//-------------------------
// FlexMesh Main File
//-------------------------

#include "core/config.p4"
#include "core/define.p4"
#include "core/macro.p4"
#include "core/metadata.p4"
#include "core/context.p4"
#include "core/protocol.p4"
#include "core/start.p4"
#include "core/rewind.p4"
#include "core/module.p4"

//-- Ingress pipeline
control ingress {

#if ENABLE_INITIALIZER == 1
    INGRESS_CHECK(0x1) {
        pipeline_start();
    }
#endif

#if INGRESS_MODULE_NUM > 1
#ifdef INGRESS_MODULE_1
    INGRESS_CHECK(0x2) {
        INGRESS_MODULE_1;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 2
#ifdef INGRESS_MODULE_2
    INGRESS_CHECK(0x4) {
        INGRESS_MODULE_2;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 3
#ifdef INGRESS_MODULE_3
    INGRESS_CHECK(0x8) {
        INGRESS_MODULE_3;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 4
#ifdef INGRESS_MODULE_4
    INGRESS_CHECK(0x10) {
        INGRESS_MODULE_4;
    }
#endif
#endif

#if INGRESS_MODULE_NUM > 5
#ifdef INGRESS_MODULE_5
    INGRESS_CHECK(0x20) {
        INGRESS_MODULE_5;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 6
#ifdef INGRESS_MODULE_6
    INGRESS_CHECK(0x40) {
        INGRESS_MODULE_6;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 7
#ifdef INGRESS_MODULE_7
    INGRESS_CHECK(0x80) {
        INGRESS_MODULE_7;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 8
#ifdef INGRESS_MODULE_8
    INGRESS_CHECK(0x100) {
        INGRESS_MODULE_8;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 9
#ifdef INGRESS_MODULE_9
    INGRESS_CHECK(0x200) {
        INGRESS_MODULE_9;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 10
#ifdef INGRESS_MODULE_10
    INGRESS_CHECK(0x400) {
        INGRESS_MODULE_10;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 11
#ifdef INGRESS_MODULE_11
    INGRESS_CHECK(0x800) {
        INGRESS_MODULE_11;
    }
#endif
#endif


#if INGRESS_MODULE_NUM > 12
#ifdef INGRESS_MODULE_12
    INGRESS_CHECK(0x1000) {
        INGRESS_MODULE_12;
    }
#endif
#endif

#if INGRESS_MODULE_NUM > 13
#ifdef INGRESS_MODULE_13
    INGRESS_CHECK(0x2000) {
        INGRESS_MODULE_13;
    }
#endif
#endif

#if INGRESS_MODULE_NUM > 14
#ifdef INGRESS_MODULE_14
    INGRESS_CHECK(0x4000) {
        INGRESS_MODULE_14;
    }
#endif
#endif

#if INGRESS_MODULE_NUM > 15
#ifdef INGRESS_MODULE_15
    INGRESS_CHECK(0x8000) {
        INGRESS_MODULE_15;
    }
#endif
#endif

}

control egress {
#if EGRESS_MODULE_NUM > 1
#ifdef ENGRESS_MODULE_1
    EGRESS_CHECK(0x1) {
        ENGRESS_MODULE_1;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 2
#ifdef ENGRESS_MODULE_2
    EGRESS_CHECK(0x2) {
        ENGRESS_MODULE_2;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 3
#ifdef ENGRESS_MODULE_3
    EGRESS_CHECK(0x4) {
        ENGRESS_MODULE_3;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 4
#ifdef ENGRESS_MODULE_4
    EGRESS_CHECK(0x8) {
        ENGRESS_MODULE_4;
    }
#endif
#endif

#if EGRESS_MODULE_NUM > 5
#ifdef ENGRESS_MODULE_5
    EGRESS_CHECK(0x10) {
        ENGRESS_MODULE_5;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 6
#ifdef ENGRESS_MODULE_6
    EGRESS_CHECK(0x20) {
        ENGRESS_MODULE_6;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 7
#ifdef ENGRESS_MODULE_7
    EGRESS_CHECK(0x40) {
        ENGRESS_MODULE_7;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 8
#ifdef ENGRESS_MODULE_8
    EGRESS_CHECK(0x80) {
        ENGRESS_MODULE_8;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 9
#ifdef ENGRESS_MODULE_9
    EGRESS_CHECK(0x100) {
        ENGRESS_MODULE_9;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 10
#ifdef ENGRESS_MODULE_10
    EGRESS_CHECK(0x200) {
        ENGRESS_MODULE_10;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 11
#ifdef ENGRESS_MODULE_11
    EGRESS_CHECK(0x400) {
        ENGRESS_MODULE_11;
    }
#endif
#endif


#if EGRESS_MODULE_NUM > 12
#ifdef ENGRESS_MODULE_12
    EGRESS_CHECK(0x800) {
        ENGRESS_MODULE_12;
    }
#endif
#endif

#if EGRESS_MODULE_NUM > 13
#ifdef ENGRESS_MODULE_13
    EGRESS_CHECK(0x1000) {
        ENGRESS_MODULE_13;
    }
#endif
#endif

#if EGRESS_MODULE_NUM > 14
#ifdef ENGRESS_MODULE_14
    EGRESS_CHECK(0x2000) {
        ENGRESS_MODULE_14;
    }
#endif
#endif

#if EGRESS_MODULE_NUM > 15
#ifdef ENGRESS_MODULE_15
    EGRESS_CHECK(0x4000) {
        ENGRESS_MODULE_15;
    }
#endif
#endif

#if ENABLE_REWINDER == 1
    EGRESS_CHECK(0x8000){
        pipeline_rewind();
    }
#endif
}
//
// #if EGRESS_MODULE_NUM > 1
// #ifdef MODULE_32
//     CHECK(32) {
//         MODULE_32;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 2
// #ifdef MODULE_33
//     CHECK(33) {
//         MODULE_33;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 3
// #ifdef MODULE_34
//     CHECK(34) {
//         MODULE_34;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 4
// #ifdef MODULE_35
//     CHECK(35) {
//         MODULE_35;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 5
// #ifdef MODULE_36
//     CHECK(36) {
//         MODULE_36;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 6
// #ifdef MODULE_37
//     CHECK(37) {
//         MODULE_37;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 7
// #ifdef MODULE_38
//     CHECK(38) {
//         MODULE_38;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 8
// #ifdef MODULE_39
//     CHECK(39) {
//         MODULE_39;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 9
// #ifdef MODULE_40
//     CHECK(40) {
//         MODULE_40;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 10
// #ifdef MODULE_41
//     CHECK(41) {
//         MODULE_41;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 11
// #ifdef MODULE_42
//     CHECK(42) {
//         MODULE_42;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 12
// #ifdef MODULE_43
//     CHECK(43) {
//         MODULE_43;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 13
// #ifdef MODULE_44
//     CHECK(44) {
//         MODULE_44;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 14
// #ifdef MODULE_45
//     CHECK(45) {
//         MODULE_45;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 15
// #ifdef MODULE_46
//     CHECK(46) {
//         MODULE_46;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 16
// #ifdef MODULE_47
//     CHECK(47) {
//         MODULE_47;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 17
// #ifdef MODULE_48
//     CHECK(48) {
//         MODULE_48;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 18
// #ifdef MODULE_49
//     CHECK(49) {
//         MODULE_49;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 19
// #ifdef MODULE_50
//     CHECK(50) {
//         MODULE_50;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 20
// #ifdef MODULE_51
//     CHECK(51) {
//         MODULE_51;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 21
// #ifdef MODULE_52
//     CHECK(52) {
//         MODULE_52;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 22
// #ifdef MODULE_53
//     CHECK(53) {
//         MODULE_53;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 23
// #ifdef MODULE_54
//     CHECK(54) {
//         MODULE_54;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 24
// #ifdef MODULE_55
//     CHECK(55) {
//         MODULE_55;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 25
// #ifdef MODULE_56
//     CHECK(56) {
//         MODULE_56;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 26
// #ifdef MODULE_57
//     CHECK(57) {
//         MODULE_57;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 27
// #ifdef MODULE_58
//     CHECK(58) {
//         MODULE_58;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 28
// #ifdef MODULE_59
//     CHECK(59) {
//         MODULE_59;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 29
// #ifdef MODULE_60
//     CHECK(60) {
//         MODULE_60;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 30
// #ifdef MODULE_61
//     CHECK(61) {
//         MODULE_61;
//     }
// #endif
// #endif

// #if EGRESS_MODULE_NUM > 31
// #ifdef MODULE_62
//     CHECK(62) {
//         MODULE_62;
//     }
// #endif
// #endif

//     CHECK(63){
//         pipeline_rewind();
//     }

// }
