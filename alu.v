`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    11:21:01 06/04/2011 
// Design Name: 
// Module Name:    alu 
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
module alu(
		input [15:0] ac,dr,
		input [3:0] code,
		input ei,
		output eo, inc,
		output [15:0] data
    );
	 
	 reg [16:0] dat = 0;
	 assign eo = (code==4'b0100) ? ac[0] : 
					 (code==4'b0101) ? ac[15] : 
					 (code==4'b1000) ? 0 :
					 (code==4'b1001) ? ~ei :
					 dat[16];
					 
	 assign inc = (code==4'b1010) ? ~ac[15] :
					  (code==4'b1011) ? ac[15] :
					  ((code==4'b1100) && (ac==0)) ? 1'b1 :
					  (code==4'b1101) ? ~ei : 0;
	 
	 always@*
		case(code)
		
		4'b0000 : dat <= ac & dr;
		4'b0001 : dat <= ac + dr;
		4'b0010 : dat <= dr;
		4'b0011 : dat <= ~ac;
		4'b0100 : dat <= {{ei},{ac[15:1]}};	//shr
		4'b0101 : dat <= {{ac[14:0]},{ei}};	//shl
		4'b0110 : dat <= 0;
		4'b0111 : dat <= ac + 1;
		default : dat <= 17'bz;
					 		
		endcase

	 assign data = dat[15:0];

endmodule
