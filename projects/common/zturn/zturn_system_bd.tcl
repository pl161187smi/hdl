
# create board design
# interface ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_0

create_bd_port -dir I -from 63 -to 0 gpio_i
create_bd_port -dir O -from 63 -to 0 gpio_o
create_bd_port -dir O -from 63 -to 0 gpio_t

create_bd_port -dir I hdmi_intn
create_bd_port -dir O vid_clk
create_bd_port -dir O -from 23 -to 0 vid_data
create_bd_port -dir O vid_de
create_bd_port -dir O vid_hs
create_bd_port -dir O vid_vs
# instance: sys_ps7
ad_ip_instance processing_system7 sys_ps7
source $ad_hdl_dir/projects/common/zturn/zturn_system_ps7.tcl 
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK0_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST0_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 3
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE

ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_BASEADDR {0xE000B000} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_HIGHADDR {0xE000BFFF} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} 
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_RESET_ENABLE {0} 

#ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
#ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO
#ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_PERIPHERAL_ENABLE 1
#ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_SPI1_IO EMIO
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_M_AXI_GP0 {1}
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP0 {1}

ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1
ad_ip_instance proc_sys_reset sys_mem_intercon_rstgen
ad_ip_parameter sys_mem_intercon_rstgen CONFIG.C_EXT_RST_WIDTH 1

ad_ip_instance axis_subset_converter axis_subset_converter_0
ad_ip_parameter axis_subset_converter_0 CONFIG.M_TDATA_NUM_BYTES {3}
ad_ip_parameter axis_subset_converter_0 CONFIG.M_TUSER_WIDTH {1}
ad_ip_parameter axis_subset_converter_0 CONFIG.S_TDATA_NUM_BYTES {4}
ad_ip_parameter axis_subset_converter_0 CONFIG.S_TUSER_WIDTH {1}
#ad_ip_parameter axis_subset_converter_0 CONFIG.TDATA_REMAP {tdata[15:8],tdata[23:16],tdata[31:24]}
ad_ip_parameter axis_subset_converter_0 CONFIG.TDATA_REMAP {tdata[7:0],tdata[15:8],tdata[23:16]}
#ad_ip_parameter axis_subset_converter_0 CONFIG.TKEEP_REMAP {tkeep[1:0]}
#ad_ip_parameter axis_subset_converter_0 CONFIG.TLAST_REMAP {tlast[0]}
ad_ip_parameter axis_subset_converter_0 CONFIG.TUSER_REMAP {tuser[0:0]}

ad_ip_instance v_axi4s_vid_out v_axi4s_vid_out_0
ad_ip_parameter v_axi4s_vid_out_0 CONFIG.C_ADDR_WIDTH {12}
ad_ip_parameter v_axi4s_vid_out_0 CONFIG.C_HAS_ASYNC_CLK {1}
ad_ip_parameter v_axi4s_vid_out_0 CONFIG.C_S_AXIS_VIDEO_DATA_WIDTH {8}
ad_ip_parameter v_axi4s_vid_out_0 CONFIG.C_S_AXIS_VIDEO_FORMAT {2}
ad_ip_parameter v_axi4s_vid_out_0 CONFIG.C_VTG_MASTER_SLAVE {1}

