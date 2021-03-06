##-------------------------XDC MAESTRO AVANXE7------------------------------------

## A�ade este archivo a tu proyecto para obtener f�cil acceso a los nombres de los puertos de
## la tarjeta Avanxe7. Descomenta los puertos que vayas a utilizar.
## 
## IMPORTANTE:
## Ten cuidado con la prioridad de los bits, recuerda que el bit con el n�mero m�s grande es el MSB
## y el bit 0 es el LSB.
## Tambi�n recuerda que los nombres de los puertos declarados en la entidad de tu proyecto deben 
## coincidir con los nombres del XDC INCLUYENDO MAY�SCULAS Y MIN�SCULAS.
## Para seleccionar un pin deber�s descomentar el IOSTANDAR como el PACKAGE_PIN

##-- Reloj (CLK) ---
set_property IOSTANDARD LVCMOS33 [get_ports {CLK}]
set_property PACKAGE_PIN P15 [get_ports {CLK}]

##-- LEDs --
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[7]}]
#set_property PACKAGE_PIN V17 [get_ports {LEDS[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[6]}]
#set_property PACKAGE_PIN U16 [get_ports {LEDS[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[5]}]
#set_property PACKAGE_PIN T15 [get_ports {LEDS[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[4]}]
#set_property PACKAGE_PIN T16 [get_ports {LEDS[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]
#set_property PACKAGE_PIN M18 [get_ports {LEDS[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]
#set_property PACKAGE_PIN M17 [get_ports {LEDS[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]
#set_property PACKAGE_PIN L18 [get_ports {LEDS[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]
#set_property PACKAGE_PIN L14 [get_ports {LEDS[0]}]


##-- Switches --
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[7]}]
#set_property PACKAGE_PIN R15 [get_ports {SW[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[6]}]
#set_property PACKAGE_PIN R16 [get_ports {SW[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[5]}]
#set_property PACKAGE_PIN P14 [get_ports {SW[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[4]}]
#set_property PACKAGE_PIN N16 [get_ports {SW[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[3]}]
#set_property PACKAGE_PIN N15 [get_ports {SW[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[2]}]
#set_property PACKAGE_PIN M16 [get_ports {SW[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]
#set_property PACKAGE_PIN N14 [get_ports {SW[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]
#set_property PACKAGE_PIN M14 [get_ports {SW[0]}]


##-- Flash --
#set_property IOSTANDARD LVCMOS33 [get_ports {CS}]
#set_property PACKAGE_PIN L13 [get_ports {CS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SO}]
#set_property PACKAGE_PIN K18 [get_ports {SO}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SI}]
#set_property PACKAGE_PIN K17 [get_ports {SI}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SCLK}]
#set_property PACKAGE_PIN E9  [get_ports {SCLK}]


##-- FTDI (USB - RS232) --
set_property IOSTANDARD LVCMOS33 [get_ports {TX}]
set_property PACKAGE_PIN V12 [get_ports {TX}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX}]
set_property PACKAGE_PIN U13 [get_ports {RX}]
#set_property IOSTANDARD LVCMOS33 [get_ports {RTS}]
#set_property PACKAGE_PIN U12 [get_ports {RTS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CTS}]
#set_property PACKAGE_PIN V11 [get_ports {CTS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {DTR}]
#set_property PACKAGE_PIN T11 [get_ports {DTR}]


##-- DAC --
#set_property IOSTANDARD LVCMOS33 [get_ports {SDI}]
#set_property PACKAGE_PIN B8 [get_ports {SDI}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SCK}]
#set_property PACKAGE_PIN A8 [get_ports {SCK}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CS}]
#set_property PACKAGE_PIN B9 [get_ports {CS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LDAC}]
#set_property PACKAGE_PIN A9 [get_ports {LDAC}]


##-- HDMI --
#set_property IOSTANDARD LVCMOS33 [get_ports {CLK_N}]
#set_property PACKAGE_PIN V14 [get_ports {CLK_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CLK_P}]
#set_property PACKAGE_PIN U14 [get_ports {CLK_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D0_N}]
#set_property PACKAGE_PIN V16 [get_ports {D0_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D0_P}]
#set_property PACKAGE_PIN V15 [get_ports {D0_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D1_N}]
#set_property PACKAGE_PIN U18 [get_ports {D1_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D1_P}]
#set_property PACKAGE_PIN U17 [get_ports {D1_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D2_N}]
#set_property PACKAGE_PIN T18 [get_ports {D2_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {D2_P}]
#set_property PACKAGE_PIN R18 [get_ports {D2_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SCL}]
#set_property PACKAGE_PIN R17 [get_ports {SCL}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SDA}]
#set_property PACKAGE_PIN P18 [get_ports {SDA}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CEC}]
#set_property PACKAGE_PIN P17 [get_ports {CEC}]
#set_property IOSTANDARD LVCMOS33 [get_ports {HPD}]
#set_property PACKAGE_PIN N17 [get_ports {HPD}]


