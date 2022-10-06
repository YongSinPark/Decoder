`timescale 1ns / 1ps

module tb_BCD_to_FND_decoder();
    reg [3:0] i_value;
    reg i_enable;
    wire [7:0] o_font;

    reg [1:0] i_disit_select;
    wire [3:0] o_disit;

    FND_select_decoder dut(
        .i_disit_select(i_disit_select),
        .i_enable(i_enable),
        .o_disit(o_disit)
    );

    BCD_to_FND_decoder dut1(
        .i_value(i_value),
        .i_enable(i_enable),
        .o_font(o_font)
    );

    initial begin
        #00 i_enable = 1'b1; i_disit_select = 2'b00;
        #00 i_enable = 1'b1; i_disit_select = 2'b01;
        #00 i_enable = 1'b1; i_disit_select = 2'b10;
        #10 i_enable = 1'b1; i_disit_select = 2'b11;

        #10 i_enable = 1'b1; i_disit_select = 2'b00; i_value = 4'h0;
        #10 i_enable = 1'b1; i_disit_select = 2'b01; i_value = 4'h5;
        #10 i_enable = 1'b1; i_disit_select = 2'b10; i_value = 4'h9;
        #10 i_enable = 1'b1; i_disit_select = 2'b11; i_value = 4'hf;
        #10 i_enable = 1'b1; i_disit_select = 2'b11; i_value = 4'h4;
        #10 i_enable = 1'b1; i_disit_select = 2'b11; i_value = 4'h3;
        #10 i_enable = 1'b1; i_disit_select = 2'b11; i_value = 4'h8;
        #10 i_enable = 1'b1; i_disit_select = 2'b11; i_value = 4'h7;
        
        #10 $finish;
    end

endmodule
