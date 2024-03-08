.data
Intro: .asciiz "This program will take in the number of integer values in an array, between 1 and 20, take in the values, and then take in a value to search the list for. \nThe program will then report if the value was found in the list or not. \nHow many items will the list contain? \nEnter a number between 1 and 20: "
Wrong: .asciiz "Enter an intager between 1-20: "
Next: .asciiz "Enter the next value: "
Search: .asciiz "Enter the value we are searching for: "
Found: .asciiz "Found the value in the list"
Unfound: .asciiz "Did not find the value in the list"
.align 4
Array: .space 80

.text
addi $t0, $zero, 0

la $a0, Intro
li $v0, 4
syscall

li $v0, 5
syscall
move $s1, $v0

While1:
blez $s1 Invalid
bgt $s1, 20, Invalid

While:
bne $s1, 0, More

la $a0, Search
li $v0, 4
syscall

li $v0, 5
syscall
move $s3, $v0

addi $t0, $zero, 0

While2:
bne $t0, 80, More2

la $a0, Unfound # if the value isnt found the program ends here
li $v0, 4
syscall

li $v0, 10 #end program
syscall

EndFound: # if the value is found go here
la $a0, Found
li $v0, 4
syscall

li $v0, 10 #end program
syscall

More: # asks the user for however many values they chose and puts them into the array
la $a0, Next
li $v0, 4
syscall

li $v0, 5
syscall
move $s2, $v0

sw $s2, Array($t0)
addi $t0, $t0, 4

addi $s1, $s1, -1
j While

More2: #searches through the array to see if the values are equal to the users input
lb $t1, Array($t0)
beq $s3, $t1, EndFound
addi $t0, $t0, 4
j While2

Invalid: #if the array size the user picks isnt between 1-20
la $a0, Wrong
li $v0, 4
syscall

li $v0, 5
syscall
move $s1, $v0

j While1

