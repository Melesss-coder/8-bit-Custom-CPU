module pc_tb;

reg clk;
reg rst;
wire [7:0] test_count;

pc my_pc (.clk(clk), .rst(rst), .count(test_count));

always #5 clk = ~clk;

initial begin 
    $dumpfile("waveform_pc.vcd");
    $dumpvars(0, pc_tb);

    clk = 0;
    rst = 1;
    #10;

    rst = 0;
    #100;
    $finish;

end
endmodule


