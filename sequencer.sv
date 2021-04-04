class sequencer extends uvm_sequence#(transaction);
 
  `uvm_object_utils(sequencer)
  
  function new(string name = "TRANS");
    super.new(name);
  endfunction
  
  transaction trans;
  
  
  virtual task body();
    trans = transaction::type_id::create("TRANS");
    for(int i = 0; i < 10; i++) begin
      start_item(trans);
      trans.randomize();
      trans.print();
      `uvm_info("SEQ","Sending a data to Driver", UVM_NONE);
      finish_item(trans); 
    end
  endtask
  
  
endclass
