module register_tb;

reg clk;
reg rst;
reg [7:0] D;
wire [7:0] Q;

register my_register(.clk(clk), .rst(rst), .D(D), .Q(Q));

always #5 clk = ~clk;

initial begin 
    $dumpfile("register_waveform.vcd");
    $dumpvars(0, register_tb);

    clk = 0;
    rst = 1; // Reset the register
    D = 8'd0; #10; // Wait for 10 time units

    rst = 0; // Release reset
    D = 8'd42; #10; // Load new value into the register

    D = 8'd99; #13; // Load another value into the register
    
    D = 8'd255; #20;
    
    rst = 1; #10; // Reset the register again

    $finish;
end
endmodule
