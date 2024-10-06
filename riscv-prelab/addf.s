	.text
	.section	.rodata
	.align	3
.LC2:
	.string	"the result is %.2f\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsw	fa5,-20(s0)
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fsw	fa5,-24(s0)
	flw	fa4,-20(s0)
	flw	fa5,-24(s0)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-28(s0)
	flw	fa5,-28(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.word	1095237632
	.align	2
.LC1:
	.word	1088841318
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
