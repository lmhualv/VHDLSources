---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_arith.ALL; 
----------------------------------------------------------------------------------
entity TB_SerializerAXI is
generic(
        --from serialiazer
        numbits: integer := 12;
        numchn: integer := 16;
        --from AXI stream interface
        NUMBITSin : natural := 12; --ADC result wide = 12 
        NUMBITSout : natural := 32 --added line 15/04/20 salida AXI  
    );
end TB_SerializerAXI;
----------------------------------------------------------------------------------
architecture bhv of TB_SerializerAXI is

COMPONENT SerializerAXI is
        Port ( 
        --inputs Serializer
        clk :  in std_logic;
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
        --AXI Interface+++++++++++++++++++++++++++++
        -- axi stream ports
        m_axis_tvalid : out std_logic;
        m_axis_tdata : out std_logic_vector(NUMBITSout-1 downto 0);
        m_axis_tstrb : out std_logic_vector(3 downto 0);
        m_axis_tlast : out std_logic 
        --++++++++++++++++++++++++++++++++++++++++++++
		   );
END COMPONENT;

       signal clk :  std_logic := '0' ;
       signal din0:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din1:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din2:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din3:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din4:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din5:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din6:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din7:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din8:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din9:  std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din10: std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din11: std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din12: std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din13: std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din14: std_logic_vector(numbits-1 downto 0) := (others => '0');
       signal din15: std_logic_vector(numbits-1 downto 0) := (others => '0');
        -- axi stream ports
       signal m_axis_tvalid: std_logic :='0';
       signal m_axis_tdata : std_logic_vector(NUMBITSout-1 downto 0) := (others => '0');
       signal m_axis_tstrb : std_logic_vector(3 downto 0) := (others => '0');
       signal m_axis_tlast : std_logic := '0'; 
        --++++++++++++++++++++++++++++++++++++++++++++


    -- Definición del periodo del reloj.
    constant clk_period: time:= 10 ns;
    
begin

    UUT: COMPONENT SerializerAXI Port MAP ( 
      clk    =>  clk,  
      din0   =>  din0, 
      din1   =>  din1,
      din2   =>  din2, 
      din3   =>  din3, 
      din4   =>  din4,
      din5   =>  din5,
      din6   =>  din6,
      din7   =>  din7,
      din8   =>  din8,
      din9   =>  din9,
      din10  =>  din10,
      din11  =>  din11,
      din12  =>  din12,
      din13  =>  din13,
      din14  =>  din14,
      din15  =>  din15,
    m_axis_tvalid => m_axis_tvalid,
    m_axis_tdata  => m_axis_tdata, 
    m_axis_tstrb  => m_axis_tstrb, 
    m_axis_tlast  => m_axis_tlast 
	);     

    -- Generación del reloj.
    process
    begin
        clk <= '0';
        wait for clk_period/2; 
        clk <= '1';
        wait for clk_period/2; 
    end process;
    
    -- Estímulos
    process
    begin
        din0  <= conv_std_logic_vector(1,12);
        din1  <= conv_std_logic_vector(2,12); 
        din2  <= conv_std_logic_vector(3,12);
        din3  <= conv_std_logic_vector(4,12);
        din4  <= conv_std_logic_vector(5,12);
        din5  <= conv_std_logic_vector(6,12);
        din6  <= conv_std_logic_vector(7,12);
        din7  <= conv_std_logic_vector(8,12);
        din8  <= conv_std_logic_vector(9,12);
        din9  <= conv_std_logic_vector(10,12);
        din10 <= conv_std_logic_vector(11,12);
        din11 <= conv_std_logic_vector(12,12);
        din12 <= conv_std_logic_vector(13,12);
        din13 <= conv_std_logic_vector(14,12);
        din14 <= conv_std_logic_vector(15,12);
        din15 <= conv_std_logic_vector(16,12);        
        wait for 350 ns;
    end process;
    
end bhv;