##-- DD3 --
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[0]}]
#set_property PACKAGE_PIN D15 [get_ports {ddr3_dq[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[1]}]
#set_property PACKAGE_PIN E15 [get_ports {ddr3_dq[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[2]}]
#set_property PACKAGE_PIN A16 [get_ports {ddr3_dq[2]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[3]}]
#set_property PACKAGE_PIN B18 [get_ports {ddr3_dq[3]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[4]}]
#set_property PACKAGE_PIN A15 [get_ports {ddr3_dq[4]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[5]}]
#set_property PACKAGE_PIN E16 [get_ports {ddr3_dq[5]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[6]}]
#set_property PACKAGE_PIN C15 [get_ports {ddr3_dq[6]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[7]}]
#set_property PACKAGE_PIN A18 [get_ports {ddr3_dq[7]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[8]}]
#set_property PACKAGE_PIN D13 [get_ports {ddr3_dq[8]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[9]}]
#set_property PACKAGE_PIN B13 [get_ports {ddr3_dq[9]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[10]}]
#set_property PACKAGE_PIN F13 [get_ports {ddr3_dq[10]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[11]}]
#set_property PACKAGE_PIN D12 [get_ports {ddr3_dq[11]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[12]}]
#set_property PACKAGE_PIN B14 [get_ports {ddr3_dq[12]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[13]}]
#set_property PACKAGE_PIN B11 [get_ports {ddr3_dq[13]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[14]}]
#set_property PACKAGE_PIN D14 [get_ports {ddr3_dq[14]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[15]}]
#set_property PACKAGE_PIN A11 [get_ports {ddr3_dq[15]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[0]}]
#set_property PACKAGE_PIN G16 [get_ports {ddr3_addr[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[1]}]
#set_property PACKAGE_PIN K15 [get_ports {ddr3_addr[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[2]}]
#set_property PACKAGE_PIN C16 [get_ports {ddr3_addr[2]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[3]}]
#set_property PACKAGE_PIN D18 [get_ports {ddr3_addr[3]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[4]}]
#set_property PACKAGE_PIN J18 [get_ports {ddr3_addr[4]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[5]}]
#set_property PACKAGE_PIN F16 [get_ports {ddr3_addr[5]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[6]}]
#set_property PACKAGE_PIN J15 [get_ports {ddr3_addr[6]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[7]}]
#set_property PACKAGE_PIN E17 [get_ports {ddr3_addr[7]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[8]}]
#set_property PACKAGE_PIN J14 [get_ports {ddr3_addr[8]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[9]}]
#set_property PACKAGE_PIN C17 [get_ports {ddr3_addr[9]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[10]}]
#set_property PACKAGE_PIN H14 [get_ports {ddr3_addr[10]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[11]}]
#set_property PACKAGE_PIN J13 [get_ports {ddr3_addr[11]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[12]}]
#set_property PACKAGE_PIN H17 [get_ports {ddr3_addr[12]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[13]}]
#set_property PACKAGE_PIN D17 [get_ports {ddr3_addr[13]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[0]}]
#set_property PACKAGE_PIN H16 [get_ports {ddr3_ba[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[1]}]
#set_property PACKAGE_PIN K13 [get_ports {ddr3_ba[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[2]}]
#set_property PACKAGE_PIN F15 [get_ports {ddr3_ba[2]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_cs_n[0]}]
#set_property PACKAGE_PIN K16 [get_ports {ddr3_cs_n[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_we_n}]
#set_property PACKAGE_PIN H15 [get_ports {ddr3_we_n}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_cas_n}]
#set_property PACKAGE_PIN E18 [get_ports {ddr3_cas_n}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ras_n}]
#set_property PACKAGE_PIN G17 [get_ports {ddr3_ras_n}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_p[0]}]
#set_property PACKAGE_PIN G18 [get_ports {ddr3_ck_p[0]}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_n[0]}]
#set_property PACKAGE_PIN F18 [get_ports {ddr3_ck_n[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[0]}]
#set_property PACKAGE_PIN J17 [get_ports {ddr3_cke[0]}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[0]}]
#set_property PACKAGE_PIN A13 [get_ports {ddr3_dqs_p[0]}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[0]}]
#set_property PACKAGE_PIN A14 [get_ports {ddr3_dqs_n[0]}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[1]}]
#set_property PACKAGE_PIN C12 [get_ports {ddr3_dqs_p[1]}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[1]}]
#set_property PACKAGE_PIN B12 [get_ports {ddr3_dqs_n[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[0]}]
#set_property PACKAGE_PIN B17 [get_ports {ddr3_dm[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[1]}]
#set_property PACKAGE_PIN C14 [get_ports {ddr3_dm[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[0]}]
#set_property PACKAGE_PIN G14 [get_ports {ddr3_odt[0]}]
#set_property IOSTANDARD LVCMOS15 [get_ports {ddr3_reset_n}]
#set_property PACKAGE_PIN G13 [get_ports {ddr3_reset_n}]


