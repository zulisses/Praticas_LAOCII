module mesi(input [15:0] SW, input [0:0] KEY, output [0:6] HEX0, output [0:6] HEX1, output [0:6] HEX2);
	wire clock, w1, w2, w3;
	wire [15:0] inst1, inst2, inst3;
	wire [4:0] endr_dado1, endr_dado2, endr_dado3;
	wire [9:0] dado_out1, dado_out2, dado_out3;

	reg [15:0] instrucoes1 [15:0];
	reg [15:0] instrucoes2 [15:0];
	reg [15:0] instrucoes3 [15:0];
	
	reg [17:0] instrucoes [15:0];

	assign clock = KEY[0];
	assign inst = SW[15:0];

	integer cont;

	initial begin
		cont = 0;

		instrucoes[0] = 18'b000000000000000000;
		instrucoes[1] = 18'b000000000000000000;
		instrucoes[2] = 18'b000000000000000000;
		instrucoes[3] = 18'b000000000000000000;
		instrucoes[4] = 18'b000000000000000000;
		instrucoes[5] = 18'b000000000000000000;
		instrucoes[6] = 18'b000000000000000000;
		instrucoes[7] = 18'b000000000000000000;
		instrucoes[8] = 18'b000000000000000000;
		instrucoes[9] = 18'b000000000000000000;
	end

	always @(posedge clock){
		if(instrucoes[cont][17:16] == 2'b00) 
			inst1 = instrucoes[cont][15:0];
		else if(instrucoes[cont][17:16] == 2'b01) 
			inst2 = instrucoes[cont][15:0];
		else if(instrucoes[cont][17:16] == 2'b10)
			inst3 = instrucoes[cont][15:0];
		
		cont++;
	}

	cpu cpu1(.clock(clock), .inst(inst1), .endr_dado(endr_dado1), .dado_out(dado_out1), .w(w1));
	l1 l1_1(.clock(clock), .endr(endr_dado1), .dado_in(dado_out1), .w(w1), .dado_out(dado_out1));
	
	cpu cpu2(.clock(clock), .inst(inst2), .endr_dado(endr_dado2), .dado_out(dado_out2), .w(w2));
	l1 l1_2(.clock(clock), .endr(endr_dado2), .dado_in(dado_out2), .w(w2), .dado_out(dado_out2));
	
	cpu cpu3(.clock(clock), .inst(inst3), .endr_dado(endr_dado3), .dado_out(dado_out3), .w(w3));
	l1 l1_3(.clock(clock), .endr(endr_dado3), .dado_in(dado_out3), .w(w3), .dado_out(dado_out3));
	
	

endmodule