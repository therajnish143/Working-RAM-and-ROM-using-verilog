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
### Single-Port RAM Module<br/>
![image](https://github.com/user-attachments/assets/ceeda7e9-7617-417d-8ba4-97e6b91ed665)
<br/>

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
<br/><br/>
### Dual-Port RAM Module

![image](https://github.com/user-attachments/assets/e76b5d1a-59fa-48a6-be32-b0ffb50ffc75)


<br/>**Inputs:**
(data_a [7:0] and data_b [7:0]: Input data for Port A and Port B.<br/>
addr_a [5:0]` and `addr_b [5:0]`: Address for Port A and Port B.<br/>

en_a and en_b : Write enable for Port A and Port B.<br/>
clk : Clock signal )
**Outputs: **(q_a [7:0] and q_b [7:0]: Output data at Port A and Port B.)<br/>
**Behavior:**<br/>
● On the rising edge of the clock (`posedge clk`):<br/>
● If `en_a` is asserted, write `data_a` to the RAM at address `addr_a`.<br/>
● If `en_a` is not asserted, assign `q_a` the value from the RAM at address `addr_a`.<br/>
● Similarly for Port B (`en_b`, `data_b`, `addr_b`, and `q_b`).<br/>
**Testbench Inputs**:<br/>
(data_a [7:0] and data_b [7:0]: Testbench input data.<br/>
addr_a [5:0] and addr_b [5:0]: Testbench address for Port A and Port B.<br/>
we_a and we_b: Testbench write enable for Port A and Port B.<br/>
clk: Testbench clock.)<br/>
**Testbench Outputs:**
( q_a [7:0] and q_b [7:0]: Testbench output data at Port A and Port B.)<br/>
**Testbench Simulation Flow:**<br/>
● Set initial values for inputs (data_a, addr_a, we_a, data_b, addr_b, we_b).<br/>
● Apply test vectors at specific time points.<br/>
● Stop the simulation after 40 time units.<br/>
**Test Vector Details:**<br/>
● Write data to Port A and Port B at different addresses with write enable control.<br/>
● Modify and read data from different addresses for Port A and Port B<br/>
<br/><br/><br/>
### ROM Module 
![image](https://github.com/user-attachments/assets/6153bfea-5599-4669-a750-4b8ca2a70874)

<br/><br/>

**Inputs:** (clk: Clock signal, en: Enable signal , addr [3:0] : 4-bit address.)<br/>
**Outputs:** (q [3:0] : 4-bit output data. )<br/>
**Behavior:**<br/>
● On the rising edge of the clock (`posedge clk`), if `en` is asserted, output `q` is
assigned the value from memory at the specified address (`addr`).<br/>
● If `en` is not asserted, output `q` is set to an undefined value (`4'bxxxx`).
**Initial Block:**- Initializes the memory with specific 4-bit values at 16 different locations.
**Testbench Inputs:** (`clk`: Testbench clock. - `en`: Testbench enable. - `addr [3:0]`: Testbench
address.)<br/>
**Testbench Outputs:** - (`data [3:0]`: Testbench output data.)<br/>
**Testbench Initial Blocks:**<br/>
● $dumpfile` and `$dumpvars` are used to create a VCD file for waveform simulation. -
A clock (`clk`) is generated with a period of 10 time units.<br/>

● Test vectors are applied to the ROM inputs (`en`, `addr`) at specific time points.<br/>
● The simulation is stopped after 80 time units using `$stop`.<br/>
Testbench Simulation Flow:<br/>
● Set initial values for inputs (`en`, `addr`).<br/>
● Apply test vectors at specific time points.<br/>
● Stop the simulation after 80 time units.<br/>
Test Vector Details:<br/>
● Enable (`en`) and disable (`en=0`) ROM output at specific addresses. - Change the
address (`addr`) to observe different data outputs.<br/>
● Set an undefined address (`addr = 4'bxxxx`) to observe an undefined output.<br/>
Simulation Results:<br/>
● The testbench aims to verify the correctness of the ROM module by simulating
various scenarios, including enabling/disabling output and reading data from different
addresses.<br/>
● The waveform simulation results can be analyzed in the generated VCD file
(`dump.vcd`).<br/>