##-- Micro SD --
#set_property IOSTANDARD LVCMOS33 [get_ports {CMD}]
#set_property PACKAGE_PIN E7 [get_ports {CMD}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CLK}]
#set_property PACKAGE_PIN D5 [get_ports {CLK}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SD0}]
#set_property PACKAGE_PIN D4 [get_ports {SD0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SD1}]
#set_property PACKAGE_PIN D3 [get_ports {SD1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SD2}]
#set_property PACKAGE_PIN D8 [get_ports {SD2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SD3}]
#set_property PACKAGE_PIN C7 [get_ports {SD3}]
#set_property IOSTANDARD LVCMOS33 [get_ports {DETECT}]
#set_property PACKAGE_PIN E3 [get_ports {DETECT}]

##-- ESP32 --
#set_property IOSTANDARD LVCMOS33 [get_ports {RX0}]
#set_property PACKAGE_PIN M6  [get_ports {RX0}] #PROGRAMACI�N ESP32
#set_property IOSTANDARD LVCMOS33 [get_ports {TX0}]
#set_property PACKAGE_PIN R8  [get_ports {TX0}] #PROGRAMACI�N ESP32
#set_property IOSTANDARD LVCMOS33 [get_ports {EN}]
#set_property PACKAGE_PIN T9  [get_ports {EN}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO0}]
#set_property PACKAGE_PIN T13 [get_ports {IO0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO5}]
#set_property PACKAGE_PIN R12 [get_ports {IO5}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO6}]
#set_property PACKAGE_PIN M4  [get_ports {IO6}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO7}]
#set_property PACKAGE_PIN V10 [get_ports {IO7}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO8}]
#set_property PACKAGE_PIN T10 [get_ports {IO8}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO9}]
#set_property PACKAGE_PIN U8  [get_ports {IO9}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO10}]
#set_property PACKAGE_PIN N6  [get_ports {IO10}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO11}]
#set_property PACKAGE_PIN P4  [get_ports {IO11}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO16}]
#set_property PACKAGE_PIN T14 [get_ports {IO16}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO17}]
#set_property PACKAGE_PIN R13 [get_ports {IO17}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO18}]
#set_property PACKAGE_PIN M13 [get_ports {IO18}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO19}]
#set_property PACKAGE_PIN R11 [get_ports {IO19}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO21}]
#set_property PACKAGE_PIN R10 [get_ports {IO21}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO22}]
#set_property PACKAGE_PIN T8  [get_ports {IO22}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO23}]
#set_property PACKAGE_PIN R6  [get_ports {IO23}]

##-- Puertos de expansi�n para Protoboard (P4) --
#set_property IOSTANDARD LVCMOS33 [get_ports {IO17_N}]
#set_property PACKAGE_PIN V1 [get_ports {IO17_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO17_P}]
#set_property PACKAGE_PIN U1 [get_ports {IO17_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO18_N}]
#set_property PACKAGE_PIN T1 [get_ports {IO18_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO18_P}]
#set_property PACKAGE_PIN R1 [get_ports {IO18_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO19_N}]
#set_property PACKAGE_PIN R2 [get_ports {IO19_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO19_P}]
#set_property PACKAGE_PIN P2 [get_ports {IO19_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO20_N}]
#set_property PACKAGE_PIN N1 [get_ports {IO20_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO20_P}]
#set_property PACKAGE_PIN N2 [get_ports {IO20_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO21_N}]
#set_property PACKAGE_PIN T3 [get_ports {IO21_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO21_P}]
#set_property PACKAGE_PIN R3 [get_ports {IO21_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO22_N}]
#set_property PACKAGE_PIN M2 [get_ports {IO22_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO22_P}]
#set_property PACKAGE_PIN M3 [get_ports {IO22_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO23_N}]
#set_property PACKAGE_PIN L3 [get_ports {IO23_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO23_P}]
#set_property PACKAGE_PIN K3 [get_ports {IO23_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO24_N}]
#set_property PACKAGE_PIN J2 [get_ports {IO24_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO24_P}]
#set_property PACKAGE_PIN J3 [get_ports {IO24_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO25}]
#set_property PACKAGE_PIN F4 [get_ports {IO25}]



