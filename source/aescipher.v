`timescale 1ns / 1ps

module aescipher(clk,datain,key,enc_text,dec_text);

    input clk;
    input [127:0] datain;
    input [127:0] key;
    output[127:0] enc_text,dec_text;
    
    wire [127:0]dec_text1;
    reg [3:0] i=0;
    reg [3:0] j=4'd10;
    wire [127:0] dataout;
        
    reg [127:0] r_out[0:9];
    reg [127:0] r_dec[0:9];
    
    reg [127:0] keyout[0:9];
    
	wire [127:0] r_pe,r_ne,r_pd;
	wire [127:0] k_pe,k_ne,k_d,k;
	
	initial begin
	   r_out[0] <= datain^key;
	   keyout[0] <= key;
	end
	
	assign dec_text = (j==0)?(dec_text1^keyout[0]):dec_text1;
	
	always @(posedge clk)
	begin
	   r_dec[j] <= dataout;
       
       if(j<9)
	       r_dec[j] <= dec_text1;           

       if(j==0)
           $finish;
	   else if(i>=9)
	       j<=j-1;
	       
	end 
		 
	always @(posedge clk)
	begin
	   r_out[i+1] <= r_ne;
	   keyout[i+1] <= k_ne;

	   if(i<9)
	       i<=i+1;
	end 
	 
	 assign r_pe = r_out[i];
	 assign k_pe = keyout[i];

	 assign r_pd = r_dec[j+1];
	 assign k_d = keyout[j+1];
	 
	 
    rounds r1(.clk(clk),.rc(i),.data(r_pe),.keyin(k_pe),.keyout(k_ne),.rndout(r_ne));
    rounndlast r10(.clk(clk),.rc(i),.rin(r_pe),.keylastin(k_pe),.k(k),.fout(enc_text));

    dec rd1(.clk(clk),.rc(j),.data(r_pd),.keyin(k_d),.rndout(dec_text1));
    declast rd10(.clk(clk),.rc(j),.rin(enc_text),.keyin(k),.fout(dataout));
    
endmodule
