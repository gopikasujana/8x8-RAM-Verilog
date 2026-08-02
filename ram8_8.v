module ram8_8(input clk,rst,wr_enb,input [2:0]wr_add,input [7:0]data,input [2:0]rd_add,output reg [7:0]dataout);
//creating one internal memory
reg [7:0]mem[7:0];
integer i;
//write and read logic
always@(posedge clk or posedge rst)begin
    if(rst)begin
        for(i=0;i<8;i++)
            mem[i] <= 0;
    end
    else
    begin
       if(wr_enb)
           mem[wr_add]<= data;
        else if(wr_enb == 0)
            dataout <= mem[rd_add];
   end
end
endmodule








       