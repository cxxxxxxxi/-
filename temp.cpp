#include <stdio.h>

int main() {
    int n, fact = 1;

    printf("请输入一个整数：");
    scanf("%d", &n);

    if (n < 0) {
        printf("输入的整数不能为负数。\n");
        return 0;
    }

    for (int i = 1; i <= n; i++) {
        fact *= i;
    }

    printf("%d的阶乘是%d。\n", n, fact);
    return 0;
}

