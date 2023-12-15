module LEDcountOn (
	input clk,
	input rst,
	input [3:0] count,
	output reg [7:0] LEDG
);

	always @(posedge clk or posedge rst) 
	begin
		//When the program is reconfigured, the leds are reset to 0 to reflect the reset count.
		if (rst)
			LEDG <= 8'b00000000; 
		else
		begin
			//The leds turn on one by one, starting on the right, to reflect the counting of the claps.
			//The count has a max of 8 bits because there are only 8 green leds on the board.
			//Once the leds hit the max amount that can light up, all lights stay lit until the program is reset.
			case(count)
				4'b0000: LEDG <= 8'b00000000;
				4'b0001: LEDG <= 8'b00000001;
				4'b0010: LEDG <= 8'b00000011;
				4'b0011: LEDG <= 8'b00000111;
				4'b0100: LEDG <= 8'b00001111;
				4'b0101: LEDG <= 8'b00011111;
				4'b0110: LEDG <= 8'b00111111;
				4'b0111: LEDG <= 8'b01111111;
				4'b1000: LEDG <= 8'b11111111;
				default: LEDG <= 8'b11111111;
			endcase
		end
	end
endmodule
	
