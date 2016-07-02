module matrix_mult_vector
  #(parameter
      M = 4, // matrix dimension M x N
      N = 4, // matrix dimension M x N, also vector dimension
      DW = 8
  )
  (
      input wire[(DW * N * M) -1 : 0] matrix_inp,
      input wire[(DW * N) -1 : 0] vector_inp,
      output wire[(2*DW+$bits(N))*M - 1 : 0] outp
  );

  //locals
  genvar i;
  wire [(2*DW + $bits(N)) * M - 1 : 0] dot_products; // dot products from each row 


  ///compute
  generate 
      for (i = 0; i < M; i = i + 1) begin: product_loop
        // instantiate 
        inner_product
          #(
                .N(N),
                .DW(DW)
          ) my_inner_product (
                .inp1( matrix_inp[(DW * N * (i+1)) - 1 : (DW * N * i)] ),
                .inp2(vector_inp),  
                .outp(dot_products[(2*DW + $bits(N))*(i+1) - 1 : 
                                    (2*DW + $bits(N))*i ])
          );
      end
  endgenerate

  assign outp = dot_products; 


endmodule
