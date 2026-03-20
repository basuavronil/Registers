module dut #(parameter N = 4)(
 input clk, rst, mode, r_input, l_input,
 output r_output, l_output
 );
 reg [N-1:0] shift_reg;
 always@(posedge clk or negedge rst)
  begin
   if (!rst)
    shift_reg <= {N{1'b0}};
   else 
     begin 
       if (mode == 1)
         shift_reg <= {r_input, shift_reg[N-1:1]};
       else
         shift_reg <= {shift_reg[N-2:0], l_input}; 
     end
   end
assign r_output = shift_reg[0];
assign l_output = shift_reg[N-1];

endmodule
/*
`timescale 1ns / 1ps
module tb( );
 parameter N = 6;
 reg clk, rst, mode, l_input, r_input;
 wire l_output, r_output;
 //instantiaition
 dut #(.N(N)) Z(.clk(clk), .rst(rst), .mode(mode), .l_input(l_input), .r_input(r_input), .l_output(l_output), .r_output(r_output)); 
 
 always #5 clk = ~clk;
 
 initial 
  begin
     clk = 0;
     rst = 0;
     mode = 0;
     l_input = 0;
     r_input = 0;
     $monitor("%0t rst=%0b mode=%0b l_input=%0b r_input=%0b l_output=%0b r_output=%0b", $time, rst, mode, l_input, r_input, l_output, r_output);
     #4;
     rst = 1;
     #10;
     mode = 1; //Right shift stimulus
     repeat (20) 
       begin
         #10;
           r_input = $random;
           l_input = $random;
       end
     #10;
     mode = 0; //Left shift stimulus
      repeat (20) 
       begin
         #10;
           r_input = $random;
           l_input = $random;
       end 
      #100;
      $finish;
   end
endmodule
*/
