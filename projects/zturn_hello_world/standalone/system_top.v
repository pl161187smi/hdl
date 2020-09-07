`timescale 1ns/100ps

module system_top (

  inout   [14:0]  ddr_addr,
  inout   [ 2:0]  ddr_ba,
  inout           ddr_cas_n,
  inout           ddr_ck_n,
  inout           ddr_ck_p,
  inout           ddr_cke,
  inout           ddr_cs_n,
  inout   [ 3:0]  ddr_dm,
  inout   [31:0]  ddr_dq,
  inout   [ 3:0]  ddr_dqs_n,
  inout   [ 3:0]  ddr_dqs_p,
  inout           ddr_odt,
  inout           ddr_ras_n,
  inout           ddr_reset_n,
  inout           ddr_we_n,

  inout           fixed_io_ddr_vrn,
  inout           fixed_io_ddr_vrp,
  inout   [2:0]   fixed_io_mio,
  inout           fixed_io_ps_clk,
  inout           fixed_io_ps_porb,
  inout           fixed_io_ps_srstb,

  inout wire      iic_0_scl_io,
  inout wire      iic_0_sda_io,

  output wire            hdmi_clk,
  output wire    [15:0]  hdmi_data,
  output wire            hdmi_de,
  output wire            hdmi_hs,
  output wire            hdmi_vs,
  input  wire    [0:0]   hdmi_intn,

  output  [2:0]   led);

  // internal signals

  wire    [2:0]  gpio_i;
  wire    [2:0]  gpio_o;
  wire    [2:0]  gpio_t;

  wire            vid_clk;
  wire    [23:0]  vid_data;
  wire            vid_de;
  wire            vid_hs;
  wire            vid_vs;

  //wire iic_0_scl_i;
  //wire iic_0_scl_io;
  // wire iic_0_scl_o;
  // wire iic_0_scl_t;
  // wire iic_0_sda_i;
  //wire iic_0_sda_io;
  // wire iic_0_sda_o;
  // wire iic_0_sda_t;

  // instantiations

  ad_iobuf #(
    .DATA_WIDTH(3)
  ) i_iobuf_leds (
    .dio_t(gpio_t[2:0]),
    .dio_i(gpio_o[2:0]),
    .dio_o(gpio_i[2:0]),
    .dio_p(led));

  // IOBUF iic_0_scl_iobuf
  //      (.I(iic_0_scl_o),
  //       .IO(iic_0_scl_io),
  //       .O(iic_0_scl_i),
  //       .T(iic_0_scl_t));
  // IOBUF iic_0_sda_iobuf
  //      (.I(iic_0_sda_o),
  //       .IO(iic_0_sda_io),
  //       .O(iic_0_sda_i),
  //       .T(iic_0_sda_t));

  //assign gpio_i[63:3] = gpio_o[63:3];

  assign    hdmi_data   =   {vid_data[23:19],vid_data[15:10],vid_data[7:3]};
  assign    hdmi_clk    =   vid_clk;
  assign    hdmi_de     =   vid_de;
  assign    hdmi_hs     =   vid_hs;
  assign    hdmi_vs     =   vid_vs;

  system_wrapper i_system_wrapper (
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_cas_n (ddr_cas_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dm (ddr_dm),
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_odt (ddr_odt),
    .ddr_ras_n (ddr_ras_n),
    .ddr_reset_n (ddr_reset_n),
    .ddr_we_n (ddr_we_n),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    .gpio_i (gpio_i),
    .gpio_o (gpio_o),
    .gpio_t (gpio_t),
    .hdmi_intn(hdmi_intn),
    .vid_clk(vid_clk),
    .vid_data(vid_data),
    .vid_de(vid_de),
    .vid_hs(vid_hs),
    .vid_vs(vid_vs),
    .IIC_0_scl_io(iic_0_scl_io),
    .IIC_0_sda_io(iic_0_sda_io));

endmodule

// ***************************************************************************
// ***************************************************************************
