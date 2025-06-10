#include </home/steven/Documents/LLVM/llvm-project/build/lib/clang/21/include/riscv_vector.h>
int main(){
int32_t a[5] = {1,2,3,4,5};
int32_t i = 5;
int32_t b[5] = {1,2,3,4,5};


// Intrinsic de RVV para definir el numero de elementos del vector, donde los elemntos son enteros de 32bits y la multiplicidad 1
// Entradas, un entero positivo que representa la cantidad de elementos por vector
// Salida un dato de tipo size_t con el valor de vl que necesitan algunas otras instrucciones
size_t vl = __riscv_vsetvl_e32m1(5);


// Intrinsic de RVV para cargar un vector de enteros de 32bits con multiplicidad 1
// Entradas, un array de tipo int32_t y tamaño vl, la variable donde se almacena el vl
// Salida un dato de tipo vint32m1_t con los valores en el array de entrada (tipo de dato de RVV representa un vector de enteros de 32bits con multiplicidad 1)
vint32m1_t v_fila = __riscv_vle32_v_i32m1(a, vl);


// Intrisics definidos para el acelerador
// Las salidas de todos son datos de tipo vint32m1_t de RVV

vint32m1_t mulx = __riscv_mul_vec_scalar(v_fila, i); // Entradas un vector de tipo vint32m1_t y un entero de 32bits
vint32m1_t sat = __riscv_saturate_vec(v_fila, i); // Entradas un vector de tipo vint32m1_t y un entero de 32bits
vint32m1_t sumx = __riscv_sum_vec_scalar(v_fila, i); // Entradas un vector de tipo vint32m1_t y un entero de 32bits
vint32m1_t mov_l_vec = __riscv_move_left_vec(v_fila,i); // Entradas un vector de tipo vint32m1_t y un entero de 32bits
vint32m1_t mov_r_vec = __riscv_move_right_vec(v_fila, i); // Entradas un vector de tipo vint32m1_t y un entero de 32bits
vint32m1_t mul = __riscv_mul_vec(v_fila, mov_r_vec); // Entradas dos vectores de tipo vint32m1_t
vint32m1_t sum = __riscv_sum_vec(v_fila,v_fila); // Entradas dos vectores de tipo vint32m1_t
vint32m1_t copy = __riscv_copy_vec(v_fila,v_fila); // Entradas dos vectores de tipo vint32m1_t
vint32m1_t extend = __riscv_extend_vec(v_fila,v_fila); // Entradas dos vectores de tipo vint32m1_t

// Intrinsic de RVV para guardar un vector de enteros de 32bits con multiplicidad 1
// Entradas, un array de tipo int32_t y tamaño vl, el vector de tipo vint32m1_t que se desea almacenar, la variable que almacena vl
__riscv_vse32_v_i32m1(b, extend, vl);
}
