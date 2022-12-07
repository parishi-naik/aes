`timescale 1ns / 1ps

module dec(clk,rc,data,keyin,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]keyin;
output [127:0]rndout;

wire [127:0] sb,sr,mcl;

subbytesd t1(sb,rndout);
shiftrowd t2(sr,sb);
mixcolumnd t3(mcl,sr);
assign mcl= keyin^data;

endmodule
