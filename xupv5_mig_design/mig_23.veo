/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2006 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

 mig_23 # (
    .BANK_WIDTH(2),   
                                       // # of memory bank addr bits.
    .CKE_WIDTH(1),   
                                       // # of memory clock enable outputs.
    .CLK_WIDTH(2),   
                                       // # of clock outputs.
    .COL_WIDTH(10),   
                                       // # of memory column bits.
    .CS_NUM(1),   
                                       // # of separate memory chip selects.
    .CS_WIDTH(1),   
                                       // # of total memory chip selects.
    .CS_BITS(0),   
                                       // set to log2(CS_NUM) (rounded up).
    .DM_WIDTH(8),   
                                       // # of data mask bits.
    .DQ_WIDTH(64),   
                                       // # of data width.
    .DQ_PER_DQS(8),   
                                       // # of DQ data bits per strobe.
    .DQS_WIDTH(8),   
                                       // # of DQS strobes.
    .DQ_BITS(6),   
                                       // set to log2(DQS_WIDTH*DQ_PER_DQS).
    .DQS_BITS(3),   
                                       // set to log2(DQS_WIDTH).
    .ODT_WIDTH(1),   
                                       // # of memory on-die term enables.
    .ROW_WIDTH(13),   
                                       // # of memory row and # of addr bits.
    .ADDITIVE_LAT(0),   
                                       // additive write latency.
    .BURST_LEN(4),   
                                       // burst length (in double words).
    .BURST_TYPE(0),   
                                       // burst type (=0 seq; =1 interleaved).
    .CAS_LAT(4),   
                                       // CAS latency.
    .ECC_ENABLE(0),   
                                       // enable ECC (=1 enable).
    .APPDATA_WIDTH(128),   
                                       // # of usr read/write data bus bits.
    .MULTI_BANK_EN(1),   
                                       // Keeps multiple banks open. (= 1 enable).
    .TWO_T_TIME_EN(1),   
                                       // 2t timing for unbuffered dimms.
    .ODT_TYPE(1),   
                                       // ODT (=0(none),=1(75),=2(150),=3(50)).
    .REDUCE_DRV(0),   
                                       // reduced strength mem I/O (=1 yes).
    .REG_ENABLE(0),   
                                       // registered addr/ctrl (=1 yes).
    .TREFI_NS(7800),   
                                       // auto refresh interval (ns).
    .TRAS(40000),   
                                       // active->precharge delay.
    .TRCD(15000),   
                                       // active->read/write delay.
    .TRFC(105000),   
                                       // refresh->refresh, refresh->active delay.
    .TRP(15000),   
                                       // precharge->command delay.
    .TRTP(7500),   
                                       // read->precharge delay.
    .TWR(15000),   
                                       // used to determine write->precharge.
    .TWTR(7500),   
                                       // write->read delay.
    .HIGH_PERFORMANCE_MODE("TRUE"),   
                              // # = TRUE, the IODELAY performance mode is set
                              // to high.
                              // # = FALSE, the IODELAY performance mode is set
                              // to low.
    .SIM_ONLY(0),   
                                       // = 1 to skip SDRAM power up delay.
    .DEBUG_EN(0),   
                                       // Enable debug signals/controls.
                                       // When this parameter is changed from 0 to 1,
                                       // make sure to uncomment the coregen commands
                                       // in ise_flow.bat or create_ise.bat files in
                                       // par folder.
    .CLK_PERIOD(3750),   
                                       // Core/Memory clock period (in ps).
    .DQS_IO_COL(16'b0000000000000000),   
                                       // I/O column location of DQS groups
                                       // (=0, left; =1 center, =2 right).
    .DQ_IO_MS(64'b10100101_10100101_10100101_10100101_10100101_10100101_10100101_10100101),   
                                       // Master/Slave location of DQ I/O (=0 slave).
    .CLK_TYPE("DIFFERENTIAL"),   
                                       // # = "DIFFERENTIAL " ->; Differential input clocks ,
                                       // # = "SINGLE_ENDED" -> Single ended input clocks.
    .DLL_FREQ_MODE("HIGH"),   
                                       // DCM Frequency range.
    .RST_ACT_LOW(1)     
                                       // =1 for active low reset, =0 for active high.
)
u_mig_23 (
    .ddr2_dq                   (ddr2_dq),
    .ddr2_a                    (ddr2_a),
    .ddr2_ba                   (ddr2_ba),
    .ddr2_ras_n                (ddr2_ras_n),
    .ddr2_cas_n                (ddr2_cas_n),
    .ddr2_we_n                 (ddr2_we_n),
    .ddr2_cs_n                 (ddr2_cs_n),
    .ddr2_odt                  (ddr2_odt),
    .ddr2_cke                  (ddr2_cke),
    .ddr2_dm                   (ddr2_dm),
    .sys_clk_p                 (sys_clk_p),
    .sys_clk_n                 (sys_clk_n),
    .clk200_p                  (clk200_p),
    .clk200_n                  (clk200_n),
    .sys_rst_n                 (sys_rst_n),
    .phy_init_done             (phy_init_done),
    .rst0_tb                   (rst0_tb),
    .clk0_tb                   (clk0_tb),
    .app_wdf_afull             (app_wdf_afull),
    .app_af_afull              (app_af_afull),
    .rd_data_valid             (rd_data_valid),
    .app_wdf_wren              (app_wdf_wren),
    .app_af_wren               (app_af_wren),
    .app_af_addr               (app_af_addr),
    .app_af_cmd                (app_af_cmd),
    .rd_data_fifo_out          (rd_data_fifo_out),
    .app_wdf_data              (app_wdf_data),
    .app_wdf_mask_data         (app_wdf_mask_data),
    .ddr2_dqs                  (ddr2_dqs),
    .ddr2_dqs_n                (ddr2_dqs_n),
    .ddr2_ck                   (ddr2_ck),
    .ddr2_ck_n                 (ddr2_ck_n)
);

// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file mig_23.v when simulating
// the core, mig_23. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

