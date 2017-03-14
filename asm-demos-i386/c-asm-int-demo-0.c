// Compile & link:	gcc -o test c-asm-int-demo.c
// Run:			./test

#include <stdio.h>

int main(void)
{
	int foo = 10, bar = 15;
	foo = foo * bar + 1;
	printf("Res=%d\n", foo);
	return 0;
}
