module instruction_memory(pc_address, instruction);

input [7:0] pc_address;
output reg [10:0] instruction;

always @(*) begin
    case(pc_address)
        8'd0: instruction = 11'b000_00001111; //ADD 15
        8'd1: instruction = 11'b001_00001111; //SUB 15
        8'd2: instruction = 11'b111_00000101; //JZ 5
        8'd3: instruction = 11'b000_01100011; //ADD 99  
        8'd4: instruction = 11'b000_01100011; //ADD 99
        8'd5: instruction = 11'b000_00001000; //ADD 8
        default: instruction = 11'b000_00000000; //NOP
    endcase
end
endmodule
