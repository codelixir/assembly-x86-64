// TRANSPOSE OF A MATRIX

#include <stdio.h>

extern void transpose(long long *array, int n, int m, long long *trans);

/*  here I'm passing the pointer of a second array as a parameter
    so that I can directly make changes in the memory location and
    this way, I won't have to return anything from the function */

int main()
{
    int n, m;
    scanf("%d%d", &n, &m);
    long long a[n][m];
    long long b[m][n];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            scanf("%lld", &a[i][j]);
        }
    }
    transpose(&a[0][0], n, m, &b[0][0]);
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("%lld ", b[i][j]);
        }
        printf("\n");
    }

    return 0;
}