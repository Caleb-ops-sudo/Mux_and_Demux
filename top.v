
module mux(


input [3:0] A, [3:0] B, [3:0] C, [3:0] D, 
input [1:0] Sel,
input Enable,
output [3:0] Y

);

assign Y = Enable == 1 ? Sel == 'b00 ? A :
           Sel == 'b01 ? B :
           Sel == 'b10 ? C : D : 0 ;
           
 
           
 endmodule          
           
           
           
           
           

module demux(
    input [3:0] DataIn,
    input [1:0] Sel,
    
    input Enable, 

    output [3:0] f1,
    output [3:0] f2,
    output [3:0] f3,
    output [3:0] f4
);

assign f1 = Enable == 1 ? (Sel == 2'b00 ? DataIn : 0) : 0;
assign f2 = Enable == 1 ? (Sel == 2'b01 ? DataIn : 0) : 0;
assign f2 = Enable == 1 ? (Sel == 2'b10 ? DataIn : 0) : 0;
assign f3 = Enable == 1 ? (Sel == 2'b11 ? DataIn : 0) : 0;


endmodule






module top(

input btnU, btnD, btnR, btnC, btnL,
input [15:0] sw,
output [15:0] led
);

wire [3:0] carry;
wire [1:0] mux_select;
wire [1:0] demux_select;

assign mux_select[0] = btnL;
assign mux_select[1] = btnU;

assign demux_select[0] = btnD; 
assign demux_select[1] = btnR;

assign Enable = ~btnC;


mux topmux(

.Enable(Enable),
.Y(carry),
.A(sw[3:0]),
.B(sw[7:4]), 
.C(sw[11:8]), 
.D(sw[15:12]),
.Sel(mux_slelect)
); 

demux topdemux(

.Enable(Enable),
.DataIn(carry),
.Sel(demux_select),
.f1(led[3:0]),
.f2(led[7:4]), 
.f3(led[11:8]), 
.f4(led[15:12])

);


endmodule
