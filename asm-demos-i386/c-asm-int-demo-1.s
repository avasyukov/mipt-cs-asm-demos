	.file	"c-asm-int-demo-1.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"Res=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	lea	ecx, [esp+4]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	sub	esp, 16
	mov	DWORD PTR [ebp-12], 10
	mov	DWORD PTR [ebp-16], 15
	mov	eax, DWORD PTR [ebp-12]
	mov	edx, DWORD PTR [ebp-16]
	mov	ebx, edx
#APP
# 9 "c-asm-int-demo-1.c" 1
	imul eax,ebx;
inc eax;

# 0 "" 2
#NO_APP
	mov	DWORD PTR [ebp-12], eax
	sub	esp, 8
	push	DWORD PTR [ebp-12]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	eax, 0
	lea	esp, [ebp-8]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	lea	esp, [ecx-4]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.2 20150212 (Red Hat 4.9.2-6)"
	.section	.note.GNU-stack,"",@progbits
