#include </home/steven/Documents/LLVM/llvm-project/build/lib/clang/21/include/riscv_vector.h>
int main(){
int32_t a[5] = {1,2,3,4,5};
int32_t b = 5;
size_t vl = __riscv_vsetvl_e32m1(5);
vint32m1_t v_fila = __riscv_vle32_v_i32m1(a, vl);
vint32m1_t mul1 = __riscv_mul_vec_scalar(v_fila, b);
vint32m1_t mul2 = __riscv_sum_vec_scalar(v_fila, b);
vint32m1_t mul3 = __riscv_move_left_vec(v_fila,b);
vint32m1_t mul4 = __riscv_move_right_vec(v_fila,b);
vint32m1_t mul5 = __riscv_saturate_vec(v_fila,b);
vint32m1_t mul6 = __riscv_mul_vec(v_fila,v_fila);
vint32m1_t mul7 = __riscv_sum_vec(v_fila,v_fila);
vint32m1_t mul8 = __riscv_copy_vec(v_fila,v_fila);
vint32m1_t mul9 = __riscv_extend_vec(v_fila,v_fila);
}
