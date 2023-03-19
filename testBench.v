`timescale 1ns / 1ps
`include "Assignment1.v"

module karatsuba_mult_tb;

  // Parameters
  parameter size = 163;

  // Inputs
  reg [size-1:0] a;
  reg [size-1:0] b;

  // Outputs
  wire [2*size-1:0] c;

  // Instantiate the DUT
  karatsuba_mult #(.size(size)) dut (.a(a), .b(b), .c(c));

  // Initialize the inputs
  initial begin
    // Test vector (a)
    a = 163'h8000000000000000000000000000000000000001;
    b = 163'h8000000000000000000000000000000000000001;
    #10;
    $display("Result (a): %h", c);

    // Test vector (b)
    a = 163'h810000000000000000000000000000000000001;
    b = 163'h820000000000000000000000000000000000001;
    #10;
    $display("Result (b): %h", c);

    // Test vector (c)
    a = 163'h7fffffffffffffffffffffffffffffffffffffff;
    b = 163'h7fffffffffffffffffffffffffffffffffffffff;
    #10;
    $display("Result (c): %h", c);
  end

endmodule

// iverilog -o exec abc_tb.v
// vvp exec