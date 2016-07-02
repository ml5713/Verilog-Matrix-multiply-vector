#include "matrix_mult_vector.h"
#include "inner_product.h"

void matrix_mult_vector(double **matrix, double *vector, int column, int row, double* result_vector){

  for(int i = 0; i < row; i++){
    result_vector[i] = inner_product(matrix[i], vector, column);
  } 
  
}
