	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"convSISD.c"
	.text
	.globl	copy_with_shift                 # -- Begin function copy_with_shift
	.p2align	1
	.type	copy_with_shift,@function
copy_with_shift:                        # @copy_with_shift
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	sw	s1, 20(sp)                      # 4-byte Folded Spill
	sw	s2, 16(sp)                      # 4-byte Folded Spill
	sw	s3, 12(sp)                      # 4-byte Folded Spill
	sw	s4, 8(sp)                       # 4-byte Folded Spill
	sw	s5, 4(sp)                       # 4-byte Folded Spill
	mv	s1, a4
	mv	s4, a3
	mv	s0, a2
	mv	s5, a1
	mv	s2, a0
	slli	s3, a4, 2
	blez	a4, .LBB0_2
# %bb.1:
	mv	a0, s2
	li	a1, 0
	mv	a2, s3
	call	memset
.LBB0_2:
	blez	s4, .LBB0_10
# %bb.3:
	mv	a0, s1
	blt	s5, s1, .LBB0_5
# %bb.4:
	mv	a0, s5
.LBB0_5:
	sub	a0, a0, s1
	addi	s4, s4, -1
	mv	a1, a0
	bltu	a0, s4, .LBB0_7
# %bb.6:
	mv	a1, s4
.LBB0_7:
	add	s2, s2, s3
	not	a1, a1
	add	a1, a1, a0
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	beqz	a0, .LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	lw	a2, 0(s0)
	addi	a0, a0, -1
	sw	a2, 0(s2)
	addi	s2, s2, 4
	addi	s0, s0, 4
	bne	a0, a1, .LBB0_8
.LBB0_10:
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	lw	s1, 20(sp)                      # 4-byte Folded Reload
	lw	s2, 16(sp)                      # 4-byte Folded Reload
	lw	s3, 12(sp)                      # 4-byte Folded Reload
	lw	s4, 8(sp)                       # 4-byte Folded Reload
	lw	s5, 4(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	copy_with_shift, .Lfunc_end0-copy_with_shift
                                        # -- End function
	.globl	mul_vec_scalar                  # -- Begin function mul_vec_scalar
	.p2align	1
	.type	mul_vec_scalar,@function
mul_vec_scalar:                         # @mul_vec_scalar
# %bb.0:
	blez	a1, .LBB1_3
# %bb.1:
	slli	a1, a1, 2
	add	a1, a1, a0
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	mul	a3, a3, a2
	sw	a3, 0(a0)
	addi	a0, a0, 4
	bne	a0, a1, .LBB1_2
.LBB1_3:
	ret
.Lfunc_end1:
	.size	mul_vec_scalar, .Lfunc_end1-mul_vec_scalar
                                        # -- End function
	.globl	move_left_vec                   # -- Begin function move_left_vec
	.p2align	1
	.type	move_left_vec,@function
move_left_vec:                          # @move_left_vec
# %bb.0:
	blez	a2, .LBB2_8
# %bb.1:
	bge	a2, a1, .LBB2_8
# %bb.2:
	sub	a6, a1, a2
	blez	a6, .LBB2_5
# %bb.3:
	slli	a7, a2, 2
	slli	a3, a1, 2
	sub	a3, a3, a7
	add	a5, a0, a3
	mv	a4, a0
.LBB2_4:                                # =>This Inner Loop Header: Depth=1
	add	a3, a4, a7
	lw	a3, 0(a3)
	sw	a3, 0(a4)
	addi	a4, a4, 4
	bne	a4, a5, .LBB2_4
.LBB2_5:
	slli	a3, a6, 2
	addi	a6, a6, 1
	add	a0, a0, a3
	mv	a3, a1
	blt	a6, a1, .LBB2_7
# %bb.6:
	mv	a3, a6
.LBB2_7:
	add	a2, a2, a3
	sub	a2, a2, a1
	slli	a2, a2, 2
	li	a1, 0
	tail	memset
.LBB2_8:
	ret
.Lfunc_end2:
	.size	move_left_vec, .Lfunc_end2-move_left_vec
                                        # -- End function
	.globl	sum_vec                         # -- Begin function sum_vec
	.p2align	1
	.type	sum_vec,@function
sum_vec:                                # @sum_vec
# %bb.0:
	blez	a2, .LBB3_3
# %bb.1:
	slli	a2, a2, 2
	add	a2, a2, a1
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a0)
	lw	a4, 0(a1)
	addi	a1, a1, 4
	add	a3, a3, a4
	sw	a3, 0(a0)
	addi	a0, a0, 4
	bne	a1, a2, .LBB3_2
