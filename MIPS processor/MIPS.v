
module MIPS ();
  //Decleration section
  reg clock = 0;
  reg [31:0] PC,IR,ALUout,IMemorey[1023:0];
  
  wire [4:0]rs,rt;
  wire [5:0]op;
  
  wire [31:0] A,B;
  
  //Intialization section

    initial 
  begin
    PC <= 0;
    IMemorey[0]<=32;
    IMemorey[1] <= 25;
  end
  
  assign A = 10;
  assign B = 5;
  
  // Decoding
  assign rs = IR[25:21]; //not imp at this code
  assign rt = IR[20:16]; // not imp at this code
  assign op = IR[31:26]; //imp
  
  
    
  always 
  begin
    #5 clock <= ~clock;
  end
  
  always @ (posedge clock)
  begin 
    IR <= IMemorey[PC>>2];
    PC <= PC+4;
    if (IR[31:26] == 6'b000000)
      
      case(IR[5:0])
        32: ALUout <= A+B;
        25: ALUout <= A-B;
        default :;
      endcase
      
    
end 

endmodule
  
  
  /*
  Question: why the Execution start in the next postive edge m3 en 
  IR = IMemorey[0] in the first positive edge 
  */