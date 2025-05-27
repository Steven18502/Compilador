   </home/steven/Documents/LLVM/llvm-project/build/lib/clang/21/include/riscv_vector.h>
int32_t img_in[5][8] = {{1,2,3,4,5,6,7,8},
                        {1,2,3,4,5,6,7,8}, 
                        {1,2,3,4,5,6,7,8},
                        {1,2,3,4,5,6,7,8},
                        {1,2,3,4,5,6,7,8}};

int32_t kernel[3][3] = {{1,2,3},
                        {4,5,6},
                        {7,8,9}};

int32_t img_out[5][10];


int main() {
    size_t vl = __riscv_vsetvl_e32m1(10);
    size_t c_row = 0;
    vint32m1_t v_fila = __riscv_vle32_v_i32m1(img_in[c_row+1], vl);
    for (size_t k_row = 0; k_row < 3; k_row++){
        vint32m1_t mul1 = __riscv_mul_vec_scalar(v_fila, kernel[k_row][0]);
        for (size_t k_col = 1; k_col < 3; k_col++){
            vint32m1_t mul2 = __riscv_mul_vec_scalar(v_fila,kernel[k_row][k_col]);
            mul2 = __riscv_move_left_vec(mul2,k_col);
            mul1 = __riscv_sum_vec(mul1, mul2);
        }
        vint32m1_t v_out = __riscv_vle32_v_i32m1(img_out[c_row], vl);
        v_out = __riscv_sum_vec(v_out, mul1);
        __riscv_vse32_v_i32m1(img_out[c_row], v_out, vl);
        c_row += 1;
    }
    return 0;
 }
 
 // 14 lineas 