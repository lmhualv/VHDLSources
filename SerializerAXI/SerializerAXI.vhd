--serializer 
--this serializer have an Master AXI Stream interface
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity SerializerAXI is
    generic(
        --from serialiazer
        numbits    : integer := 12;
        numchn     : integer := 16;
        --from AXI stream interface
        NUMBITSin  : natural := 12; --ADC result wide = 12 
        NUMBITSout : natural := 32; --added line 15/04/20 salida AXI 
        numintime  : natural := 12  --to configure the integration time
);
    port(
        --Serializer---------------
        --inputs
        clk :   in std_logic;
        din0:   in std_logic_vector(numbits-1 downto 0);
        din1:   in std_logic_vector(numbits-1 downto 0);
        din2:   in std_logic_vector(numbits-1 downto 0);
        din3:   in std_logic_vector(numbits-1 downto 0);
        din4:   in std_logic_vector(numbits-1 downto 0);
        din5:   in std_logic_vector(numbits-1 downto 0);
        din6:   in std_logic_vector(numbits-1 downto 0);
        din7:   in std_logic_vector(numbits-1 downto 0);
        din8:   in std_logic_vector(numbits-1 downto 0);
        din9:   in std_logic_vector(numbits-1 downto 0);
        din10:  in std_logic_vector(numbits-1 downto 0);
        din11:  in std_logic_vector(numbits-1 downto 0);
        din12:  in std_logic_vector(numbits-1 downto 0);
        din13:  in std_logic_vector(numbits-1 downto 0);
        din14:  in std_logic_vector(numbits-1 downto 0);
        din15:  in std_logic_vector(numbits-1 downto 0);
        intime: in std_logic_vector(numintime-1 downto 0); --to modify the integration time
        ----------------------------------------------
        --AXI Interface+++++++++++++++++++++++++++++
        -- axi stream ports
        m_axis_tvalid : out std_logic;
        m_axis_tdata : out std_logic_vector(NUMBITSout-1 downto 0);
        m_axis_tstrb : out std_logic_vector(3 downto 0);
        m_axis_tlast : out std_logic 
        --++++++++++++++++++++++++++++++++++++++++++++
        );
end SerializerAXI;

architecture bhv of SerializerAXI is
  --Serializer signals
  signal internal: std_logic_vector(numbits-1 downto 0);
  -- AXI Stream internal signals
  signal tvalid         : std_logic := '0';
  signal tlast          : std_logic := '0';   
  signal padding        : std_logic_vector(NUMBITSout - NUMBITSin - 1 downto 0) := (others => '0');

  
  
  begin 
  --connections of AXI Interface
  m_axis_tstrb   <= (others => '1');     -- byte enables always high
  m_axis_tvalid  <= tvalid;
  m_axis_tlast   <= tlast;
  
  --Serializer arch-----------------------------------
    process(clk)
        variable count: integer range 0 to numchn+1; --+1 for test
        variable intime_val : integer range 0 to 2**numintime+1 := 0; --for the integration time control
        variable conitime   : integer range 0 to 2**numintime+1 := 0;
    
    begin
    intime_val := to_integer(unsigned(intime));
        if (clk'event and clk='1') then
            count := count + 1; --increment the counters
            conitime := conitime + 1; 
            tvalid <= '1';
            tlast  <= '0';
            -------------------------counter of AXI Signals
            if (conitime = intime_val) then --former 15
                tlast <= '1';
                
            end if;
            if (conitime = intime_val+1) then --former 16
                tvalid <= '0';
                conitime := 0;
                count := 17; --let's see
            end if;
            -------------------count of serializer
            if count = 17 then
               count := count - 1;
            end if;
            if count = 16 then
               count := 0;
            end if;
            
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
                --experiment sending null data at the end
                when others => internal <= (others => '0'); --if anything wrong, make it HiZ
            end case;
            m_axis_tdata <= padding & internal;
        end if;
    end process;
     
     
end bhv;
