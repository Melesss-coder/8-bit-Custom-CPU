`timescale 1ns / 1ps
module alu_tb;

reg [7:0] test_A;
reg [7:0] test_B;
reg [2:0] test_Opcode;
wire [7:0] test_Result;

alu my_alu(.A(test_A), .B(test_B),.Opcode(test_Opcode), .Result(test_Result));

initial begin 
    $dumpfile("waveform.vcd");
    $dumpvars(0, alu_tb);

    test_A = 8'd12; 
    test_B = 8'd5;
    
    test_Opcode = 3'b000; #10; // A + B
    test_Opcode = 3'b001; #10; // A - B
    test_Opcode = 3'b010; #10; // A & B
    test_Opcode = 3'b011; #10; // A | B
    test_Opcode = 3'b100; #10; 
    test_Opcode = 3'b101; #10; 
    test_Opcode = 3'b110; #10; 
    test_Opcode = 3'b111; #10;
    
$finish;
end
endmodule