----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:38 02/13/2016 
-- Design Name: 
-- Module Name:    BiggerBlackerBox - Behavioral 
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

entity BiggerBlackerBox is

	port(	CLK	: in  STD_LOGIC; -- clock for the whole system
			SW		: in  STD_LOGIC_VECTOR(7 downto 0); -- eight switches for input
			BTN	: in  STD_LOGIC_VECTOR(3 downto 0); -- four push buttons control muxes
			SEG   : out STD_LOGIC_VECTOR (6 downto 0); -- outputs for seven seg display
         DP    : out STD_LOGIC;
         AN    : out STD_LOGIC_VECTOR (3 downto 0));

end BiggerBlackerBox;

architecture Behavioral of BiggerBlackerBox is

signal ain : STD_LOGIC_VECTOR(7 downto 0):=  (OTHERS => '0'); -- switch mux to register a
signal bin : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- switch mux to register b
signal opin : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- switch mux to opcode register

signal r_aout : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- register a to ALU
signal r_bout : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- register b to ALU
signal r_opout : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- opcode register to alu
signal r_aluout : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- ALU result
signal r_ssegout : STD_LOGIC_VECTOR(7 downto 0):= (OTHERS => '0'); -- 

signal en1 : STD_LOGIC := '1'; 

begin

	switches : entity work.SwitchMux
	port map( input => SW,
				 sel 	 => BTN,
				 outp1 => ain,
				 outp2 => bin,
				 outp3 => opin);
				 
	regswitches : entity work.RegisterMux
	port map( aout => r_aout,
				 bout => r_bout,
				 opout => r_opout,
				 sel => BTN,
				 aluout => r_aluout,
				 ssegout => r_ssegout ); -- ?????

	regA : entity work.SIMPREG 
	
	port map( DIN		 =>	ain,
				 DOUT		 => 	r_aout,
				 ENABLE   =>   en1,
				 CLK      =>   CLK,
				 RESET    =>   BTN(3)); 

	regB : entity work.SIMPREG 
	
	port map( DIN		 =>	bin,
				 DOUT		 => 	r_bout,
				 ENABLE   =>   en1,
				 CLK      =>   CLK,
				 RESET    =>   BTN(3));
				 
	regop : entity work.SIMPREG 
	
	port map( DIN		 =>	opin,
				 DOUT		 => 	r_opout,
				 ENABLE   =>   en1,
				 CLK      =>   CLK,
				 RESET    =>   BTN(3));
				 
	sseg : entity work.SSeg_toplevel
	
	port map(CLK	=>	CLK, 
				SW		=>	r_aout,
				BTN	=>	BTN(3),
				SEG	=>	SEG,
				DP		=>	DP,
				AN		=>	AN);

end Behavioral;

