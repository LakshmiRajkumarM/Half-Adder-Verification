class driver;
  mailbox gen2driv;
  virtual intf vif;
  int no_transaction;
  
  function new(virtual intf vif,mailbox gen2driv);
    this.vif=vif;
    this.gen2driv=gen2driv;
  endfunction
  
  task reset;
    wait(vif.reset);
    $display("[DRIVER]: Reset Started.....");
    vif.a<=0;
    vif.b<=0;
    vif.sum<=0;
    vif.carry<=0;
    wait(!vif.reset);
    $display("[DRIVER]: Reset Ended.....");
  endtask
  
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge vif.clk);
      vif.valid<=1;
      vif.a<=trans.a;
      vif.b<=trans.b;
      @(posedge vif.clk)
      vif.valid=0;
      @(posedge vif.clk)
      no_transaction++;
      trans.display("[DRIVER]");
    end
  endtask
endclass

    
    