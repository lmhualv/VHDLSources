----------------------------------------------------------------------------------
-- Autor: Jesús Eduardo Méndez Rosales
--
---- Description: Aplicación de ejemplo para utilizar el ADC y realizar
---- 				 lectura a los 7 canales del ADC para después enviar 
--					 los datos obtenidos a una aplicación hecha en C#.
--					 El protocolo utilizado para la transmisión de datos
--					 es RS232.	 
---------------------------------------------------------------------------------
					 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity Top is
PORT(
		CLK 			: IN STD_LOGIC; -- Reloj FPGA a 100MHz
		CH0_P,CH1_P,CH2_P,CH3_P,CH4_P,CH5_P,CH6_P : IN STD_LOGIC; -- Canales del ADC
		CH0_N,CH1_N,CH2_N,CH3_N,CH4_N,CH5_N,CH6_N : IN STD_LOGIC; -- diferenciales
		RX 			: in std_logic; -- Puerto de recepción del protocolo RS232
		TX 			: out std_logic -- Puerto de transmisión del protocolo RS232
    );
end Top;

architecture Behavioral of Top is

COMPONENT LIB_ADC_AVANXE7_VIVADO_REVA is
port(
    CLK 	 			: in  std_logic; 							  			-- Reloj de FPGA a 100mhz.
    CH0_P,CH1_P,CH2_P,CH3_P,CH4_P,CH5_P,CH6_P : in std_logic;	-- Canales ADC
    CH0_N,CH1_N,CH2_N,CH3_N,CH4_N,CH5_N,CH6_N : in std_logic;	-- diferenciales.
    CANAL	 		: in  std_logic_vector(3 downto 0);			  	-- Selector de canal (del 0 al 6).
    DATA_ADC 		: out std_logic_vector(11 downto 0); 		  	-- Dato de 12 bits digital resultante 
																					-- de la conversión.
    DATO_LISTO  	: out std_logic; 							  			-- Bandera que indica fin de conversión 
																					-- y sólo dura un ciclo de reloj.
    BUSY 	 		: out std_logic;  							  		-- bit que indica que se esta realizando 
																					-- una conversión.
	 INI 				: in  std_logic 							  			-- bit para iniciar conversión.
);
end COMPONENT LIB_ADC_AVANXE7_VIVADO_REVA;


component RS232 is

generic	(	FPGA_CLK :			INTEGER := 50000000;
				BAUD_RS232 :		INTEGER := 9600		
			);
port	(	CLK : 		in std_logic ;			
			RX :			in std_logic ;			
			TX_INI :		in std_logic ;			
			TX_FIN :		out std_logic ;		
			TX :			out std_logic ;		
			RX_IN :		out std_logic ;		
			DATAIN :		in std_logic_vector(7 downto 0); 
			DOUT :		out std_logic_vector(7 downto 0)
		);
		
end component RS232; 

-- Señales para la librería LIB_ADC_AVANXE7_ISE_REVA
signal busy 		: std_logic := '0'; 
signal ini 			: std_logic := '0'; 
signal dato_listo : std_logic := '0'; 
signal canal		: std_logic_vector(3 downto 0);
signal data_adc 	: std_logic_vector(11 downto 0) := (others => '0');

-- Señales para la libreria RS232
signal tx_ini 		: std_logic := '0'; 
signal tx_fin 		: std_logic := '0';
signal rx_in 		: std_logic := '0';
signal datain 		: std_logic_vector(7 downto 0)  := (others => '0');
signal dout 		: std_logic_vector(7 downto 0)  := (others => '0');

-- Señales para la máquina de estados principal
CONSTANT FIN : integer := 9_999; 				-- Constante para generar retardo de 100us.
signal edo 	 : integer range 0 to 10 := 0; 	-- Estados para la máquina de estados.
signal conta : integer range 0 to fin  := 0; -- Contador para retardo de 100us, se utiliza ya que la aplicación de C# 
															-- no opera a la misma frecuencia que el FPGA y evita desincronización.

begin

u1_adc: LIB_ADC_AVANXE7_VIVADO_REVA
port map(
    clk,
	 ch0_p,ch1_p,ch2_p,ch3_p,ch4_p,ch5_p,ch6_p,
	 ch0_n,ch1_n,ch2_n,ch3_n,ch4_n,ch5_n,ch6_n,
    canal,
	 data_adc,
	 dato_listo,
	 busy,
	 ini
    );

u2: rs232
generic	map (	fpga_clk => 100000000,
				baud_rs232 => 9600		
			)
port map(	clk ,
			rx ,
			tx_ini,
			tx_fin,
			tx,
			rx_in, 
			datain,
			dout 
		);

-- Máquina de estados que controla la recepción y transmisión de datos, asi como controlar la libreria del ADC
process(clk)
begin
if rising_edge(clk) then
    if edo = 0 then
		  -- El byte que se recibe selecciona el canal que se quiere leer.
        if rx_in = '1' then
            if dout = x"01" then
                canal <= x"0";
					 edo <= 1;
            elsif dout = x"02" then
                canal <= x"1";
					 edo <= 1;
            elsif dout = x"03" then
                canal <= x"2";
					 edo <= 1;
            elsif dout = x"04" then
                canal <= x"3";
					 edo <= 1;
            elsif dout = x"05" then
                canal <= x"4";
					 edo <= 1;
            elsif dout = x"06" then
                canal <= x"5";
					 edo <= 1;
            elsif dout = x"07" then
                canal <= x"6";
					 edo <= 1;
             else
                edo <= 0;
             end if;
         else
            edo <= 0;
         end if; 
	 
     elsif edo = 1 then
			-- Se espera a que finalice la conversión
			if dato_listo = '1' then
				edo <= 3;
				ini <= '0';
			else
				edo <= 1;
				ini <= '1';
			end if;
	 
    elsif edo = 3 then
		  -- Se envía los primeros 4 bits más significativos
        if tx_fin = '1' then
           edo <= 4;
           tx_ini <= '0';
        else
           datain <= "0000"&data_adc(11 downto 8);
           tx_ini <= '1';
           edo <= 3;
        end if;
     
	 elsif edo = 4 then
		-- Esperamos 100us a que la aplicación de C# haya recibido el byte
		conta <= conta+1;
		if conta = fin then
			conta <= 0;
			edo <= 5;
		else 
			edo <= 4;
		end if;
	  
     elsif edo = 5 then
		-- Mandamos los 8 bits restantes
       if tx_fin = '1' then
          edo <= 0;
          tx_ini <= '0';
       else
          datain <= data_adc(7 downto 0);
          tx_ini <= '1';
          edo <= 5;
       end if; 
         
     end if;
  end if;
end process;    

end behavioral;