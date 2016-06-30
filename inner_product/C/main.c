#include <stdio.h>
#include "inner_product.h"

int main(){
  printf("hello world\n");
  
  int SIZE = 3;

  double *d_array1 = (double *) malloc(sizeof(double)*SIZE);
  double *d_array2 = (double *) malloc(sizeof(double)*SIZE);

  for(int i = 0; i < SIZE; i++){
    d_array1[i] = i;
    d_array2[i] = i*2;
  }
  for(int i = 0; i < SIZE; i++){
    printf("%f\n", d_array1[i]); 
    printf("%f\n", d_array2[i]); 
  }

  double product = inner_product(d_array1, d_array2, 3);

  printf("inner product is: %f\n", product);
  free(d_array1);
  free(d_array2);
  return 0;
}
