    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions
	//read the first number
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
	ldr	x0, =b_mul
	ldr	x1, =oper
	ldr	w0, [x0]
	ldr	w1, [x1]
	cmp	w0, w1
	beq	do_mul

	ldr	x0, =b_add
	ldr	w0, [x0]
	cmp	w0, w1
	beq	do_add

	ldr	x0, =b_sub
	ldr	w0, [x0]
	cmp	w0, w1
	beq	do_sub

	b	do_invalid
do_mul:
	ldr	x0, =num1
	ldr	x0, [x0, #0]
	ldr	x1, =num2
	ldr	x1, [x1, #0]
	
	//add	x0, x0, #-48
	//add	x1, x1, #-48
	//mov	x2, x0
	//ldr	x0, =printChar
	//bl	printf
	//mov	x0, #5
	//mov	x1, #5
	bl	intmul
	b	do_result
do_add:
	ldr	x0, =num1
	ldr	x0, [x0, #0]
	ldr	x1, =num2
	ldr	x1, [x1, #0]
	bl	intadd
	b	do_result
do_sub:
	ldr	x0, =num1
	ldr	x0, [x0, #0]
	ldr	x1, =num2
	ldr	x1, [x1, #0]
	bl	intsub
	b	do_result
do_result:
	//print result
	ldr	x0, =string3
	mov	x1, x20
	//mov	x2, x20
	//mov	x3, x21
	bl	printf
	b	do_again

do_invalid:
	ldr	w0, =string5
	bl	printf

do_again:
	//print agian?
	ldr	w0, =string4
	bl	printf
	
	ldr	w0, =formatStr
	mov	x1, sp
	bl	scanf
	ldr	x1, =yes
	ldrb	w1, [x1]
	ldrb	w0, [sp]
	cmp	w0, w1
	beq	loop
	ret

.data
b_mul: .dword '*'
b_add: .dword '+'
b_sub: .dword '-'
yes: .byte 'y'
formatInt: .asciz "%d"
formatStr: .asciz " %c"
num1: .dword 0
num2: .dword 0
oper: .dword 0
string0: .asciz "Enter Number 1: "
string1: .asciz "Enter Number 2: "
string2: .asciz "Enter Operation: "
string3: .asciz "Result is: %d\n"
string4: .asciz "Again? "
string5: .asciz "Invalid Operation Entered.\n"
debug: .asciz "here\n"
printChar: .asciz "Num: %x, %x\n"
opera: .asciz "Num: \'%d\', \'%d\', %x\n"
