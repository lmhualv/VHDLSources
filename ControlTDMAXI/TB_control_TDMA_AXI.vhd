library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL; 

entity TB_control_TDMA_AXI is
end TB_control_TDMA_AXI;

architecture bhv of TB_control_TDMA_AXI is

component control_TDMA_AXI is
	Port(
		clk: in std_logic;
		ena: in std_logic;
		start: out std_logic
	);
end component;

signal clk:   std_logic := '0';
signal ena:   std_logic := '0';
signal start: std_logic := '0';

constant clk_period: time:= 10 ns;

begin

dut: component control_TDMA_AXI port map(
    clk   => clk,
    ena   => ena,
    start => start
);

process
    begin
        clk <= '0';
        wait for clk_period/2; 
        clk <= '1';
        wait for clk_period/2; 
    end process;
    
process
begin
    ena <= '1';
    wait for 100 ns;
end process;
    
end bhv;
