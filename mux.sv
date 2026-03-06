module mux (
    output logic [31:0] f,
    input logic [31:0] i0, i1, i2, i3,
    input logic [1:0] sel
);

    always_comb begin
        case(sel)
            2'b00: f = i0;
            2'b01: f = i1;
            2'b10: f = i2;
            2'b11: f = i3;
            default: f = '0;
        endcase
    end

endmodule