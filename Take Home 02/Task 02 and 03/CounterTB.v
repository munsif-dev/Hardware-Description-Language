module CounterTB();

    reg clk;       // Testbench clock
    reg reset;     // Testbench reset
    wire [6:0] seg_tens; // Tens 7-segment output
    wire [6:0] seg_ones; // Ones 7-segment output

    // Instantiate the Counter module
    Counter counter_inst (
        .clk(clk),
        .reset(reset),
        .seg_tens(seg_tens),
        .seg_ones(seg_ones)
    );

    // Clock generation
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle the clock every 5 time units
        $dumpfile("counter_wave.vcd");
        $dumpvars(0, CounterTB);
    end

    // Simulation procedure
    initial begin
        reset = 1;     // Start with reset active
        #10 reset = 0; // Deactivate reset after 10 time units

        // Let the counter run for a few clock cycles until it counts to 40
        #415;

        $finish;       // End the simulation
    end

    // Monitoring the output
    initial begin
        $monitor("Time = %0t, Tens = %b, Ones = %b", $time, seg_tens, seg_ones);
    end

endmodule

