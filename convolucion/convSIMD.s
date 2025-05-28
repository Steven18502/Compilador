	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"convSIMD.c"
	.text
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	li	a0, 0
	vsetivli	zero, 10, e32, m1, ta, ma
	lui	a6, %hi(.L_MergedGlobals)
	addi	a6, a6, %lo(.L_MergedGlobals)
	addi	a1, a6, 68
	vle32.v	v8, (a1)
	addi	a4, a6, 4
	li	a3, 3
	li	a7, 40
	lui	t0, %hi(img_out)
	addi	t0, t0, %lo(img_out)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	slli	a1, a0, 2
	slli	a2, a0, 4
	sub	a2, a2, a1
	add	a2, a2, a6
	lw	a1, 0(a2)
	mul_vec_scalar	v9, v8, a1
	li	a1, 1
	mv	a2, a4
.LBB0_2:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a5, 0(a2)
	addi	a2, a2, 4
	mul_vec_scalar	v10, v8, a5
	mov_left_vec	v10, v10, a1
	addi	a1, a1, 1
	sum_vec	v9, v9, v10
	bne	a1, a3, .LBB0_2
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	mul	a1, a0, a7
	add	a1, a1, t0
	vle32.v	v10, (a1)
	addi	a0, a0, 1
	sum_vec	v9, v10, v9
	vse32.v	v9, (a1)
	addi	a4, a4, 12
	bne	a0, a3, .LBB0_1
# %bb.4:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	img_out,@object                 # @img_out
	.bss
	.globl	img_out
	.p2align	2, 0x0
img_out:
	.zero	200
	.size	img_out, 200

	.type	.L_MergedGlobals,@object        # @_MergedGlobals
	.data
	.p2align	2, 0x0
.L_MergedGlobals:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.word	9                               # 0x9
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.word	6                               # 0x6
	.word	7                               # 0x7
	.word	8                               # 0x8
	.size	.L_MergedGlobals, 196

	.globl	kernel
.set kernel, .L_MergedGlobals
	.size	kernel, 36
	.globl	img_in
.set img_in, .L_MergedGlobals+36
	.size	img_in, 160
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 061f87f75f38e80e7494b5f7235103f7f11a36c3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym img_out
	.addrsig_sym .L_MergedGlobals
