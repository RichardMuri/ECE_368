----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:02 02/16/2016 
-- Design Name: 
-- Module Name:    RegisterMux - Behavioral 
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

entity RegisterMux is

port(    aout : in STD_LOGIC_VECTOR(7 downto 0);
			bout : in STD_LOGIC_VECTOR(7 downto 0);
			opout : in STD_LOGIC_VECTOR(7 downto 0);
			aluout : in STD_LOGIC_VECTOR(7 downto 0);
			sel   : in STD_LOGIC;
			ssegout : out STD_LOGIC_VECTOR(7 downto 0));

end RegisterMux;

architecture Behavioral of RegisterMux is

signal temp : STD_LOGIC_VECTOR(1 downto 0):= "10";

begin

	process(sel)
	begin
		if (sel'event and sel = '1') then

			if temp = "11" then
				temp <= "00";
			end if;

			case (temp) is
				when "00" =>
					ssegout <= aout;
				when "01" =>
					ssegout <= bout;
				when "10" =>
					ssegout <= opout;
				when others =>
					ssegout <= "00000000";
			end case;
		end if;
	end process;

end Behavioral;

