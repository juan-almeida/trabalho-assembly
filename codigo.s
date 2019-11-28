 .data                        #Aqui onde se cria as variaveis em Assembly
Mensagem:  .asciiz "Digite um numero\n"  #Cria uma variável string
Mensagem1:	.asciiz "O Resultado da Subtracao e: \n"
num1:       .word 1                      #Cria uma variável int
num2:       .word 1                      #Cria uma variável int
result:    .word 1                       #Cria uma variável int

            .text                        #Iniciando os codigos do programa usando as variaveis criadas no .data
main: li $v0, 4                          #Declarando a main
la $a0, Mensagem                         #Exibe a Mensagem na tela
syscall                                  #Chama o sistema

li $v0, 5                                #Lê um inteiro
syscall                                  #Chama o sistema
sw $v0, num1                             #Joga na variavel o que o usuario digitou

li $v0, 4                          
la $a0, Mensagem                         #Exibe a Mensagem na tela
syscall                                  #Chama o sistema

li $v0, 5                                #Lê um inteiro
syscall                                  #Chama o sistema
sw $v0, num2  

li $v0, 4                          
la $a0, Mensagem1
syscall  

lw $s0, num1($zero)
lw $s1, num2($zero)
sub $t0, $s0, $s1                        
sw $t0, result                           #Joga na variavel result o valor do temporario

li $v0, 1                                #Le um inteiro
move $a0, $t0                            #Exibe o resultado na tela
syscall                                  #Chama o sistema

jr $ra                                   
