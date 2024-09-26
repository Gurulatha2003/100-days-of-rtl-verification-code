 include "cmp_4_bit.v"
module cmp_4bit_tb(eq,lst,grt,a,b);
input wire eq,lst,grt;
output reg [3:0]a,b;
  cmp_4bit duf(.eq(eq), .lst(lst), .grt(grt), .a(a), .b(b));
initial begin
$monitor("Time=%t=> a=%b b=%b eq=%b lst=%b grt=%b", $time,a,b,eq,lst,grt);
#10 a=4'b0000;b=4'b0000;
#10 a=4'b0110;b=4'b0101;
#10 a=4'b1001;b=4'b0101;
#10 a=4'b0110;b=4'b0011;
#10 a=4'b1011;b=4'b0100;
#10 a=4'b0100;b=4'b1000;
#10 a=4'b0001;b=4'b1010;
#10
$finish;
end
endmodule
