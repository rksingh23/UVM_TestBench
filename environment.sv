class env extends uvm_env;
  
  monitor m;
  scoreboard s;
  agent a;
  
  `uvm_component_utils(env)
  
  	function new(string name = "ENV", uvm_component p = null);
   	 super.new(name,p);
  endfunction
  
      virtual function void build_phase(uvm_phase phase);
    		super.build_phase(phase);
        m = monitor::type_id::create("MON",this);
        s = scoreboard::type_id::create("SCO",this);
        a = agent::type_id::create("AGENT",this);      	
     endfunction
  
    virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      m.m_write.connect(s.m_read);
    endfunction

endclass
