class monitor;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main;
    forever begin
      transaction trans;
      trans=new();
      @(posedge vif.clk);
      wait(vif.valid);
      trans.a<=vif.a;
      trans.b<=vif.b;
      @(posedge vif.clk);
      trans.sum=vif.sum;
      trans.carry<=vif.carry;
      @(posedge vif.clk);
      mon2scb.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
