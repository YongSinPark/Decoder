`timescale 1ns / 1ps

module FND_select_decoder(
    input [1:0] i_disit_select,  //wire base, non_memoey
    input i_enable,
    output [3:0] o_disit
    );

    reg [3:0] r_digit; // memory_enable
    assign o_disit = r_digit;

    always @(i_disit_select, i_enable) // , -> or 
    begin 
        if (i_enable) 
        begin
            r_digit = 4'b1111;
        end
        else 
        begin
            case (i_disit_select)
                2'h0 : r_digit= 4'b1110;
                2'h1 : r_digit= 4'b1101;
                2'h2 : r_digit= 4'b1011;
                2'h3 : r_digit= 4'b0111;
            endcase
        end
    end
endmodule

