----------------------------------------------------------------------------------
-- COPYRIGHT 2019 Victor Raúl Arteaga Pérez & Jesús Eduardo Méndez Rosales
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--
-- Description: Las caracteristicas de la librería son:
--					* bit de inicio
--					La librería permite hacer conversión Analógica-Digital utilizando
--                  7 canales integrados en el FPGA Artix 7. Se compone de los siguientes
--                  puertos:
--
--                    CLK            - Reloj FPGA
--                    CH0_P -> CH6_N - Canales del ADC diferenciales
--                    CANAL          - Selector de canal
--                    DATA_ADC       - Valor digital de 12 bits
--                    DATO_LISTO     - Bandera que indica fin de conversión, se pondrá a '1'
--                    BUSY           - Bandera que indica cuando el ADC está ocupado
--                    INI            - Bit que inicia la conversión cuando está en '1'
--
--          Para realizar una conversión se selecciona el canal y después se 
--          activa el bit INI por lo menos un ciclo de reloj.
 
--                     _____  _____________________________________________________ 
--          CANAL       XXX ><                  x"01"                              >||
--                     ¯¯¯¯¯  ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
--				INI	     _______/¯¯\__________________________________________________||
--          BUSY       __________/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\________||
--			DATO_LISTO    ____________________________________________________/¯¯\_____||
--
----------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LIB_ADC_AVANXE7_VIVADO_REVA is
 
port(
    CLK 	 			: in  std_logic; 							  			-- Reloj de FPGA a 100mhz.
    CH0_P,CH1_P,CH2_P,CH3_P,CH4_P,CH5_P,CH6_P : in std_logic;	-- Canales ADC
    CH0_N,CH1_N,CH2_N,CH3_N,CH4_N,CH5_N,CH6_N : in std_logic;	-- diferenciales.
    INI 				: in  std_logic; 							  			-- bit para iniciar conversión.
    CANAL	 		: in  std_logic_vector(3 downto 0);			  	-- Selector de canal (del 0 al 6).
    DATA_ADC 		: out std_logic_vector(11 downto 0); 		  	-- Dato de 12 bits digital resultante 
																					-- de la conversión.
    DATO_LISTO  	: out std_logic; 							  			-- Bandera que indica fin de conversión 
																					-- y sólo dura un ciclo de reloj.
    BUSY 	 		: out std_logic  							  			-- bit que indica que se esta realizando 
																					-- una conversión.
);

end LIB_ADC_AVANXE7_VIVADO_REVA;

architecture Behavioral of LIB_ADC_AVANXE7_VIVADO_REVA is

component xadc_wiz_0 is
   port
   (
    daddr_in        : in  STD_LOGIC_VECTOR (6 downto 0);     -- Address bus for the dynamic reconfiguration port
    den_in          : in  STD_LOGIC;                         -- Enable Signal for the dynamic reconfiguration port
    di_in           : in  STD_LOGIC_VECTOR (15 downto 0);    -- Input data bus for the dynamic reconfiguration port
    dwe_in          : in  STD_LOGIC;                         -- Write Enable for the dynamic reconfiguration port
    do_out          : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    drdy_out        : out  STD_LOGIC;                        -- Data ready signal for the dynamic reconfiguration port
    dclk_in         : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
    reset_in        : in  STD_LOGIC;                         -- Reset signal for the System Monitor control logic
    vauxp4          : in  STD_LOGIC;                         -- Auxiliary Channel 4
    vauxn4          : in  STD_LOGIC;
    vauxp5          : in  STD_LOGIC;                         -- Auxiliary Channel 5
    vauxn5          : in  STD_LOGIC;
    vauxp6          : in  STD_LOGIC;                         -- Auxiliary Channel 6
    vauxn6          : in  STD_LOGIC;
    vauxp7          : in  STD_LOGIC;                         -- Auxiliary Channel 7
    vauxn7          : in  STD_LOGIC;
    vauxp12         : in  STD_LOGIC;                         -- Auxiliary Channel 12
    vauxn12         : in  STD_LOGIC;
    vauxp14         : in  STD_LOGIC;                         -- Auxiliary Channel 14
    vauxn14         : in  STD_LOGIC;
    vauxp15         : in  STD_LOGIC;                         -- Auxiliary Channel 15
    vauxn15         : in  STD_LOGIC;
    busy_out        : out  STD_LOGIC;                        -- ADC Busy signal
    channel_out     : out  STD_LOGIC_VECTOR (4 downto 0);    -- Channel Selection Outputs
    eoc_out         : out  STD_LOGIC;                        -- End of Conversion Signal
    eos_out         : out  STD_LOGIC;                        -- End of Sequence Signal
    alarm_out       : out STD_LOGIC;                         -- OR'ed output of all the Alarms
    vp_in           : in  STD_LOGIC;                         -- Dedicated Analog Input Pair
    vn_in           : in  STD_LOGIC
);
end component xadc_wiz_0;

