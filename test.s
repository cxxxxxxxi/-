
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bgt	a4,a5,.L2
	lw	a5,-36(s0)
	j	.L3
.L2:
	lw	a5,-36(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	mv	a0,a5
	call	fibonacci
	mv	a5,a0
	mv	s1,a5
	lw	a5,-36(s0)
	addiw	a5,a5,-2
	sext.w	a5,a5
	mv	a0,a5
	call	fibonacci
	mv	a5,a0
	addw	a5,s1,a5
	sext.w	a5,a5
.L3:
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	fibonacci, .-fibonacci
	.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"\347\254\254 %d \351\241\271\347\232\204\346\226\220\346\263\242\351\202\243\345\245\221\346\225\260\346\230\257: %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	addi	s0,sp,48
	la	a5,__stack_chk_guard
	ld	a4, 0(a5)
	sd	a4, -40(s0)
	li	a4, 0
	addi	a5,s0,-44
	mv	a1,a5
	lla	a0,.LC0
	call	__isoc99_scanf@plt
	lw	s1,-44(s0)
	lw	a5,-44(s0)
	mv	a0,a5
	call	fibonacci
	mv	a5,a0
	mv	a2,a5
	mv	a1,s1
	lla	a0,.LC1
	call	printf@plt
	li	a5,0
	mv	a4,a5
	la	a5,__stack_chk_guard
	ld	a3, -40(s0)
	ld	a5, 0(a5)
	xor	a5, a3, a5
	li	a3, 0
	beq	a5,zero,.L6
	call	__stack_chk_fail@plt
.L6:
	mv	a0,a4
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	







