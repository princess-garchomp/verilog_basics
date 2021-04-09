module and_gate_tb;
	wire t_y;
	reg t_a, t_b;

	and_gate my_gate (.a (t_a), .b(t_b), .y(t_y));

	initial
		begin

                        $dumpfile("and_gate_tb_test.vdc");
                        $dumpvars(0,and_gate_tb);

	
			$monitor (t_a, t_b, t_y);
			   	 t_a = 1'b0;
   				 t_b = 1'b0;

   				 #5
   				 t_a = 1'b0;
   				 t_b = 1'b1;

   				 #5
   				 t_a = 1'b1;
   				 t_b = 1'b0;

   				 #5
   				 t_a = 1'b1;
   				 t_b = 1'b1;

				 #5
				 t_a = 1'b0;
				 t_b = 1'b0;


	end
endmodule	
