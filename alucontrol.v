module alu_control (
    input wire [1:0] alu_op,
    input wire [5:0] funct,
    output reg [3:0] op
);
    always @(*) begin
        if(alu_op===2'b00) begin
            op <= 4'b0010;
        end
        else if(alu_op===2'b01) begin
            op <= 4'b0110;
        end 
        else begin
            case (funct[5:0])
                6'b00000: op = 4'b0010; // add 
                6'b00010: op = 4'b0110; // sub 
                6'b00100: op = 4'b0000; // and 
                6'b00101: op = 4'b0001; // or 
                6'b00110: op = 4'b0011; // nor 
                6'b00111: op = 4'b0100; // xor 
                6'b10000: op = 4'b1101; // sll 
                6'b10001: op = 4'b1110; // srl 
                6'b10010: op = 4'b1010; // slt
                default: 
                op <= 4'bzzzz;
            endcase
        end
    end
endmodule