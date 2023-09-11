module prefix(a,b,sub,g,p);
input a,b,sub;
output g,p;

assign g = (sub^a)&b;
assign p = (sub^a)|b;

endmodule

/***********************************************************************/

module blackbox(gik,pik,gkm1j,pkm1j,gij,pij);
input gik,pik,gkm1j,pkm1j;
output gij,pij;

assign gij = gik | (pik & gkm1j);
assign pij = pik & pkm1j;

endmodule

/*******************************************************************************/

module graybox(gik,pik,gkm1j,gij);
input gik,pik,gkm1j;
output gij;

assign gij = gik | (pik & gkm1j);

endmodule

/***************************************************************************/

module sumbox(gim1m1,a,b,sum);
input gim1m1,a,b;
output sum;

assign sum = (gim1m1 ^ (a^b));

endmodule

/*****************************************************************************/

module pes_add_sub_32(a,b,cin,sub,res,ovf);
input [31:0]a,b;
input cin,sub;
output [31:0]res;
output ovf;

wire [63:0]out;

wire gm1,pm1;
wire ex1 ,ex2;

assign ex1 = 1'b0;
assign ex2 = 1'b0;

assign out[63:33] = 32'd0;

wire g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,g20,g21,g22,g23,g24,g25,g26,g27,g28,g29,g30,g31,g0tom1,g2to1,g4to3,g6to5,g8to7,g10to9,g12to11,g14to13,g16to15,g18to17,g20to19,g22to21,g24to23,g26to25,g28to27,g30to29,g1tom1,g2tom1,g5to3,g6to3,g9to7,g10to7,g13to11,g14to11,g17to15,g18to15,g21to19,g22to19,g25to23,g26to23,g29to27,g30to27,g3tom1,g4tom1,g5tom1,g6tom1,g11to7,g12to7,g13to7,g14to7,g19to15,g20to15,g21to15,g22to15,g27to23,g28to23,g29to23,g30to23,g7tom1,g8tom1,g9tom1,g10tom1,g11tom1,g12tom1,g13tom1,g14tom1,g23to15,g24to15,g25to15,g26to15,g27to15,g28to15,g29to15,g30to15,g15tom1,g16tom1,g17tom1,g18tom1,g19tom1,g20tom1,g21tom1,g22tom1,g23tom1,g24tom1,g25tom1,g26tom1,g27tom1,g28tom1,g29tom1,g30tom1,g31tom1;

wire p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p0tom1,p2to1,p4to3,p6to5,p8to7,p10to9,p12to11,p14to13,p16to15,p18to17,p20to19,p22to21,p24to23,p26to25,p28to27,p30to29,p2tom1,p5to3,p6to3,p9to7,p10to7,p13to11,p14to11,p17to15,p18to15,p21to19,p22to19,p25to23,p26to23,p29to27,p30to27,p6tom1,p11to7,p12to7,p13to7,p14to7,p19to15,p20to15,p21to15,p22to15,p27to23,p28to23,p29to23,p30to23,p14tom1,p23to15,p24to15,p25to15,p26to15,p27to15,p28to15,p29to15,p30to15,p30tom1,p31tom1;

assign gm1 = cin;
prefix pp0(a[0],b[0],sub,g0,p0);
prefix pp1(a[1],b[1],sub,g1,p1);
prefix pp2(a[2],b[2],sub,g2,p2);
prefix pp3(a[3],b[3],sub,g3,p3);
prefix pp4(a[4],b[4],sub,g4,p4);
prefix pp5(a[5],b[5],sub,g5,p5);
prefix pp6(a[6],b[6],sub,g6,p6);
prefix pp7(a[7],b[7],sub,g7,p7);
prefix pp8(a[8],b[8],sub,g8,p8);
prefix pp9(a[9],b[9],sub,g9,p9);
prefix pp10(a[10],b[10],sub,g10,p10);
prefix pp11(a[11],b[11],sub,g11,p11);
prefix pp12(a[12],b[12],sub,g12,p12);
prefix pp13(a[13],b[13],sub,g13,p13);
prefix pp14(a[14],b[14],sub,g14,p14);
prefix pp15(a[15],b[15],sub,g15,p15);
prefix pp16(a[16],b[16],sub,g16,p16);
prefix pp17(a[17],b[17],sub,g17,p17);
prefix pp18(a[18],b[18],sub,g18,p18);
prefix pp19(a[19],b[19],sub,g19,p19);
prefix pp20(a[20],b[20],sub,g20,p20);
prefix pp21(a[21],b[21],sub,g21,p21);
prefix pp22(a[22],b[22],sub,g22,p22);
prefix pp23(a[23],b[23],sub,g23,p23);
prefix pp24(a[24],b[24],sub,g24,p24);
prefix pp25(a[25],b[25],sub,g25,p25);
prefix pp26(a[26],b[26],sub,g26,p26);
prefix pp27(a[27],b[27],sub,g27,p27);
prefix pp28(a[28],b[28],sub,g28,p28);
prefix pp29(a[29],b[29],sub,g29,p29);
prefix pp30(a[30],b[30],sub,g30,p30);
prefix pp31(a[31],b[31],sub,g31,p31);

