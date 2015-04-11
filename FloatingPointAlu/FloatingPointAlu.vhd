----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:02 04/12/2014 
-- Design Name: 
-- Module Name:    FinalCode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FinalCode is
port(a,b : in STD_LOGIC_VECTOR(7 downto 0);					
cin : in std_logic;
sel : in std_logic_vector(3 downto 0);
y : out STD_LOGIC_VECTOR(7 downto 0));
end FinalCode;

architecture Behav of FinalCode is	

signal temp1 : std_logic_vector(7 downto 0);
signal temp2 : std_logic_vector(7 downto 0);
signal temp_out : std_logic_vector(7 downto 0);
--signal flag : std_logic;

component FloatingPointAlu port(a,b:in std_logic_VECTOR(7 downto 0);
c : out std_logic_vector(7 downto 0) );
end component;


begin

process(sel,a,b,cin)

begin



case(sel) is
when "0000"=>
temp1<=a;
temp2<=b;
when "0001"=>
temp1<=a;
temp2<="00000000";
when "0010"=>
temp1<=a;
temp2<="10000000";
when "0011"=>
temp1<=a;
temp2<=b;
when "0100"=>
temp1<=b;
temp2<="00000000";
when "0101"=>
temp1<=b;
temp2<="10000000";
when "0110"=>
temp1<=a;
temp2<=b;
when "0111"=>
temp1<=a;
temp2<=b;
when "1000"=>
temp1<=a;
temp2<=b;
when "1001"=>
temp1<=a;
temp2<=b;
when "1010"=>
temp1<=a;
temp2<=b;
when "1011"=>
temp1<=a;
temp2<=b;
when "1100"=>
temp1<=a;
temp2<=b;
when "1101"=>
temp1<=a;
temp2<=b;
when "1110"=>
temp1<=a;
temp2<=b;
when "1111"=>
temp1<=a;
temp2<=b;
when others=>

temp1<=a;
temp2<=b;
end case;



end process;


x0 : FloatingPointAlu port map(temp1,temp2,temp_out);
y<=a
when sel="0000"
else b
when sel="0011"
else (not a)
when sel="1000"
else (not b)
when sel="1001"
else (a and b)
when sel="1010"
else (a or b)
when sel="1011"
else (a nand b)
when sel="1100"
else (a nor b)
when sel="1101"
else (a xor b)
when sel="1110"
else (a xnor b)
when sel="1111"
else temp_out;





end Behav;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:50 04/08/2014 
-- Design Name: 
-- Module Name:    FloatingPointAlu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:50 04/08/2014 
-- Design Name: 
-- Module Name:    FloatingPointAlu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:50 04/08/2014 
-- Design Name: 
-- Module Name:    FloatingPointAlu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FloatingPointAlu is
port(a,b : in std_logic_vector(7 downto 0);  --a,b are inputs 
--clock : in std_logic;              
c : out std_logic_vector(7 downto 0));  -- c is output
end FloatingPointAlu;

architecture Behavioral of FloatingPointAlu is
signal e1,e2,e3,tempe: std_logic_vector(2 downto 0);  -- for copying exponents of the  floating numbers
signal s1,s2,s3,temps : std_logic;    -- for copying signs of the  floating numbers
signal f1,f2,f3,tempf : std_logic_vector(3 downto 0);    --for copying mantissas of the  floating numbers
signal temp : std_LOGIC_VECTOR(7 downto 0);       -- some temporary output
signal a1 : std_LOGIC_VECTOR(7 downto 0);        -- for copying signal a for using temporarily
signal b1 : std_LOGIC_VECTOR(7 downto 0);            --for copying signal b for using temporarily
signal e_diff: std_LOGIC_VECTOR(2 downto 0);        --for calculating difference in exponents (e1-e2)
signal e_diff_sig : std_logic_vector(2 downto 0);       -- for copying exp difference  
signal f1_var,f2_var,f3_var : std_logic_vector(5 downto 0);   -- for adding mantissa1 and mantissa2 with carry in algorithm


begin

process(a,b)
begin
--if (clock'event and clock='1') then   --If the absolute value of v1 is less than the absolute
--value of v2 then swap v1 and v2. The absolute value is
--checked by comparing the exponent and mantissa of
--each value.

a1<=a;
b1<=b;
s1 <= a1(7);
s2 <= b1(7);
e1(2)<=a1(6);
e1(1)<=a1(5);
e1(0)<=a1(4);
e2(2)<=b1(6);
e2(1)<=b1(5);
e2(0)<=b1(4);
f1(3)<=a1(3);
f1(2)<=a1(2);
f1(1)<=a1(1);
f1(0)<=a1(0);
f2(3)<=b1(3);
f2(2)<=b1(2);
f2(1)<=b1(1);
f2(0)<=b1(0);

if e1<e2 then
tempe <= e2;
e2<=e1;
e1<= tempe;

tempf <= f2;
f2<=f1;
f1<= tempf;

temps <= s2;
s2<=s1;
s1<= temps;


elsif e1 = e2 then
if f1<f2 then 
tempf <= f2;
f2<=f1;
f1<= tempf;

temps <= s2;
s2<=s1;
s1<= temps;

end if;

end if;

e_diff<= e1-e2;           --Subtract e2 from e1 in order to calculate the number of
--positions to shift f2 to the right so that the decimal
--points are aligned befre addition or subtraction.



e_diff_sig<=e_diff;
--add 1 to left side of mantissa in both.
--add 0 to left side again to check carry after addition or subtraction.
f1_var(3)<=f1(3);  
f1_var(2)<=f1(2);  
f1_var(1)<=f1(1);
f1_var(0)<=f1(0);
f1_var(4)<='1';
f1_var(5)<='0';

f2_var(3)<=f2(3);
f2_var(2)<=f2(2);
f2_var(1)<=f2(1);
f2_var(0)<=f2(0);
f2_var(4)<='1';
f2_var(5)<='0';


--Shift 1.f2 to the right (e2 - e1) places calculated in the
--previous stage.

for i in 1 to 3 loop
if e_diff_sig>"000" then 
f2_var(0)<=f2_var(1);
f2_var(1)<=f2_var(2);
f2_var(2)<=f2_var(3);
f2_var(3)<=f2_var(4);
f2_var(4)<=f2_var(5);
f2_var(5)<='0';
e_diff_sig<=e_diff_sig-1;
end if;
end loop;

--Add 1.f1 to 1.f2 if s1 equals s2, else subtract 1.f2 from
--1.f1.


if s1=s2 then
f3_var<=f1_var + f2_var;
else
f3_var<=f1_var - f2_var;
end if;



--Set the sign and the exponent of the final result, v3, to
--the sign and the exponent of the greater value v1.

s3<=s1;
e3<=e1;

--if there is no carry then mantissa of output will be last 4 bits of f3_var and there is no need to change 
--exponent of output. if there is a carry then  mantissa of output will be middle 4 bits of f3_var and 
--exponent of output should be increased by one.

if f3_var(5) = '0' then
c(3)<=f3_var(3);
c(2)<=f3_var(2);
c(1)<=f3_var(1);
c(0)<=f3_var(0);
else
c(3)<=f3_var(4);
c(2)<=f3_var(3);
c(1)<=f3_var(2);
c(0)<=f3_var(1);
e3<=e3+1;
end if;



-- copying sign and exponents of output to their places.

c(7)<=s3;
c(6)<=e3(2);
c(5)<=e3(1);
c(4)<=e3(0);

--end if;

end process;

end Behavioral;