.LBB3_3:
	ret
.Lfunc_end3:
	.size	sum_vec, .Lfunc_end3-sum_vec
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -224
	sw	ra, 220(sp)                     # 4-byte Folded Spill
	sw	s0, 216(sp)                     # 4-byte Folded Spill
	sw	s1, 212(sp)                     # 4-byte Folded Spill
	sw	s2, 208(sp)                     # 4-byte Folded Spill
	sw	s3, 204(sp)                     # 4-byte Folded Spill
	sw	s4, 200(sp)                     # 4-byte Folded Spill
	sw	s5, 196(sp)                     # 4-byte Folded Spill
	sw	s6, 192(sp)                     # 4-byte Folded Spill
	sw	s7, 188(sp)                     # 4-byte Folded Spill
	sw	s8, 184(sp)                     # 4-byte Folded Spill
	sw	s9, 180(sp)                     # 4-byte Folded Spill
	sw	s10, 176(sp)                    # 4-byte Folded Spill
	sw	s11, 172(sp)                    # 4-byte Folded Spill
	sw	zero, 128(sp)
	sw	zero, 132(sp)
	addi	a0, sp, 136
	lui	a1, %hi(.L_MergedGlobals)
	addi	a1, a1, %lo(.L_MergedGlobals)
	addi	a1, a1, 68
	addi	a2, sp, 168
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	sw	a3, 0(a0)
	addi	a0, a0, 4
	addi	a1, a1, 4
	bne	a0, a2, .LBB4_1
# %bb.2:
	li	s3, 0
	addi	s11, sp, 128
	addi	s1, sp, 88
	lui	a4, %hi(img_out)
	addi	a4, a4, %lo(img_out)
	addi	s5, sp, 48
	li	s7, 10
	li	s8, 3
.LBB4_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_4 Depth 2
                                        #     Child Loop BB4_6 Depth 2
                                        #     Child Loop BB4_8 Depth 2
                                        #       Child Loop BB4_9 Depth 3
                                        #       Child Loop BB4_11 Depth 3
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_15 Depth 3
                                        #     Child Loop BB4_18 Depth 2
                                        #     Child Loop BB4_20 Depth 2
                                        #     Child Loop BB4_22 Depth 2
	sw	a4, 4(sp)                       # 4-byte Folded Spill
	li	a0, 40
	mul	a1, s3, a0
	addi	a0, sp, 88
	lui	a2, %hi(img_out)
	addi	a2, a2, %lo(img_out)
	add	a1, a1, a2
	addi	s10, a1, 40
	addi	a1, sp, 128
.LBB4_4:                                #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a1)
	sw	a2, 0(a0)
	addi	a0, a0, 4
	addi	a1, a1, 4
	bne	a0, s11, .LBB4_4
# %bb.5:                                #   in Loop: Header=BB4_3 Depth=1
	slli	a0, s3, 2
	slli	a1, s3, 4
	sub	a1, a1, a0
	lui	s0, %hi(.L_MergedGlobals)
	addi	s0, s0, %lo(.L_MergedGlobals)
	add	s0, s0, a1
	lw	a0, 0(s0)
	addi	a1, sp, 88
.LBB4_6:                                #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a1)
	mul	a2, a2, a0
	sw	a2, 0(a1)
	addi	a1, a1, 4
	bne	a1, s11, .LBB4_6
# %bb.7:                                #   in Loop: Header=BB4_3 Depth=1
	li	s2, 0
	li	s6, 1
	li	s4, 4
.LBB4_8:                                #   Parent Loop BB4_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_9 Depth 3
                                        #       Child Loop BB4_11 Depth 3
                                        #       Child Loop BB4_13 Depth 3
                                        #       Child Loop BB4_15 Depth 3
	slli	a0, s2, 2
	addi	a1, sp, 48
	sub	a0, a1, a0
	addi	a0, a0, 36
	addi	a2, sp, 128
