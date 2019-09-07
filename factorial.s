.data
  input:.word 5 # entrada

.text
main:
  lw x5, input # carregando entrada
  li x2, 1
  li x3, 1
  jal x1, factorial # chamando factorial
  addi a1, x2, 0 # a1 guarda o resultado
  addi a0, x0, 1 # saída
  ecall # imprime o resultado
  jal  zero, end

factorial:
  beq x3, x5, done #se a entrada for igual a 1, volta pro main
  mul x2,x2,x5 #multiplica a entrada pelo resultado anterior
  sub x5, x5,x3 #decrementa a entrada
  beq x0, x0, factorial #volta pro loop
  
done:
	jalr x0, 0(x1) # volta pro main
end:
