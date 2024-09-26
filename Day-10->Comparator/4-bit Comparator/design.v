
module cmp4bit(a,b,x,y,z);
input wire [3:0]a,b;
output reg x,y,z;
  assign x=(~(a[3]^b[3]))&(~(a[2]^b[2]))&(~(a[1]^b[1]))&(~(a[0]^b[0]));
  assign y=~a[3]&b[3]|(~(a[3]^b[3]))&~a[2]&b[2]|~(a[3]^b[3])&(~(a[2]^b[2]))&~a[1]&b[1]|(~(a[3]^b[3]))&~(a[2]^b[2])&~(a[1]^b[1])&a[0]&b[0];
  assign z=a[3]&~b[3]|~(a[3]^b[3])&a[2]&~b[2]|(a[3]^b[3])&(~(a[2]^b[2]))&a[1]&~b[1]|(~(a[3]^b[3]))&~(a[2]^b[2])&~(a[1]^b[1])&a[0]&~b[0]; 
endmodule
module cmp4bit_test(a,b,x,y,z);
input wire x,y,z;
output reg [3:0] a,b;
  cmp4bit inst(.a(a), .b(b), .x(x), .y(y), .z(z));
initial begin
  $monitor("Time=%t a=%b b=%b x=%b y=%b z=%b", $time,a,b,x,y,z);
#10 a=4'b0000;b=4'b0000;
#10 a=4'b0001;b=4'b0000;
#10 a=4'b0000;b=4'b0010;
#10;
$finish;
end
endmodule
