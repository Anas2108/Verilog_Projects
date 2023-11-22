

module and3 (A,B,C,F);
  input A,B,C;
  output F;
  assign F = A&B&C;
    
endmodule 


module OR4 (A,B,C,D,F);
  input A,B,C,D;
  output F;
  assign F = A|B|C|D;
    
endmodule 



module MUX4 (SEL,A,B,C,D,OUT);
  input [1:0] SEL;
  input A,B,C,D;
  output OUT;
  
  
  and3 and1 (~SEL[0],~SEL[1],A,OUT1);
  
  and3 and2 (SEL[0],~SEL[1],B,OUT2);

  and3 and3 (~SEL[0],SEL[1],C,OUT3);

  and3 and4 (SEL[0],SEL[1],D,OUT4);

  OR4 or1 (OUT1,OUT2,OUT3,OUT4,OUT);

  
endmodule


/* Test Bench */

module MUX4_DUT();
  
  reg TA,TB,TC,TD;
  reg [1:0] TSEL;
  wire TF;
  
  initial
  begin
  
  TSEL = 2'b00;
#10 TA = 0;
#10 TA = 1;
#10 TSEL = 2'b01;
#10 TB = 0;
#10 TB = 1;
#10 TSEL = 2'b10;
#10 TC = 0;
#10 TC = 1;
#10 TSEL = 2'b11;
#10 TD = 0;
#10 TD = 1;


  end 
  
  MUX4 testMUX(TSEL,TA,TB,TC,TD,TF);
  
endmodule