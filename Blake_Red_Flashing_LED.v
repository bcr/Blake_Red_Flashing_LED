`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:23 11/25/2010 
// Design Name: 
// Module Name:    Blake_Red_Flashing_LED 
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
module Blake_Red_Flashing_LED(
    input CLK,
    output LED_RED
    );

reg [15:0] MclkDiv_Count;
reg [7:0] MSDiv_Count;
reg OneMsClk;
reg EighthSecondClk;
assign LED_RED = EighthSecondClk;

// Setup the 1ms counter
always @(posedge CLK) begin
  if (MclkDiv_Count==50000) begin
    MclkDiv_Count <= 16'h00;
         OneMsClk <= !OneMsClk;
  end
  else
    MclkDiv_Count <= MclkDiv_Count+1;
end

always @(posedge OneMsClk) begin
  if (MSDiv_Count==125) begin
    MSDiv_Count <= 8'h00;
         EighthSecondClk <= !EighthSecondClk;
  end
  else
    MSDiv_Count <= MSDiv_Count+1;
end
endmodule
