li $s0, 1
li $s1, 15
sll $s0, $s0, 15

while:
beq $s0, $zero, exit #if the values are equal then the program ends, if not, proceed with loop

#printager 15-0
li $v0, 1 
move $a0, $s1 
syscall

sub $s1, $s1, 1

#space
li $v0, 11
addi $a0, $zero, ' '
syscall

#printager 32767-1
li $v0, 1 
move $a0, $s0 
syscall

#new line
li $v0, 11
addi $a0, $zero, '\n'
syscall

srl $s0, $s0, 1

j while

exit:
#end program
li $v0, 10
syscall