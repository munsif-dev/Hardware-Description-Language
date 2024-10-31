module Counter (
    input wire clk,        // Clock input
    input wire reset,      // Reset input
    output wire [6:0] seg_tens,  // 7-segment display for tens
    output wire [6:0] seg_ones   // 7-segment display for ones
);

    reg [5:0] count; // 6-bit counter to count up to 40
    wire [3:0] tens, ones; // BCD digits for tens and ones

    // Increment the counter on each clock pulse
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 6'b0; // Reset the counter to 0
        end else if (count == 6'd40) begin
            count <= 6'b0; // Reset the counter when it reaches P (40)
        end else begin
            count <= count + 1; // Increment the counter
        end
    end

    // Convert the count into BCD digits for tens and ones
    assign tens = count / 10; // Tens digit
    assign ones = count % 10; // Ones digit

    // Use the Decoder module to drive the 7-segment displays
    Decoder decode_tens(.BCD(tens), .seg(seg_tens));
    Decoder decode_ones(.BCD(ones), .seg(seg_ones));

endmodule
