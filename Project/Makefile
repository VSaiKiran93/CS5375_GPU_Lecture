all:
  matrixMul_cpu.cpp matrixMul_gpu.cu matrixMul_gpu_Part1.cu matrixMul_gpu_Part2.cu matrixMul_gpu_Part3.cu matrixMul_gpu_Part4.cu
 
matrixMul_cpu.cpp:
 g++ matrixMul_cpu.cpp -o matrixMul_cpu.exe
 ./matrixMul_cpu.exe
 time ./matrixMul_cpu.exe
 
matrixMul_gpu.cu:
 interative -p gpu-build
 nvcc matrixMul_gpu.cu -o matrixMul_gpu.exe
 ./matrixMul_gpu.exe
 nvprof ./matrixMul_gpu.exe

matrixMul_gpu_part2.cu:
 nvcc matrixMul_gpu_Part2.cu -o matrixMul_gpu_Part2.exe
 ./matrixMul_gpu_Part2.exe
 nvprof ./matrixMul_gpu_Part2.exe
 
matricMul_gpu_Part3.cu:
 nvcc matrixMul_gpu_Part3.cu -o matrixMul_gpu_Part3.exe
 ./matrixMul_gpu_Part3.exe
 nvprof ./matrixMul_gpu_Part3.exe
 
matrixMul_gpu_Part4.cu:
 nvcc matrixMul_gpu_Part4.cu -o matrixMul_gpu_Part4.exe
 ./matrixMul_gpu_Part4.exe
 nvprof ./matrixMul_gpu_Part4.exe
 
clean:
  rm *.exe