blackbox b1(g0,p0,gm1,pm1,g0tom1,p0tom1);
blackbox b2(g2,p2,g1,p1,g2to1,p2to1);
blackbox b3(g4,p4,g3,p3,g4to3,p4to3);
blackbox b4(g6,p6,g5,p5,g6to5,p6to5);
blackbox b5(g8,p8,g7,p7,g8to7,p8to7);
blackbox b6(g10,p10,g9,p9,g10to9,p10to9);
blackbox b7(g12,p12,g11,p11,g12to11,p12to11);
blackbox b8(g14,p14,g13,p13,g14to13,p14to13);
blackbox b9(g16,p16,g15,p15,g16to15,p16to15);
blackbox b10(g18,p18,g17,p17,g18to17,p18to17);
blackbox b11(g20,p20,g19,p19,g20to19,p20to19);
blackbox b12(g22,p22,g21,p21,g22to21,p22to21);
blackbox b13(g24,p24,g23,p23,g24to23,p24to23);
blackbox b14(g26,p26,g25,p25,g26to25,p26to25);
blackbox b15(g28,p28,g27,p27,g28to27,p28to27);
blackbox b16(g30,p30,g29,p29,g30to29,p30to29);

graybox gb1(g1,p1,g0tom1,g1tom1);

blackbox b18(g2to1,p2to1,g0tom1,p0tom1,g2tom1,p2tom1);
blackbox b19(g5,p5,g4to3,p4to3,g5to3,p5to3);
blackbox b20(g6to5,p6to5,g4to3,p4to3,g6to3,p6to3);
blackbox b21(g9,p9,g8to7,p8to7,g9to7,p9to7);
blackbox b22(g10to9,p10to9,g8to7,p8to7,g10to7,p10to7);
blackbox b23(g13,p13,g12to11,p12to11,g13to11,p13to11);
blackbox b24(g14to13,p14to13,g12to11,p12to11,g14to11,p14to11);
blackbox b25(g17,p17,g16to15,p16to15,g17to15,p17to15);
blackbox b26(g18to17,p18to17,g16to15,p16to15,g18to15,p18to15);
blackbox b27(g21,p21,g20to19,p20to19,g21to19,p21to19);
blackbox b28(g22to21,p22to21,g20to19,p20to19,g22to19,p22to19);
blackbox b29(g25,p25,g24to23,p24to23,g25to23,p25to23);
blackbox b30(g26to25,p26to25,g24to23,p24to23,g26to23,p26to23);
blackbox b31(g29,p29,g28to27,p28to27,g29to27,p29to27);
blackbox b32(g30to29,p30to29,g28to27,p28to27,g30to27,p30to27);

graybox gb2(g3,p3,g2tom1,g3tom1);
graybox gb3(g4to3,p4to3,g2tom1,g4tom1);
graybox gb4(g5to3,p5to3,g2tom1,g5tom1);

blackbox b33(g6to3,p6to3,g2tom1,p2tom1,g6tom1,p6tom1);

blackbox b34(g11,p11,g10to7,p10to7,g11to7,p11to7);
blackbox b35(g12to11,p12to11,g10to7,p10to7,g12to7,p12to7);
blackbox b36(g13to11,p13to11,g10to7,p10to7,g13to7,p13to7);
blackbox b37(g14to11,p14to11,g10to7,p10to7,g14to7,p14to7);

blackbox b38(g19,p19,g18to15,p18to15,g19to15,p19to15);
blackbox b39(g20to19,p20to19,g18to15,p18to15,g20to15,p20to15);
blackbox b40(g21to19,p21to19,g18to15,p18to15,g21to15,p21to15);
blackbox b41(g22to19,p22to19,g18to15,p18to15,g22to15,p22to15);

blackbox b42(g27,p27,g26to23,p26to23,g27to23,p27to23);
blackbox b43(g28to27,p28to27,g26to23,p26to23,g28to23,p28to23);
blackbox b44(g29to27,p29to27,g26to23,p26to23,g29to23,p29to23);
blackbox b45(g30to27,p30to27,g26to23,p26to23,g30to23,p30to23);

graybox gb5(g7,p7,g6tom1,g7tom1);
graybox gb6(g8to7,p8to7,g6tom1,g8tom1);
graybox gb7(g9to7,p9to7,g6tom1,g9tom1);
graybox gb8(g10to7,p10to7,g6tom1,g10tom1);
graybox gb9(g11to7,p11to7,g6tom1,g11tom1);
graybox gb10(g12to7,p12to7,g6tom1,g12tom1);
graybox gb11(g13to7,p13to7,g6tom1,g13tom1);

blackbox b46(g14to7,p14to7,g6tom1,p6tom1,g14tom1,p14tom1);

