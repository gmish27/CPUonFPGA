`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    06:38:26 06/07/2011 
// Design Name: 
// Module Name:    opcode 
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
module opcode(
		input [2:0] ilines,
		output [7:0] Tsig
    );
	 
	 reg [7:0] r_reg;
	 
	 always@*
		case(ilines)
			3'h0 : r_reg <= 8'h1;
			3'h1 : r_reg <= 8'h2;
			3'h2 : r_reg <= 8'h4;
			3'h3 : r_reg <= 8'h8;
			3'h4 : r_reg <= 8'h10;
			3'h5 : r_reg <= 8'h20;
			3'h6 : r_reg <= 8'h40;
			3'h7 : r_reg <= 8'h80;
		endcase
		
	assign Tsig = r_reg;

endmodule
