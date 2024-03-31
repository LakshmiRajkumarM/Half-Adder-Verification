// Code your testbench here
// or browse Examples
`include "Interface.sv"
`include "Test.sv"

module testbench;
  bit clk;
  bit reset;
  
  always #5 clk=~clk;
  initial
    begin
      reset=1;
      #10 reset=0;
    end
  
  intf i_intf(clk,reset);
  test t1(i_intf);
  
  halfadder DUT(.clk(i_intf.clk),
                .reset(i_intf.reset),
                .a(i_intf.a),
                .b(i_intf.b),
                .sum(i_intf.sum),
                .carry(i_intf.carry),
                .valid(i_intf.valid));
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule