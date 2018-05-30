module time_machine( input logic clk_s,
			input logic clk_m,
			input logic reset_n,
			output logic [5:0] sec,
			output logic [5:0] min
			);

			always_ff @ (posedge clk_s, negedge reset_n)
			begin
				if(!reset_n)
					sec = 0;
				else
					if( sec >= 59)
						begin
							sec = 0;
							min = min +1;
							if (min > 59)
								begin
									min = 0;
								end
						end
					else
						sec = sec + 1;
		
			end
		//	always_ff @ (posedge clk_m, negedge reset_n)
		//	begin
		//		if(!reset_n)
		//			min = 0;
		//		else
		//			if( min >= 59)
		//				min = 0;
		//			else
		//				min = min + 1;
		
	//		end
			
	endmodule	
