
//Single Port RAM
module single_port_ram(
 input [7:0] data, //input data
 input [5:0] addr, //address
 input en, //write enable
 input clk, //clk
 output [7:0] q //output data
);

 reg [7:0] ram [63:0]; //8*64 bit ram
 reg [5:0] addr_reg; //address register
 always @ (posedge clk)
 begin
 if(en)
 ram[addr] <= data;
 else
 addr_reg <= addr;
 end
 assign q = ram[addr_reg];

endmodule

//Dual Port RAM:


module dual_port_ram(
 input [7:0] data_a, data_b, //input data
 input [5:0] addr_a, addr_b, //Port A and Port B address
 input en_a, en_b, //write enable for Port A and Port B
 input clk, //clk
 output reg [7:0] q_a, q_b //output data at Port A and Port B
);

 reg [7:0] ram [63:0]; //8*64 bit ram
 always @ (posedge clk)
 begin
 if(en_a)
 ram[addr_a] <= data_a;
 else
 q_a <= ram[addr_a];
 end

 always @ (posedge clk)
 begin
 if(en_b)
 ram[addr_b] <= data_b;
 else
 q_b <= ram[addr_b];
 end

endmodule


//ROM:

module rom (
 input clk, //clk 
 input en, //enable
 input [3:0] addr, //address
 output reg [3:0] q //output data
);

 reg [3:0] mem [15:0]; //4 bit data and 16 locations

 always @ (posedge clk)
 begin
 if (en)
 q <= mem[addr];
 else
 q <= 4'bxxxx;
 end

 initial
 begin
 mem[0] = 4'b0010;
 mem[1] = 4'b0010;
 mem[2] = 4'b1110;
 mem[3] = 4'b0010;
 mem[4] = 4'b0100;
 mem[5] = 4'b1010;
 mem[6] = 4'b1100;
 mem[7] = 4'b0000;
 mem[8] = 4'b1010;
 mem[9] = 4'b0010;
 mem[10] = 4'b1110;
 mem[11] = 4'b0010;
 mem[12] = 4'b0100;
 mem[13] = 4'b1010;
 mem[14] = 4'b1100;
 mem[15] = 4'b0000;
 end
endmodule
