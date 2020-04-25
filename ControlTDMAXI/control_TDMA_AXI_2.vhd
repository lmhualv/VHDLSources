library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_TDMA_AXI_2 is
	Port(
		clk:   in std_logic;
		ena:   in std_logic; 
		start: out std_logic
	);
end control_TDMA_AXI_2;

architecture behav of control_TDMA_AXI_2 is
	signal conteo: integer range 0 to 34 := 0;
	begin
	process(clk)
	begin
	if (ena='0') then
	start <= '0';
	elsif (clk'event and clk='1') then
		  conteo <= conteo + 1;
		  start  <= '0';
			if (conteo > 14 and conteo < 32) then
				start <= '1';
            elsif (conteo = 32) then
                conteo <= 0;
			end if;
		end if;
	end process;
end behav;
