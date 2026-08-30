module alu_tb;

reg [7:0] A, B;
reg [3:0] op;
reg rst_n;
wire [7:0] out;
wire carr, borr;

alu dut(.A(A), .B(B), .op(op), .rst_n(rst_n), .out(out), .carr(carr), .borr(borr)); //Module instance for test

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, alu_tb);
    $display("A\t\tB\t\tOP\trst_n\tOut\t\tCarry\tBorrow");
    $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", A, B, op, rst_n, out, carr, borr);
    A = 8'd0; B = 8'h0; rst_n = 1; op = 4'h0;
    #20;
    A = 8'd25; B = 8'd10; op=4'h0;
    #20;
    A = 8'd40; B = 8'd20; op=4'h1;
    #20;
    A = 8'd102; B = 8'd189; op=4'h2;
    #20;
    A = 8'd182; B = 8'd1; op=4'h3;
    #20;
    A = 8'd102; B = 8'd124; op=4'h4;
    #20
    A = 8'd120; B = 8'd64; op=4'h5;
    #20;
    A = 8'd234; B = 8'd120; op=4'h6;
    #20;
    A = 8'b10101010; op=4'h7;
    #20;
    A = 8'b01101100; op=4'h8;
    #20;
    A = 8'b11010111; op=4'h9;
    #20;
    A = 8'd255; B = 8'd255; op = 4'h0;
    #20;
    A = 8'd12; B = 8'd120; op = 4'h1;
    #20;
    A = 8'd255; op=4'h8;
    #20;
    A = 8'd1; op=4'h9;
    #20;
    rst_n = 0;
    #20;
    rst_n = 1;
    #20;
    A = 8'd10; B = 8'd20; op = 4'ha;
    #20;
    A = 8'hFF; op=4'h2;
    #20;
    A = 8'h00; op=4'h3;
    #20;
    $finish;
end
endmodule
