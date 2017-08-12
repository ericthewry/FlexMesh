import tornado.ioloop
import tornado.web
import os

devicePortMap = {
    'S1': 9090,
    'S2': 9091,
    'S3': 9092,
    'S4': 9093,
    'S5': 9094
}

protoMap = {
    'TCP' : 1,
    'UDP' : 2
}

featureMap = {
    'clickp4_mac_learning' : 1,
    'clickp4_ip_sg' : 2
    'clickp4_l2_sw' : 3,
    'clickp4_l3_sw' : 4,
    'clickp4_vlan'  : 5,
    'clickp4_qos'   : 6,
    'clickp4_nat'   : 7,
    'clickp4_ip_acl': 8
}

policies = {}

policy_id = 0

device_dir='/home/ubuntu/Work/behavioral-model/targets/simple_switch'


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        pass
    def post(self, *args, **kwargs):
        policy = {}
        tmp = self.request.body.split('|') 
        pattern = tmp[0].split('+')
        
        policy['L3Dst'] = pattern[0]
        policy['L3Src'] = pattern[1]
        policy['L4Dst'] = pattern[3]
        policy['L4Src'] = pattern[4]
        policy['Proto'] = protoMap[pattern[2]]
        policy['Device'] = pattern[5]

        chain = tmp[1].split('+')
        policy['chain'] = chain
        if check_policy(policy) is True:
            execute_policy(policy)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])


def check_policy(policy):
    return True

def execute_policy(policy):
    print policy
    global policy_id, policies
    
    policy_id = policy_id + 1
    policies[policy] = policy_id
    bitmaps = []
    bitmap = 0
    pre = 0
    for feature in policy['chain']:
        n = featureMap[feature]
        if n < 1:
            print '%s is not a supported feature.'%feature
            return
        if pre < n:
            pre = n
            bitmap = bitmap + (1 << n)
        else:
            pre = 0
            bitmaps.append(bitmap)
            bitmap = 0
    bitmaps.append(bitmap)

    for i in range(len(bitmaps) - 1):
        bitmaps[i] = bitmaps[i] + (1 << 15)

    rule = 'table_add tbl_pipeline_start act_set_chain %s %s %d %s %s => %d %d'%(
        policy['L3Dst'], 
        policy['L3Src'], 
        policy['Proto'], 
        policy['L4Dst'], 
        policy['L4Src'], 
        policy_id, 
        bitmaps[0])
    
    install_rule(policy['device'], rule)
    counter = 0
    for b in bitmaps[1:]:
        rule = 'table_add rewind_table rewind %d %d => %d %d' % (policy_id, counter, counter + 1, b)
        install_rule(policy['device'], rule)

def install_rule(device, rule):
    port = devicePortMap[device]
    os.popen('cd %s && echo %s >tmp_commands'%(device_dir, rule) )
    os.popen('cd %s && ./runtime_CLI --thrift-port %d <tmp_commands'%(device_dir, port))


if __name__ == "__main__":
    app = make_app()
    app.listen(10888)
    tornado.ioloop.IOLoop.current().start()