module inner_product
  #(parameter
      N = 4,
      DW = 8
  )
  (
      input wire[(DW * N) -1 : 0] inp1,
      input wire[(DW * N) -1 : 0] inp2,
      output wire[(2*DW + $bits(N)) - 1 : 0] outp
  );

  //locals
  genvar i;
  wire [(2*DW + $bits(N)) - 1 : 0] sums[0 : N - 1]; // intermediate product sums

  ///compute
  assign sums[0] = inp1[DW - 1 : 0] * inp2[DW - 1 : 0];

  generate 
      for (i = 1; i < N; i = i + 1) begin: sum_loop
          assign sums[i] = sums[i-1] + inp1[ (i + 1) * DW - 1 : i * DW ] * inp2[ (i + 1) * DW - 1 : i * DW ];
      end
  endgenerate

  assign outp = sums[N-1]; 


endmodule
