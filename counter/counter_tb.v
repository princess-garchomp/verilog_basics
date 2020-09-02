module counter_tb;
	wire [7:0] t_out;
	reg t_clk=0;
        reg t_reset=0;

	counter counter_test (.out(t_out), .clk(t_clk), .reset(t_reset));

//make a reset that puleses once
        initial begin
                $dumpfile("counter_tb_test.vdc");
                $dumpvars(0,counter_tb);

                #5 t_reset =1;
                #5 t_reset =0;
                #5 t_reset =1;
                #5 t_reset =0;
                #50 $finish;
        end

        //maek a regular pulsing clock
        always #1 t_clk = !t_clk;


        initial
               // $monitor("at time %t, value = %h (%0d)",t_out,t_clk,t_reset);
                  $monitor("at time %h, reset state %h, output= %h",$time,t_reset,t_out);

endmodule
