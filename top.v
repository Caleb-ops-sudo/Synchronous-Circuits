module top(
     input [15:0] sw,
    input btnC,
    output [15:0] led
);
    d_latch latc(
        .D(sw[0]),
        .Q(led[0]),
        .NotQ(led[1]),
        .E(btnC)
    );
    memory_system meme(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led[15:8])

    );
    
 endmodule   
    
    

    
    
    
    
