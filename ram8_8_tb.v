module ram8_8_tb;
reg clk,rst,wr_enb;
reg [2:0]wr_add;
reg [7:0]data;
reg [2:0]rd_add;
wire [7:0]dataout;
ram8_8 dut(clk,rst,wr_enb,wr_add,data,rd_add,dataout);
initial
    begin
       {clk,rst,wr_enb,wr_add,data,rd_add} = 0;
       $dumpfile("ram8_8.vcd");
       $dumpvars(0,ram8_8_tb);
end
always #5 clk =~clk;
initial
   begin
      rst = 1;
      #10;
      rst = 0;
      wr_enb = 1;
      wr_add = 3'b100;
      data = 5;
      #10;
      wr_enb =1;
      wr_add =3'b101;
      data =10;
      #10;
      wr_enb =0;
      rd_add = 3'b100;
      #10;
      rd_add = 3'b101;
      #20;
      $finish;
end
endmodule