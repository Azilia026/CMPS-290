#Anna Valdez
#2-10-24
#This program will be a simple guess the number game. Player 1 will enter a whole number for the other player to try and guess. Player 2 will then attempt to guess the number, and this program will give feedback on whether the guess is too high, too low, or correct

.data
str_P1: .asciiz "Player 1: Please enter a whole number. "
str_P2: .asciiz "Player 2: Please guess a whole number. "
str_High: .asciiz "Player 2: Guess too high, guess again. "
str_Low: .asciiz "Player 2: Guess too Low, guess again. "
str_Correct: .asciiz "Player 2: You guessed correctly!"
.text

la $a0, str_P1
li $v0, 4
syscall

#takes in int from p1
li $v0, 5
syscall
move $s1, $v0

la $a0, str_P2
li $v0, 4
syscall

#takes in int from p2
li $v0, 5
syscall
move $s2, $v0

while:
beq $s2, $s1, exit #if the values are equal then the program ends, if not, proceed with loop

slt $s0, $s1, $s2 #checks if p1's value is higher than p2's
beq $s0, $zero, printL

slt $s0, $s2, $s1 #checks if p1's value is lower than p2's
beq $s0, $zero, printH

more:
li $v0, 5 # will take in a new intager from p2
syscall
move $s2, $v0

j while

exit:
la $a0, str_Correct
li $v0, 4
syscall

#end program
li $v0, 10
syscall

printL: 
la $a0, str_Low
li $v0, 4
syscall
j more

printH: 
la $a0, str_High
li $v0, 4
syscall
j more
