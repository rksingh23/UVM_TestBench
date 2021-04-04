class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  function new(string name = "SCO", uvm_component p = null);
    super.new(name,p);
  endfunction
  
  uvm_analysis_imp#(transaction,scoreboard) m_read;
  
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      m_read = new("GET",this);
    endfunction
  
  virtual task write(transaction t);
    `uvm_info("SCO", $sformatf("a = %0d, b = %0d, sum = %0d",t.a,t.b,t.c),UVM_NONE);
    if(t.c == t.a + t.b) begin
      `uvm_info("SCO", "TEST PASSED", UVM_NONE);
    end
    else begin
      `uvm_info("SCO", "TEST FAILED", UVM_NONE);
    end 
  endtask
    
endclass
 
