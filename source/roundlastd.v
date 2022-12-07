`timescale 1ns / 1ps

module declast(clk,rc,rin,keyin,fout);
input clk;
input [3:0]rc;
input [127:0]rin;
input [127:0]keyin;
output [127:0]fout;

wire [127:0] sb,sr,mcl;

subbytesd t1(sb,fout);
shiftrowd t2(sr,sb);
assign sr= keyin^rin;

endmodule
