rm simulaTB_Serializer.vcd
ghdl -s -fsynopsys SerializerAXI.vhd 
ghdl -a -fsynopsys SerializerAXI.vhd 
ghdl -e -fsynopsys TB_SerializerAXI
ghdl -s -fsynopsys TB_SerializerAXI.vhd 
ghdl -a -fsynopsys TB_SerializerAXI.vhd 
ghdl -e -fsynopsys TB_SerializerAXI
ghdl -r -fsynopsys TB_SerializerAXI --vcd=simulaTB_Serializer.vcd
