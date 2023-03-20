// `timescale 1ns / 1ps
// `include "karatsuba.v"

module test();
    reg[162:0] A,B;
    wire[324:0] out;

    Kartsuba_Multiplier k1(A,B,out);
    initial begin
        $monitor("A = %h   B = %h   out = %h",A,B,out);

        {A,B} = {0x8000000000000000000000000000000000000001, 0x8000000000000000000000000000000000000001};
        {A,B} = {0x810000000000000000000000000000000000001, 0x820000000000000000000000000000000000001};
    end


endmodule