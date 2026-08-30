module alu(
	input [7:0] A, B,
	input [3:0] op,
	input rst,
	output reg [8:0] out
);

always @ (*) begin
	if (!rst) begin
		out = 8'b0;
	end
	else begin
	case (op)
		4'b0000:  out = A+B; //Add
		4'b0001:  out = A-B; //Subtract
		4'b0010:  out = A+1; //increment
		4'b0011:  out = (A != 8'b0) ? A-1 : 0; //Decrement
		4'b0100:  out = A&B; //AND Operation
		4'b0101:  out = A|B; //OR Operation
		4'b0110:  out = A^B; //XOR operation
		4'b0111:  out = ~A; //NOT Operation
		4'b1000:  out = A<<1; //Left shift by 1
		4'b1001:  out = A>>1; //Right shift by 1
		default:  out = 0; //Default
	endcase
	end
end
endmodule

