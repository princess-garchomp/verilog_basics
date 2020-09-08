module dff_asy (data, clk, rst, q);
	input data, clk, rst;
	output reg q;

	always @ (posedge clk or rst)
		begin
			if (rst == 1'b1)
			        q <= 1'b0;
	       		else
			 	q <= data;
	end
endmodule	
