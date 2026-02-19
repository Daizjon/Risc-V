//COSC130
//lab9.S
//Dai'zjon Carney
//3/29/2019
.section .rodata
prompt:.asciz "level	Index	Byte Offset\n"
usage:.asciz "Usage: %s <address>\n"
all:.asciz "VPN[%03d] = %-4d (%4d)\n"
po:.asciz "PO = %lx\n"
va:.asciz "%lx\n"

.section .text
.global main
main:
//allocate stack space
//getting comand line arguments

li t0,2 
addi sp, sp, -36
sd ra, 0(sp)
//if the the number of arguments isn't equal to two, jumps to usage
bne a0, t0,2f

ld a0, 8(a1)
la a1, va
addi a2, sp, 24//hex code
call sscanf@plt
la a0, prompt
call printf@plt
//load values into saved registers 
li s2, 30
li s1, 002
1:
//load the virtual address into s0
//right shifted s0, by s2 (which is 30 intially)
//anded the virtual address by 0x1ff
//multiplied the vpn by 8 to get byte offset
//moved values to a registers in order to print
ld s0, 24(sp)
srl s0, s0, s2
li t5, 0x1ff
li t6, 8
and s0, s0, t5
mul t6, t6, s0
mv a1,s1 
mv a2, s0
mv a3, t6
la a0, all
call printf@plt

//checks to see if s1 (vpn counter) is zero and goes to 4 if so.
//if it isn't equal, subtracts s2 (the value that the virtual address is shifted by) by 9
//subtracts s1 (vpn counter) by 1
beq s1, zero, 4f
addi s2, s2, -9
addi s1, s1, -1
j 1b
//code to do it seperately, should skip till label 2
2:
la a0, usage
ld a1, 0(a1)
call printf@plt
j 5f

4:
//anded virtual address by 0xfff
//now have PO
ld s0, 24(sp)
li t6, 0xfff
and s0, s0,t6
mv a1, s0

la a0,po
call printf@plt
j 5f

5:
ld ra, 0(sp)
addi sp, sp, 36
ret

