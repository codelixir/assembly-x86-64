// ODD NUMBER OF SET BITS

#include <stdio.h>

extern long long oddbits(long long n);
// function returns 1 if set bits are odd, and 0 if even

int main()
{

    long long n;
    scanf("%lld", &n);
    if (oddbits(n))
    {
        printf("TRUE\n");
    }
    else
        printf("FALSE\n");

    return 0;
}