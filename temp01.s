.data
    n: .dword VALUE

.text
    main:
        addi sp, sp, -32
        sd  ra, 24(sp)
        sd  s0, 16(sp)
        addi s0, sp, 32

        la a0, n 
        lw  a0,0(a0)
        call fact

        addi a7, x0, 1
        ecall

        addi a7, x0, 10
        ecall
        
    fact:
        addi sp sp -32
        sd ra 24(sp)
        sd s0 16(sp)
        addi s0 sp 32
        sd a0 -24(s0)
        ld x15 -24(s0)
        blt x0 x15 L1
        addi x15 x0 1
        jal x0 L2
    L1:
        ld x15 -24(s0)
        addi x15 x15 -1
        addi a0 x15 0
        jal ra fact
        addi x14 a0 0
        ld x15 -24(s0)
        mul x15 x14 x15
    L2:
        addi a0 x15 0
        ld ra 24(sp)
        ld x8 16(sp)
        addi sp sp 32
        jalr x0 ra 0

