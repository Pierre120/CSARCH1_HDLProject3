// Name: Pierre Vincent C. Hernandez, Section: S11
`timescale 1ns / 1ps

module BCD_Counter_tb();
    wire t_A, t_B, t_C, t_D;
    reg t_x, t_clk, t_rst;

    initial
    begin
        $display("\nWritten by: Pierre Vincent C. Hernandez");
        $display("Sequential Circuit Specification: up_down BCD counter using JK Flip Flop");
        $monitor("time=%0d\tclk=%b\trst=%b\tx=%b\tA=%b\tB=%b\tC=%b\tD=%b",$time,t_clk,t_rst,t_x,t_A,t_B,t_C,t_D);
        $dumpfile("herp3.vcd");
        $dumpvars;
    end

    initial #205 $finish;
endmodule