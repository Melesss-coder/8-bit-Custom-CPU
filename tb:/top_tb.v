`timescale 1ns / 1ps

module top_tb;

    reg clk;
    reg rst;
    wire [7:0] CPU_Output;

    // Φέρνουμε όλο το σύστημα στο εργαστήριο
    top my_system (
        .clk(clk),
        .rst(rst),
        .final_result(CPU_Output)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform_top.vcd");
        $dumpvars(0, top_tb);

        clk = 0;
        rst = 1; 
        #10;

        rst=0;
        #60;
        
        $finish;
    end

endmodule