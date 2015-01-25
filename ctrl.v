`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
// 
// Create Date:    21:10:20 06/06/2011 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
			input alu_pcinc,
			input [7:0] pc_odat,
			input [15:0] mem_dat, alu_data, ir_odat,
			input [15:0] dec_signal,
			input [7:0] dec,
			output [3:0] ctrl_alu,
			output [7:0] ar_idat,
			output [15:0] ir_idat, dr_idat, ac_idat,
			output ar_we, dr_we, ac_we, pc_inc, ff_en, mem_we
		); 
		
		wire m_ref_ind = ir_odat[15] & (~dec[7]) & dec_signal[6];		//T3
		wire m_ref = (~dec[7]) & dec_signal[8];								//T4
		wire m_alu = (~dec[7]) & dec_signal[10];								//T5
		wire m_sta = m_ref & dec[3];
		
		wire r_ref = (~ir_odat[15]) & dec[7] & dec_signal[6];
		wire r_ac = r_ref & (ir_odat[11] | ir_odat[9] | ir_odat[7] | ir_odat[6] | ir_odat[5]);		//reg-ref AC enable
			
		assign ar_we = dec_signal[0] | dec_signal[4] | m_ref_ind;
		assign ar_idat = dec_signal[0] ? pc_odat : dec_signal[4] ? ir_odat[7:0] : m_ref_ind ? mem_dat[7:0] : 0;
		assign ir_idat = dec_signal[2] ? mem_dat : 0;	//data stable at t5 dec4
		
		assign dr_we = m_ref && (~dec[3]);
		assign dr_idat = dr_we ? mem_dat : 0;
		assign ac_we = (m_alu | r_ac) & (~m_sta);
		assign ac_idat = ac_we ? alu_data : 0;
		assign ctrl_alu = (m_alu && dec[0]) ? 4'b0000 :
								(m_alu && dec[1]) ? 4'b0001 :
								(m_alu && dec[2]) ? 4'b0010 : 
								(r_ref && ir_odat[11]) ? 4'b0110 :
								(r_ref && ir_odat[9]) ? 4'b0011 :
								(r_ref && ir_odat[7]) ? 4'b0100 :
								(r_ref && ir_odat[6]) ? 4'b0101 : 
								(r_ref && ir_odat[5]) ? 4'b0111 :
								(r_ref && ir_odat[10]) ? 4'b1000 : 
								(r_ref && ir_odat[8]) ? 4'b1001 : 
								(r_ref && ir_odat[4]) ? 4'b1010 :
								(r_ref && ir_odat[3]) ? 4'b1011 :
								(r_ref && ir_odat[2]) ? 4'b1100 :
								(r_ref && ir_odat[1]) ? 4'b1101 : 4'b1111;
		assign mem_we = m_sta;
		
		//E enable
		assign ff_en = (m_alu && dec[1]) | (r_ref && (ir_odat[7] | ir_odat[6] | ir_odat[8] | ir_odat[10]));
		
		//PC INC
		assign pc_inc = (alu_pcinc | dec_signal[2]);
			
endmodule
