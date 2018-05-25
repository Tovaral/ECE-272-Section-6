module Parser(
		input logic [5:0] second,
		input logic [5:0] minute,
		output logic [3:0] one_s,
		output logic [3:0] ten_s,
		output logic [3:0] one_m,
		output logic [3:0] ten_m);
		
		//always_comb
			//begin
			assign	one_s = second % 10;
			assign	ten_s = (second/10) % 10;
			assign	one_m = minute % 10;
			assign	ten_m = (minute / 10) % 10;
				
			//end
				
	endmodule