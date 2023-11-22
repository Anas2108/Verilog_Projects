
module AOI (a,b,c,d,f);
  input a,b,c,d;
  output f;
  assign f = ~((a & b) | (c & d));
  
endmodule 


module INV (a, b);
  input a;
  output b;
  assign  b = ~a;
  
endmodule 

module MUX (SEL,a,b,f);
  input SEL,a,b;
  output f;
  
  INV inv1 (SEL,SELB);
  
  AOI AOI1 (SELB,a,SEL,b,FB);
  
  INV inv2 (.a(FB),.b(f));
  
  
endmodule