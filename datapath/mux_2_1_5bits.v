module mux2_1_5(a,b,sel,out);
input [4:0] a,b;
input sel;
output [4:0] out;

assign out= (sel) ? a : b;


endmodule