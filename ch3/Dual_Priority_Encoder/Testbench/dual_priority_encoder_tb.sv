`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Emmanuel Marcial
// 
// Create Date: 10/30/2024 02:58:27 PM
// Design Name: 
// Module Name: dual_priority_encoder_tb
// Project Name: Paramaterized Dual Priority Encoder
// Target Devices: 
// Tool Versions: 
// Description: 
// For Experiment 3.12.3 in FPGA Prototyping by SystemVerilog Examples by Pong chu
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dual_priority_encoder_tb();
parameter WIDTH_TB = 12;

logic [WIDTH_TB:0] req_tb;
logic [$clog2(WIDTH_TB)-1:0] first_tb; 
logic [$clog2(WIDTH_TB)-1:0] second_tb;

dual_priority_encoder #(.REQ_WIDTH(12)) uut(
    .req(req_tb),
    .first(first_tb),
    .second(second_tb)
    );

initial begin
    for (integer i = 0; i < 2**WIDTH_TB; i = i+1)
    begin : TEST_CASES
        req_tb = i; 
        #5;
    end
        
    $finish;
end

endmodule
