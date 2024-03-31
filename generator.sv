class generator;
  rand transaction trans;
  mailbox gen2driv;
  int repeat_count,count;
  event ended;
  
  function new(mailbox gen2driv);
    this.gen2driv=gen2driv;
  endfunction
  
  task main;
    repeat(repeat_count)begin
      trans=new();
      if(!trans.randomize())$fatal("[GEN]: Randomization Failed..");
      gen2driv.put(trans);
      trans.write();
      trans.print(count);
      count++;
      trans.display("[GENERATOR]");
    end
    ->ended;
  endtask
endclass