#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <iostream>

__global__
void GPUmatmul(double *x, double *y, double *ans, int N) 
{
  //calculates the unique thread ID in the block
	int t= (blockDim.x*blockDim.y)*threadIdx.z+(threadIdx.y*blockDim.x)+(threadIdx.x);
	//calculates the unique block ID in the grid
	int b= (gridDim.x*gridDim.y)*blockIdx.z+(blockIdx.y*gridDim.x)+(blockIdx.x);
	//block size 
	int T= blockDim.x*blockDim.y*blockDim.z;
	//grid size
	int B= gridDim.x*gridDim.y*gridDim.z;
	 
    for (int i=b;i<N;i+=B)
    {
		for(int j=t;j<N;j+=T)
		{
			for(int k=0;k<N;k++)
			{
				ans[i*N+j]+=(x[i*N+k]*y[k*N+j]);
			}
		}
	}
}

// ---------------------------------------------------------------------- check
bool check(int N, double *ans)
{
  for(int i = 0; i < N; i++) {
    for(int j = 0; j < N; j++) {
      if(ans[i*N+j] != 20.0) return false;
    }
  }
  return true;
}

int main(int argc, char const *argv[])
{
    int N= 1<<9;
    int iter = 3;
    clock_t t;

    // matrices
    double *x, *y, *ans;
	
    //allocate memory -- accessible from both GPU and CPU
    cudaMallocManaged((void **) &x, N*N*sizeof(double));
    cudaMallocManaged((void **) &y, N*N*sizeof(double));
    cudaMallocManaged((void **) &ans, N*N*sizeof(double));

    // random initialize matrix A
    for (int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            x[i*N+j] = 5;
            y[i*N+j] = (i==j?1:0);
            ans[i*N+j] = (double)0.000000000000;
        }
    }
    
    // Run the kernel
    double avg = 0;
    std::cout<<"Starting GPU computation"<<std::endl;
    for(int i = 0; i <= iter; i++) {
        t = clock();
        GPUmatmul<<<dim3(16,4,4), dim3(8,8,8)>>>(x, y, ans, N);
        t = clock() - t;
        if(i) avg += t;
    }

    avg /= iter;
    avg /= CLOCKS_PER_SEC;
    avg *= 1000;
    printf("It took %lf ms on avg.\n", avg);
    cudaThreadSynchronize();

    // validate results computed by GPU
    if(check(N,ans)) std::cout<<"RUN OK."<<std::endl;
        else std::cout<<"RUN NOT OK."<<std::endl;

    // free memory
    cudaFreeHost(x);
    cudaFreeHost(y);
    cudaFreeHost(ans);
    return 0;
}
