/* pseudocode

i, j = 0, 0
while (i < N):
    while (j < M):
        i' = i*M + j
        j' = j*N + i
        b[j'] = a[i']
        j += 1
    i += 1
    j = 0

return
*/

.text
.global transpose
transpose: # inputs: a(%rdi), n(%rsi), m(%rdx), b(%rcx)
    movq $0, %r8 # i = 0
    movq $0, %r9 # j = 0
.outerloop:
    cmp %r8, %rsi # if (i == n)
    je .loopexit   #    {exit loop}
    jmp .innerloop
.innerloop:
    cmp %r9, %rdx # if (j == m)
    je .nextloop #      {exit inner loop} 
    movq %r8, %r10
    imul %rdx, %r10
    addq %r9, %r10 # r10 = i*m + j
    movq %r9, %r11
    imul %rsi, %r11
    addq %r8, %r11 # r11 = j*n + i
    movq (%rdi, %r10, 8), %r12 # temp = a[i][j]
    movq %r12, (%rcx, %r11, 8) # b[j][i] = temp
    inc %r9    # j++
    jmp .innerloop
.nextloop:
    movq $0, %r9 # reset j = 0
    inc %r8    # i++
    jmp .outerloop
.loopexit:
    ret
