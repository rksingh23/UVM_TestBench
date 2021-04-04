interface top_if();
  
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] c;
 
endinterface


module top(top_if intf);
  
  assign intf.c = intf.a + intf.b;
  
endmodule
