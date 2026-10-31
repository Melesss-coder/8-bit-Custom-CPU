module top(clk, rst, final_result);

input clk;
input rst;
output [7:0] final_result;

wire [7:0] pc_to_mem_wire;
wire [10:0] mem_to_cpu_wire;
wire [7:0] alu_to_reg_wire;

wire [2:0] opcode = mem_to_cpu_wire[10:8];
wire [7:0] data_in = mem_to_cpu_wire[7:0];

pc main_pc(.clk(clk),.rst(rst), .count(pc_to_mem_wire));

instruction_memory main_memory(.pc_address(pc_to_mem_wire), .instruction(mem_to_cpu_wire));

alu main_alu(.A(data_in), .B(final_result), .Opcode(opcode), .Result(alu_to_reg_wire));

register main_register(.clk(clk), .rst(rst), .D(alu_to_reg_wire), .Q(final_result));

endmodule

