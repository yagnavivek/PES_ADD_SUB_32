module add_sub_32_tb;

  reg [31:0] A, B;
  reg Ci, Subtract,clk;
  wire Co;
  wire [31:0]S;
  
  add_sub_32 UUT (
    .A(A),
    .B(B),
    .Ci(Ci),
    .clk(clk),
    .Subtract(Subtract),
    .S(S),
    .Co(Co)
  );

initial
begin
	$dumpfile("add_sub_32_tb.vcd");
	$dumpvars(0,add_sub_32_tb);
	clk = 0;
	A = 32'd10;
	B = 32'd20;
	Ci = 0;
	Subtract = 0;
	#300 $finish;
end

always #5 clk = ~clk;
always # 20 Ci = ~ Ci;
always # 80 Subtract = ~Subtract;

endmodule

