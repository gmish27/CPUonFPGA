`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    17:49:46 05/27/2011 
// Design Name: 
// Module Name:    decoder 
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
module decoder #(parameter n=4)(	//n is the no. of input signals.
    input [n-1:0] ilines,
    output [2**n-1:0] Tsig
    );
	 
	 reg [2**n-1:0] r_sig;
	 
	 always@*
		case(ilines)
			4'h0 : r_sig <= 16'h1;
			4'h1 : r_sig <= 16'h2;
			4'h2 : r_sig <= 16'h4;
			4'h3 : r_sig <= 16'h8;
			4'h4 : r_sig <= 16'h10;
			4'h5 : r_sig <= 16'h20;
			4'h6 : r_sig <= 16'h40;
			4'h7 : r_sig <= 16'h80;
			4'h8 : r_sig <= 16'h100;
			4'h9 : r_sig <= 16'h200;
			4'ha : r_sig <= 16'h400;
			4'hb : r_sig <= 16'h800;			
			4'hc : r_sig <= 16'h1000;
			4'hd : r_sig <= 16'h2000;
			4'he : r_sig <= 16'h4000;
			4'hf : r_sig <= 16'h8000;
			endcase
		
	assign Tsig = r_sig;

endmodule
