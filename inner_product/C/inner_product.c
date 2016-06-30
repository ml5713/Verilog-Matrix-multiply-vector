#include "inner_product.h"

double inner_product(double *arg1, double *arg2, int size){
  double partial_product = 0;
  for(int i = 0; i < size; i++){
    partial_product += arg1[i] * arg2[i]; 
  }
  return partial_product;
}
