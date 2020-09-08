module dff_sync (data, clk, rst, q);
	input data, clk, rst;
	output reg q;

	always @ (posedge clk)
	begin
		if (rst == 1'b1)
			q <= 1'b0;
		else
			q <= data;
	end
endmodule
