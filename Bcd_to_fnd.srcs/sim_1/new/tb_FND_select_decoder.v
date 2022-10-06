`timescale 1ns / 1ps

module tb_FND_select_decoder();
    reg [1:0] i_disit_select;
    reg i_enable;
    wire [3:0] o_disit;

    FND_select_decoder dut(
        .i_disit_select(i_disit_select),
        .i_enable(i_enable),
        .o_disit(o_disit)
    );

    initial begin
        #00 i_enable = 1'b1; i_disit_select = 2'b00;
        #10 i_enable = 1'b1; i_disit_select = 2'b01;
        #10 i_enable = 1'b1; i_disit_select = 2'b10;
        #10 i_enable = 1'b1; i_disit_select = 2'b11;

        #10 i_enable = 1'b0; i_disit_select = 2'b00;
        #10 i_enable = 1'b0; i_disit_select = 2'b01;
        #10 i_enable = 1'b0; i_disit_select = 2'b10;
        #10 i_enable = 1'b0; i_disit_select = 2'b11;

        #10 $finish;
    end
    
endmodule
