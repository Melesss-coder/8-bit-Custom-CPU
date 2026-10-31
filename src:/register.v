module register(clk, rst, D,Q);

input clk;
input rst;
input [7:0] D;
output reg [7:0] Q;

always @(posedge clk or posedge rst) begin 
    if (rst == 1'b1) begin 
        Q <= 8'h00;
    end
    else begin 
        Q <= D;
    end 
end
endmodule