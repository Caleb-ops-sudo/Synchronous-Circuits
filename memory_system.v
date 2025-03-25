
module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
    
);
wire [7:0] arr_vec[3:0];
wire [7:0] arr_vec2[3:0];
wire [3:0] selectDemuxOutput;

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
 
 data_demux demuxData(
 
 );
 
 
 
 mux mux1(
    .A(arr_vec2[0]),
    .B(arr_vec2[1]),
    .C(arr_vec2[2]),
    .D(arr_vec2[3]), 
    .Sel(addr),
    .Enable(1),
    .Y(memory)
);




demux_store store1(
    .data(store),
    .sel(addr),
    .A(selectDemuxOutput[0]),
    .B(selectDemuxOutput[1]),
    .C(selectDemuxOutput[2]),
    .D(selectDemuxOutput[3])
);



    
bytememory m0(
     .D(arr_vec[0]),
     .Q(arr_vec2[0]),
     .E(selectDemuxOutput[0])
    );
    
bytememory m1(
     .D(arr_vec[1]),
     .Q(arr_vec2[1]),
     .E(selectDemuxOutput[1])
    );
    
bytememory m2(
     .D(arr_vec[2]),
     .Q(arr_vec2[2]),
     .E(selectDemuxOutput[2])
    );
    
    
bytememory m3(
     .D(arr_vec[3]),
     .Q(arr_vec2[3]),
     .E(selectDemuxOutput[3])
     
    );
 
endmodule

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs




module mux(

    
    input [7:0] A, [7:0] B, [7:0] C, [7:0] D, 
    input [1:0] Sel,
    input Enable,
    output [1:0] Y

);

assign Y = Enable == 1 ? Sel == 'b00 ? A :
           Sel == 'b01 ? B :
           Sel == 'b10 ? C : D : 0 ;
           
 
endmodule          
   
 
    
    
    
    
    
    
    
    
    
module demux_data(
    input [7:0] data,
    input [1:0] sel,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D
);

    always @(*) begin 
        case(sel)
            2'b00: {D, C, B, A} <= {8'b0, 8'b0, 8'b0, data}; 
            2'b01: {D, C, B, A} <= {8'b0, 8'b0, data, 8'b0};
            2'b10: {D, C, B, A} <= {8'b0, data, 8'b0, 8'b0};
            2'b11: {D, C, B, A} <= {data, 8'b0, 8'b0, 8'b0};
            
        endcase
    end
    
endmodule





module demux_store(
    input  data,
    input [1:0] sel,
    output reg  A,
    output reg  B,
    output reg  C,
    output reg  D
);

    always @(*) begin 
        case(sel)
            2'b00: {D, C, B, A} <= {1'b0, 1'b0, 1'b0, data}; 
            2'b01: {D, C, B, A} <= {1'b0, 1'b0, data, 1'b0};
            2'b10: {D, C, B, A} <= {1'b0, data, 1'b0, 1'b0};
            2'b11: {D, C, B, A} <= {data, 1'b0, 1'b0, 1'b0};
            
        endcase
    end    
    
endmodule
    
    


    


