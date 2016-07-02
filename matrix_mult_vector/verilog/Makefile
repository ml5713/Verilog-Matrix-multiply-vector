# build and run simulation
# 

# tools
VERILOG:=iverilog
SIMULATOR:=vvp

SRCS := matrix_mult_vector.v matrix_mult_vector_test.v matrix_mult_vector_tb.v inner_product.v

.PHONY : all

all: matrix_mult_vector


# build simulation
matrix_mult_vector : $(SRCS)
	$(VERILOG) -o $@  $(SRCS)	


# run simulation
.PHONY : runsim
runsim:
	$(SIMULATOR) matrix_mult_vector


# cleanup
.PHONY : clean
clean:
	$(RM) *.o

# delete all built files
.PHONY : realclean
realclean:
	$(RM) matrix_mult_vector

