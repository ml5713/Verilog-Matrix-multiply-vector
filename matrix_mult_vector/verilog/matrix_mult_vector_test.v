module matrix_mult_vector_test
  #(parameter 
      m_rows = 4,
      n_columns = 4, //also is the dimension of vector
      data_width = 8)
  (
      input wire clk,
      output wire [(2*data_width + $bits(n_columns))*m_rows - 1  : 0] outp,
      output wire [n_columns * data_width - 1 : 0] outp_inps
  );

  localparam
      num_bits = data_width * n_columns; // size in bits of a vector

      //counter 
      reg [num_bits - 1 : 0] count;
      reg [num_bits * m_rows -1 : 0] multiple_counts; // for matrix input
      initial begin
          count = 0;
          multiple_counts = 0;
      end
      always @ (posedge clk) begin
          count <= count + 1;
          multiple_counts <= multiple_counts + 1; // TODO: count value in all rows
      end
      assign outp_inps = count;

      // instantiate 
      matrix_mult_vector
          #(
                .M(m_rows),    
                .N(n_columns),
                .DW(data_width)
          ) my_matrix_mult_vector (
                .matrix_inp(multiple_counts),
                .vector_inp(count), // takes in count as 2 inputs 
                .outp(outp)
          );

endmodule
