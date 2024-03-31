// Code your design here
module halfadder(input clk,reset,valid,a,b,output sum,carry);
  reg temp_sum,temp_carry;
  
  always@(posedge clk)begin
   if(valid)begin
      temp_sum<=a^b;
      temp_carry=a&b;
    end
  end
  assign sum=temp_sum;
  assign carry=temp_carry;
endmodule