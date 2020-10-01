.data
    a: .word 2
    b: .word 5 #entradas do usuário
    
.text
    lw x5, a
    lw x6, b #carregando a entrada do usuário
    jal x1, exponencial #chama exponencial e salva o próximo endereço pra ser executado depois
    addi a1, x10, 0 #a1 guarda o resultado
    addi a0, x0, 1 #faz ecall ser a saída
    ecall #imprime a saída
    jal zero, end

	exponencial:
    beq x6, x0, exp0 # expoente igual a zero
	addi x7, x0, 1 # i = 1
    beq x6, x7, exp1 # expoente igual a um
    add x10, x0, x5 # resultado = a
    loop:
    	mul x10, x10, x5 #multiplica o resultado anterior por a
        addi x7, x7, 1 # incrementa o i
        bne x7, x6, loop #enquando i não for igual a b continua no loop
   		jalr x0, 0(x1) #sai do exponencial
    exp0: 
    	addi x10, x0, 1 
    	jalr x0, 0(x1) #sai do exponencial
    exp1:
    	add x10, x5, x0
    	jalr x0, 0(x1) #sai do exponencial

end:
