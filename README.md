# ***Floating-Point-Alu-VHDL***:

----------
### *Aim*:

----------

To Design an 8 bit floating point ALU that supports the arithmetic and logic operations: addition, subtraction, multiplication,
division, AND, OR, NOT, XOR on floating point numbers as shown below. 

- sel = 0000 :Operation y<=a :Function: Transfer a
- sel = 0001 :Operation y<=a+1 :Function: Increment a
- sel = 0010 :Operation y<=a-1 :Function: Decrement a
- sel = 0011 :Operation y<=b :Function: Transfer b
- sel = 0100 :Operation y<=b+1 :Function: Increment b
- sel = 0101 :Operation y<=b-1 :Function: Decrement b
- sel = 0110 :Operation y<=a+b :Function: add a,b
- sel = 0111 :Operation y<=a+b+cin :Function: add a,b,cin
- sel = 1000 :Operation y<=not a :Function: complement a
- sel = 1001 :Operation y<=not b :Function: complement b
- sel = 1010 :Operation y<=a and b :Function: And
- sel = 1011 :Operation y<=a or b :Function: Or
- sel = 1100 :Operation y<=a nand b:Function: Nand
- sel = 1101 :Operation y<=a nor b:Function: Nor
- sel = 1110 :Operation y<=a xor b:Function: Xor
- sel = 1111 :Operation y<=a xnor b:Function: Xnor


-------------
### *Softwares Used*:

-------------

Xilinx 14.2

-------------
### *Languages Written*:

-------------

VHDL

-------------
### *Usage*:

-------------

Run FloatingPointAlu.xise in xilinx.
This project is edited using xilinx 14.2 and simulated in the same.



