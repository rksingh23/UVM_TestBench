class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  sequencer seq;
  
  function new(string name = "TEST", uvm_component p = null);
    super.new(name,p);
  endfunction
  
      virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
        e = env::type_id::create("ENV",this);
        seq = sequencer::type_id::create("SEQ",this);
     endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    begin
      seq.start(e.a.sequencer);  
    end
    phase.drop_objection(this);
    
  endtask
endclass
