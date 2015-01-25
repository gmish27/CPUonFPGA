`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    09:23:57 06/05/2011 
// Design Name: 
// Module Name:    ff 
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
module ff(
		input d,clk,clr,en,
		output reg q
    );
	 
	 always@(posedge clk, posedge clr)
		if(clr)
			q <= 0;
		else if(en)
			q <= d;

endmodule
