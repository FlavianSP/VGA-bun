module Sync(

	input [9:0] visibleN, frontN, syncN, backN,
	input clock, reset,
	output reg [11:0] x,y,
	output reg syncO

);

reg [31:0] counter;

always@(posedge clock) begin

	if(reset) begin
	
		counter <= 0;
		x <= 0;
		y <= 0;
		end
		
		else 
		
			if(counter <= visibleN) begin
			
				counter <= counter + 1;
				syncO <= 1;
				end
				
if((x == visibleN) | (y == visibleN)) begin
			
		x <= x;
		y <= y;
		end
		
		else begin
				
			x <= x + 1;
			y <= y + 1;
			end
			
if(counter >= (visibleN + backN) & counter <= (visibleN + backN + syncN)) begin

	syncO <= 0;
	counter <= counter + 1;
	end
	
	else
	
	if(counter > (visibleN + backN + syncN) & counter < visibleN + backN + syncN + frontN) begin
	
		syncO <= 1;
		counter <= counter + 1;
		end
		
		else
		
		if (counter == (visibleN + backN + syncN + frontN)) begin
		
			counter <= 0;
			end
			
end

endmodule