#include <stdio.h>
#include "matrix_mult_vector.h"

int main(){

  double row1[3] = {1,2,3};
  double row2[3] = {4,5,6};
  double row3[3] = {7,8,9};
  double *matrix[3] = {row1, row2, row3};

  double vector[3] = {1,1,1};

  double result[3];
  matrix_mult_vector(matrix, vector, 3, 3, result);

  printf("product is: \n");
  for(int i=0; i < 3; i++){
    printf("%f ",result[i]);
  }
  return 0;
}
