module counter(
  input clk,
  input rst,
  input ledPeak,
  output [3:0] clapCount
);

  reg [3:0] count;
  reg ledPeakPrev;

  always @(posedge clk or posedge rst) 
  begin

    //This resets the count when the rest of the program reconfigures.
    if (rst) begin
      count <= 4'b0000;
    end

    //Detects if the led is currently peaking and the last instance of it is not peaking.
    //This determines whether a clap is happening, updating the counter to add one to the current total.
    else if (ledPeak == 1'b1 && ledPeakPrev == 1'b0) 
    begin
      count <= count + 1'b1;
    end
    ledPeakPrev <= ledPeak;
  end

  assign clapCount = count;

endmodule
