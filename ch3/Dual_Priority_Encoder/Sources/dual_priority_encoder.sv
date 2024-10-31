`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Emmanuel Marcial
// 
// Create Date: 10/30/2024 02:57:32 PM
// Design Name: Emmanuel Marcial
// Module Name: dual_priority_encoder
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


module dual_priority_encoder #(parameter REQ_WIDTH = 12)(
    input [REQ_WIDTH-1:0] req,
    output logic [$clog2(REQ_WIDTH)-1:0] first,
    output logic [$clog2(REQ_WIDTH)-1:0] second
    );
    
    integer i, j;
    always_comb
    begin
    //initialize outputs to 0
    first = 0;
    second = 0;
        // first find first priority
        for(i = REQ_WIDTH - 1; i >= 0; i = i - 1)
        begin : FIRST_PRIORITY
            if(req[i])
            begin
            first = i;
            break; //break when found
            end
        end
        // next find second priority after finding first priority
            for(j = REQ_WIDTH - 1; j >= 0; j = j - 1)
            begin : SECOND_PRIORITY
                if(req[j] && j < first) // only check bits lower than first priority bit
                begin
                second = j;
                break;
                end
            end
    end
    
endmodule
