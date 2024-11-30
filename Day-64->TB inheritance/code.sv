class packet;
  integer q;

  function integer delay();
    delay = q * q;
  endfunction
endclass

class linkedpacket extends packet;
  integer q;

  function integer delay();
    super.q = 3;
    delay = super.delay() + q * super.q;
  endfunction
endclass

packet p1;
linkedpacket p2;

module test;

  initial begin
    p1 = new;
    p2 = new;
    p1.q = 2;
    p2.q = 4;
    p1.delay();
    p2.delay();
    $display("the p1.delay is %0d", p1.delay);
    $display("the p2.delay is %0d", p2.delay);
  end

endmodule
