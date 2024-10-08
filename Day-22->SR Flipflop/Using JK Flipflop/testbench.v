`inclide "jkff_test.v"
module srff_using_jkff_test;
  reg s,r,clk;
  wire q;
  srff_using_jkff inst(.s(s), .r(r), .clk(clk), .q(q));
  initial begin
    clk=0;
    for
