.data
Sec1: .asciiz "This section of the program will take in two values, add them together, and then return the result.\n"
First: .asciiz "Enter the first value: "
Second: .asciiz "Enter the second value: "
Sum: .asciiz "The sum of the two values is: "

Sec2: .asciiz "\nThis section of the program will take in a string and echo it back to you."
Input: .asciiz "\nEnter your string here: "
Return: .asciiz "The string you entered is: "
String: .space 64

.text
la $a0, Sec1
li $v0, 4
syscall

la $a0, First
li $v0, 4
syscall

#first intager
li $v0, 5
syscall
move $t1, $v0

la $a0, Second
li $v0, 4
syscall

#second intager
li $v0, 5
syscall
move $t2, $v0

add $t0, $t1, $t2

la $a0, Sum
li $v0, 4
syscall

#printager
li $v0, 1 
move $a0, $t0 
syscall

#new line
li $v0, 11
addi $a0, $zero, '\n'
syscall

#Start section 2
la $a0, Sec2
li $v0, 4
syscall

la $a0, Input
li $v0, 4
syscall

li $v0, 8
la $a0, String
li $a1, 64
syscall

li $v0, 4
la $a0, Return
syscall

li $v0, 4
la $a0, String
syscall

#end program
li $v0, 10
syscall
