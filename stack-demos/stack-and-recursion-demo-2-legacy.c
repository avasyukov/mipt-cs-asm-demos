#include <stdio.h>

unsigned long long int add(unsigned long int n, unsigned long long int sum){
    return (n == 0) ? sum : add(n-1, n+sum); //tail recursion form
}

int main(){
    printf("result : %llu \n", add(1000000, 0));//OK
    return 0;
}