##-- Puertos de expansi�n con pines hembra (P3) --
#set_property IOSTANDARD LVCMOS33 [get_ports {IO0_P}]
#set_property PACKAGE_PIN U9 [get_ports {IO0_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO0_N}]
#set_property PACKAGE_PIN V9 [get_ports {IO0_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO1_P}]
#set_property PACKAGE_PIN V7 [get_ports {IO1_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO1_N}]
#set_property PACKAGE_PIN V6 [get_ports {IO1_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO2_P}]
#set_property PACKAGE_PIN V5 [get_ports {IO2_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO2_N}]
#set_property PACKAGE_PIN V4 [get_ports {IO2_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO3_P}]
#set_property PACKAGE_PIN U2 [get_ports {IO3_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO3_N}]
#set_property PACKAGE_PIN V2 [get_ports {IO3_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO4_P}]
#set_property PACKAGE_PIN R7 [get_ports {IO4_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO4_N}]
#set_property PACKAGE_PIN T6 [get_ports {IO4_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO5_P}]
#set_property PACKAGE_PIN U7 [get_ports {IO5_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO5_N}]
#set_property PACKAGE_PIN U6 [get_ports {IO5_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO6_P}]
#set_property PACKAGE_PIN T5 [get_ports {IO6_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO6_N}]
#set_property PACKAGE_PIN T4 [get_ports {IO6_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO7_P}]
#set_property PACKAGE_PIN U4 [get_ports {IO7_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO7_N}]
#set_property PACKAGE_PIN U3 [get_ports {IO7_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO8_P}]
#set_property PACKAGE_PIN L1 [get_ports {IO8_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO8_N}]
#set_property PACKAGE_PIN M1 [get_ports {IO8_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO9_P}]
#set_property PACKAGE_PIN K2 [get_ports {IO9_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO9_N}]
#set_property PACKAGE_PIN K1 [get_ports {IO9_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO10_P}]
#set_property PACKAGE_PIN N5 [get_ports {IO10_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO10_N}]
#set_property PACKAGE_PIN P5 [get_ports {IO10_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO11_P}]
#set_property PACKAGE_PIN H1 [get_ports {IO11_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO11_N}]
#set_property PACKAGE_PIN G1 [get_ports {IO11_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO12_P}]
#set_property PACKAGE_PIN F1 [get_ports {IO12_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO12_N}]
#set_property PACKAGE_PIN E1 [get_ports {IO12_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO13_P}]
#set_property PACKAGE_PIN E2 [get_ports {IO13_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO13_N}]
#set_property PACKAGE_PIN D2 [get_ports {IO13_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO14_P}]
#set_property PACKAGE_PIN H2 [get_ports {IO14_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO14_N}]
#set_property PACKAGE_PIN G2 [get_ports {IO14_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO15_P}]
#set_property PACKAGE_PIN G4 [get_ports {IO15_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO15_N}]
#set_property PACKAGE_PIN G3 [get_ports {IO15_N}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO16_P}]
#set_property PACKAGE_PIN C2 [get_ports {IO16_P}]
#set_property IOSTANDARD LVCMOS33 [get_ports {IO16_N}]
#set_property PACKAGE_PIN C1 [get_ports {IO16_N}]


##-- Puertos Anal�gicos --
set_property IOSTANDARD LVCMOS33 [get_ports {CH0_P}]
set_property PACKAGE_PIN B1 [get_ports {CH0_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH0_N}]
set_property PACKAGE_PIN A1 [get_ports {CH0_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH1_P}]
set_property PACKAGE_PIN C6 [get_ports {CH1_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH1_N}]
set_property PACKAGE_PIN C5 [get_ports {CH1_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH2_P}]
set_property PACKAGE_PIN A4 [get_ports {CH2_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH2_N}]
set_property PACKAGE_PIN A3 [get_ports {CH2_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH3_P}]
set_property PACKAGE_PIN C4 [get_ports {CH3_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH3_N}]
set_property PACKAGE_PIN B4 [get_ports {CH3_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH4_P}]
set_property PACKAGE_PIN A6 [get_ports {CH4_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH4_N}]
set_property PACKAGE_PIN A5 [get_ports {CH4_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH5_P}]
set_property PACKAGE_PIN B3 [get_ports {CH5_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH5_N}]
set_property PACKAGE_PIN B2 [get_ports {CH5_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH6_P}]
set_property PACKAGE_PIN B7 [get_ports {CH6_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {CH6_N}]
set_property PACKAGE_PIN B6 [get_ports {CH6_N}]