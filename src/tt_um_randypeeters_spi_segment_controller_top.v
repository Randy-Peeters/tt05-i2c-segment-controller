`default_nettype none

module tt_um_randypeeters_spi_segment_controller_top #( parameter MAX_COUNT = 24'd10_000_000 )(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

assign uo_out[0] = ui_in[0];

assign uio_oe = 8'b11111111;
assign uio_out = 8'b11111111;
assign uo_out[7:2] = 7'b1111111;

reg [8:0] counter;
reg uo_out_1;

assign uo_out[1] = uo_out_1;

always @(posedge(clk)) begin
    if (counter == 16) begin
        counter = 0;
        uo_out_1 = 1;
    end    
    else
        counter = counter + 1;
        uo_out_1 = 0;
        
end

endmodule
