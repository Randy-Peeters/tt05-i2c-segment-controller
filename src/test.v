

module test(
    input wire clk,
    output reg out
);

reg [8:0] counter = 0;

always @(posedge(clk)) begin
    if (counter == 16) begin
        counter = 0;
        out = 1;
    end    
    else
        counter = counter + 1;
        out = 0;
end

endmodule