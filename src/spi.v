`default_nettype none

module spi(
    input wire rst_n,
    input wire cs,
    input wire clk,
    input wire mosi,
    output reg miso
);

reg [8:0] shift_reg_in;

always @(posedge(clk) or negedge(reset)) begin
    
    //reset all the sequential circuits.
    if (rst_n == 1'b0) begin
        miso = 0;
    end

    else begin
        shift_reg_in[8] <= mosi;
        shift_reg_in >> 1;
    end
end

endmodule