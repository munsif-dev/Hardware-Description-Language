module IC7490 (
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output reg [3:0] Q // BCD output (QD, QC, QB, QA)
);

    // Always block for counting functionality
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 4'b0000; // Reset to 0
        end else begin
            if (Q == 4'b1001) begin
                Q <= 4'b0000; // Roll back to 0 after reaching 9
            end else begin
                Q <= Q + 1;   // Increment the count
            end
        end
    end

endmodule
