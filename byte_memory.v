
module byte_memory(
 input [7:0] data,
    input store,
    output [7:0] memory
);

    // Herein, implement D-Latch style memory
    // that stores the input data into memory
    // when store is high
    
    // Memory should always output the value
    // stored, and it should only change
    // when store is high
    
d_latch D0(
     .D(data[0]),
     .Q(memory[0]),
     .NotQ(),
     .E(store)
    );
    
d_latch D1(
     .D(data[1]),
     .Q(memory[1]),
     .NotQ(),
     .E(store)
    );
    
d_latch D2(
     .D(data[2]),
     .Q(memory[2]),
     .NotQ(),
     .E(store)
    );
    
d_latch D3(
     .D(data[3]),
     .Q(memory[3]),
     .NotQ(),
     .E(store)
    );

d_latch D4(
     .D(data[4]),
     .Q(memory[4]),
     .NotQ(),
     .E(store)
    );
    
d_latch D5(
     .D(data[5]),
     .Q(memory[5]),
     .NotQ(),
     .E(store)
    );
    
d_latch D6(
     .D(data[6]),
     .Q(memory[6]),
     .NotQ(),
     .E(store)
    );
    
d_latch D7(
     .D(data[7]),
     .Q(memory[7]),
     .NotQ(),
     .E(store)
    );
 
endmodule

    
  
