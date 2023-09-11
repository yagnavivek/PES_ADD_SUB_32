`timescale 1ns / 1ps

module PES_ADD_SUB_32_tb;
reg [31:0]a,b;
reg cin,sub,clk;
wire [31:0]res;
wire ovf;

PES_ADD_SUB_32 dut(clk,a,b,cin,sub,res,ovf);

initial
begin
	$dumpfile("PES_ADD_SUB_32_tb.vcd");
	$dumpvars(0,PES_ADD_SUB_32_tb);
	clk = 0;
	a = 32'hFFFFFFFF;
	b = 32'hFFFFFFFE;
	sub = 0;
	cin = 0;
	#50 sub = 1;
	#49 sub = 0;
	#1 cin = 1;
	#50 sub = 1;
	#50 $finish;
end

always #5 clk = ~clk;

endmodule
