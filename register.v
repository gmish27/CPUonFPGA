`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    18:02:12 05/28/2011 
// Design Name: 
// Module Name:    register 
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
module register #(parameter n=8)
	(
    input inc,we,
    input clr,clk,
    input [n-1:0] idat,
    output [n-1:0] odat
    );
	 
	reg [n-1:0] data;
	
	always@(posedge clk, posedge clr)
		if(clr)
			data <= 0;
		else if(inc)
			data <= data + 1;
		else if(we)
			data <= idat;
			
	assign odat = data;


endmodule
