
my_main.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <__crt0_entry>:
    80000000:	30005073          	csrwi	mstatus,0

0000000080000004 <__crt0_cpu_csr_init>:
    80000004:	30401073          	csrw	mie,zero
    80000008:	00000097          	auipc	ra,0x0
    8000000c:	0f408093          	addi	ra,ra,244 # 800000fc <__crt0_trap_handler>
    80000010:	30509073          	csrw	mtvec,ra

0000000080000014 <__crt0_pointer_init>:
    80000014:	00002117          	auipc	sp,0x2
    80000018:	fe810113          	addi	sp,sp,-24 # 80001ffc <__crt0_stack_begin>
    8000001c:	00001197          	auipc	gp,0x1
    80000020:	96018193          	addi	gp,gp,-1696 # 8000097c <__global_pointer$>

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
    80000080:	10058593          	addi	a1,a1,256 # 8000017c <__etext>
    80000084:	00000617          	auipc	a2,0x0
    80000088:	0f860613          	addi	a2,a2,248 # 8000017c <__etext>
    8000008c:	00000697          	auipc	a3,0x0
    80000090:	0f068693          	addi	a3,a3,240 # 8000017c <__etext>
    80000094:	00c58e63          	beq	a1,a2,800000b0 <__crt0_clear_bss>

0000000080000098 <__crt0_copy_data_loop>:
    80000098:	00d65c63          	ble	a3,a2,800000b0 <__crt0_clear_bss>
    8000009c:	0005a703          	lw	a4,0(a1)
    800000a0:	00e62023          	sw	a4,0(a2)
    800000a4:	00458593          	addi	a1,a1,4
    800000a8:	00460613          	addi	a2,a2,4
    800000ac:	fedff06f          	j	80000098 <__crt0_copy_data_loop>

00000000800000b0 <__crt0_clear_bss>:
    800000b0:	00000717          	auipc	a4,0x0
    800000b4:	0cc70713          	addi	a4,a4,204 # 8000017c <__etext>
    800000b8:	00000797          	auipc	a5,0x0
    800000bc:	0c478793          	addi	a5,a5,196 # 8000017c <__etext>

00000000800000c0 <__crt0_clear_bss_loop>:
    800000c0:	00f75863          	ble	a5,a4,800000d0 <__crt0_clear_bss_loop_end>
    800000c4:	00072023          	sw	zero,0(a4)
    800000c8:	00470713          	addi	a4,a4,4
    800000cc:	ff5ff06f          	j	800000c0 <__crt0_clear_bss_loop>

00000000800000d0 <__crt0_clear_bss_loop_end>:
    800000d0:	00000513          	li	a0,0
    800000d4:	00000593          	li	a1,0
    800000d8:	070000ef          	jal	ra,80000148 <main>

00000000800000dc <__crt0_main_exit>:
    800000dc:	30401073          	csrw	mie,zero
    800000e0:	34051073          	csrw	mscratch,a0

00000000800000e4 <__crt0_main_aftermath>:
    800000e4:	80000097          	auipc	ra,0x80000
    800000e8:	f1c08093          	addi	ra,ra,-228 # 0 <__neorv32_heap_size>
    800000ec:	00008463          	beqz	ra,800000f4 <__crt0_main_aftermath_end>
    800000f0:	000080e7          	jalr	ra

00000000800000f4 <__crt0_main_aftermath_end>:
    800000f4:	10500073          	wfi
    800000f8:	ffdff06f          	j	800000f4 <__crt0_main_aftermath_end>

00000000800000fc <__crt0_trap_handler>:
    800000fc:	ff810113          	addi	sp,sp,-8
    80000100:	00812023          	sw	s0,0(sp)
    80000104:	00912223          	sw	s1,4(sp)
    80000108:	34202473          	csrr	s0,mcause
    8000010c:	02044663          	bltz	s0,80000138 <__crt0_trap_handler_end>
    80000110:	34102473          	csrr	s0,mepc
    80000114:	00041483          	lh	s1,0(s0)
    80000118:	0034f493          	andi	s1,s1,3
    8000011c:	00240413          	addi	s0,s0,2
    80000120:	34141073          	csrw	mepc,s0
    80000124:	00300413          	li	s0,3
    80000128:	00941863          	bne	s0,s1,80000138 <__crt0_trap_handler_end>
    8000012c:	34102473          	csrr	s0,mepc
    80000130:	00240413          	addi	s0,s0,2
    80000134:	34141073          	csrw	mepc,s0

0000000080000138 <__crt0_trap_handler_end>:
    80000138:	00012403          	lw	s0,0(sp)
    8000013c:	00412483          	lw	s1,4(sp)
    80000140:	00810113          	addi	sp,sp,8
    80000144:	30200073          	mret

0000000080000148 <main>:
.balign 4
.global main


main:
	li	a5,136
    80000148:	08800793          	li	a5,136
	csrw	mstatus,a5
    8000014c:	30079073          	csrw	mstatus,a5
	jal 	ra, goto_user_mode
    80000150:	00c000ef          	jal	ra,8000015c <goto_user_mode>
	wfi
    80000154:	10500073          	wfi
	add a1, a1, 5
    80000158:	00558593          	addi	a1,a1,5

000000008000015c <goto_user_mode>:

goto_user_mode:
	csrw	mepc,ra
    8000015c:	34109073          	csrw	mepc,ra
	lui	ra,0x2
    80000160:	000020b7          	lui	ra,0x2
	addi	ra,ra,-2048
    80000164:	80008093          	addi	ra,ra,-2048 # 1800 <__neorv32_heap_size+0x1800>
	csrc	mstatus,ra
    80000168:	3000b073          	csrc	mstatus,ra
	mret
    8000016c:	30200073          	mret
	csrw    mstatus, a5
    80000170:	30079073          	csrw	mstatus,a5
	wfi
    80000174:	10500073          	wfi
	add a1, a1, 5
    80000178:	00558593          	addi	a1,a1,5
