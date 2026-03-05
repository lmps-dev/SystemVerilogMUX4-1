`timescale 1ns/1ps

module mux (
    output logic f,
    input logic i0, i1, i2, i3, sel1, sel2
);
    and g0(f0, i0, sel1, sel2),
            g1(f1, i1, not_sel1, sel2),
            g2(f2, i2, sel1, not_sel2),
            g3(f3, i3, not_sel1, not_sel2);

    or g4(f, f0, f1, f2, f3);
    not g5(not_sel1, sel1),
        g6(not_sel2, sel2);

endmodule