#include <neorv32.h>
#include <string.h>


int main(){
	uint32_t a=136;
	neorv32_cpu_csr_write(768, a);
	neorv32_cpu_goto_user_mode();
	neorv32_cpu_csr_clr(CSR_MSTATUS, 1 << CSR_MSTATUS_MIE);
	neorv32_cpu_csr_clr(CSR_MSTATUS, 1 << CSR_MSTATUS_MPIE);
	return 0;
}
