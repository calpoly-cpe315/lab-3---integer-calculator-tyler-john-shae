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



	//print result
	ldr	w0, =string3
	ldr	x1, =num2
	ldr	x1, [x1, #0]
	bl	printf

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
	b	loop
	ret

.data
yes: .byte 'y'
formatInt: .asciz "%d"
formatStr: .asciz " %c"
num1: .word 0
num2: .word 0
oper: .word 0
string0: .asciz "Enter Number 1: "
string1: .asciz "Enter Number 2: "
string2: .asciz "Enter Operation: "
string3: .asciz "Result is: %d\n"
string4: .asciz "Again? "
string5: .asciz "Invalid Operation Entered.\n"

