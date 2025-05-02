#include <cmath>
#include <stdio.h>

bool esPrimo(int a) {
    if (a == 1)
        return false;
    int a_sqrt_trncated = sqrt((double) a);
    int i = a_sqrt_trncated;
    while (i > 1 && a % i != 0)
        i--;
    return i == 1;
}

void primosEntreAyB(int a, int b)
{
    printf("primos entre a=%d, b=%d:\n", a, b);
    for (; a < b; a++)
        if (esPrimo(a))
                printf(" - %d\n", a);
}

int main()
{
    primosEntreAyB(1, 20);
    return 0;
}
