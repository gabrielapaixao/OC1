.data
    input: .word 5 #entrada do usuário

.text
    lw x5, input #carregando a entrada do usuário
    jal x1, evenorodd #chama evenorodd e salva o próximo endereço pra ser executado depois
    addi a1, x10, 0 #a1 guarda o resultado
    addi a0, x0, 1 #faz ecall ser a saída
    ecall #imprime a saída
    jal zero, end

evenorodd:
    li t1, 2
    rem a0, t0, t1 #a0 <-t0 mod t1 
    jalr x0, 0(x1) #sai do evenorodd

end:
