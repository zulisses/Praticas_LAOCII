module mesi(input [17:0] SW, output [0:6] HEX0, output [0:6] HEX1, output [0:6] HEX2);
	wire [1:0] estado_in, msg_in, estado_ems, msg_ems, estado_rcpt;
	wire [3:0] estado_out, msg_out, wb_out;

	wire shared, emsOuRcpt, wb_ems, wb_rcpt, abt_mem_acs, fazNada_ems, fazNada_rcpt;

	assign estado_in = SW[1:0];
	assign msg_in = SW[17:16];
	assign shared = SW[10];
	assign emsOuRcpt = SW[5];

	mesiEmissor me (.estado_in(estado_in), .msg_in(msg_in), .shared(shared), .estado_out(estado_ems), .msg_out(msg_ems), .wb(wb_ems), .fazNada(fazNada_ems));

	mesiReceptor mr (.estado_in(estado_in), .msg_in(msg_in), .estado_out(estado_rcpt), .wb(wb_rcpt), .abt_mem_acs(abt_mem_acs), .fazNada(fazNada_rcpt));

	assign estado_out = emsOuRcpt ? (fazNada_ems ? 4'b1111 : {2'b00, estado_ems}) : (fazNada_rcpt ? 4'b1111 : {2'b00, estado_rcpt});
	assign msg_out = emsOuRcpt ? (fazNada_ems ? 4'b1111 : {2'b00, msg_ems}) : 4'b1111;
	assign wb_out = emsOuRcpt ? (fazNada_ems ? 4'b1111 : {3'b000, wb_ems}) : (fazNada_rcpt ? 4'b1111 : {3'b000, wb_rcpt});

	decodificadorComportamental d0(estado_out , HEX0);
	decodificadorComportamental d1(msg_out, HEX1);
	decodificadorComportamental d2(wb_out, HEX2);

endmodule