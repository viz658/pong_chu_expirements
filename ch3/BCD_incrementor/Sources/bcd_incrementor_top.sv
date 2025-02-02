`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Emmanuel Marcial
// 
// Create Date: 10/30/2024 07:31:33 PM
// Design Name: 
// Module Name: bcd_incrementor
// Project Name: BCD_Incrementor
// Target Devices: 
// Tool Versions: 
// Description: 
// For Experiment 3.12.4 in FPGA Prototyping by SystemVerilog Examples by Pong Chu
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcd_incrementor_top
    (
        input [11:0] BCD_In_top,
        input clk,
        output logic [6:0] sseg,
        output logic [7:0] an
    );
    logic [3:0] digit0_top, digit1_top, digit2_top;
    bcd_incrementor inc(
        .BCD_In(BCD_In_top),
        .digit0(digit0_top),
        .digit1(digit1_top),
        .digit2(digit2_top)
    ); 

    time_mux_disp sseg_mux(
        .in0({1'b1, digit0_top ,1'b1}),
        .in1({1'b1, digit1_top ,1'b1}),
        .in2({1'b1, digit2_top ,1'b1}),
        .in3(),
        .in4(),
        .in5(),
        .in6(),
        .in7(),
        .dp(),
        .*
    );
    
endmodule
