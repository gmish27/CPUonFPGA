`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    01:53:32 06/09/2011 
// Design Name: 
// Module Name:    signals 
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
module signals(
		input reset, clk, en,
		output [15:0] dec_signal
    );
	 
	 wire clr;
	 wire [3:0] sc_signal;
	 assign clr = reset | dec_signal[13];
	 
	 sc seq (.clk(clk), .reset(clr), .r_reg(sc_signal), .en(en));	
	 decoder dec (.ilines(sc_signal), .Tsig(dec_signal));

endmodule
