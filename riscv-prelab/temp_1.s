	.text
	.align	1
	.globl	multi
	.type	multi, @function
multi:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L2
	li	a5,1
	j	.L3
.L2:
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	mv	a0,a5
	call	multi
	mv	a5,a0
	lw	a4,-20(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
.L3:
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	multi, .-multi
	.section	.rodata
	.align	3
.LC0:
	.string	"please input a number"
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"it can't be a minus one!"
	.align	3
.LC3:
	.string	"the result is:%d\n"
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
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a5,s0,-24
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	__isoc99_scanf
	lw	a5,-24(s0)
	bge	a5,zero,.L5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	j	.L6
.L5:
	lw	a5,-24(s0)
	mv	a0,a5
	call	multi
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
.L6:
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