-- Señales para el IP XADC
signal enable          : std_logic := '0';
signal ready           : std_logic := '0';
signal last_ready      : std_logic := '0';
signal ready_pe_strobe : std_logic := '0';
signal ready_ne_strobe : std_logic := '0';
signal data            : std_logic_vector(15 downto 0);
signal buff_adc        : std_logic_vector(15 downto 0);
signal Address_in      : std_logic_vector(7 downto 0);

-- Señal para la máquina de estados
signal edo : integer range 0 to 10 := 0;

begin

U1:  xadc_wiz_0
   port MAP
   (
   daddr_in => Address_in(6 downto 0),
   den_in => enable,
   di_in => (others => '0'),
   dwe_in => '0',
   do_out => data,
   drdy_out => ready,
   dclk_in => clk,
   reset_in => '0',
   VAUXP4  => CH1_P,
   VAUXN4  => CH1_N,
   VAUXP5  => CH4_P,
   VAUXN5  => CH4_N,
   VAUXP6  => CH3_P,
   VAUXN6  => CH3_N,
   VAUXP7  => CH0_P,
   VAUXN7  => CH0_N,
   VAUXP12 => CH6_P,
   VAUXN12 => CH6_N,
   VAUXP14 => CH2_P,
   VAUXN14 => CH2_N,
   VAUXP15 => CH5_P,
   VAUXN15 => CH5_N,
   busy_out => open,
   channel_out => open,
   eoc_out => enable,
   eos_out => open,
   alarm_out => open,
   vp_in => '0',
   vn_in => '0'
);

process (clk)
begin
    if rising_edge(clk) then
        last_ready <= ready;     
    end if;
end process;

ready_pe_strobe <= '1' when (last_ready = '0' and ready = '1') else '0';
ready_ne_strobe <= '1' when (last_ready = '1' and ready = '0') else '0';

--Máquina de estados principal --
process(CLK)
begin
if rising_edge(CLK) then
	if edo = 0 then
		-- Se espera a que el usuario indique inicio de conversión
		if INI = '1' then
			edo <= 1;
		else
			edo <= 0;
		end if;
		DATO_LISTO <= '0';

	elsif edo = 1 then
		-- El IP nos indica cuándo seleccionar el canal
		if ready_ne_strobe = '1' then
			case(CANAL) is
				when x"0" => address_in <= x"17";
				when x"1" => address_in <= x"14";
				when x"2" => address_in <= x"1e";
				when x"3" => address_in <= x"16";
				when x"4" => address_in <= x"15";
				when x"5" => address_in <= x"1f";
				when x"6" => address_in <= x"1c";
				when others => address_in <= x"17";
			end case;
			edo <= 2;
		end if;

	elsif edo = 2 then
		-- Nos indica cuando se finalizó una conversión y se manda al puerto "DATA_ADC"
		if ready_pe_strobe = '1' then
			DATA_ADC <= data(15 downto 4);
			edo <= 3;
		end if;

	elsif edo = 3 then
		-- Activamos la bandera "DATO_LISTO"
		DATO_LISTO <= '1';
		edo <= 0;

	end if;
end if;
end process;

end behavioral;