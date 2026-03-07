module mux (
    output logic [31:0] f,
    input logic [31:0] i0, i1, i2, i3,
    input logic [1:0] sel
);
    logic [3:0] [31:0] arrayF;
    logic [1:0] not_sel;

    for (genvar i = 0; i < 32; i = i + 1) begin
        and g1(arrayF[0][i], i0[i], not_sel[0], not_sel[1]),
            g2(arrayF[1][i], i1[i], sel[0], not_sel[1]),
            g3(arrayF[2][i], i2[i], not_sel[0], sel[1]),
            g4(arrayF[3][i], i3[i], sel[0], sel[1]);
            
        or  g5(f[i], arrayF[0][i], arrayF[1][i], arrayF[2][i], arrayF[3][i]);    
    end

    not g6(not_sel[0], sel[0]),
        g7(not_sel[1], sel[1]);

endmodule