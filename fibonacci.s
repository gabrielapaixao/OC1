.data
    n: .word 7 #entrada do usuário
    
.text
    lw x5, n #carregando a entrada do usuário
    jal x1, fibonacci #chama a função fibonacci e salva o próximo endereço pra ser executado depois
    addi a1, x10, 0 #a1 guarda o resultado
    addi a0, x0, 1 #faz ecall ser a saída
    ecall #imprime a saída
    jal zero, end

	fibonacci:
    add x6, x0, x0 # i = 0
    addi x7, x0, 1 # j = 1 
    beq x5, x7, primeirotermo
    addi x28, x0, 1 #controle do loop: 1 a n
    loop:
    add x10, x6, x7 # soma i e j
    add x6, x7, x0 # i = j
    add x7, x10, x0 # j = soma
    addi x28, x28, 1 #incrementa a variável de controle
    bne x28, x5, loop #enquanto a variável de controle não for igual a n continua no loop
    jalr x0, 0(x1) #sai de fibonacci
    primeirotermo:
    addi x10, x0, 1 # 1º termo da sequência é 1
    jalr x0, 0(x1)
    
end:
