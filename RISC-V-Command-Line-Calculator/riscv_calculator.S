//Dai'zjon Carney
.section .rodata
//set up labels for a decimal and a char
numb:.asciz "%d"
char:.asciz "%c" 
//set up a solution label to print result to screen
solution: .asciz "Result: %d %c %d = %d\n"
//set up unknown
unknown: .asciz "Unknown operator '%c'\n" 
.section .text
.global main
main:
//stack
//0-7 8bytes : return address (a0)
//8-15 8 bytes: a1
//16-19 4 bytes : left operand
//20 1 byte : operator
//21-25 4 bytes right operand
addi sp, sp, -25
//went through the process for the left operand  
sd ra, 0(sp)
sd a1, 8(sp)
ld a0, 8(a1)
la a1, numb
addi a2, sp, 16
call sscanf@plt
//operator
ld a1, 8(sp)
ld a0, 16(a1)
la a1, char
addi a2, sp, 20
call sscanf@plt
//right
ld a1, 8(sp)
ld a0, 24(a1)
la a1, numb
addi a2, sp, 21
call sscanf@plt

lw a1, 16(sp) //left operand
lb a2, 20(sp) //operator
lw a3, 21(sp)// right operand

//load values to multiple registers in order to compare them to the a2 register which holds the operator
li t0, 43
li t1, '-'
li t2, 120
li t3, '/'
li t4, '%'
//li t5, 'q'
//li t6, 'q'

//used  branch if equal to statements to determine if one of the five operations are used. if so,goes to that label. if not 
beq a2, t0, plus
beq a2, t1, minus
beq a2, t2, multi
beq a2, t3, divid
beq a2, t4, remain
//beq t5, t6, unknow

//unknow:
mv a1, a2
la a0, unknown
call printf@plt
ld ra, 0(sp)
addi sp, sp, 25
ret

//once at these labels, the labels then call their respective functions. afterwards it jumps to done
plus:
call adding
j done

minus:
call subtracting
j done

multi:
call multiplying
j done

//created a branch in divid to safe divide, which checks to see if the right operator is equal to 0
divid:
beq a3, zero, right_is_zeroD
call dividing
j done

remain:
//created a branch in remain to safely do the mod operation, which checks to see if the right operator is equal to 0
beq a3, zero, right_is_zeroR
call remaining
j done

//if the right operand is 0, comes down here and makes the result negative one, then jumps to done
right_is_zeroD:
li a4, -1
//ret
j done

//if the right operand is 0, comes down here and makes the result zero, then jumps to done
right_is_zeroR:
li a4, 0
//ret
j done

//here the functions perform their designated tasks. once done, they are then returned back to their "parent" labels.
adding:
add a4, a1, a3
ret

subtracting:
sub a4, a1, a3
ret

multiplying:
mul a4, a1, a3
ret

dividing:
div a4, a1, a3
ret

remaining:
rem a4, a1, a3
ret

//after all the operations are complete, no matter the operation, they jump down to done. This uses printf to print to the screen
done:
la a0, solution
call printf@plt
ld ra, 0(sp)
addi sp, sp, 25
ret
