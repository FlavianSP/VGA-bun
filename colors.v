module colors(

	input  clock, rb, gb, bb,
	input [3:0] color,
	output reg [3:0] rv, gv, bv

);

always @(posedge clock) begin

	if(~rb)
	
		rv <= color;
		
		else if(~gb)
			
			gv <= color;
			
				else if(~bb)
				
					bv <= color;
					
end

endmodule