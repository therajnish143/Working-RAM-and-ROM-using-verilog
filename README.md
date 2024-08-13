# Working-RAM-and-ROM-using-verilog

##  The Single Port RAM <br/>
The single port RAM is a basic memory device which is used for reading and
writing through a single channel. Only one of the two operations can be done at
one time. It has a clock input, enable input which allows data or instructions to
be written in it. The module we have implemented is a 64x8 bit module. The
address input has 6 bits, allowing for 64 address locations and the input data has
8 bits, making the module 64x8. The output q is an 8-bit data output for reading.
<br/><br/>
![image](https://github.com/user-attachments/assets/fe7b6216-9e6b-46b5-a5ad-0c8a286f080e)
<br/><br/>
## The Dual Port RAM<br/>
The dual port RAM is the improved version of the single port RAM which
allows for the Reading and Writing operations to be done simultaneously. It is
also a 64x8 bit memory module but it has two set of input/output channels – a &
b. One of them can write and the other can read independently of each other.
This module also has 2 enable inputs but only a single clock input.
<br/><br/>
![image](https://github.com/user-attachments/assets/20f13553-2a81-46dd-b27a-dd2a94852470)
<br/><br/>
## ROM<br/>
The ROM is a non-volatile memory storage solution, as discussed before. The
model we have implemented is an 8x8 bit memory device. The address input
has 3 bits making possible for 8 total address locations with each location has 8
bit data stored in it. When enable is 1, the q output port allows for the data to
be read from the ROM module.
<br/><br/>
![image](https://github.com/user-attachments/assets/8c744e26-d8c1-416c-8814-b9774da28359)

<br/><br/>
## Results and Discussions
![image](https://github.com/user-attachments/assets/ceeda7e9-7617-417d-8ba4-97e6b91ed665)
<br/>
### Single-Port RAM Module<br/>
**Inputs**: ( data [7:0] 8-bit input data. addr [5:0] 6-bit address. en: Write enable signal.
 clk: Clock signal. )<br/>
**Outputs:**( q [7:0]: 8-bit output data.)<br/>
**Behavior:**<br/>
● Data is written to the RAM at the specified address on the rising clock edge if `en` is
asserted.<br/>
● If `en` is not asserted, the address is stored in `addr_reg`.<br/>
● Output `q` is assigned the value from the RAM at the address stored in `addr_reg`.<br/>
**Simulation Flow:**<br/>
● Generates a clock with a 10-time unit period.<br/>
● Applies test vectors at specific time points.<br/>
● Creates a VCD file for waveform simulation.<br/>
● Stops simulation after 90 time units.<br/><br/>
**Simulation Results:**<br/>
● The testbench aims to verify the correctness of the single-port RAM module by
simulating various scenarios, including write and read operations.<br/>
● The waveform simulation results can be analyzed in the generated VCD file
(`dump.vcd`)<br/>

