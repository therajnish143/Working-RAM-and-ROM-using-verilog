//Single Port RAM:
module single_port_ram_tb;
reg [7:0] data; //input data
reg [5:0] addr; //address
reg we; //write enable
 reg clk; //clk
 wire [7:0] q; //output data

 single_port_ram spr1(
 .data(data),
 .addr(addr),
 .en(en),
 .clk(clk),
 .q(q)
 );

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1, single_port_ram_tb);

 clk=1'b1;
 forever #5 clk = ~clk;
 end

 initial
 begin
 data = 8'h01;
 addr = 5'd0;
 en = 1'b1;
 #10;
 data = 8'h02;
 addr = 5'd1;
 #10;
 data = 8'h03;
 addr = 5'd2;
 #10;
 addr = 5'd0;
 en = 1'b0;
 #10;
 addr = 5'd1;
 #10;
 addr = 5'd2;
 #10;
 data = 8'h04;
 addr = 5'd1;
 en = 1'b1;
 #10;
 addr = 5'd1;
 en = 1'b0;
 #10
 addr = 5'd3;
 #10;
 end

 initial
 #90 $stop;

endmodule


//Dual Port RAM:
module dual_port_ram_tb;
 reg [7:0] data_a, data_b; //input data
 reg [5:0] addr_a, addr_b; //Port A and Port B address
 reg we_a, we_b; //write enable for Port A and Port B
 reg clk; //clk
 wire [7:0] q_a, q_b; //output data at Port A and Port B

 dual_port_ram dpr1(
 .data_a(data_a),
 .data_b(data_b),
 .addr_a(addr_a),
 .addr_b(addr_b),
 .we_a(we_a),
 .we_b(we_b),
 .clk(clk),
 .q_a(q_a),
 .q_b(q_b)
 );

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1, dual_port_ram_tb);

 clk=1'b1;
 forever #5 clk = ~clk;
 end

 initial
 begin
 data_a = 8'h33;
 addr_a = 6'h01;
 data_b = 8'h44;
 addr_b = 6'h02;
 we_a = 1'b1;
 we_b = 1'b1;
 #10;
 data_a = 8'h55;
 addr_a = 6'h03;
 addr_b = 6'h01;
 we_b = 1'b0;
 #10;
 addr_a = 6'h02;
 addr_b = 6'h03;
 we_a = 1'b0;
 #10
 addr_a = 6'h01;
 data_b = 8'h77;
 addr_b = 6'h02;
 we_b = 1'b1;
 #10;
 end
 initial
 #40 $stop;
endmodule


//ROM:


module rom_tb;
 reg clk; //clk
 reg en; //enable
 reg [3:0] addr; //address
 wire [3:0] data; //output data

 rom r1(
 .clk(clk),
 .en(en),
 .addr(addr),
 .data(data)
 );

 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1, rom_tb);

 clk=1'b1;
 forever #5 clk = ~clk;
 end

 initial
 begin
 en = 1'b0;
 #10;
 en = 1'b1;
 addr = 4'b1010;
 #10;
 addr = 4'b0110;
 #10;
 addr = 4'b0011;
 #10;
 en = 1'b0;
 addr = 4'b1111;
 #10;
 en = 1'b1;
 addr = 4'b1000;
 #10;
 addr = 4'b0000;
 #10;
 addr = 4'bxxxx;
 #10;
 end

 initial
 begin
 #80 $stop;
 end

endmodule 
