module l1(input clock, input[4:0] endr_in, input [9:0] dado_in, input w, input dado_mem_in, input mem_pronto, output reg [9:0] dado_out, output reg [4:0] endr_mem_out, output reg [4:0] endr_mem_wb_out, output reg [9:0] dado_mem_wb_out);
	reg [9:0] dados [7:0];
	reg [1:0] tags [7:0];
	reg [1:0] estados [7:0];
	
	reg [1:0] msg_in, estado_out;
	reg shared, wb;
	reg nova_mem;
	
	wire [2:0] endr;
	wire [1:0] tag;
	
	assign endr = endr_in[2:0];
	assign tag = endr_in[4:3];
	
	integer i;
	
	initial begin
		for(i = 0; i < 32; i = i + 1){
			dados[i] = 1'b0;
			estados[i] = 2'b11;
		}
		nova_mem = 1'b0;
	end
	
	always @(negedge clock) begin
		
		if(!nova_mem) begin
		
			if(estados[endr] == 2'b11 || tags[endr] != tag) begin
				
				nova_mem = 1'b1;
				if(w) begin // wm
					msg_in = 2'b11;
				end else begin // rm
					msg_in = 2'b01;
				end
				
				if(wb) begin
					endr_mem_wb_out = {tags[endr], endr};
					dado_mem_wb_out = dados[endr];
				end
				
				endr_mem_out = endr_in;
				tags[endr] = tag;
				
			end else begin
				if(w) begin // wh
					msg_in = 2'b10;
					dados[endr] = dado_in;
				end else begin // rh
					msg_in = 2'b00;
					dado_out = dados[endr];
				end
			end
			
			estados[endr] = estado_out;
		
		end else if(mem_pronto) begin
			nova_mem = 1'b0;
			dados[endr] = dado_mem_in;
			if(w)
				dados[endr] = dado_in;
		end
		
		
		
		
		
		
		
  end
  
  mesiEmissor me(.estado_in(estados[endr]), .msg_in(msg_in), .shared(shared), .estado_out(estado_out), output reg [1:0] msg_out, .wb(wb));
  mesiReceptor mr(input [1:0] estado_in, input [1:0] msg_in, output reg [1:0] estado_out, output reg wb, output reg abt_mem_acs);
	
endmodule