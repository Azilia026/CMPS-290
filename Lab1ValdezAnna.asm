li $s1, 20 #g
li $s2, 14 #h
li $s3, 6 #i
li $s4, 22 #j

sub $t0, $s2, $s3 #h-i
add $t1, $s1, $s4 #g+j
add $s0, $t1, $t0 #all temp values added to final product

#printager
li $v0, 1 #place a 1 into $v0
move $a0, $s0 #copy $s0 into $a0
syscall #make a call to the system

#new line
li $v0, 11
addi $a0, $zero, 0xA
syscall

#takes in int
li $v0, 5
syscall
move $s2, $v0

#takes in int
li $v0, 5
syscall
move $s4, $v0,

#new calculation
sub $t0, $s2, $s3
add $t1, $s1, $s4
add $s0, $t1, $t0

#printager
li $v0, 1 
move $a0, $s0 
syscall 

#no more falling off bottom
li $v0, 10
syscall
