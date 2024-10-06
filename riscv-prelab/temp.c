#include <stdio.h>
int multi(int a){

    int r=1;
    for(int i=1;i<=a;i++){
         r*=i;
    }
    return r;
}
int main() {
    int n,a,fact = 1;

    printf("please input a number:\n");
    scanf("%d", &n);

    if (n < 0) {
        printf("it can't be a minus one!\n");
        return 0;
    }

    a=multi(fact);
    printf("the result is%d\n", a);
    return 0;
}

