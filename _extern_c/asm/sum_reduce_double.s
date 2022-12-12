	.text
	.intel_syntax noprefix
	.file	"sum_reduce_double.c"
	.globl	go_mm_sum_reduce_d              # -- Begin function go_mm_sum_reduce_d
	.p2align	4, 0x90
	.type	go_mm_sum_reduce_d,@function
go_mm_sum_reduce_d:                     # @go_mm_sum_reduce_d
# %bb.0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	vxorpd	xmm0, xmm0, xmm0
	test	rsi, rsi
	je	.LBB0_1
# %bb.6:
	xor	eax, eax
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vaddpd	ymm0, ymm0, ymmword ptr [rdi + 8*rax]
	add	rax, 4
	cmp	rax, rsi
	jb	.LBB0_7
.LBB0_1:
	vhaddpd	ymm0, ymm0, ymm0
	vextractf128	xmm1, ymm0, 1
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	qword ptr [rdx], xmm0
	mov	rax, rsi
	and	rax, -4
	cmp	rax, rsi
	jae	.LBB0_5
# %bb.2:
	mov	r8, rax
	not	r8
	add	r8, rsi
	mov	rcx, rsi
	and	rcx, 3
	je	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	vaddsd	xmm0, xmm0, qword ptr [rdi + 8*rax]
	vmovsd	qword ptr [rdx], xmm0
	add	rax, 1
	add	rcx, -1
	jne	.LBB0_3
.LBB0_4:
	cmp	r8, 3
	jb	.LBB0_5
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	vaddsd	xmm0, xmm0, qword ptr [rdi + 8*rax]
	vmovsd	qword ptr [rdx], xmm0
	vaddsd	xmm0, xmm0, qword ptr [rdi + 8*rax + 8]
	vmovsd	qword ptr [rdx], xmm0
	vaddsd	xmm0, xmm0, qword ptr [rdi + 8*rax + 16]
	vmovsd	qword ptr [rdx], xmm0
	vaddsd	xmm0, xmm0, qword ptr [rdi + 8*rax + 24]
	vmovsd	qword ptr [rdx], xmm0
	add	rax, 4
	cmp	rsi, rax
	jne	.LBB0_8
.LBB0_5:
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.Lfunc_end0:
	.size	go_mm_sum_reduce_d, .Lfunc_end0-go_mm_sum_reduce_d
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"
	.section	".note.GNU-stack","",@progbits
	.addrsig
