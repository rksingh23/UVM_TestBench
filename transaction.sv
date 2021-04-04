class transaction extends uvm_sequence_item;
  
  rand bit [3:0] a;
  rand bit [3:0] b;
  bit [4:0] c;
  
  
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(a, UVM_DEFAULT)
  `uvm_field_int(b, UVM_DEFAULT)
  `uvm_field_int(c, UVM_DEFAULT)
  `uvm_object_utils_end
  
  function new(string name = "TRANS");
    super.new(name);
  endfunction
  
endclass
