module axi4_video_pattern_gen_wrap #(
  parameter int Y_ACTIVE   = 1080,
  parameter int Y_BLANKING = 45,
  parameter int X_ACTIVE   = 1920,
  parameter int X_BLANKING = 280
)(
  input           clk_i,
  input           rst_i,
  output [31 : 0] video_o_tdata,
  output          video_o_tvalid,
  output          video_o_tlast,
  output          video_o_tuser,
  input           video_o_tready
);

axi4_stream_if #(
  .TDATA_WIDTH ( 32     ),
  .TDEST_WIDTH ( 1      ),
  .TID_WIDTH   ( 1      ),
  .TUSER_WIDTH ( 1      )
) video_o (
  .aclk       ( clk_i  ),
  .aresetn    ( !rst_i )
);

assign video_o_tdata  = video_o.tdata;
assign video_o_tvalid = video_o.tvalid;
assign video_o_tlast  = video_o.tlast;
assign video_o_tuser  = video_o.tuser;
assign video_o.tready = video_o_tready;

axi4_video_pattern_gen #(
  .Y_ACTIVE   ( Y_ACTIVE   ),
  .Y_BLANKING ( Y_BLANKING ),
  .X_ACTIVE   ( X_ACTIVE   ),
  .X_BLANKING ( X_BLANKING )
) axi4_video_pattern_gen (
  .clk_i      ( clk_i      ),
  .rst_i      ( rst_i      ),
  .video_o    ( video_o    )
);

endmodule
