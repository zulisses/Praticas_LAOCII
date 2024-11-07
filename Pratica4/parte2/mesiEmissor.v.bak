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


module mesiEmissor(input [1:0] estado_in, input [1:0] msg_in, input shared, output reg [1:0] estado_out, output reg [1:0] msg_out, output reg wb, output reg fazNada);
	
	always @(estado_in, msg_in) begin
		case(estado_in)
		
			2'b00: begin // M
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'b00; // M
						msg_out <= 2'b00; // rh
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						msg_out <= 2'b01; // rm
						wb <= 1'b1;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'b00; // M
						msg_out <= 2'b10; // wh
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm
						wb <= 1'b1;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b01: begin // E
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'b01; // E
						msg_out <= 2'b00; // rh
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						msg_out <= 2'b01; // rm
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm
						wb <= 1'b0;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b10: begin // S
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'b10; // S
						msg_out <= 2'b00; // rh
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b01: begin // rm
						estado_out <= 2'b10; // S
						msg_out <= 2'b01; // rm
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm (invalidate)
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm
						wb <= 1'b0;
						fazNada <= 0;
					end
				endcase
			end
			
			2'b11: begin // I
				case(msg_in)
					2'b00: begin // rh
						estado_out <= 2'bXX;
						msg_out <= 2'bXX;
						wb <= 1'bX;
						fazNada <= 1;
					end
					
					2'b01: begin // rm
						if(shared)
							estado_out <= 2'b10; // S
						else
							estado_out <= 2'b01; // E
						
						msg_out <= 2'b01; // rm
						wb <= 1'b0;
						fazNada <= 0;
					end
					
					2'b10: begin // wh
						estado_out <= 2'bXX;
						msg_out <= 2'bXX;
						wb <= 1'bX;
						fazNada <= 1;
					end
					
					2'b11: begin // wm
						estado_out <= 2'b00; // M
						msg_out <= 2'b11; // wm
						wb <= 1'b0;
						fazNada <= 0;
					end
				endcase
			end
			
		endcase
	end
	
endmodule