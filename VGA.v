module VGA(

	input clock,reset,rb,gb,bb,
	input [3:0] mode, color,
	output [11:0]  x,y,
	output [3:0] rv,gv,bv,
	output HSync,VSync,Disp_Active,VSyncN,HSyncN

);

reg[9:0] visibleH,frontH,backH,syncH,visibleV,frontV,backV,syncV;
wire w1;
reg val;

assign HSyncN = ~HSync;

assign VSyncN = ~VSync;

assign Disp_Active = ((x <= visibleH) & (y <= visibleV)) ? 1 : 0;

Sync dut(

	.frontN(frontH),
	.backN(backH),
	.syncN(syncH),
	.visibleN(visibleH),
	.clock(clock),
	.reset(reset),
	.syncO(HSync),
	.x(x)

);

Sync dut1(

	.frontN(frontV),
	.backN(backV),
	.syncN(syncV),
	.clock(HSync),
	.reset(reset),
	.syncO(VSync),
	.y(y)

);

Divisor dut2 (

	.clock(clock),
	.reset(reset),
	.val(val),
	.mode(mode),
	.out(out)

);

colors dut3(

	.clock(clock),
	.color(color),
	.rv(rv),
	.gv(gv),
	.bv(bv),
	.rb(rb),
	.gb(gb),
	.bb(bb)

);

always @(posedge clock) begin
 
	if(reset)begin
	
		visibleH = 0;

		frontH = 0;

		syncH = 0;

		backH = 0;

		val = 0;

		visibleV = 0;

		frontV = 0;

		syncV = 0;

		backV = 0;
		
		end

		else begin
 
			visibleH = 800;

			frontH = 56;

			syncH = 120;

			backH = 64;

			val = 1;

			visibleV = 600;

			frontV = 37;

			syncV = 6;

			backV = 23;
			
			end
			
end

endmodule
