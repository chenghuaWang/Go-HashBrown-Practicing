//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

TEXT ·_go_mm_sum_reduce_d(SB), $0-24

    MOVQ buf+0(FP), DI
    MOVQ len+8(FP), SI
    MOVQ res+16(FP), DX

    LONG $0xc057f9c5             // vxorpd    xmm0, xmm0, xmm0
    WORD $0x8548; BYTE $0xf6     // test    rsi, rsi
	JE LBB0_1
    WORD $0xc031                 // xor    eax, eax
LBB0_7:
    QUAD $0x000000c78458fdc5; BYTE $0x00 // vaddpd    ymm0, ymm0, yword [rdi + 8*rax]
    LONG $0x04c08348             // add    rax, 4
    WORD $0x3948; BYTE $0xf0     // cmp    rax, rsi
	JB LBB0_7
LBB0_1:
    LONG $0xc07cfdc5             // vhaddpd    ymm0, ymm0, ymm0
    LONG $0x197de3c4; WORD $0x01c1 // vextractf128    xmm1, ymm0, 1
    LONG $0xc158fbc5             // vaddsd    xmm0, xmm0, xmm1
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    WORD $0x8948; BYTE $0xf0     // mov    rax, rsi
    LONG $0xfce08348             // and    rax, -4
    WORD $0x3948; BYTE $0xf0     // cmp    rax, rsi
	JAE LBB0_5
    WORD $0x8949; BYTE $0xc0     // mov    r8, rax
    WORD $0xf749; BYTE $0xd0     // not    r8
    WORD $0x0149; BYTE $0xf0     // add    r8, rsi
    WORD $0x8948; BYTE $0xf1     // mov    rcx, rsi
    LONG $0x03e18348             // and    rcx, 3
	JE LBB0_4
LBB0_3:
    LONG $0x4458fbc5; WORD $0x08c7 // vaddsd    xmm0, xmm0, qword [rdi + 8*rax]
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    LONG $0x01c08348             // add    rax, 1
    LONG $0xffc18348             // add    rcx, -1
	JNE LBB0_3
LBB0_4:
    LONG $0x03f88349             // cmp    r8, 3
	JB LBB0_5
LBB0_8:
    LONG $0x4458fbc5; WORD $0x08c7 // vaddsd    xmm0, xmm0, qword [rdi + 8*rax]
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    LONG $0x4458fbc5; WORD $0x10c7 // vaddsd    xmm0, xmm0, qword [rdi + 8*rax + 8]
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    LONG $0x4458fbc5; WORD $0x18c7 // vaddsd    xmm0, xmm0, qword [rdi + 8*rax + 16]
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    LONG $0x4458fbc5; WORD $0x20c7 // vaddsd    xmm0, xmm0, qword [rdi + 8*rax + 24]
    LONG $0x4211fbc5; BYTE $0x08 // vmovsd    qword [rdx], xmm0
    LONG $0x04c08348             // add    rax, 4
    WORD $0x3948; BYTE $0xc6     // cmp    rsi, rax
	JNE LBB0_8
LBB0_5:
    VZEROUPPER
    RET
