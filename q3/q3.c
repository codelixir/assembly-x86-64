// SUM OF PRIME NUMBERS UPTO N

#include <stdio.h>

extern int sumprimes(int n, int m);
// function takes in N and M and returns {(Σ(prime numbers less than N)) mod M}

int main()
{
    int n, m;
    scanf("%d%d", &n, &m);
    printf("%d\n", sumprimes(n, m));
    return 0;
}