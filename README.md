Descargar LLVM/CLang siguiendo los pasos en  -->  https://clang-llvm-org.translate.goog/get_started.html?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc  
Antes de hacer make reemplazar los archivos por los de la carpeta llvm  

Direccion de los archivos dentro de LLVM  
1.riscv_vector.td y riscv_vector_common.td  -->  llvm-project/clang/include/clang/Basic  
2.IntrinsicsRISCV.td   --> llvm-project/llvm/include/llvm/IR  
3.RISCVInstrInfoV.td y RISCVInstrInfoAcc.td  --> llvm-project/llvm/lib/Target/RISCV  

Para compilar e incluir riscv_vector.h usar preferiblemente direcciones completas  
Para compilar -->  llvm-project/build/bin/clang --target=riscv32  -march=rv32gcv -O1  convSIMD.c -S -o convSIMDt.s  
--targer indica la arquitectura objetivo (puede ser tambien riscv64), -march indica extensiones para riscv (gcv incluye las estandar y la vectorial), -O1 es el nivel de optimizacion (desde -O0 a -O3)  
Tener cuidado al usar optimizaciones ya que depende de que se esté haciendo el compilador puede eliminar lineas por dead code elimination o incluso no generar nada porque elimina todo en el proceso


El archivo TestIntrinsics.c tiene un llamado a cada Intrinsic y de como se hacen los loads y stores de RVV para int32, y como definir el valor de vl (vector length)  
En convolucion hay un ejemplo de lo que se hacia en el HLS con los instrinsiscs (convSIMD)  

Para generar una representacion intermedia de LLVM IR se puede utilizar llvm-project/build/bin/clang --target=riscv32 -march=rv32gcv -emit-llvm  convSIMD.c -S -o convSIMD.ll  

