class scoreboard;
  mailbox mon2scb;
  int no_transaction;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main;
    forever begin
      transaction trans;
      mon2scb.get(trans);
      if(trans.a^trans.b == trans.sum)begin
        if(trans.a & trans.b == trans.carry)
          $display("Result is Expected...");
      end
      else
        $display("Expected sum: %d	Expected carry: %d\n\t Obtained sum: %d	Obtained carry: %d",(trans.a^trans.b),(trans.a & trans.b),trans.sum,trans.carry);
      no_transaction++;
      trans.display("[SCOREBOARD]");
    end
  endtask
endclass