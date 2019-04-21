module axi4_video_pattern_gen #(
  parameter int Y_ACTIVE   = 1080,
  parameter int Y_BLANKING = 45,
  parameter int X_ACTIVE   = 1920,
  parameter int X_BLANKING = 280
)(
  input                 clk_i,
  input                 rst_i,
  axi4_stream_if.master video_o
);

localparam int Y_RES         = Y_ACTIVE + Y_BLANKING;
localparam int X_RES         = X_ACTIVE + X_BLANKING;
localparam int PX_CNT_WIDTH  = $clog2( X_RES );
localparam int LN_CNT_WIDTH  = $clog2( Y_RES );
localparam int LANE_1_BORDER = ( X_ACTIVE / 8 ) * 1;
localparam int LANE_2_BORDER = ( X_ACTIVE / 8 ) * 2;
localparam int LANE_3_BORDER = ( X_ACTIVE / 8 ) * 3;
localparam int LANE_4_BORDER = ( X_ACTIVE / 8 ) * 4;
localparam int LANE_5_BORDER = ( X_ACTIVE / 8 ) * 5;
localparam int LANE_6_BORDER = ( X_ACTIVE / 8 ) * 6;
localparam int LANE_7_BORDER = ( X_ACTIVE / 8 ) * 7;
localparam int LANE_8_BORDER = ( X_ACTIVE / 8 ) * 8;

logic [PX_CNT_WIDTH - 1 : 0] px_cnt;
logic [LN_CNT_WIDTH - 1 : 0] ln_cnt;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    px_cnt <= '0;
  else
    if( px_cnt == ( X_RES - 1 ) )
      px_cnt <= '0;
    else
      px_cnt <= px_cnt + 1'b1;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    ln_cnt <= '0;
  else
    if( ( px_cnt == ( X_RES - 1 ) ) )
      if( ln_cnt == ( Y_RES - 1 ) )
        ln_cnt <= '0;
      else
        ln_cnt <= ln_cnt + 1'b1;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    video_o.tvalid <= 1'b0;
  else
    if( ( ln_cnt < Y_ACTIVE ) && ( px_cnt < X_ACTIVE ) )
      video_o.tvalid <= 1'b1;
    else
      video_o.tvalid <= 1'b0;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    video_o.tdata <= '0;
  else
    if( px_cnt < LANE_1_BORDER )
      video_o.tdata <= 32'h00000000;
    else
      if( px_cnt < LANE_2_BORDER )
        video_o.tdata <= 32'h000003ff;
      else
        if( px_cnt < LANE_3_BORDER )
          video_o.tdata <= 32'h00ffc00;
        else
          if( px_cnt < LANE_4_BORDER )
            video_o.tdata <= 32'h000fffff;
          else
            if( px_cnt < LANE_5_BORDER )
              video_o.tdata <= 32'h3ff00000;
            else
              if( px_cnt < LANE_6_BORDER )
                video_o.tdata <= 32'h3ff003ff;
              else
                if( px_cnt < LANE_7_BORDER )
                  video_o.tdata <= 32'h3ffffc00;
                else
                  video_o.tdata <= 32'h3fffffff;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    video_o.tlast <= 1'b0;
  else
    if( px_cnt == ( X_ACTIVE - 1 ) )
      video_o.tlast <= 1'b1;
    else
      video_o.tlast <= 1'b0;

always_ff @( posedge clk_i, posedge rst_i )
  if( rst_i )
    video_o.tuser <= 1'b0;
  else
    if( ( px_cnt == '0 ) &&
        ( ln_cnt == '0 ) )
      video_o.tuser <= 1'b1;
    else
      video_o.tuser <= 1'b0;

endmodule
