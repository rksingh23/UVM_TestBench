class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  function new(string name = "AGENT", uvm_component p = null);
    super.new(name,p);
  endfunction
  
  driver d;
  monitor m;
  uvm_sequencer#(transaction) sequencer;
  
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      if(get_is_active == UVM_ACTIVE) begin
        d  = driver::type_id::create("DRV",this);
        m = monitor::type_id::create("MON",this);
        sequencer = uvm_sequencer#(transaction)::type_id::create("SEQ",this);  
      end
    endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
