module mem(input clock, input [4:0] endr_leitura, input [4:0] endr_escrita, input [9:0] dado_in, input w, output [9:0] dado_out);
	reg [9:0] dados [31:0];
	
	integer i;
	
	initial begin
		for(i = 0; i < 32; i = i + 1)
			dados[i] = 0;
	end
	
	always @(negedge clock) begin
    if(w) begin
      dados[endr_escrita] = dado_in;
    end
  end
  
  assign dado_out = dados[endr_leitura];
	
endmodule