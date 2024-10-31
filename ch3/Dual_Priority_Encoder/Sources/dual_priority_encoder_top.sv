`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 04:29:37 PM
// Design Name: 
// Module Name: dual_priority_encoder_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dual_priority_encoder_top #(parameter REQ_WIDTH = 12)
    (
        input [REQ_WIDTH-1:0] req_top,
        input logic clk,
        output logic [6:0] sseg,
        output logic [7:0] an
    );
    logic [$clog2(REQ_WIDTH)-1:0] first_top;
    logic [$clog2(REQ_WIDTH)-1:0] second_top;
    dual_priority_encoder #(REQ_WIDTH) encoder(
        .req(req_top),
        .first(first_top),
        .second(second_top)
    );
    
    time_mux_disp sseg_mux(
        .in0({1'b1, first_top ,1'b1}),
        .in1(),
        .in2(),
        .in3(),
        .in4({1'b1, second_top ,1'b1}),
        .in5(),
        .in6(),
        .in7(),
        .dp(),
        .*
    );
    
endmodule
