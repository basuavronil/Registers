module dut #(parameter N = 8) (
    input clk,
    input rst,           // active-low reset
    input serial_in,
    output reg [N-1:0] parallel_out
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            parallel_out <= {N{1'b0}};
        else
            parallel_out <= {serial_in, parallel_out[N-1:1]}; // shift right
    end

endmodule

/*`timescale 1ns / 1ps
 module tb();
    parameter N = 8;
    reg clk, rst, serial_in;
    wire [N-1:0] parallel_out;

    dut #(.N(N)) Z (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;           
        serial_in = 0;

        $monitor("Time=%0t rst=%b serial_in=%b parallel_out=%b", $time, rst, serial_in, parallel_out);

        #10 rst = 1;       

        
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        #20 $finish;
    end

endmodule*/

