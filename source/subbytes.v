`timescale 1ns / 1ps

module subbytesd(data,sb);

input [127:0] data;
output [127:0] sb;

     sboxi q0( .a(data[127:120]),.c(sb[127:120]) );
     sboxi q1( .a(data[119:112]),.c(sb[119:112]) );
     sboxi q2( .a(data[111:104]),.c(sb[111:104]) );
     sboxi q3( .a(data[103:96]),.c(sb[103:96]) );
     
     sboxi q4( .a(data[95:88]),.c(sb[95:88]) );
     sboxi q5( .a(data[87:80]),.c(sb[87:80]) );
     sboxi q6( .a(data[79:72]),.c(sb[79:72]) );
     sboxi q7( .a(data[71:64]),.c(sb[71:64]) );
     
     sboxi q8( .a(data[63:56]),.c(sb[63:56]) );
     sboxi q9( .a(data[55:48]),.c(sb[55:48]) );
     sboxi q10(.a(data[47:40]),.c(sb[47:40]) );
     sboxi q11(.a(data[39:32]),.c(sb[39:32]) );
     
     sboxi q12(.a(data[31:24]),.c(sb[31:24]) );
     sboxi q13(.a(data[23:16]),.c(sb[23:16]) );
     sboxi q14(.a(data[15:8]),.c(sb[15:8]) );
     sboxi q16(.a(data[7:0]),.c(sb[7:0]) );
	  
endmodule
