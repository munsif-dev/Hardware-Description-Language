module IC4017 (
    input wire clk,     // Clock input
    input wire reset,   // Reset input
    output reg [9:0] Q  // 10 output lines (one per count)
);

    reg [3:0] count;    // 4-bit counter to track the count (0-9)

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000; // Reset count to 0
            Q <= 10'b0000000001; // Set the first output HIGH
        end else begin
            if (count == 4'b1001) begin
                count <= 4'b0000; // Reset count after 9
            end else begin
                count <= count + 1; // Increment the count
            end
            // Shift the output Q to reflect the current count
            Q <= (10'b1 << count); // Set only one bit HIGH at a time
        end
    end

endmodule
