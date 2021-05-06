/* pseudocode

sum = 0, i = 1

for (i=2; i<N; i++):
    isprime = True

    for (j=2; j<=i/2; j++):
        if (j divides i):
            isprime = False
            break

    if isprime:
        sum += i

return (sum)%M
*/

.text
.global sumprimes
sumprimes: # inputs: N(%rdi), M(%rsi); output: %rax
    movq $1, %r8 # i: iterator from 2 to N-1
    movq $0, %r11 # s : sum of primes less than N
.outerloop:
    cmp %r8, %rdi # if (i==N)
    je .loopexit    # {break;}
    inc %r8 # i++
    movq %r8, %r9
    shrq $1, %r9 # i' = i >> 1
    movq $1, %r10 # j: iterator from 2 to i'
.innerloop:
    cmp %r9, %r10 # if (j == i')
    je .isprime    # {jump to .isprime}
    inc %r10 # j++
    movq $0, %rdx
    movq %r8, %rax # %rdx:%rax now has i
    divq %r10 # i ÷ j (rax: quotient, rdx: remainder)
    cmp $0, %rdx # if (reminder == 0)
    je .outerloop     # {break;}            ## i is composite
    jmp .innerloop # else {continue;}
.isprime: # if i is prime
    addq %r8, %r11 # s += i
    jmp .outerloop # continue;
.loopexit: # s(%r11) now has sum of all primes
    movq $0, %rdx
    movq %r11, %rax # %rdx:%rax now has s
    divq %rsi # divide by M; %rdx has S mod M
    movq %rdx, %rax # we have to return S mod M
    ret # return the value in %rax

