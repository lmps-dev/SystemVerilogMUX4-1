`timescale 1ns/1ps

module tb_mux;
    logic [5:0] count;
    logic muxOut;

    mux dut(.f(muxOut), .i0(count[0]), .i1(count[1]), .i2(count[2]), .i3(count[3]), .sel1(count[4]), .sel2(count[5]));

    initial begin
        $monitor($time, "i0 = %b | i1 = %b | i2 = %b | i3 = %b | sel1 = %b | sel2 = %b | muxOut = %b", count[0], count[1], count[2], count[3], count[4], count[5], muxOut);
        for (count = 0; count != 6'b111111; count++) #10;
        #10 $stop;
    end


endmodule: tb_mux