// Compile & link:	gcc -masm=intel -o test c-asm-int-demo.c
// Run:			./test

#include <stdio.h>

int main(void)
{
	int foo = 10, bar = 15;
	__asm__ __volatile__(	"imul eax,ebx;\n"
				"inc eax;\n"
				:"=a"(foo)
				:"a"(foo), "b"(bar)
				);
	printf("Res=%d\n", foo);
	return 0;
}
