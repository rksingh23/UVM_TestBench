`include "uvm_macros.svh"

module tb;
  
import uvm_pkg::*;
`include "transaction.sv"
 `include "sequencer.sv"
  `include "driver.sv"
  `include "monitor.sv"
  `include "agent.sv"
  `include "scoreboard.sv"
  `include "environment.sv"
  `include "test.sv"

  
  top_if vif();
  
  top uut (.intf(vif));
  
 /* 
  initial begin
    vif.a = 4'b0001;
    vif.b = 4'b1010;
    #10;
    $display("Sum : %0d", vif.c);
    
  end
  */
  
  
  initial begin
  $dumpvars;
  $dumpfile("dump.vcd");
    
  uvm_config_db#(virtual top_if)::set(null, "*", "vif" ,vif); 
    run_test("test");
  end
  
  
  
endmodule
