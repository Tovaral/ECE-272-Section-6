module clock_timer(
	input logic clk_i,		//often, "tags" are added to variables to denote what they do for the user
	input logic reset_n,
	 //here, 'i' is used for input and 'o' for the output, while 'n' specifies						//an active low signal ("not") 
	output logic clk_s,
	output logic clk_m
		);
		logic [25:0] count_s;	//register stores the counter value so that it can be modified
					//on a clock edge. Register size needs to store as large of a
					//number as the counter reaches. Here, 2^(13+1) = 16,384.
		logic [35:0] count_m;
		logic [5:0] seconds;
		logic [5:0] mins;
		always_ff @ (posedge clk_i, negedge reset_n)			
			begin
				count_s <= count_s + 1;	//at every positive edge, the counter is increased by 1
				if(!reset_n) //If reset_n gets pulled to ground (active low), reset count to 0
					begin
						clk_s <= 0;
						count_s <= 0;
					end
				else
					if(count_s >= 1000000) //Flips the slow clock every 10000 clock cycles
						begin		
							clk_s <= ~clk_s;	//Flip slow clock
							count_s <= 0;			//Reset the counter
						end
			end
	//	always_ff @ (posedge clk_i, negedge reset_n)			
	//		begin
	//			count_m <= count_m + 1;	//at every positive edge, the counter is increased by 1
	//			if(!reset_n) //If reset_n gets pulled to ground (active low), reset count to 0
	//				begin
	//					clk_m <= 0;
	//					count_m <= 0;
	//				end
	//			else
	//				if(count_m >= 1000000 * 60) //Flips the slow clock every 10000 clock cycles
	//					begin		
	//						clk_m <= ~clk_m;	//Flip slow clock
	//						count_m <= 0; ////////////// <= 0;			//Reset the counter
	//					end
	//		end
								
			
endmodule
			
