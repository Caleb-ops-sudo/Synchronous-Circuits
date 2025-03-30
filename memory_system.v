
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

    wire [7:0] dataInput [3:0];
    wire [7:0] dataOutput [3:0];
    wire [3:0] selectDemuxOutput; 

    byte_memory m0(
        .data(dataInput[0]),
        .store(selectDemuxOutput[0]), 
        .memory(dataOutput[0])
    );

    byte_memory m1(
        .data(dataInput[1]),
        .store(selectDemuxOutput[1]), 
        .memory(dataOutput[1])
    );

    byte_memory m2(
        .data(dataInput[2]),
        .store(selectDemuxOutput[2]), 
        .memory(dataOutput[2])
    );

    byte_memory m3(
        .data(dataInput[3]),
        .store(selectDemuxOutput[3]), 
        .memory(dataOutput[3])
    );







    demux_data dataDemux(
        .sel(addr),
        .data(data),
        .A(dataInput[0]), 
        .B(dataInput[1]),
        .C(dataInput[2]), 
        .D(dataInput[3])
    );

    demux_store enabDemux(
        .sel(addr),
        .data(store),
        .A(selectDemuxOutput[0]),
        .B(selectDemuxOutput[1]),
        .C(selectDemuxOutput[2]),
        .D(selectDemuxOutput[3])
    );

    mux outputSel(
        .Enable(1'b0),
        .Sel(addr),
        .Y(memory),
        .A(dataOutput[0]),
        .B(dataOutput[1]),
        .C(dataOutput[2]),
        .D(dataOutput[3])

    );

  
endmodule


    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs




    
