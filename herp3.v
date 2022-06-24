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

// Module: Up-down BCD Counter
module UD_BCD_Counter(A,B,C,D,x,clk,rst);
    output A,B,C,D;
    input x,clk,rst;
    wire
        JA,KA, // A JK Flip-Flop
        JB,KB, // B JK Flip-Flop
        JC,KC, // C JK Flip-Flop
        JD,KD; // D JK Flip-Flop
    
    // Assign Flip-Flop input equations
    // A JK Flip-Flop
    assign JA = (B & C & D & ~x) | (~B & ~C & ~D & x); // JA = BCDx' + B'C'D'x
    assign KA = B | C | (D & ~x) | (~D & x); // KA = B + C + Dx' + D'x
    // B JK Flip-Flop
    assign JB = (A & ~C & ~D & x) | (~A & C & D & ~x); // JB = AC'D'x + A'CDx'
    assign KB = A | (C & D & ~x) | (~C & ~D & x); // KB = A + CDx' + C'D'x
    // C JK Flip-Flop
    assign JC = (~A & D & ~x) | (A & ~B & ~D & x) | (~A & B & ~D & x); // JC = A'Dx' + AB'D'x + A'BD'x
    assign KC = (A & C) | (C & D & ~x) | (C & ~D & x); // KC = AC + CDx' + CD'x
    // D JK Flip-Flop
    assign JD = ~A | (~B & ~C); // JD = A' + B'C'
    assign KD = D; // KD = D or KD = 1

    // Instantiate JK Flip-Flops
    JK_FF F3(A,JA,KA,clk,rst);
    JK_FF F2(B,JB,KB,clk,rst);
    JK_FF F1(C,JC,KC,clk,rst);
    JK_FF F0(D,JD,KD,clk,rst);
endmodule
