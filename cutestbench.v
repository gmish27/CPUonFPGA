`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gaurav
//
// Create Date:   22:04:07 01/06/2012
// Design Name:   cu
// Module Name:   D:/Padaai/Extraaas/classi/XiLinx/Basic Computer/cutestbecnh.v
// Project Name:  v1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cutestbecnh;

    reg clk = 1'b0;
    reg reset = 1'b0;
    reg en = 1'b0;
    wire [15:0] cu_data;
    wire [15:0] ac_data;

    parameter PERIOD = 200;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 100;

    initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end

    cu UUT (
        .clk(clk),
        .reset(reset),
        .en(en),
        .cu_data(cu_data),
        .ac_data(ac_data));

    initial begin
        // -------------  Current Time:  100ns
        #100;
        reset = 1'b1;
        // -------------------------------------
        // -------------  Current Time:  185ns
        #85;
        reset = 1'b0;
        en = 1'b1;
        // -------------------------------------
    end

endmodule

