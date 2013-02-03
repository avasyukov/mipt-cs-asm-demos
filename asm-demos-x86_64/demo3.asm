; Assemble:	nasm -f elf demo3.asm
; Link:		gcc -o demo3 demo3.o
; Run:		./demo3
;
; A similar "C" program
; #include 
; int main()
; {
;   char   char1='a';         /* sample character */
;   char   str1[]="string";   /* sample string */
;   int    int1=1234567;      /* sample integer */
;   int    hex1=0x6789ABCD;   /* sample hexadecimal */
; 
;   printf("Hello world: %c %s %d %X \n", /* format string for printf */
;          char1, str1, int1, hex1);
;   return 0;
; }


        extern printf                   ; the C function to be called

        SECTION .data                   ; Data section

msg:    db "Hello world: %c %s of length %d. %d %X",10,0
					; format string for printf
char1:	db	'a'			; a character 
str1:	db	"string",0	        ; a C string, "string" needs 0
len:	equ	$-str1			; len has value, not an address
inta1:	dd	1234567		        ; integer 1234567
hex1:	dd	0x6789ABCD	        ; hex constant 

        SECTION .text                   ; Code section.

        global	main		        ; "C" main program 
main:				        ; label, start of main program
	
	push	rbp
	mov	rbp, rsp

	mov	r9d, [hex1]	        ; hex constant
	mov	r8d, [inta1]	        ; integer data pass by value
	mov	ecx, len	        ; constant pass by value
	mov	edx, str1		; "string" pass by reference 
	mov     esi, dword [char1]	; 'a'
        mov     edi, msg		; address of format string
        call    printf			; Call C function
	add     esp, 32			; pop stack 4*8 bytes

	mov	rsp, rbp
	pop	rbp

	mov	rbx, 0
        mov     rax, 1			; exit code, 0=normal
        int	0x80			; main returns to operating system