blackbox b47(g23,p23,g22to15,p22to15,g23to15,p23to15);
blackbox b48(g24to23,p24to23,g22to15,p22to15,g24to15,p24to15);
blackbox b49(g25to23,p25to23,g22to15,p22to15,g25to15,p25to15);
blackbox b50(g26to23,p26to23,g22to15,p22to15,g26to15,p26to15);
blackbox b51(g27to23,p27to23,g22to15,p22to15,g27to15,p27to15);
blackbox b52(g28to23,p28to23,g22to15,p22to15,g28to15,p28to15);
blackbox b53(g29to23,p29to23,g22to15,p22to15,g29to15,p29to15);
blackbox b54(g30to23,p30to23,g22to15,p22to15,g30to15,p30to15);

graybox gb12(g15,p15,g14tom1,g15tom1);
graybox gb13(g16to15,p16to15,g14tom1,g16tom1);
graybox gb14(g17to15,p17to15,g14tom1,g17tom1);
graybox gb15(g18to15,p18to15,g14tom1,g18tom1);
graybox gb16(g19to15,p19to15,g14tom1,g19tom1);
graybox gb17(g20to15,p20to15,g14tom1,g20tom1);
graybox gb18(g21to15,p21to15,g14tom1,g21tom1);
graybox gb19(g22to15,p22to15,g14tom1,g22tom1);
graybox gb20(g23to15,p23to15,g14tom1,g23tom1);
graybox gb21(g24to15,p24to15,g14tom1,g24tom1);
graybox gb22(g25to15,p25to15,g14tom1,g25tom1);
graybox gb23(g26to15,p26to15,g14tom1,g26tom1);
graybox gb24(g27to15,p27to15,g14tom1,g27tom1);
graybox gb25(g28to15,p28to15,g14tom1,g28tom1);
graybox gb26(g29to15,p29to15,g14tom1,g29tom1);

blackbox b55(g30to15,p30to15,g14tom1,p14tom1,g30tom1,p30tom1);

/***************************************************************************/

blackbox b56(g31,p31,g30tom1,p30tom1,g31tom1,p31tom1);

/******************************************************************************/

sumbox s0(gm1,a[0],b[0],out[0]);
sumbox s1(g0tom1,a[1],b[1],out[1]);
sumbox s2(g1tom1,a[2],b[2],out[2]);
sumbox s3(g2tom1,a[3],b[3],out[3]);
sumbox s4(g3tom1,a[4],b[4],out[4]);
sumbox s5(g4tom1,a[5],b[5],out[5]);
sumbox s6(g5tom1,a[6],b[6],out[6]);
sumbox s7(g6tom1,a[7],b[7],out[7]);
sumbox s8(g7tom1,a[8],b[8],out[8]);
sumbox s9(g8tom1,a[9],b[9],out[9]);
sumbox s10(g9tom1,a[10],b[10],out[10]);
sumbox s11(g10tom1,a[11],b[11],out[11]);
sumbox s12(g11tom1,a[12],b[12],out[12]);
sumbox s13(g12tom1,a[13],b[13],out[13]);
sumbox s14(g13tom1,a[14],b[14],out[14]);
sumbox s15(g14tom1,a[15],b[15],out[15]);
sumbox s16(g15tom1,a[16],b[16],out[16]);
sumbox s17(g16tom1,a[17],b[17],out[17]);
sumbox s18(g17tom1,a[18],b[18],out[18]);
sumbox s19(g18tom1,a[19],b[19],out[19]);
sumbox s20(g19tom1,a[20],b[20],out[20]);
sumbox s21(g20tom1,a[21],b[21],out[21]);
sumbox s22(g21tom1,a[22],b[22],out[22]);
sumbox s23(g22tom1,a[23],b[23],out[23]);
sumbox s24(g23tom1,a[24],b[24],out[24]);
sumbox s25(g24tom1,a[25],b[25],out[25]);
sumbox s26(g25tom1,a[26],b[26],out[26]);
sumbox s27(g26tom1,a[27],b[27],out[27]);
sumbox s28(g27tom1,a[28],b[28],out[28]);
sumbox s29(g28tom1,a[29],b[29],out[29]);
sumbox s30(g29tom1,a[30],b[30],out[30]);
sumbox s31(g30tom1,a[31],b[31],out[31]);
sumbox s32(g31tom1,ex1,ex2,out[32]);

assign ovf = out[32];
assign res = out[31:0];

endmodule


/********************************************************************************/

module PES_ADD_SUB_32(clk,a,b,cin,sub,res,ovf);

input [31:0]a,b;
input cin,sub,clk;
output reg ovf;
output reg [31:0]res;

wire [31:0]res_v;
wire ovf_v;

pes_add_sub_32 m1(a,b,cin,sub,res_v,ovf_v);

always @(posedge clk)
begin
	res <= res_v;
	ovf <= ovf_v;
end
endmodule
