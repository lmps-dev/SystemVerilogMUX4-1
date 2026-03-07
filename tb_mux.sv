`timescale 1ns/1ps

module tb_mux;
    // Repete a lógica do setup anterior.
    logic [1:0] selector;  
    logic [31:0] muxOut; 
    logic [3:0] [31:0] inputs; 

    mux dut(.f(muxOut), .i0(inputs[0]), .i1(inputs[1]), .i2(inputs[2]), .i3(inputs[3]), .sel(selector)); //Responsável pela seleção das saídas em teste.

    initial begin
        // Monitorar quando houver variação em algum desses 7 valores. As vezes binário as vezes decimal.
        $monitor($time, "i0 = %d | i1 = %d | i2 = %d | i3 = %d | sel[1] = %b | sel[0] = %b | muxOut = %d", inputs[0], inputs[1], inputs[2], inputs[3], selector[1], selector[0], muxOut);

        inputs = '0; #10; //inicializando 
        muxOut = '0; #10;

        // Iteração para selecionar as saídas 
        for (int count = 0; count <= 1'b1; count++) begin
            for (int i = 0; i <= 2'b11; i++) begin
                selector = i;
                
                for (int j = 0; j <= 2'b11; j++) begin
                    inputs[j] = $urandom_range(0, 2**6) * 10; #10; // Função nativa de geração aleatória de valores de entrada.
                
                end
            end
        end

        $stop;
    end

endmodule: tb_mux