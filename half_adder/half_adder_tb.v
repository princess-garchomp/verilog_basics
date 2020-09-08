	

// half_adder_tb.v


//this 'timescale defines the units and the percesion of the time units in the
//complier
//
//`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

`timescale  10ns/1ns

module half_adder_tb;

    reg t_a, t_b;
    wire t_sum, t_carry;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 10;  

    half_adder UUT (.a(t_a), .b(t_b), .sum(t_sum), .carry(t_carry));
    
    initial // initial block executes only once
        begin
                $dumpfile("half_adder.vdc");
                $dumpvars(0,half_adder_tb);

            // values for a and b
            t_a = 0;
            t_b = 0;
            #period; // wait for period 

            t_a = 0;
            t_b = 1;
            #period;

            t_a = 1;
            t_b = 0;
            #period;

            t_a = 1;
            t_b = 1;
            #period;
        end
endmodule

