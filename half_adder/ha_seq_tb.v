// half_adder_procedural_tb.v

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module half_adder_seq_tb;

    reg t_a, t_b;
    wire t_sum, t_carry;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    half_adder UUT (.a(t_a), .b(t_b), .sum(t_sum), .carry(t_carry));
reg clk;

//                $dumpfile("counter_tb_test.vdc");
//                $dumpvars(0,counter_tb);
//		$dumpfile("ha_procedural_test.vdc");
//		$dumpvats(0,half_adder_procedural_tb);

// note that sensitive list is omitted in always block
// therefore always-block run forever
// clock period = 2 ns


        initial begin
                $dumpfile("test.vdc");
                $dumpvars(0,half_adder_seq_tb);
        end



always 
begin
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
end

always @(posedge clk)
begin
    // values for a and b
    t_a = 0;
    t_b = 0;
    #period; // wait for period
    // display message if output not matched
    if(t_sum != 0 || t_carry != 0)  
        $display("test failed for input combination 00");

    t_a = 0;
    t_b = 1;
    #period; // wait for period 
    if(t_sum != 1 || t_carry != 0)
        $display("test failed for input combination 01");

    t_a = 1;
    t_b = 0;
    #period; // wait for period 
    if(t_sum != 1 || t_carry != 0)
        $display("test failed for input combination 10");

    t_a = 1;
    t_b = 1;
    #period; // wait for period 
    if(t_sum != 0 || t_carry != 1)
        $display("test failed for input combination 11");

    t_a = 0;
    t_b = 1;
    #period; // wait for period 
    if(t_sum != 1 || t_carry != 1)
        $display("test failed for input combination 01");

    $stop;   // end of simulation
end
//	initial begin
//               $dumpfile("ha_procedural_test.vdc");
//                $dumpvars(0,half_adder_procedural_tb);
//	end
endmodule
