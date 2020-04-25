--serializer 
--this serializer sets a flag when done tx the last data
--if all data is wanted in a single clock cycle operation frequency needed = 192 MHz = 16 inputs * 12 bits each
--these operation frequency is obtained from a external clocking wizard in Vivado

library ieee;
use ieee.std_logic_1164.all;

entity FastSerializer is
    generic(
        numbits: integer := 12;
        numchn: integer := 16
    );
    port(
        --inputs
        clk : in std_logic;
        din0:  in std_logic_vector(numbits-1 downto 0);
        din1:  in std_logic_vector(numbits-1 downto 0);
        din2:  in std_logic_vector(numbits-1 downto 0);
        din3:  in std_logic_vector(numbits-1 downto 0);
        din4:  in std_logic_vector(numbits-1 downto 0);
        din5:  in std_logic_vector(numbits-1 downto 0);
        din6:  in std_logic_vector(numbits-1 downto 0);
        din7:  in std_logic_vector(numbits-1 downto 0);
        din8:  in std_logic_vector(numbits-1 downto 0);
        din9:  in std_logic_vector(numbits-1 downto 0);
        din10: in std_logic_vector(numbits-1 downto 0);
        din11: in std_logic_vector(numbits-1 downto 0);
        din12: in std_logic_vector(numbits-1 downto 0);
        din13: in std_logic_vector(numbits-1 downto 0);
        din14: in std_logic_vector(numbits-1 downto 0);
        din15: in std_logic_vector(numbits-1 downto 0);
        --outputs
        finnish_n: out std_logic; --update
        dout:  out std_logic_vector(numbits-1 downto 0)
        );
end entity;

architecture bhv of FastSerializer is
--signals
signal internal: std_logic_vector(numbits-1 downto 0);
begin 
    process(clk)
        variable count : integer range 0 to numchn;
    begin
        if (clk'event and clk='1') then
            count := count + 1; --increment the counter
            --------------------------update 
            finnish_n <= '0';
            if (count = 16) then
                count := 0;
                finnish_n <= '1';
            end if;
            -------------------------
            case count is
                when 0 => internal <= din0; 
                when 1 => internal <= din1;
                when 2 => internal <= din2;
                when 3 => internal <= din3;
                when 4 => internal <= din4;
                when 5 => internal <= din5;
                when 6 => internal <= din6;
                when 7 => internal <= din7;
                when 8 => internal <= din8;
                when 9 => internal <= din9;
                when 10 => internal <= din10;
                when 11 => internal <= din11;
                when 12 => internal <= din12;
                when 13 => internal <= din13;
                when 14 => internal <= din14;
                when 15 => internal <= din15;
                --when 16 => count :=0; --experiment
                when others => internal <= (others => 'Z'); --if anything wrong, make it HiZ
            end case;
            dout <= internal;
        end if;
    end process;
end architecture;
