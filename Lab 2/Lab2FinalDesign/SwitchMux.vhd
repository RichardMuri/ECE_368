----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:05 02/14/2016 
-- Design Name: 
-- Module Name:    SwitchMux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SwitchMux is

	port( input : in STD_LOGIC_VECTOR(7 downto 0);
			sel   : in STD_LOGIC_VECTOR(3 downto 0);
			outp1 : out STD_LOGIC_VECTOR(7 downto 0);
			outp2 : out STD_LOGIC_VECTOR(7 downto 0);
			outp3 : out STD_LOGIC_VECTOR(7 downto 0));
		
end SwitchMux;

architecture Behavioral of SwitchMux is 

begin


process(sel)
begin
case (sel) is
	when "0001" =>
		outp1 <= input;
	when "0010" =>
		outp2 <= input;
	when "0100" =>
		outp3 <= input;
	when others =>
		outp1 <= "00000000";
		outp2 <= "00000000";
		outp3 <= "00000000";
end case;
end process;


end Behavioral;

