module dff_tb;

	reg tb_clk = 0;
	reg tb_data = 0;
	reg tb_rst = 0;
	wire tb_q;
	//data = 1 q = 1 this makes the flip flop "set"
	//d	q
	//0	prev state	no change
	//0	0		reset
	//1	1		set

	dff_asy dff_test_asy (.clk (tb_clk), .data (tb_data), .rst (tb_rst), .q (tb_q));
	dff_sync dff_test_sync (.clk (tb_clk), .data (tb_data), .rst (tb_rst), .q (tb_q));
	


	initial begin
		$dumpfile ("test.vcd");
		$dumpvars(0,dff_tb);
		#100 $finish;
	end
	
	always
		#5 tb_clk =! tb_clk;
	always
		#10 tb_data =! tb_data;
	always
		#20 tb_rst =! tb_rst;
endmodule

//iverilog -o test dff_tb.v dff_asy.v dff_sync.v

