----------------------------------------------------------------------------------

-- Module Name: axi_master_cntr - Behavioral
-- http://fpgasite.blogspot.com/2017/07/xilinx-axi-stream-tutorial-part-2.html

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity axi_master_cntr is

 generic(
  NUMBITSin : natural := 12; --added line 19/03/20 ADC result wide = 12 
  NUMBITSout : natural := 32; --added line 15/04/20 salida  
  -- PACKET_LEN : natural :=  8; --original
  PACKET_LEN : natural :=  16; --number of channels = 16
 -- PACKET_W   : natural :=  4);
  PACKET_W   : natural :=  4); --length of the TX counter, count 0 to 16, 4 or 5 bits????
  
  port (      
    start          : in std_logic;                             -- Starts an axi_stream transaction
	datain		   : in std_logic_vector(NUMBITSin-1 downto 0);  -- added line 19/03/20
    -- axi stream ports
    m_axis_clk    : in  std_logic;
    m_axis_tvalid : out std_logic;
    -- m_axis_tdata : out std_logic_vector(31 downto 0); --original
	m_axis_tdata : out std_logic_vector(NUMBITSout-1 downto 0);
    m_axis_tstrb : out std_logic_vector(3 downto 0);
    m_axis_tlast : out std_logic  
  );
end axi_master_cntr;

architecture rtl of axi_master_cntr is
                                                                                                                 

  -- Define the states of state machine                                             
  type    state is (IDLE, SEND_STREAM);          

  signal  sm_state : state := IDLE;                                                   

  -- AXI Stream internal signals
  signal tvalid         : std_logic := '0';
  signal tlast          : std_logic := '0';   
  -- signal data           : unsigned(31 downto 0) := (others => '0');
  signal data           : unsigned(NUMBITSout-1 downto 0) := (others => '0');
  signal packet_len_cnt : unsigned(PACKET_W-1 downto 0)  := (others => '0');
  signal datainbuffer : std_logic_vector(NUMBITSout-1 downto 0);
  signal padding : std_logic_vector(NUMBITSout - NUMBITSin - 1 downto 0) := (others => '0');

   

begin
  -- I/O Connections assignments
  
  datainbuffer <= padding & datain; --added 15/04/2020 --to adapt the incoming data width(12 bits) to the output data width (32 bits)
  
  m_axis_tstrb   <= (others => '1');     -- byte enables always high
  m_axis_tvalid  <= tvalid;
  m_axis_tlast   <= tlast;
  data(PACKET_W-1 downto 0)  <= packet_len_cnt; 
  
  -- m_axis_tdata   <= std_logic_vector(data); --original code
  
  
  
  -- Control state machine implementation                                               
  sm_pr : process(m_axis_clk)                                                                        
  begin                                                                                       
    if (rising_edge (m_axis_clk)) then                                                       
      case (sm_state) is                                                              
        when IDLE =>
          tvalid            <= '0';
          tlast             <= '0';
          m_axis_tdata <= (others => '0'); --null data
          packet_len_cnt    <= (others => '0');      
          
            -- start sending 
            if (start = '1') then
              sm_state <= SEND_STREAM;  
            end if;                                                                                                      
        when SEND_STREAM  =>   
          tvalid            <= '1'; 
          m_axis_tdata   <= datainbuffer; --adapt 19/03/20              
          packet_len_cnt    <= packet_len_cnt + 1;
          if (packet_len_cnt = PACKET_LEN-1 ) then
            tlast           <= '1';
            sm_state        <= IDLE;
          end if;                                                                                                        
        when others =>                                                                   
          sm_state <= IDLE;                                                                                                                                                       
      end case;                                                                             
    end if;                                                                                 
  end process sm_pr;                                                                                
end rtl;