`timescale 1ns / 1ps

module AES_TOP(clk,finalout);
    input clk;
    output [7:0] finalout;

wire [127:0] tempout1,tempout2;

aescipher u1(.clk(clk),.datain(128'h00112233445566778899aabbccddeeff),.key(128'h000102030405060708090a0b0c0d0e0f),.enc_text(tempout1),.dec_text(tempout2));

assign finalout = tempout1[127:120];

endmodule
