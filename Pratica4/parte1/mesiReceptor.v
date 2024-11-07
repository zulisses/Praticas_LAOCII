/*
estado:
00 -> M
01 -> E
10 -> S
11 -> I


msg: 
00 -> rh
01 -> rm
10 -> wh
11 -> wm
*/


module mesiReceptor(input [1:0] estado_in, input [1:0] msg_in, output reg [1:0] estado_out, output reg wb, output reg abt_mem_acs, output reg fazNada);
	
	always @(estado_in, msg_in) begin
		case(estado_in)
		
			2'b00: begin // M
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						wb <= 1'b1; 
						abt_mem_acs <= 1'b1;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b11; // I
						wb <= 1'b1;
						abt_mem_acs <= 1'b1;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b01: begin // E
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						wb <= 1'b0;
						abt_mem_acs <= 1'b0;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b11; // I
						wb <= 1'b0;
						abt_mem_acs <= 1'b0;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b10: begin // S
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						wb <= 1'b0;
						abt_mem_acs <= 1'b0;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'bXX;
						wb <= 1'bX;
						abt_mem_acs <= 1'bX;
						fazNada <= 1;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b11; // I
						wb <= 1'b0;
						abt_mem_acs <= 1'b0;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b11: begin // I
				estado_out <= 2'bXX;
				wb <= 1'bX;
				abt_mem_acs <= 1'bX;
				fazNada <= 1;
			end
			
		endcase
	end
	
endmodule