module dut #(parameter N = 4)(
 input clk, rst,
 input [N-1:0] p_input,
 output [N-1:0] p_output
 );
 reg [N-1:0] avro;
 always@(posedge clk or negedge rst)
  begin
   if (!rst)
     avro <= {N{1'b0}};
   else
     avro <= p_input; 
  end
  assign p_output = avro;
endmodule
/*`timescale 1ns / 1ps
module tb( );
 parameter N = 8;
 reg clk, rst;
 reg [N-1:0] p_input;
 wire [N-1:0] p_output;
 
 //instantiating the dut
 dut #(.N(N)) z(.clk(clk), .rst(rst), .p_input(p_input), .p_output(p_output));
 
 always #5 clk = ~ clk;
 
 initial begin
 $monitor("%0t  rst = %0b  p_input = %0b  p_output = %0b", $time, rst, p_input, p_output); 
 clk = 0 ;
 rst = 0 ;
 p_input = {N{1'b0}};
 #5;
 rst = 1;
 p_input = 8'b11010101;
 #10;
 p_input = 8'b11110000;
 #10;
 p_input = 8'b10110000;
 #10;
 p_input = 8'b10000000;
 #10;
 p_input = 8'b10000101;
 #200;
 $finish;
 end
endmodule
*/
