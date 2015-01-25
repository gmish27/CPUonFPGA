`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    17:24:46 05/28/2011 
// Design Name: 
// Module Name:    mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mem
	#(parameter a=8,d=16) //256 words of 16 bit each
	(
    input clk,we,
    input [a-1:0] ad,
	 input [d-1:0] idat,
    output reg [d-1:0] dat
    );

	reg [d-1:0] r_mem [2**a-1:0];
	initial begin							
	$readmemh("t.txt",r_mem,0,255);
	end
	
	always@(posedge clk)
		begin
		if(we)
			r_mem[ad] <= idat;
   	dat <= r_mem[ad];
		end
				
endmodule
