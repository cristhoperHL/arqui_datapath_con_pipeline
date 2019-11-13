module Register_File(clk, readreg1, readreg2, writereg, writedata, read_data1, read_data2, regwrite);
input clk;
input [4:0] readreg1, readreg2, writereg; // 2 sources y 1 destination
input [31:0] writedata; // resultado (writeback)
input regwrite; // input de Control
output [31:0] read_data1, read_data2;
reg [31:0]reg_set[0:31]; // tabla de las variables
initial begin
$readmemb("register_set.txt", reg_set);
end
//se lee en posedge
/*always @(*) 
begin
  read_data1 <= reg_set[readreg1];
  read_data2 <= reg_set[readreg2];
end
*/
assign read_data1 = (readreg1!=0)?reg_set[readreg1]:0;
assign read_data2 = (readreg2!=0)?reg_set[readreg2]:0;

//se escribe en negedge
always @(*) 
begin
  if(regwrite == 1'b1)
  begin
  reg_set[writereg] <= writedata;
  end
end					

endmodule
