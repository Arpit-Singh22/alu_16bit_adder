module alu (
    x,y,z,sign,zero,carry,parity,overflow
);
    input [15:0] x,y;
    output [15:0] z;
    output sign,zero,carry,parity,overflow;

    assign {carry,z} = x + y;   // 16-bit addition
    assign sign = z[15];     // most significant digit 1-> - , 0->+
    assign zero = ~|z;      // NOR if output is = 0, zero wii be set to 1
    assign parity = ~^z;    // XNOR even parity = 1 , odd parity=0
    assign overflow = (x[15] & y[15] & ~z[15]) | (x[15] & ~y[15] & z[15]); 


endmodule