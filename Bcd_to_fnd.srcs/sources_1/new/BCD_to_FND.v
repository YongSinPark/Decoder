`timescale 1ns / 1ps

module BCD_to_FND(
    input [1:0] i_disit_select,
    input [3:0] i_value,
    input i_enable,
    output [3:0] o_disit,
    output [7:0] o_font
    );

    FND_select_decoder Fnd_digit_decoeder(
        .i_disit_select(i_disit_select),
        .i_enable(i_enable),
        .o_disit(o_disit)
    );

    BCD_to_FND_decoder Fnd_font_decoeder(
        .i_value(i_value),
        .i_enable(i_enable),
        .o_font(o_font)
    );
endmodule
