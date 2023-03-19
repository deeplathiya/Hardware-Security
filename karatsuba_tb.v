`timescale 1ns / 1ps
`include "karatsuba.v"

module test();
    reg[162:0] A,B;
    wire[324:0] out;

    karatsuba_162 kar(A,B,out);
	// shift_module s(A,B,controls,out);

    // testing all the control signals
    initial begin
        $monitor("A = %d   B = %d   out = %d",A,B,out);

        {A,B} = {163'd5, 163'd5}; #20;
        {A,B} = {163'd512, 163'd1024}; #20;
        {A,B} = {163'd10, 163'd15}; #20;
        {A,B} = {163'd12, 163'd13}; #20;
    end


endmodule