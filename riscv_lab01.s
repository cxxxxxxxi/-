
.section .rodata
.globl main
.type main, @function

main:
    la a0, prompt  
    call print_string  

    la a0, input  
    call read_int 
    move a0, a1  

    la a0, prompt  
    call print_string  

    la a0, result  
    call print_string  

    la a0, prompt  
    call print_string  

    la a0, result  
    call print_string  

    jr ra  

.section .data
prompt: .asciz "Enter a number: "
input:  .asciz "Input value: "
result: .asciz "Factorial of "

.section .text
.globl print_string
print_string:
    la a0, prompt  
    call printf  
    jr ra 

.globl read_int
read_int:
    la a0, input 
    call scanf  
    jr ra  

.globl factorial
factorial:
    move a0, a1  
    li a1, 1  

loop:
    beq a0, a1, done  
    mul a1, a1, a0 
    sub a0, a0, 1  
    j loop  

done:
    move a0, a1  
    la   a0, result  
    call printf  
    jr ra  


