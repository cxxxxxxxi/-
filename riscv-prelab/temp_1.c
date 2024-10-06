
#include <stdio.h>
int multi(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * multi(n - 1);
    }
}

int main() {
    int number;

    printf("please input a number");
    scanf("%d", &number);

    
    if (number < 0) {
        printf("it can't be a minus one!\n");
    } else {
        int result = multi(number);
        printf("the result is:%d\n", result);
    }

    return 0;
}

