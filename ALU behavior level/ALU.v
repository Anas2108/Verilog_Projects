/*******************************************************************/
/*Author : Anas Hamed                                              */
/*Version: V01                                                     */
/*Date   : 10/8/2023                                               */
/*******************************************************************/

module ALU_32bit (
  input [31:0] a,
  input [31:0] b,
  input [3:0] alu_select,
  output reg [31:0] out,
  output reg zero_flag,
  output reg negative_flag,
  output reg overflow_flag
 
);

  always @(*) //if any signal changed
  
    case(alu_select)
      4'b0000: // AND operation
        begin
           out = a & b;
          zero_flag = (out == 0);
          negative_flag = 0;
          overflow_flag = 0;
          
        end
      4'b0001: // OR operation
        begin
          out = a | b;
          zero_flag = (out == 0);
          negative_flag = 0;
          overflow_flag = 0;
          
        end
      4'b0010: // ADD operation
        begin
          out = a + b;
          zero_flag = (out == 0);
          negative_flag = out[31];
          overflow_flag = ((a[31] == b[31])&&(out[31] != a[31]));
          
        end
      4'b0110: // SUB operation
        begin
          out = a - b;
          zero_flag = (out == 0);
          negative_flag = out[31];
          overflow_flag = ((a[31] != b[31])&&(out[31] != a[31]));
          
        end
      4'b0111: // SET LESS THAN (STL) operation
        begin
          out = (a < b) ? 1 : 0;
          zero_flag = (out == 0);
          negative_flag = 0;
          overflow_flag = 0;
          
        end
      4'b1100: // NOR operation
        begin
          out = ~(a | b);
          zero_flag = (out == 0);
          negative_flag = 0;
          overflow_flag = 0;
         
        end
      default:
        begin
          out = 0;
          zero_flag = 0;
          negative_flag = 0;
          overflow_flag = 0;
    
        end
    endcase
  

endmodule


/*Test Bench*/

module ALU_DUT();
  
  reg [31:0]Ta;
  reg [31:0]Tb;
  reg [3:0]Talu_sel;
  
  wire [31:0]Tout;
  wire Tnegative,Tover_flow,Tzero;
  
  initial 
  
  begin
    
    Ta = 5;
    Tb = 7;
    Talu_sel = 4'b0000; #100 ; // test and
    Talu_sel = 4'b0001; #100 ; // test or
    Talu_sel = 4'b0010; #100 ; // test add
    Talu_sel = 4'b0110; #100 ; // test subtract
    Talu_sel = 4'b0111; #100 ; // test set less than
    Talu_sel = 4'b1100; #100 ; //test nor
    
  end
  
  ALU_32bit T_ALU (Ta,Tb,Talu_sel,Tout,Tzero,Tnegative,Tover_flow);
  
endmodule