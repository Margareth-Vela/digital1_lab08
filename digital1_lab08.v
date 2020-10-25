/*Margareth Vela
Sección: 20 
Carné: 19458 */

//Primer ejercicio - Contador
module counter(input wire clk, rst, enable, Load, input wire [11:0] Ld, output reg [11:0] Y);

  always @ (posedge clk or posedge rst) begin
    if (rst == 1) begin
      Y <= 12'b0;
      end
    else if (enable == 1) begin
        if (Load == 1) begin
          Y <= Ld;
        end
        else if (Load == 0) begin
        Y <= Y + 1;
        end
      end
    else if (enable == 0) begin
      Y <= Y;
      end
    end
endmodule

//Segundo ejercicio - Memoria ROM
module ROM(input wire [11:0] direccion, output wire [7:0] palabra);
  reg [7:0] mem [0:4095];
  initial begin
      $readmemh("datos.list", mem);
  end
  assign palabra = mem[direccion];
endmodule

//Tercer ejercicio - ALU
module alu(input wire [3:0] A, B, input wire [2:0] F, output reg [3:0] Y);

  parameter AND = 3'b000;
  parameter OR = 3'b001;
  parameter ADD = 3'b010;
  parameter AND1 = 3'b100;
  parameter OR1 = 3'b101;
  parameter SUBTRACT = 3'b110;
  parameter SLT = 3'b111;

  always @(*) begin
    case(F)
      AND:  assign Y = (A & B);
      OR:   assign Y = (A | B);
      ADD:  assign Y = A + B;
      AND1: assign Y = (A & ~B);
      OR1:  assign Y = (A | ~B);
      SUBTRACT: assign Y = A - B;
      SLT: assign Y = (A < B) ? 4'd1 : 4'd0 ;
      default: Y = 4'd0;
    endcase
  end
endmodule
