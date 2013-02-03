; Assemble:	nasm -f elf demo2.asm
; Link:		gcc -o demo2 demo2.o
; Run:		./demo2
;
; Equivalent C code
; /* print an int and an expression */
; #include 
; int main()
; {
;   int a=5;
;   printf("a=%d, eax=%d\n", a, a+2);
;   return 0;
; }

; Declare some external functions
;
	extern	printf		; the C function, to be called

	SECTION	.data		; Data section, initialized variables

a:	dd	5		; int a=5;
fmt:	db "a=%d, eax=%d", 10, 0 ; The printf format, "\n",'0'


	SECTION	.text                   ; Code section.

	global	main		; the standard gcc entry point
main:				; the program label for the entry point
	push	rbp		; set up stack frame
	mov	rbp,rsp

	mov	rax, [a]	; put a from store into register
	add	rax, 2		; a+2
	mov	edx, eax	; value of a+2
	mov	esi, [a]	; value of variable a
	mov	edi, fmt	; address of ctrl string
	call	printf		; Call C function
	add	rsp, 24		; pop stack 3 push times 4 bytes

	mov	rsp, rbp	; takedown stack frame
	pop	rbp		; same as "leave" op

	mov	rbx,0
	mov	rax,1		;  normal, no error, return value
	int	0x80		; return
