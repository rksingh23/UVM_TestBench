class driver extends uvm_driver#(transaction);
  `uvm_component_utils(driver)
  
  function new(string name = "DRV", uvm_component p = null);
    super.new(name,p);
  endfunction
  
  transaction trans;
  virtual top_if vif;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual top_if)::get(this,"","vif",vif))
      `uvm_info("DRV", "Unable to access the config db", UVM_NONE);
    
   trans = transaction::type_id::create("TRANS");
  endfunction
  
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
     forever begin
       seq_item_port.get_next_item(trans);
       vif.a = trans.a;
       vif.b = trans.b;
       #10;
       seq_item_port.item_done(); 
     end
  endtask
  
  
endclass
