`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    16:13:54 05/27/2011 
// Design Name: 
// Module Name:    cu 
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
module cu#(parameter d=16)(
		input clk, reset, en,
		output [d-1:0] cu_data, ac_data
    );
	 	 
	 wire ar_we, ar_inc;	 
	 wire [7:0] ar_idat, ar_odat;
	 wire pc_we, pc_inc;	 
	 wire [7:0] pc_idat, pc_odat;
	 wire ir_inc;	 
	 wire [d-1:0] ir_idat, ir_odat;
	 wire ac_we, ac_inc;	 
	 wire [d-1:0] ac_idat, ac_odat;
	 wire dr_we, dr_inc;	 
	 wire [d-1:0] dr_idat, dr_odat;
	 
	 wire [d-1:0] mem_dat;		//memory
	 wire mem_we;
	 
	 wire [15:0] dec_signal;	//decoders
	 wire [7:0] dec_opcode;
	 
	 wire [d-1:0] data;			//alu var
	 wire [3:0] ctrl_alu;
	 wire ei, eo, pcinc;
	 
	 wire ff_en;					//E var
	 	 
	 mem rom (.clk(clk), .ad(ar_odat), .we(mem_we), .idat(ac_odat), .dat(mem_dat));						//memory
	  
	 signals sig (.reset(reset), .clk(clk), .dec_signal(dec_signal), .en(en));				//seq counter & decoder
    
	 register ar (.we(ar_we), .inc(ar_inc), .clr(reset), .idat(ar_idat), .odat(ar_odat), .clk(clk));
	 register pc (.we(pc_we), .inc(pc_inc), .clr(reset), .idat(pc_idat), .odat(pc_odat), .clk(clk));					//registers
	 register #(.n(16)) ir (.we(dec_signal[2]), .inc(ir_inc), .clr(reset), .idat(ir_idat), .odat(ir_odat), .clk(clk));
	 register #(.n(16)) dr (.we(dr_we), .inc(dr_inc), .clr(reset), .idat(dr_idat), .odat(dr_odat), .clk(clk));
	 register #(.n(16)) ac (.we(ac_we), .inc(ac_inc), .clr(reset), .idat(ac_idat), .odat(ac_odat), .clk(clk));
	 	
	 alu unit (.ac(ac_odat), .dr(dr_odat), .code(ctrl_alu), .ei(ei), .eo(eo), .inc(pcinc), .data(data));
	 ff E (.clk(clk), .d(eo), .q(ei), .clr(reset), .en(ff_en));
	 opcode decode_ir (.ilines(ir_odat[14:12]), .Tsig(dec_opcode));
	 
	 ctrl control (.alu_pcinc(pcinc),
						.dec_signal(dec_signal),
						.ar_idat(ar_idat),
						.ir_idat(ir_idat),
						.dr_idat(dr_idat),
						.ac_idat(ac_idat),
						.mem_dat(mem_dat),
						.pc_odat(pc_odat),
						.ir_odat(ir_odat),
						.ar_we(ar_we),
						.dr_we(dr_we),
						.ac_we(ac_we),
						.pc_inc(pc_inc),
						.ff_en(ff_en),
						.mem_we(mem_we),
						.ctrl_alu(ctrl_alu),
						.alu_data(data),
						.dec(dec_opcode)
					  );
					  
	 assign cu_data = (((~dec_opcode[7]) && dec_signal[11]) | (dec_opcode[7] && dec_signal[8])) ? ac_odat : {d{1'bz}};
	 assign ac_data = ac_odat;
					  
endmodule
