--XADC Controller

entity control_XADC_3Ch is
port(
    clk 	 			: in  std_logic; 							  			-- Reloj de FPGA a 100mhz.
    CH0_P,CH1_P,CH2_P   : in std_logic;	-- Canales ADC diferenciales.
    CH0_N,CH1_N,CH2_N   : in std_logic;	
    ini 				: in  std_logic; 							  			-- bit para iniciar conversión.
    canal	 		    : in  std_logic_vector(3 downto 0);			  	-- Selector de canal (del 0 al 6).
    data_ADC 		    : out std_logic_vector(11 downto 0); 		  	-- Dato de 12 bits digital resultante de la conversión.
    dato_listo  	    : out std_logic; 							  			-- Bandera que indica fin de conversión y sólo dura un ciclo de reloj.
    busy 	 		    : out std_logic  							  			-- bit que indica que se esta realizando una conversión.);
																					-- 
    ---control para ADC
    enable          : out std_logic;                      -- den_in
    ready           : out std_logic;                      -- drdy_out
    data            : out std_logic_vector(15 downto 0);  -- do_out
    Address_in      : out std_logic_vector(7 downto 0)    -- daddr_in
    );
end control_XADC_3Ch;

architecture bhv of control_XADC_3Ch is
-- Señales para el IP XADC
signal last_ready      : std_logic := '0';
signal ready_pe_strobe : std_logic := '0';
signal ready_ne_strobe : std_logic := '0';
signal buff_adc        : std_logic_vector(15 downto 0);

-- Señal para la máquina de estados
signal edo : integer range 0 to 10 := 0;

begin
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
			case(CANAL) is                        -- hex  reg channel   xcz7z007 
				when x"0" => address_in <= x"10"; --x"10"  16  VAUX0       x
				when x"1" => address_in <= x"11"; --x"11"  17  VAUX1       x
				when x"2" => address_in <= x"12"; --x"12"  18  VAUX2
				when x"3" => address_in <= x"13"; --x"13"  19  VAUX3
				when x"4" => address_in <= x"14"; --x"14"  20  VAUX4
				when x"5" => address_in <= x"15"; --x"15"  21  VAUX5
				when x"6" => address_in <= x"16"; --x"16"  22  VAUX6
				when x"7" => address_in <= x"17"; --x"17"  23  VAUX7
				when x"8" => address_in <= x"18"; --x"18"  24  VAUX8       x
                when x"9" => address_in <= x"19"; --x"19"  25  VAUX9       x
                when x"A" => address_in <= x"1A"; --x"1A"  26  VAUX10
                when x"B" => address_in <= x"1B"; --x"1B"  27  VAUX11
				when x"C" => address_in <= x"1C"; --x"1C"  28  VAUX12
				when x"D" => address_in <= x"1D"; --x"1D"  28  VAUX13
				when x"E" => address_in <= x"1E"; --x"1E"  30  VAUX14
				when x"F" => address_in <= x"1F"; --x"1F"  31  VAUX15
				when others => address_in <= x"0";
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



end bhv;
