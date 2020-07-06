
# gpio RGB LED.

set_property  -dict {PACKAGE_PIN  R14   IOSTANDARD LVCMOS33} [get_ports led[0]]       ; ## LED_R
set_property  -dict {PACKAGE_PIN  Y16   IOSTANDARD LVCMOS33} [get_ports led[1]]       ; ## LED_G
set_property  -dict {PACKAGE_PIN  Y17   IOSTANDARD LVCMOS33} [get_ports led[2]]       ; ## LED_B