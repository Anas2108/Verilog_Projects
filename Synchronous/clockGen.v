

module D_Q (clock,D,Q);
  input D;
  input clock;
  
  output reg Q;
 
  
  
  always @(posedge clock)
  Q<=D;
endmodule


module D_Q_DUT;
  reg Tclock=0, TD;
  wire TQ;
  
  always 
  #5 Tclock=~Tclock;
  
  initial begin
    TD = 1;
    #30;
    TD = 0;
    #10
    TD = 1;
  end
  
  D_Q m (Tclock, TD, TQ);
endmodule