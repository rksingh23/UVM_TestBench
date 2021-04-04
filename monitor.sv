class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(string name = "MON", uvm_component p = null);
    super.new(name,p);
  endfunction
  
  transaction trans;
  virtual top_if vif;
  
  uvm_analysis_port#(transaction) m_write;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual top_if)::get(this,"","vif",vif))
      `uvm_info("MON", "Unable to access the config db", UVM_NONE);
    
     trans = transaction::type_id::create("TRANS");
     
     m_write = new("PUT",this);
    
  endfunction
  
    virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
     forever begin
       trans.c = vif.c;
       trans.a = vif.a;
       trans.b = vif.b;
       m_write.write(trans);
       #10;
     end
  endtask
endclass
