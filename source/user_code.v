

module ddr_interfacing(
    )

  wire                              sys_clk;
  wire                              idly_clk_200;
  wire                              error_cmp;
  wire                              rst0;
  wire                              rst90;
  wire                              rstdiv0;
  wire                              rst200;
  wire                              clk0;
  wire                              clk90;
  wire                              clkdiv0;
  wire                              clk200;
  wire                              idelay_ctrl_rdy;
  wire                              app_wdf_afull;
  wire                              app_af_afull;
  wire                              rd_data_valid;
  wire                              app_wdf_wren;
  wire                              app_af_wren;
  wire  [30:0]                      app_af_addr;
  wire  [2:0]                       app_af_cmd;
  wire  [(APPDATA_WIDTH)-1:0]       rd_data_fifo_out;
  wire  [(APPDATA_WIDTH)-1:0]       app_wdf_data;
  wire  [(APPDATA_WIDTH/8)-1:0]     app_wdf_mask_data;

  reg [3:0] count = 0;

  always @(posedge clk0) begin

    //Write to DDR
    app_af_cmd <= 3'b000;   //Select write mode

    //Wait for app_af_afull
    if(!app_af_afull) begin
        case (count)
            0 : app_af_addr <= 32;  //Selecting an address to write data before enabling address FIFO write
            1 : app_af_wren <= 1;   //Assert Address FIFO write enable
            2 : app_af_wren <= 0;   //Disabling addresss FIFO write enable
        endcase
    end
    //Wait for adata FIFO almost full deassertion
    if(!app_wdf_afull) begin
      case (count)
        0 : app_wdf_data <= 32;       //Get data ready before enabling data FIFO
            app_wdf_mask_data <= 0x1; //Data mask. Not being used here
        1 : app_wdf_wren <= 1;        //Enable data FIFO write
        2 : app_wdf_wren <= 0;        //Disable data FIFO write
      endcase
    end

    count <= count+1;
  end

endmodule