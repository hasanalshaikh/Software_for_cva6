.file "main.S"
.section .text
.balign 4
.global main

main:
 	li a1, 0x1009A2
 	csrwi mstatus, 0
 	ret

.end
