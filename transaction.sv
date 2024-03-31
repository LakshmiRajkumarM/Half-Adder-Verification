class transaction;
  rand bit a,b;
  bit sum,carry;
  
  function void display(string name);
    $display("------------------------");
    $display("%s",name);
    $display("------------------------");
    $display("a=%d	b=%d",a,b);
    $display("sum=%d	carry=%d",sum,carry);
  endfunction
  
  covergroup coverg;
    cp1:coverpoint a{bins b1[]={0,1};}
    cp2:coverpoint b{bins b1[]={0,1};}
  endgroup
  
  function new();
    coverg=new();
  endfunction
  
  function void write();
    coverg.sample();
  endfunction
  
  function void print(int c);
    int count=c;
    $display("no. coverage transaction= %d",count);
    $display("Current Coverage= %f",coverg.get_coverage());
    $display("---------------------------------------------");
  endfunction
endclass

    
    