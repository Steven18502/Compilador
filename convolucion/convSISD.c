int img_in[5][8] = {{1,2,3,4,5,6,7,8},
                    {1,2,3,4,5,6,7,8}, 
                    {1,2,3,4,5,6,7,8},
                    {1,2,3,4,5,6,7,8},
                    {1,2,3,4,5,6,7,8}};

int kernel[3][3] = {{1,2,3},
                    {4,5,6},
                    {7,8,9}};

int img_out[5][10];

void copy_with_shift(int *a, int a_size, int *b, int b_size, int shift) {
    for (int i = 0; i < shift; i++) {
        a[i] = 0;
    }
    for (int i = 0; i < b_size && (i + shift) < a_size; i++) {
        a[i + shift] = b[i];
    }
}
void mul_vec_scalar(int* arr, int len, int escalar) {
    for (int i = 0; i < len; ++i) {
        arr[i] *= escalar;
    }
}
void move_left_vec(int* arr, int len, int n) {
    if (n <= 0 || n >= len) return;

    for (int i = 0; i < len - n; ++i) {
        arr[i] = arr[i + n];
    }
    for (int i = len - n; i < len; ++i) {
        arr[i] = 0;  // puedes usar otro valor si lo deseas
    }
}
void sum_vec(int* arr1, int* arr2, int len) {
    for (int i = 0; i < len; ++i) {
        arr1[i] = arr1[i] + arr2[i];
    }
}
int main() {
    int c_row = 0;
    int v_fila[10];
    int mul1[10];
    int mul2[10];
    int v_out[10];
    copy_with_shift(v_fila,10,img_in[c_row+1],8,2);
    for (int k_row = 0; k_row < 3; k_row++){
        copy_with_shift(mul1,10, v_fila, 10, 0);
        mul_vec_scalar(mul1, 10, kernel[k_row][0]);
        for (int k_col = 1; k_col < 3; k_col++){
            copy_with_shift(mul2,10, v_fila, 10, 0);
            mul_vec_scalar(mul2,10,kernel[k_row][k_col]);
            move_left_vec(mul2,10,k_col);
            sum_vec(mul1,mul2,10);
        }
        copy_with_shift(v_out,10,img_out[c_row],10, 0);
        sum_vec(v_out,mul1,10);
        copy_with_shift(img_out[c_row],10,v_out,10,0);
        c_row += 1;
    }
    return 0;
}

// 36 lineas 