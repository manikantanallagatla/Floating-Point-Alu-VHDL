--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:45:31 04/11/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/FloatingPointAlu/fa.vhd
-- Project Name:  FloatingPointAlu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FinalCode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fa IS
END fa;
 
ARCHITECTURE behavior OF fa IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FinalCode
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         cin : IN  std_logic;
         sel : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FinalCode PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sel => sel,
          y => y
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     

      -- insert stimulus here 

      wait;
   end process;

END;
