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

module bcd_incrementor(
    input [11:0] BCD_In,
    output logic [3:0] digit0,
    output logic [3:0] digit1,
    output logic [3:0] digit2
);

    logic [3:0] BCD_0;
    logic [3:0] BCD_1;
    logic [3:0] BCD_2;
    logic carry0, carry1;

    always_comb begin
        // Extract BCD values
        BCD_0 = BCD_In[3:0];
        BCD_1 = BCD_In[7:4];
        BCD_2 = BCD_In[11:8];

        // BCD check
        if (BCD_0 <= 9 && BCD_1 <= 9 && BCD_2 <= 9) begin

            if (BCD_0 == 9) begin
                digit0 = 0;
                carry0 = 1; //signal carry
            end else begin
                digit0 = BCD_0 + 1;
                carry0 = 0;
            end

            if (carry0) begin
                if (BCD_1 == 9) begin
                    digit1 = 0;
                    carry1 = 1; //signal next carry
                end else begin
                    digit1 = BCD_1 + 1;
                    carry1 = 0;
                end
            end else begin
                digit1 = BCD_1;
                carry1 = 0;
            end

            if (carry1) begin
                if (BCD_2 == 9) begin
                    digit2 = 0;
                end else begin
                    digit2 = BCD_2 + 1;
                end
            end else begin
                digit2 = BCD_2;
            end
            
        end 
        else begin // Not BCD, output 0
            digit0 = 4'd0;
            digit1 = 4'd0;
            digit2 = 4'd0;
        end
    end
endmodule
