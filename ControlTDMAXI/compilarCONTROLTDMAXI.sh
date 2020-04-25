ghdl -s -fsynopsys control_TDMA_AXI.vhd 
ghdl -a -fsynopsys control_TDMA_AXI.vhd 
ghdl -e -fsynopsys control_TDMA_AXI
ghdl -s -fsynopsys TB_control_TDMA_AXI.vhd 
ghdl -a -fsynopsys TB_control_TDMA_AXI.vhd 
ghdl -e -fsynopsys TB_control_TDMA_AXI 
ghdl -r -fsynopsys TB_control_TDMA_AXI --vcd=simula_controlTDMAXI.vcd
