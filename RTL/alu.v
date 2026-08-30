//Verilog code for 8Bit ALU

module alu(
	input [7:0] A, B,
	input [3:0] op,
	input rst_n,
	output reg [7:0] out,
	output reg carr, borr
);

always @ (*) begin
	out = 0;
	carr = 0;
	borr = 0;
	if (!rst_n) begin //Active Low Reset
		out = 8'b0;
		carr = 0;
		borr = 0;
	end
	else begin
	case (op)
		4'b0000:  {carr, out} = {1'b0, A} + {1'b0, B}; //Add
		4'b0001:  
		begin //Subtract
			out = A-B;
			borr = (A<B); 
		end
		4'b0010:  {carr, out}  = {1'b0, A} + 1; //increment
		4'b0011:  
		begin //Decrement
		    out = A-1;
			borr = (A == 0); 
		end
		4'b0100:  out = A&B; //AND Operation
		4'b0101:  out = A|B; //OR Operation
		4'b0110:  out = A^B; //XOR operation
		4'b0111:  out = ~A; //NOT Operation
		4'b1000:  //Left shift by 1
		begin
			out = A<<1;
			carr = A[7]; 		
		end
		4'b1001:  //Right shift by 1
		begin
			out = A>>1; 
			carr = A[0]; 
		end
		default:  //Default
		begin
			out = 0; 
			carr = 0; 
			borr = 0; 	
		end
		endcase
	end
end
endmodule

