    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions
	//read the first number

stp x29, x30, [sp, -32]!        //store registers
str x21, [sp, -16]!
str x20, [sp, -16]!

loop:
	ldr	w0, =string0
	bl	printf
	ldr	w0, =formatInt
	ldr	x1, =num1
	bl	scanf
	//read the second number
	ldr	w0, =string1
	bl	printf
	ldr	w0, =formatInt
	ldr	x1, =num2
	bl	scanf
	//read the operation
	ldr	w0, =string2
	bl	printf
	ldr	w0, =formatStr
	ldr	x1, =oper
	bl	scanf

	//calculate
	
	ldr x0, =num1
	ldr x0, [x0, #0]

	ldr x1, =num2
	ldr x1, [x1, #0]
	
	ldr x20, =oper
	ldr w20, [x20, #0]

	cmp w20, #42
	beq opmul

	cmp w20, #43
	beq opadd

	cmp w20, #45
	beq opsub 
	
	ldr w0, =string5
	bl printf
	b prompt	
	
opadd:
	bl intadd
	b printAns

opmul:
        bl intmul
        b printAns

opsub:
        bl intsub
        b printAns

	


	
printAns:
	mov x1, x0
	//print result
	ldr	w0, =string3
	//ldr	x1, =num2
	//ldr	x1, [x1, #0]
	bl	printf


prompt:
	//print agian?
	ldr	w0, =string4
	bl	printf
	
	ldr	x0, =formatStr
	ldr	x1, =repeat
	bl	scanf

	ldr 	x1, =repeat
	ldrb	w1, [x1, #0]

	mov	w0, #121
	cmp	w0, w1

	beq	loop

	ldr x20, [sp], 16
	ldr x21, [sp], 16

	ldp x29, x30, [sp], 32




	ret

.data
yes: .byte 'y'
formatInt: .asciz "%d"
formatStr: .asciz " %c"
num1: .word 0
num2: .word 0
oper: .word 0
repeat: .word 0
string0: .asciz "Enter Number 1: "
string1: .asciz "Enter Number 2: "
string2: .asciz "Enter Operation: "
string3: .asciz "Result is: %d\n"
string4: .asciz "Again? "
string5: .asciz "Invalid Operation Entered.\n"

