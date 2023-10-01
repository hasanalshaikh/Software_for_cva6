
my_main.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <__crt0_entry>:
    80000000:	30005073          	csrwi	mstatus,0

0000000080000004 <__crt0_cpu_csr_init>:
    80000004:	30401073          	csrw	mie,zero
    80000008:	00000097          	auipc	ra,0x0
    8000000c:	0e408093          	addi	ra,ra,228 # 800000ec <__crt0_trap_handler>
    80000010:	30509073          	csrw	mtvec,ra

0000000080000014 <__crt0_pointer_init>:
    80000014:	00002117          	auipc	sp,0x2
    80000018:	fe810113          	addi	sp,sp,-24 # 80001ffc <__crt0_stack_begin>
    8000001c:	00001197          	auipc	gp,0x1
    80000020:	93418193          	addi	gp,gp,-1740 # 80000950 <__global_pointer$>

0000000080000024 <__crt0_reg_file_init>:
    80000024:	00000213          	li	tp,0
    80000028:	00000293          	li	t0,0
    8000002c:	00000313          	li	t1,0
    80000030:	00000393          	li	t2,0
    80000034:	00000413          	li	s0,0
    80000038:	00000493          	li	s1,0
    8000003c:	00000813          	li	a6,0
    80000040:	00000893          	li	a7,0
    80000044:	00000913          	li	s2,0
    80000048:	00000993          	li	s3,0
    8000004c:	00000a13          	li	s4,0
    80000050:	00000a93          	li	s5,0
    80000054:	00000b13          	li	s6,0
    80000058:	00000b93          	li	s7,0
    8000005c:	00000c13          	li	s8,0
    80000060:	00000c93          	li	s9,0
    80000064:	00000d13          	li	s10,0
    80000068:	00000d93          	li	s11,0
    8000006c:	00000e13          	li	t3,0
    80000070:	00000e93          	li	t4,0
    80000074:	00000f13          	li	t5,0
    80000078:	00000f93          	li	t6,0

000000008000007c <__crt0_copy_data>:
    8000007c:	00000597          	auipc	a1,0x0
    80000080:	0d458593          	addi	a1,a1,212 # 80000150 <__etext>
    80000084:	00000617          	auipc	a2,0x0
    80000088:	0cc60613          	addi	a2,a2,204 # 80000150 <__etext>
    8000008c:	00000697          	auipc	a3,0x0
    80000090:	0c468693          	addi	a3,a3,196 # 80000150 <__etext>
    80000094:	00c58963          	beq	a1,a2,800000a6 <__crt0_clear_bss>

0000000080000098 <__crt0_copy_data_loop>:
    80000098:	00d65763          	ble	a3,a2,800000a6 <__crt0_clear_bss>
    8000009c:	4198                	lw	a4,0(a1)
    8000009e:	c218                	sw	a4,0(a2)
    800000a0:	0591                	addi	a1,a1,4
    800000a2:	0611                	addi	a2,a2,4
    800000a4:	bfd5                	j	80000098 <__crt0_copy_data_loop>

00000000800000a6 <__crt0_clear_bss>:
    800000a6:	00000717          	auipc	a4,0x0
    800000aa:	0aa70713          	addi	a4,a4,170 # 80000150 <__etext>
    800000ae:	00000797          	auipc	a5,0x0
    800000b2:	0a278793          	addi	a5,a5,162 # 80000150 <__etext>

00000000800000b6 <__crt0_clear_bss_loop>:
    800000b6:	00f75663          	ble	a5,a4,800000c2 <__crt0_clear_bss_loop_end>
    800000ba:	00072023          	sw	zero,0(a4)
    800000be:	0711                	addi	a4,a4,4
    800000c0:	bfdd                	j	800000b6 <__crt0_clear_bss_loop>

00000000800000c2 <__crt0_clear_bss_loop_end>:
    800000c2:	00000513          	li	a0,0
    800000c6:	00000593          	li	a1,0
    800000ca:	05e000ef          	jal	ra,80000128 <main>

00000000800000ce <__crt0_main_exit>:
    800000ce:	30401073          	csrw	mie,zero
    800000d2:	34051073          	csrw	mscratch,a0

00000000800000d6 <__crt0_main_aftermath>:
    800000d6:	80000097          	auipc	ra,0x80000
    800000da:	f2a08093          	addi	ra,ra,-214 # 0 <__neorv32_heap_size>
    800000de:	00008363          	beqz	ra,800000e4 <__crt0_main_aftermath_end>
    800000e2:	9082                	jalr	ra

00000000800000e4 <__crt0_main_aftermath_end>:
    800000e4:	10500073          	wfi
    800000e8:	bff5                	j	800000e4 <__crt0_main_aftermath_end>
    800000ea:	0001                	nop

00000000800000ec <__crt0_trap_handler>:
    800000ec:	1161                	addi	sp,sp,-8
    800000ee:	c022                	sw	s0,0(sp)
    800000f0:	c226                	sw	s1,4(sp)
    800000f2:	34202473          	csrr	s0,mcause
    800000f6:	02044363          	bltz	s0,8000011c <__crt0_trap_handler_end>
    800000fa:	34102473          	csrr	s0,mepc
    800000fe:	00041483          	lh	s1,0(s0)
    80000102:	888d                	andi	s1,s1,3
    80000104:	0409                	addi	s0,s0,2
    80000106:	34141073          	csrw	mepc,s0
    8000010a:	00300413          	li	s0,3
    8000010e:	00941763          	bne	s0,s1,8000011c <__crt0_trap_handler_end>
    80000112:	34102473          	csrr	s0,mepc
    80000116:	0409                	addi	s0,s0,2
    80000118:	34141073          	csrw	mepc,s0

000000008000011c <__crt0_trap_handler_end>:
    8000011c:	4402                	lw	s0,0(sp)
    8000011e:	4492                	lw	s1,4(sp)
    80000120:	0121                	addi	sp,sp,8
    80000122:	30200073          	mret
    80000126:	0000                	unimp

0000000080000128 <main>:
.balign 4
.global main


main:
	li	a5,136
    80000128:	08800793          	li	a5,136
	csrw	mstatus,a5
    8000012c:	30079073          	csrw	mstatus,a5
	jal 	ra, goto_user_mode
    80000130:	00a000ef          	jal	ra,8000013a <goto_user_mode>
	csrw 	mstatus, a5
    80000134:	30079073          	csrw	mstatus,a5
	add 	a5, a5, 1
    80000138:	0785                	addi	a5,a5,1

000000008000013a <goto_user_mode>:

goto_user_mode:
	csrw	mepc,ra
    8000013a:	34109073          	csrw	mepc,ra
	lui	ra,0x2
    8000013e:	6089                	lui	ra,0x2
	addi	ra,ra,-2048
    80000140:	80008093          	addi	ra,ra,-2048 # 1800 <__neorv32_heap_size+0x1800>
	csrc	mstatus,ra
    80000144:	3000b073          	csrc	mstatus,ra
	mret
    80000148:	30200073          	mret
    8000014c:	0000                	unimp
    8000014e:	0000                	unimp
