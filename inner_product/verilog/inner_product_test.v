module inner_product_test
  #(parameter 
      num_elems = 4,
      data_width = 8)
  (
      input wire clk,
      output wire [7 : 0] outp,
      output wire [num_elems * data_width - 1 : 0] outp_inps
  );

  localparam
      num_bits = data_width * num_elems;

      //counter 
      reg [num_bits - 1 : 0] count;
      initial begin
          count = 0;
      end
      always @ (posedge clk)
          count <= count + 1;
      assign outp_inps = count;

      // instantiate 
      inner_product
          #(
                .N(num_elems),
                .DW(data_width)
          ) my_inner_product (
                .inp1(count),
                .inp2(count), // takes in count as 2 inputs 
                .outp(outp)
          );

endmodule
