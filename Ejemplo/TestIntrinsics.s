	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zcf1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"TestIntrinsics.c"
	.text
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	s0, 72(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 80
	csrr	a0, vlenb
	li	a1, 10
	mul	a0, a0, a1
	sub	sp, sp, a0
	lui	a0, %hi(.L__const.main.a)
	addi	a0, a0, %lo(.L__const.main.a)
                                        # implicit-def: $v8
	vsetivli	zero, 4, e32, m1, tu, ma
	vle32.v	v8, (a0)
	addi	a1, s0, -32
	vse32.v	v8, (a1)
	li	a2, 5
	sw	a2, -16(s0)
	sw	a2, -36(s0)
	lui	a0, %hi(.L__const.main.b)
	addi	a0, a0, %lo(.L__const.main.b)
                                        # implicit-def: $v8
	vle32.v	v8, (a0)
	addi	a0, s0, -64
	vse32.v	v8, (a0)
	sw	a2, -48(s0)
	vsetivli	a2, 5, e32, m1, ta, ma
	sw	a2, -68(s0)
	lw	a2, -68(s0)
                                        # implicit-def: $v8
	vsetvli	zero, a2, e32, m1, tu, ma
	vle32.v	v8, (a1)
	csrr	a1, vlenb
	sub	a1, s0, a1
	addi	a1, a1, -80
	vsetvli	a2, zero, e32, m1, ta, ma
	vse32.v	v8, (a1)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a2, -36(s0)
	mul_vec_scalar	v8, v8, a2
	csrr	a2, vlenb
	slli	a2, a2, 1
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a2, -36(s0)
	saturate_vec	v8, v8, a2
	csrr	a2, vlenb
	slli	a3, a2, 1
	add	a2, a2, a3
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a2, -36(s0)
	sum_vec_scalar	v8, v8, a2
	csrr	a2, vlenb
	slli	a2, a2, 2
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a2, -36(s0)
	mov_left_vec	v8, v8, a2
	csrr	a2, vlenb
	slli	a3, a2, 2
	add	a2, a2, a3
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a2, -36(s0)
	mov_right_vec	v8, v8, a2
	csrr	a2, vlenb
	li	a3, 6
	mul	a2, a2, a3
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
                                        # implicit-def: $v9
	vle32.v	v9, (a2)
	mul_vec	v8, v8, v9
	csrr	a2, vlenb
	slli	a3, a2, 3
	sub	a2, a3, a2
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	sum_vec	v8, v8, v8
	csrr	a2, vlenb
	slli	a2, a2, 3
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	copy_vec	v8, v8, v8
	csrr	a2, vlenb
	slli	a3, a2, 3
	add	a2, a2, a3
	sub	a2, s0, a2
	addi	a2, a2, -80
	vse32.v	v8, (a2)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	extend_vec	v8, v8, v8
	csrr	a1, vlenb
	li	a2, 10
	mul	a1, a1, a2
	sub	a1, s0, a1
	addi	a1, a1, -80
	vse32.v	v8, (a1)
                                        # implicit-def: $v8
	vle32.v	v8, (a1)
	lw	a1, -68(s0)
	vsetvli	zero, a1, e32, m1, ta, ma
	vse32.v	v8, (a0)
	li	a0, 0
	addi	sp, s0, -80
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 72(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	.L__const.main.a,@object        # @__const.main.a
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.L__const.main.a:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.size	.L__const.main.a, 20

	.type	.L__const.main.b,@object        # @__const.main.b
	.p2align	2, 0x0
.L__const.main.b:
	.word	1                               # 0x1
	.word	2                               # 0x2
	.word	3                               # 0x3
	.word	4                               # 0x4
	.word	5                               # 0x5
	.size	.L__const.main.b, 20

	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 061f87f75f38e80e7494b5f7235103f7f11a36c3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
