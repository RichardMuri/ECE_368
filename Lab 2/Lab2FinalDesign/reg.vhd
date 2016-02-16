-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 library ieee;
 use ieee.std_logic_1164.all;
 entity SIMPREG is

	 port (	DIN : in std_logic_vector(7 downto 0):= (OTHERS => 'X'); -- system inputs
				DOUT : out std_logic_vector(7 downto 0); -- system outputs
				ENABLE : in std_logic; -- enable
				RESET  : in std_logic;
				CLK : in std_logic); -- clock and reset
				
 end SIMPREG;
 -- purpose: Main architecture details for SIMPREG
 architecture SIMPLE of SIMPREG is

	 begin -- SIMPLE
		 process(CLK,RESET)

		 begin -- process
			 -- activities triggered by asynchronous reset (active high)
			 if RESET = '1' then
			 DOUT <= "00000000";

			 -- activities triggered by rising edge of clock
				 elsif CLK'event and CLK = '1' then
					 if ENABLE='1' then
						 DOUT <= DIN;
						 else
						 null;
					 end if;
		 end if;
		 end process;
 end SIMPLE;
