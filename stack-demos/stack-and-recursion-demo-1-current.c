#include <stdio.h>

long long int test;

unsigned long long int add(unsigned long int n){
    long long int res;
    if(n != 0)
        res = add(n-1) + n;
    else
        res = 0;
    //test = res;
    return res;
}

int main(){
    printf("result : %llu \n", add(10000000));
    return 0;
}
