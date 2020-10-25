//Testbench del ejercicio 1

module testbench();

  reg clock, rst, enable, Load;
  reg [3:0] A, B;
  reg [2:0] F;
  reg [11:0] Ld, direccion;
  wire [3:0] ALU;
  wire [7:0] palabra;
  wire [11:0] Y;
  integer i;


  always
    begin
      clock <= 1;
      #1 clock <= ~clock;
      #1;
  end

  counter G1(clock, rst, enable, Load, Ld, Y);
  ROM     G2(direccion, palabra);
  alu     G3(A, B, F, ALU);

  initial begin
  $display("\n");
    $display("Contador - Ejercicio 1");
    $display("\n");
    $display(" Clk RST | EN  LOAD |       LD       |        Y       ");
    $display(" -------------------------------------------------------- ");
    $monitor(" %b    %b  | %b      %b |  %b  |  %b ", clock, rst, enable, Load, Ld, Y);

    #1 rst = 1; //Reset inicial
    #1 rst = 0; //Reset inicial
    #2 enable = 1; Load = 0; Ld[11] = 0; Ld[10] = 0; Ld[9] = 0; Ld[8] = 0; Ld[7] = 0; Ld[6] = 0; Ld[5] = 1; Ld[4] = 0; Ld[3] = 1; Ld[2] = 0; Ld[1] = 1; Ld[0] =0;
    #12 Load = 1;
    #1 Load = 0;
    #6 enable = 0;
    #8 enable = 1;
    end

    initial begin
      #38
      $display("\n");
      $display(" Memoria ROM - Ejercicio 2");
      $display("    Address       |   Palabra   ");
      $display("-----------------------------");
      $monitor("%b  |   %b", direccion, palabra);

      for (i = 0; i < 9; i++) begin
        #2 direccion =  i;
      end
    end

    initial begin
      #60
      $display("\n");
      $display("ALU - Ejercicio 3");
      $display("   A         B   |  F  |    Y ");
      $display(" ----------------------------- ");
      $monitor(" %b    %b  | %b |  %b ", A, B, F, ALU);

      #1  A[3] = 0; A[2] = 0; A[1] = 1; A[0] = 0; B[3] = 0; B[2] = 1; B[1] = 0; B[0] = 1;
      #1  F[2] = 0; F[1] = 0; F[0] = 0;
      #1  F[2] = 0; F[1] = 0; F[0] = 1;
      #1  F[2] = 0; F[1] = 1; F[0] = 0;
      #1  F[2] = 1; F[1] = 0; F[0] = 0;
      #1  F[2] = 1; F[1] = 0; F[0] = 1;
      #1  F[2] = 1; F[1] = 1; F[0] = 0;
      #1  F[2] = 1; F[1] = 1; F[0] = 1;
      #1  F[2] = 0; F[1] = 0; F[0] = 0;
      #1  A[3] = 1; A[2] = 0; A[1] = 1; A[0] = 0;
      #1  F[2] = 1; F[1] = 1; F[0] = 1;
      #5 $finish;

      end

  initial begin
        $dumpfile("testbench_tb.vcd");
        $dumpvars(0, testbench);
      end
endmodule
