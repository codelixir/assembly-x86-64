/* pseudocode

while (n > 0):
    m = n & 1
    if m:
        set_bits += 1
    n /= 2

if (set_bits & 1):
    return 1
else:
    return 0
*/

.text
.global oddbits 
oddbits: # input n (64-bit) stored in %rdi; output stored in %rax
    movq %rdi, %r8
    movq $0, %r10 # i : number of bits
.loopback:
    cmpq $0, %r8
    jz .loopexit # exit loop if n = 0
    movq %r8, %r9   # m = n
    shrq $1, %r8     # n = n >> 1
    andq $1, %r9     # m = m&1
    cmpq $0, %r9      # if (m!=0)
    jnz .setbit        # {jump to .setbit}
    jmp .loopback   # repeat .loopback
.setbit:
    inc %r10 # i ++
    jmp .loopback
.loopexit:
    andq $1, %r10 # i = i&1
    movq %r10, %rax # return 1 if i=1 else return 0
    ret
