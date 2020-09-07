# create_clock -period 5.000 -name hdmi_clk_OBUF -waveform {0.000 2.500} [get_nets hdmi_clk_OBUF]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -min  -2 [get_ports {hdmi_data[*]}]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -max  0 [get_ports {hdmi_data[*]}]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -min  -2 [get_ports hdmi_de]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -max  0 [get_ports hdmi_de]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -min  -2 [get_ports hdmi_hs]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -max  0 [get_ports hdmi_hs]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -min  -2 [get_ports hdmi_vs]
# set_output_delay -clock [get_clocks hdmi_clk_OBUF] -max  0 [get_ports hdmi_vs]

# gpio RGB LED.

set_property  -dict {PACKAGE_PIN  R14   IOSTANDARD LVCMOS33} [get_ports led[0]]         ; ## LED_R
set_property  -dict {PACKAGE_PIN  Y16   IOSTANDARD LVCMOS33} [get_ports led[1]]         ; ## LED_G
set_property  -dict {PACKAGE_PIN  Y17   IOSTANDARD LVCMOS33} [get_ports led[2]]         ; ## LED_B

# HDMI SIL9022A Interface

set_property  -dict {PACKAGE_PIN  T16   IOSTANDARD LVCMOS33} [get_ports hdmi_data[0]] 
set_property  -dict {PACKAGE_PIN  U17   IOSTANDARD LVCMOS33} [get_ports hdmi_data[1]]  
set_property  -dict {PACKAGE_PIN  V15   IOSTANDARD LVCMOS33} [get_ports hdmi_data[2]] 
set_property  -dict {PACKAGE_PIN  W15   IOSTANDARD LVCMOS33} [get_ports hdmi_data[3]] 
set_property  -dict {PACKAGE_PIN  U18   IOSTANDARD LVCMOS33} [get_ports hdmi_data[4]] 
set_property  -dict {PACKAGE_PIN  U19   IOSTANDARD LVCMOS33} [get_ports hdmi_data[5]] 
set_property  -dict {PACKAGE_PIN  N18   IOSTANDARD LVCMOS33} [get_ports hdmi_data[6]] 
set_property  -dict {PACKAGE_PIN  P19   IOSTANDARD LVCMOS33} [get_ports hdmi_data[7]] 
set_property  -dict {PACKAGE_PIN  N20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[8]] 
set_property  -dict {PACKAGE_PIN  P20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[9]] 
set_property  -dict {PACKAGE_PIN  T20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[10]] 
set_property  -dict {PACKAGE_PIN  U20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[11]]
set_property  -dict {PACKAGE_PIN  V20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[12]]
set_property  -dict {PACKAGE_PIN  W20   IOSTANDARD LVCMOS33} [get_ports hdmi_data[13]]
set_property  -dict {PACKAGE_PIN  Y18   IOSTANDARD LVCMOS33} [get_ports hdmi_data[14]]
set_property  -dict {PACKAGE_PIN  Y19   IOSTANDARD LVCMOS33} [get_ports hdmi_data[15]]

set_property  -dict {PACKAGE_PIN  V16   IOSTANDARD LVCMOS33} [get_ports hdmi_vs]
set_property  -dict {PACKAGE_PIN  W16   IOSTANDARD LVCMOS33} [get_ports hdmi_hs]
set_property  -dict {PACKAGE_PIN  R16   IOSTANDARD LVCMOS33} [get_ports hdmi_de]
set_property  -dict {PACKAGE_PIN  R17   IOSTANDARD LVCMOS33} [get_ports hdmi_clk]

set_property  -dict {PACKAGE_PIN  N15   IOSTANDARD LVCMOS33} [get_ports LCD_BL_CN]
set_property  -dict {PACKAGE_PIN  N16   IOSTANDARD LVCMOS33} [get_ports LCD_PWR_EN]

set_property  -dict {PACKAGE_PIN  P15   IOSTANDARD LVCMOS33  PULLUP true} [get_ports iic_0_sda_io]
set_property  -dict {PACKAGE_PIN  P16   IOSTANDARD LVCMOS33  PULLUP true} [get_ports iic_0_scl_io]

set_property  -dict {PACKAGE_PIN  W19   IOSTANDARD LVCMOS33} [get_ports hdmi_intn]
