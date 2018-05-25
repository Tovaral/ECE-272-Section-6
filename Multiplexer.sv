module mux4 ( input logic [3:0] ones,
				input logic [3:0] tens,
				input logic [3:0] hunds,
				input logic [3:0] thous,
				input logic [2:0] stateSel,
				output logic [3:0] out);
				
			always_comb
					case (stateSel)
						3'b000:		out = ones;
						3'b001:		out = tens;
						3'b011:		out = hunds;
						3'b100:		out = thous;
						default: out = ones;
					endcase
				
	endmodule