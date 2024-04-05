.data
Intro: .asciiz "This program reads in a String from the user and then allows the user to make changes to it until they want to stop. \nPlease enter your string now (maximum of 40 characters):"
Current: .asciiz "\nYour current string is: "
Changes: .asciiz "\nWould you like to make changes? (y/n): \n"
Quest: .asciiz "\nWhat character would you like to change?\n"
Quest2: .asciiz "\nWhat character would you like to change it to?\n"
Final: .asciiz "\nYour final string is: "
String: .space 40

.text
la $a0, Intro
li $v0, 4
syscall

li $v0, 8
la $a0, String
li $a1, 41
syscall

while:
	li $v0, 4
	la $a0, Current
	syscall

	li $v0, 4
	la $a0, String
	syscall

	li $v0, 4
	la $a0, Changes
	syscall

	li $v0, 12
	syscall

	add $s0, $zero, $v0

	beq $s0, 'n', exit
	bne $s0, 'y', while

	li $v0, 4
	la $a0, Quest
	syscall

	li $v0, 12
	syscall

	move $s1, $v0

	li $v0, 4
	la $a0, Quest2
	syscall

	li $v0, 12
	syscall

	move $s2, $v0
	
	la $a1, String
	move $a2, $s1
	move $a3, $s2
	jal ChangeStr

j while

exit:
	li $v0, 4
	la $a0, Final
	syscall

	li $v0, 4
	la $a0, String
	syscall

	li $v0, 10
	syscall
	
ChangeStr:
	lb $t2, 0($a1) #$t2 = y[i]
	beq $t2, $a2, change
	beq $t2, $zero, done #if $t2 == ‘\0’ then exit
	addi $a1, $a1, 1
j ChangeStr
	
done:
jr $ra
		
change:
	sb $a3, 0($a1)
j ChangeStr