ad_ip_instance v_tc v_tc_0
ad_ip_parameter v_tc_0 CONFIG.VIDEO_MODE {Custom}
ad_ip_parameter v_tc_0 CONFIG.enable_detection {false}
ad_ip_parameter v_tc_0 CONFIG.enable_generation {true}
ad_ip_parameter v_tc_0 CONFIG.GEN_HACTIVE_SIZE {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_HFRAME_SIZE {1344}
ad_ip_parameter v_tc_0 CONFIG.GEN_HSYNC_END {1156}
ad_ip_parameter v_tc_0 CONFIG.GEN_HSYNC_START {1068}
ad_ip_parameter v_tc_0 CONFIG.GEN_VACTIVE_SIZE {600}
ad_ip_parameter v_tc_0 CONFIG.GEN_VSYNC_POLARITY {High}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VBLANK_HEND {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VBLANK_HSTART {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VFRAME_SIZE {625}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VSYNC_HEND {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VSYNC_HSTART {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VSYNC_VEND {609}
ad_ip_parameter v_tc_0 CONFIG.GEN_F0_VSYNC_VSTART {603}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VBLANK_HEND {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VBLANK_HSTART {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VFRAME_SIZE {806}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VSYNC_HEND {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VSYNC_HSTART {1024}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VSYNC_VEND {776}
ad_ip_parameter v_tc_0 CONFIG.GEN_F1_VSYNC_VSTART {770}


ad_ip_instance axi_vdma axi_vdma_0
ad_ip_parameter axi_vdma_0 CONFIG.c_include_mm2s_dre {0}
ad_ip_parameter axi_vdma_0 CONFIG.c_include_s2mm {0}
ad_ip_parameter axi_vdma_0 CONFIG.c_include_s2mm_dre {0}
ad_ip_parameter axi_vdma_0 CONFIG.c_m_axi_mm2s_data_width {64}
ad_ip_parameter axi_vdma_0 CONFIG.c_m_axis_mm2s_tdata_width {32}
ad_ip_parameter axi_vdma_0 CONFIG.c_mm2s_genlock_mode {0}
ad_ip_parameter axi_vdma_0 CONFIG.c_mm2s_linebuffer_depth {4096}
ad_ip_parameter axi_vdma_0 CONFIG.c_mm2s_max_burst_length {16} 
ad_ip_parameter axi_vdma_0 CONFIG.c_num_fstores {1}
ad_ip_parameter axi_vdma_0 CONFIG.c_s2mm_genlock_mode {0}

ad_ip_instance axi_interconnect axi_mem_intercon 
ad_ip_parameter axi_mem_intercon CONFIG.M00_HAS_DATA_FIFO {2}
ad_ip_parameter axi_mem_intercon CONFIG.M00_HAS_REGSLICE {4}
ad_ip_parameter axi_mem_intercon CONFIG.NUM_MI {1}
ad_ip_parameter axi_mem_intercon CONFIG.NUM_SI {1}
ad_ip_parameter axi_mem_intercon CONFIG.S00_HAS_DATA_FIFO {2}
ad_ip_parameter axi_mem_intercon CONFIG.S00_HAS_REGSLICE {4}
ad_ip_parameter axi_mem_intercon CONFIG.S01_HAS_DATA_FIFO {2}
ad_ip_parameter axi_mem_intercon CONFIG.S01_HAS_REGSLICE {4}
ad_ip_parameter axi_mem_intercon CONFIG.STRATEGY {0}
ad_ip_parameter axi_mem_intercon CONFIG.SYNCHRONIZATION_STAGES {2}

ad_ip_instance clk_wiz clk_wiz_0
ad_ip_parameter clk_wiz_0 CONFIG.CLKOUT1_JITTER {266.070}
ad_ip_parameter clk_wiz_0 CONFIG.CLKOUT1_PHASE_ERROR {298.923}
ad_ip_parameter clk_wiz_0 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.25}
ad_ip_parameter clk_wiz_0 CONFIG.MMCM_CLKFBOUT_MULT_F {50.250}
ad_ip_parameter clk_wiz_0 CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000}
ad_ip_parameter clk_wiz_0 CONFIG.MMCM_DIVCLK_DIVIDE {5}
ad_ip_parameter clk_wiz_0 CONFIG.USE_LOCKED {false}
ad_ip_parameter clk_wiz_0 CONFIG.USE_RESET {false}

ad_ip_instance xlconstant xlconstant_1

ad_ip_instance util_vector_logic util_vector_logic_0
ad_ip_parameter util_vector_logic_0 CONFIG.C_OPERATION {not}
ad_ip_parameter util_vector_logic_0 CONFIG.C_SIZE {1}
ad_ip_parameter util_vector_logic_0 CONFIG.LOGO_FILE {data/sym_notgate.png}

ad_cpu_interconnect 0x43000000 axi_vdma_0
ad_cpu_interconnect 0x43C00000 v_tc_0

ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N

ad_connect  sys_mem_intercon_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N
ad_connect  sys_mem_intercon_rstgen/slowest_sync_clk sys_ps7/FCLK_CLK1
ad_connect  sys_mem_intercon_rstgen/interconnect_aresetn axi_mem_intercon/ARESETN
ad_connect  sys_mem_intercon_rstgen/peripheral_aresetn axi_mem_intercon/M00_ARESETN
ad_connect  sys_mem_intercon_rstgen/peripheral_aresetn axi_mem_intercon/S00_ARESETN

ad_connect  sys_ps7/S_AXI_HP0_ACLK sys_ps7/FCLK_CLK1
#ad_connect  sys_ps7/M_AXI_GP0_ACLK sys_ps7/FCLK_CLK0
# ad_connect  sys_dma_reset sys_dma_rstgen/peripheral_reset
# ad_connect  sys_dma_resetn sys_dma_rstgen/peripheral_aresetn
# ad_connect  sys_dma_clk sys_dma_rstgen/slowest_sync_clk
# ad_connect  sys_dma_rstgen/ext_reset_in sys_ps7/FCLK_RESET1_N

ad_connect axi_mem_intercon/ACLK sys_ps7/FCLK_CLK1
ad_connect axi_mem_intercon/S00_ACLK sys_ps7/FCLK_CLK1
ad_connect axi_mem_intercon/M00_ACLK sys_ps7/FCLK_CLK1
ad_connect axi_mem_intercon/M00_AXI sys_ps7/S_AXI_HP0

#ad_connect axi_vdma_0/s_axi_lite_aclk sys_ps7/FCLK_CLK0
ad_connect axi_vdma_0/m_axi_mm2s_aclk sys_ps7/FCLK_CLK1
ad_connect axi_vdma_0/m_axis_mm2s_aclk sys_ps7/FCLK_CLK1
#ad_connect axi_vdma_0/axi_resetn sys_rstgen/peripheral_aresetn
ad_connect axi_vdma_0/M_AXI_MM2S axi_mem_intercon/S00_AXI

ad_connect clk_wiz_0/clk_in1 sys_ps7/FCLK_CLK0

ad_connect v_tc_0/clk clk_wiz_0/clk_out1

ad_connect v_tc_0/vtiming_out v_axi4s_vid_out_0/vtiming_in
ad_connect v_tc_0/gen_clken v_axi4s_vid_out_0/vtg_ce

ad_connect v_axi4s_vid_out_0/aclk sys_ps7/FCLK_CLK1
ad_connect v_axi4s_vid_out_0/vid_io_out_clk clk_wiz_0/clk_out1
ad_connect v_axi4s_vid_out_0/vid_data vid_data
ad_connect v_axi4s_vid_out_0/vid_active_video vid_de
ad_connect v_axi4s_vid_out_0/vid_hsync vid_hs
ad_connect v_axi4s_vid_out_0/vid_vsync vid_vs

ad_connect axis_subset_converter_0/aclk sys_ps7/FCLK_CLK1
ad_connect axis_subset_converter_0/S_AXIS axi_vdma_0/M_AXIS_MM2S
ad_connect axis_subset_converter_0/M_AXIS v_axi4s_vid_out_0/video_in
ad_connect axis_subset_converter_0/aresetn xlconstant_1/dout

ad_connect hdmi_intn util_vector_logic_0/Op1
ad_connect vid_clk clk_wiz_0/clk_out1

# Create address segments
create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces axi_vdma_0/Data_MM2S] [get_bd_addr_segs sys_ps7/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
#create_bd_addr_seg -range 0x00010000 -offset 0x43000000 [get_bd_addr_spaces sys_ps7/Data] [get_bd_addr_segs axi_vdma_0/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  

# generic system clocks pointers

set sys_cpu_clk           [get_bd_nets sys_cpu_clk]
# set sys_dma_clk           [get_bd_nets sys_dma_clk]
set sys_iodelay_clk       [get_bd_nets sys_dma_clk]

set sys_cpu_reset         [get_bd_nets sys_cpu_reset]
set sys_cpu_resetn        [get_bd_nets sys_cpu_resetn]
# set sys_dma_reset         [get_bd_nets sys_dma_reset]
# set sys_dma_resetn        [get_bd_nets sys_dma_resetn]
# set sys_iodelay_reset     [get_bd_nets sys_dma_reset]
# set sys_iodelay_resetn    [get_bd_nets sys_dma_resetn]

# interface connections

ad_connect  ddr           sys_ps7/DDR
ad_connect  gpio_i        sys_ps7/GPIO_I
ad_connect  gpio_o        sys_ps7/GPIO_O
ad_connect  gpio_t        sys_ps7/GPIO_T
ad_connect  fixed_io      sys_ps7/FIXED_IO
ad_connect  IIC_0         sys_ps7/IIC_0

#     .IIC_0_scl_i(iic_0_scl_i),
#     .IIC_0_scl_o(iic_0_scl_o),
#     .IIC_0_scl_t(iic_0_scl_t),
#     .IIC_0_sda_i(iic_0_sda_i),
#     .IIC_0_sda_o(iic_0_sda_o),
#     .IIC_0_sda_t(iic_0_sda_t));

# ad_connect IIC_0_scl_i 

# spi connections

# ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
# ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
# ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
# ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
# ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
# ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
# ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
# ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
# ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I

# ad_connect  spi1_csn_2_o sys_ps7/SPI1_SS2_O
# ad_connect  spi1_csn_1_o sys_ps7/SPI1_SS1_O
# ad_connect  spi1_csn_0_o sys_ps7/SPI1_SS_O
# ad_connect  spi1_csn_i sys_ps7/SPI1_SS_I
# ad_connect  spi1_clk_i sys_ps7/SPI1_SCLK_I
# ad_connect  spi1_clk_o sys_ps7/SPI1_SCLK_O
# ad_connect  spi1_sdo_i sys_ps7/SPI1_MOSI_I
# ad_connect  spi1_sdo_o sys_ps7/SPI1_MOSI_O
# ad_connect  spi1_sdi_i sys_ps7/SPI1_MISO_I

# system id

# ad_ip_instance axi_sysid axi_sysid_0
# ad_ip_instance sysid_rom rom_sys_0

# ad_connect  axi_sysid_0/rom_addr        rom_sys_0/rom_addr
# ad_connect  axi_sysid_0/sys_rom_data    rom_sys_0/rom_data
# ad_connect  sys_cpu_clk                 rom_sys_0/clk

# interrupts

ad_connect  sys_concat_intc/dout  sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15  GND
ad_connect  sys_concat_intc/In14  GND
ad_connect  sys_concat_intc/In13  GND
ad_connect  sys_concat_intc/In12  GND
ad_connect  sys_concat_intc/In11  GND
ad_connect  sys_concat_intc/In10  GND
ad_connect  sys_concat_intc/In9   GND
ad_connect  sys_concat_intc/In8   GND
ad_connect  sys_concat_intc/In7   GND
ad_connect  sys_concat_intc/In6   GND
ad_connect  sys_concat_intc/In5   GND
ad_connect  sys_concat_intc/In4   GND
ad_connect  sys_concat_intc/In3   GND
ad_connect  sys_concat_intc/In2   v_tc_0/irq
ad_connect  sys_concat_intc/In1   axi_vdma_0/mm2s_introut
ad_connect  sys_concat_intc/In0   util_vector_logic_0/Res

# interconnects and address mapping

# ad_cpu_interconnect 0x45000000 axi_sysid_0

# ad_mem_hp0_interconnect $sys_cpu_clk sys_ps7/S_AXI_HP1

