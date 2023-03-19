module karatsuba_mult (
  input [162:0] a,
  input [162:0] b,
  output reg [325:0] c
);

  parameter size = 163;
  reg [size-1:0] a0, a1, b0, b1;
  reg [2*size-1:0] p0, p1, p2;

  always @(*) begin
    a0 = a[size-1:0];
    a1 = a[2*size-1:size];
    b0 = b[size-1:0];
    b1 = b[2*size-1:size];
  end

  // Base case
  if (size == 1) begin
    assign c = a & b;
  end
  // Recursive case
  else begin
    // Calculate the three sub-products
    karatsuba_mult #(.size(size/2)) m1 (.a(a0), .b(b0), .c(p0));
    karatsuba_mult #(.size(size/2)) m2 (.a(a1), .b(b1), .c(p1));
    karatsuba_mult #(.size(size/2)+1) m3 (.a = a0^a1, .b = b0^b1, .c(p2));

    // Calculate the final product
    always @(*) begin
      c = {p1, {(2*(size/2)) {1'b0}} } + {p2, {(size/2) {1'b0}}, {(size/2) {1'b0}} } + {p0, {(size) {1'b0}} };
    end
  end

endmodule
