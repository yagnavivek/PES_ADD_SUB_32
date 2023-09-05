module add_sub_32 (
    input [31:0] A,
    input [31:0] B,
    input Ci,           // Carry-in for addition mode
    input Subtract,     // Control signal (0 for addition, 1 for subtraction)
    input clk,          // Clock signal
    output reg [31:0] S,
    output reg Co       // Carry-out
);

reg [32:0] Sum33;

always @(posedge clk) begin

    // Perform addition or subtraction based on the control signal
    if (Subtract) begin
        Sum33 = A - B - Ci;
    end else begin
        Sum33 = A + B + Ci;
    end

    S <= Sum33[31:0];
    Co <= Sum33[32];
end

endmodule

