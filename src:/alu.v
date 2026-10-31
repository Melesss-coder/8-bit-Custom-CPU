module alu(A,B,Opcode,Result,ZeroFlag);

input [7:0] A;
input [7:0] B;
input [2:0] Opcode;
output reg [7:0] Result;
output ZeroFlag;

assign ZeroFlag = (Result == 8'h0);
always @(*) begin
    case (Opcode)
        3'b000: Result = A + B;
        3'b001: Result = A - B;
        3'b010: Result = A & B;
        3'b011: Result = A | B;
        3'b100: Result = A ^ B;
        3'b101: Result = ~A;     
        3'b110: Result = A << 1; 
        3'b111: Result = A >> 1;
        default: Result = 8'h0;
    endcase
end

endmodule 



