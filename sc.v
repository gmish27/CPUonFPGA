`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    17:49:07 05/27/2011 
// Design Name: 
// Module Name:    sc 
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
module sc #(parameter n=4)(
    input clk,en,
    input reset,
    output reg[n-1:0] r_reg
    );
	 
	//reg [n-1:0] r_reg;
	//wire [n-1:0] r_nxt;
	 
	always@(posedge clk,posedge reset)
		if(reset)
			r_reg <= 0;
		else if(en)
			r_reg <= r_reg+1;
			
	//assign r_nxt = r_reg + 1'b1;
	//assign signal = r_reg;
			
endmodule
