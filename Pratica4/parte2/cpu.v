/*
inst:
| op (1 bit) | endr (5 bits) | dado (10 bits) |

op:
1 -> ler 
0 -> escrever
*/

module cpu(input clock, input [15:0] inst, output reg [4:0] endr_dado, output reg [9:0] dado_out, output reg w);

	wire op;
	wire [4:0] endr;
	wire [9:0] dado;
	
	assign op = inst[15];
	assign endr = inst[14:10];
	assign dado = inst[9:0];

	always @(posedge clock) begin
		endr_dado = endr;
		if(op) begin // ler
			w = 1'b0;
			dado_out = 10'bXXXXXXXXXX;
		end else begin 
			w = 1'b1;
			dado_out = dado;
		end
	end
	
endmodule