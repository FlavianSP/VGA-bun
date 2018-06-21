module Divisor(

	input [3:0] mode,
	input clock,
	input reset,
	input val,
	output reg [3:0] out

);

reg [31:0] counter;

always@(posedge clock) begin

	if(reset) begin
		
		counter <= 0;
		out <= 0;
		end
		
		else 
		
		if (counter == val) begin
		
			out <= ~out;
			counter <= 0;
			end
			
			else begin
			
			counter <= counter + 1;
			end
			
end

endmodule
