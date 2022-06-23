// Name: Pierre Vincent C. Hernandez, Section: S11
`timescale 1ns / 1ps

// Module: JK Flip-Flop
module JK_FF(Q,J,K,clk,rst);
    output reg Q;
    input J,K;
    input clk,rst;

    always @(posedge clk,negedge rst)
        if (rst == 0) Q <= 0;
        else
            begin
                case ({J,K})
                    2'b00: Q <= Q;
                    2'b01: Q <= 0;
                    2'b10: Q <= 1;
                    2'b11: Q <= ~Q;
                endcase 
            end
endmodule

// Module: Flip-Flop input equations
module FF_input(JA,KA,JB,KB,JC,KC,JD,KD);
endmodule

module UD_BCD_Counter(A,B,C,D,x,clk,rst);
    output A,B,C,D;
    input x,clk,rst;
    wire
        JA,KA, // A
        JB,KB, // B
        JC,KC, // C
        JD,KD; // D
    
    // Assign Flip-Flop input equations

    // Instantiate JK Flip-Flop
endmodule
