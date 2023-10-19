`default_nettype none

module spi(
    input wire rst_n,
    input wire cs_n,
    input wire sck,
    input wire mosi,
    output reg miso
);

reg [8:0] shift_reg_in;
reg [3:0] bit_count;

always @(posedge(sck) or negedge(reset)) begin
    
    //reset all the sequential circuits when the reset is pulled low.
    if (rst_n == 1'b0) begin
        miso = 0;
        shift_reg_in = 0;
        bit_count = 0;
    end

    //If the chip is selected.
    else if(cs_n == 1'b0) begin
        shift_reg_in[8] <= mosi;
        shift_reg_in >> 1;
    end
end

endmodule