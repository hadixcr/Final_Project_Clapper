module clapCounter (
  input clk,
  input rst,
  input [15:0] fftInDataAbs,
  output reg [3:0] countDisplay
);


  always @(posedge clk or posedge rst) 
  begin

   	//Checks if the program reconfigured, reseting the count to zero to restart counting.  
	if (rst)
   	begin
   		countDisplay <= 4'b0000;
	end

	//Checks if the data reaches the 15th bit, reflecting the last led on the board lighting up.
	//Using this, we determine there was a clap so we add one to the current sum output.
   	else if (fftInDataAbs[15] == 1'b1)
   	begin
		countDisplay <= countDisplay + 1'b1;
  	end
  end

endmodule
