`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 07:31:55 PM
// Design Name: 
// Module Name: bcd_incrementor_tb
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


module bcd_incrementor_tb();

logic [11:0] BCD_In_tb;
logic [3:0] digit0_tb;
logic [3:0] digit1_tb;
logic [3:0] digit2_tb;

 bcd_incrementor uut(
        .BCD_In(BCD_In_tb),
        .digit0(digit0_tb),
        .digit1(digit1_tb),
        .digit2(digit2_tb)
    );
    
 initial begin
 
 for(integer i = 0; i < 2**11; i = i +1)
     begin : TEST_CASES
        BCD_In_tb = i;
        #5;
     end
     
 $finish;
 end
endmodule
