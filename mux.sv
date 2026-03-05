module mux (
    output logic [31:0] f,
    input logic [31:0] i0, i1, i2, i3,
    input logic [1:0] sel,
);

    and g0 [31:0] (f0, i0, sel[0], sel[1]),
        g1 [31:0] (f1, i1, not_sel0, sel[1]),
        g2 [31:0] (f2, i2, sel[0], not_sel1),
        g3 [31:0] (f3, i3, not_sel0, not_sel1);

    or g4 [31:0] (f, f0, f1, f2, f3);
    not g5 [31:0] (not_sel0, sel[0]),
        g6 [31:0] (not_sel1, sel[1]);

endmodule