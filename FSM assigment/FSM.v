
module FSM (X,clk,reset,Y,current_state);
  
  output reg Y;
  
  input clk,reset,X;
  
  output reg [1:0]current_state ;
  
  parameter A=2'b00;
  parameter B=2'b01;
  parameter C=2'b10;
  parameter D=2'b11;
  
  initial 
  begin
    current_state = A;
    Y = 0;
  end
  
  always @(posedge clk or posedge reset)
  begin
    if(reset)
      begin
        current_state =A;
        Y=0;
      end
      
    else 
    begin
 
      case(current_state)
        A: begin 
          Y<=0;
          if(X==0)
            current_state<=A;
          else
            current_state<=B;  
            
        end
   
        B: begin 
          Y<=0;
          if(X==0)
            current_state<=C;
          else
            current_state<=B;     
        end
 
        C: begin 
          Y<=0;
          if(X==0)
            current_state<=C;
          else
            current_state<=D;      
        end
        
        D: begin 
          Y<=1;
          if(X==0)
            current_state<=D;
          else
            current_state<=A;    
        end
        
      endcase
 
    end
    
  end
  
endmodule 

/**********************************Test bench*********************************************/

module FSM_DUT();
  
  reg X_tb,clk_tb,reset_tb;
  
  wire Y_tb;
  wire [1:0]cs_tb;
  
  initial
  begin
    reset_tb=0;
    clk_tb=0;
  end
  
  always
  begin
   #5 clk_tb =~clk_tb;
  end
  
  initial 
  begin
     X_tb =1;
    #10 X_tb =0;
    #10 X_tb =1;
    
  end
  
  FSM moore (X_tb,clk_tb,reset_tb,Y_tb,cs_tb);
  
  
endmodule