.LBB4_9:                                #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a3, 0(a2)
	sw	a3, 0(a1)
	addi	a1, a1, 4
	addi	a2, a2, 4
	bne	a1, s1, .LBB4_9
# %bb.10:                               #   in Loop: Header=BB4_8 Depth=2
	slli	a2, s6, 2
	add	a1, s0, a2
	lw	a1, 0(a1)
	addi	a3, sp, 48
.LBB4_11:                               #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a4, 0(a3)
	mul	a4, a4, a1
	sw	a4, 0(a3)
	addi	a3, a3, 4
	bne	a3, s1, .LBB4_11
# %bb.12:                               #   in Loop: Header=BB4_8 Depth=2
	sub	a1, s7, s6
	addi	a3, sp, 48
.LBB4_13:                               #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	a4, a3, s4
	lw	a4, 0(a4)
	sw	a4, 0(a3)
	addi	a3, a3, 4
	bne	a3, a0, .LBB4_13
# %bb.14:                               #   in Loop: Header=BB4_8 Depth=2
	slli	a0, a1, 2
	addi	s9, sp, 48
	add	a0, a0, s9
	li	a1, 0
	call	memset
	addi	a0, sp, 88
.LBB4_15:                               #   Parent Loop BB4_3 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a1, 0(a0)
	lw	a2, 0(s9)
	addi	s9, s9, 4
	add	a1, a1, a2
	sw	a1, 0(a0)
	addi	a0, a0, 4
	bne	s9, s1, .LBB4_15
# %bb.16:                               #   in Loop: Header=BB4_8 Depth=2
	addi	s6, s6, 1
	addi	s4, s4, 4
	addi	s2, s2, 1
	bne	s6, s8, .LBB4_8
# %bb.17:                               #   in Loop: Header=BB4_3 Depth=1
	addi	a0, sp, 8
	lw	a4, 4(sp)                       # 4-byte Folded Reload
	mv	a1, a4
.LBB4_18:                               #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a1)
	sw	a2, 0(a0)
	addi	a0, a0, 4
	addi	a1, a1, 4
	bne	a0, s5, .LBB4_18
# %bb.19:                               #   in Loop: Header=BB4_3 Depth=1
	addi	a0, sp, 88
	addi	a1, sp, 8
.LBB4_20:                               #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a1)
	lw	a3, 0(a0)
	addi	a0, a0, 4
	add	a2, a2, a3
	sw	a2, 0(a1)
	addi	a1, a1, 4
	bne	a0, s11, .LBB4_20
# %bb.21:                               #   in Loop: Header=BB4_3 Depth=1
	addi	a0, sp, 8
	mv	a1, a4
.LBB4_22:                               #   Parent Loop BB4_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a0)
	sw	a2, 0(a1)
	addi	a1, a1, 4
	addi	a0, a0, 4
	bne	a1, s10, .LBB4_22
# %bb.23:                               #   in Loop: Header=BB4_3 Depth=1
	addi	s3, s3, 1
	addi	a4, a4, 40
	bne	s3, s8, .LBB4_3
# %bb.24:
	li	a0, 0
	lw	ra, 220(sp)                     # 4-byte Folded Reload
	lw	s0, 216(sp)                     # 4-byte Folded Reload
	lw	s1, 212(sp)                     # 4-byte Folded Reload
	lw	s2, 208(sp)                     # 4-byte Folded Reload
	lw	s3, 204(sp)                     # 4-byte Folded Reload
	lw	s4, 200(sp)                     # 4-byte Folded Reload
	lw	s5, 196(sp)                     # 4-byte Folded Reload
	lw	s6, 192(sp)                     # 4-byte Folded Reload
	lw	s7, 188(sp)                     # 4-byte Folded Reload
	lw	s8, 184(sp)                     # 4-byte Folded Reload
	lw	s9, 180(sp)                     # 4-byte Folded Reload
	lw	s10, 176(sp)                    # 4-byte Folded Reload
	lw	s11, 172(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 224
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
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
	.addrsig_sym .L_MergedGlobals
