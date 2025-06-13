`timescale 1ps/1ps

module processor_tb;
    reg clk = 0;
    processor mips(clk);
    always #2 clk = ~clk;
    initial begin
        $dumpfile("wave.vcd");   // Output waveform file
        $dumpvars(0, processor_tb);    // Dump all variables in the testbench
        
        mips.regs.regs[29] = 32'h00000000; // $sp = 0 
        mips.regs.regs[8] = 32'h00000005;  // $t0 = 5
        mips.regs.regs[9] = 32'h00000007;  // $t1 = 7
        
        mips.imem.mem.mem[0] = 32'h201000E8;  // addi 
        mips.imem.mem.mem[1] = 32'h20080005;  // addi 
        mips.imem.mem.mem[2] = 32'h20090007;  // addi 
        mips.imem.mem.mem[3] = 32'h0109702A;  // slt 
        mips.imem.mem.mem[4] = 32'h11C00009;  // beq 
        mips.imem.mem.mem[5] = 32'h01095020;  // add
        mips.imem.mem.mem[6] = 32'h01095024;  // and 
        mips.imem.mem.mem[7] = 32'h01095025;  // or 
        mips.imem.mem.mem[8] = 32'h01095026;  // xor 
        mips.imem.mem.mem[9] = 32'h01E06027;  // nor 
        mips.imem.mem.mem[10] = 32'h00091500; // sll 
        mips.imem.mem.mem[11] = 32'h00091502; // srl 
        mips.imem.mem.mem[12] = 32'hAFA20000; // sw
        mips.imem.mem.mem[13] = 32'hAFA30004; // sw 
        mips.imem.mem.mem[14] = 32'hAFA40008; // sw
        mips.imem.mem.mem[15] = 32'h08000010; // j 16 
        mips.imem.mem.mem[16] = 32'h01096022; // sub 
        mips.imem.mem.mem[17] = 32'h8FB00000; // lw 
        mips.imem.mem.mem[18] = 32'h8FB10004; // lw 
        mips.imem.mem.mem[19] = 32'h16110002; // bne 
        mips.imem.mem.mem[20] = 32'h20120001; // addi 
        mips.imem.mem.mem[21] = 32'h20120002; // addi 

        #2;
        #100 $finish;

    end
endmodule