# CPUonFPGA
It's a basic computer designed using VERILOG on XILINX FPGA architecture. 

The complete architecture has been made using the Xilinx software and the implementation has been implemented on the target device: xc5vlx110t-3ff1136. Below is a brief description:

Load all the verilog codes that you download in a single project on Xilinx.

1. CU.V is the main black box or you can say your basic computer that includes all the hardware and wirings inside it.

2. MEM.V is the ROM memory used in this example. It has a capacity to store 256 words of 16 bits each. I could have used 2 separate  memories for instructions and data but for a ‘basic’ example I dropped the idea. 

3. SIGNALS.V is the signal generator module that provides all the required timing signals for the computer to work with. It’s basically the T0, T1, T2… timing signals which are used to schedule the fetch and execute instructions through the control block.

4. REGISTER.V is a basic module describing the registers of the architecture. Anyone with hands on Verilog can hold it with ease.

5. ALU.V is the block that describes the Arithmetic Logic Unit of the system. This module takes the signal from the control block and performs all the operations related with the Accumulator (AC) and the carry flip-flop (E).

6. FF.V implements the flip-flop model. I have only used the E flip-flop. Anyone who is more excited can use this module to extend the complete design by including the parity, sign and other flip-flops to this basic architectue design.

7. OPCODE.V is used to reduce the complexity involved with decoding the Instruction register’s (IR) higher bits. This decoder is used to decode the 12,13 and 14 bits of the IR code.

8. CTRL.V is the heart of the design. Yeah! you guessed right, this module describes all the timing sequences associated with computer.

An RTL Schematic of the project is here: An RTL schematic generated using Verilog on Xilinx

![Alt text] (https://algoboy.files.wordpress.com/2011/08/rtl.jpg?w=645)

I have also included a text file called “t.txt” with an example program that can be burned into the ROM. You can write your own program for further testing purpose using the hexadecimal coding provided in the Morris Mano book.

Hexadecimal                                        Code Meaning

200a                                                       Load content from memory to AC. It loads the data from address ‘a’ to AC.

100b                                                       ADD to AC the content stored at address ‘b’ from ROM.

300c                                                       Store the content of AC at address ‘c’ in ROM.

200c                                                       Load the content from ROM address ‘c’ in AC.

7020                                                       Increment AC

7400                                                       Clear E

7080                                                       Circulate AC right

7100                                                        Complement E

7040                                                       Circulate AC left

0000                                                      Do Nothing

0f0f                                                        The data stored at the ROM address ‘a’

f102                                                        The data stored at the ROM address ‘b’

Basically I attempted to test some memory reference and register reference instructions using this code. You can go with your own testing skills.
