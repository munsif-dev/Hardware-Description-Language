module IC7490TB;

    
    reg clk;
    reg reset;
    wire [3:0] Q;
    
    
    IC7490 uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );
    
    // Clock generation: 10ns period (100 MHz)
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, IC7490TB);
        clk = 0;
        forever #5 clk = ~clk; // Toggle every 5ns
    end
    
    // Test procedure
    initial begin
        // Monitor output
        $monitor("Time = %0t | Reset = %b | Count = %b", $time, reset, Q);
        
        // Initial values
        reset = 1; 
        #10 reset = 0; 
        
        // Allow counting to proceed for 100ns
        #100;
        
        // Apply reset in the middle of counting
        #10 reset = 1;
        #10 reset = 0; 
        
        
        #100;
        
        
        $finish;
    end

endmodule



// vvp counter_sim
// iverilog -o counter_sim IC7490.v IC7490TB.v
// vvp counter_sim
// gtkwave counter.vcd
