def MULVEC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, VR:$rs2);
    let AsmString = "mul_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_mul_vec (nxv2i32 VR:$rs1), (nxv2i32 VR:$rs2))),
          (MULVEC VR:$rs1, VR:$rs2)>;

def SUMVEC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, VR:$rs2);
    let AsmString = "sum_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_sum_vec (nxv2i32 VR:$rs1), (nxv2i32 VR:$rs2))),
          (SUMVEC VR:$rs1, VR:$rs2)>;

def SUMVECX : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, GPR:$rs2);
    let AsmString = "sum_vec_scalar\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_sum_vec_scalar (nxv2i32 VR:$rs1), (i32 GPR:$rs2))),
          (SUMVECX VR:$rs1, GPR:$rs2)>;

def MULVECX : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, GPR:$rs2);
    let AsmString = "mul_vec_scalar\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_mul_vec_scalar (nxv2i32 VR:$rs1), (i32 GPR:$rs2))),
          (MULVECX VR:$rs1, GPR:$rs2)>;

def MOVVECL : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, GPR:$rs2);
    let AsmString = "mov_left_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_move_left_vec (nxv2i32 VR:$rs1), (i32 GPR:$rs2))),
          (MOVVECL VR:$rs1, GPR:$rs2)>;

def MOVVECR : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000100; 
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; 
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, GPR:$rs2);
    let AsmString = "mov_right_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_move_right_vec (nxv2i32 VR:$rs1),(i32 GPR:$rs2))),
          (MOVVECR VR:$rs1, GPR:$rs2)>;



def EXTVEC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs1;
    bits<5> rs2;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-27} = rs1; 
    let Inst{26-22} = rs2;
    let Inst{21-17} = 0b11111;
    let Inst{16-12} = 0b00000;
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, VR:$rs2);
    let AsmString = "extend_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_extend_vec (nxv2i32 VR:$rs1), (nxv2i32 VR:$rs2))),
          (EXTVEC VR:$rs1, VR:$rs2)>;

def SATVEC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-27} = rs1; 
    let Inst{26-22} = rs2;
    let Inst{21-17} = 0b11111;
    let Inst{16-12} = 0b00000;
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b0101011; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, GPR:$rs2);
    let AsmString = "saturate_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_saturate_vec (nxv2i32 VR:$rs1), (i32 GPR:$rs2))),
          (SATVEC VR:$rs1, GPR:$rs2)>;

def COPYVEC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-27} = rs1; 
    let Inst{26-22} = rs2;
    let Inst{21-17} = 0b00001;
    let Inst{16-12} = 0b00000;
    let Inst{11-7} = rd;
    let Inst{6-2} = 0b11111;
    let Inst{1-0} = 0b11; 
    dag OutOperandList = (outs VR:$rd);
    dag InOperandList = (ins VR:$rs1, VR:$rs2);
    let AsmString = "copy_vec\t$rd, $rs1, $rs2";
}
def : Pat<(nxv2i32 (int_riscv_copy_vec (nxv2i32 VR:$rs1), (nxv2i32 VR:$rs2))),
          (COPYVEC VR:$rs1, VR:$rs2)>;