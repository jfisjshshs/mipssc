module control (
    input wire [5:0] opcode,
    output reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump,
    output reg [1:0] alu_op
);
    always @(*) begin
        if(~|opcode) begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b10010000_10;
        end
        else if(opcode===6'b100011) //load word opcode
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b01111000_00;
        end
        else if(opcode===6'b101011) //store word opcode
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b01000100_00;
        end
        else if(opcode===6'b000100) //branch equal opcode
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b00000010_01;
        end
        else if(opcode===6'b001000) //addi opcode
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b01010000_01;
        end
        else if (opcode===6'b000101)
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b00000010_01;
        end 
        else if (opcode===6'b000010)
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b00000001_01;
        end 
        else
        begin
            {RegDst, ALUSrc,MemtoReg, RegWrite,  MemRead, MemWrite, Branch, Jump, alu_op} <= 10'b00000000_00;   
        end   
   

    end
endmodule
