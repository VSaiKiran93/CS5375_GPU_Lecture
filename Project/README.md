Matrix Multiplication Kernel
======================

**Texas Tech University, CS5375 Computer Systems Organization and Architecture, Project**

  * Venkata Sai Kiran Kureti
  * R# 11786485
  * TTU e-mail: vkureti@ttu.edu

### (TODO: Your README)

Include comments and analysis, etc.
 
 // Run the command to execute the cpp file and store the file in .exe //
g++ matrixMul_cpu.cpp -o matrixMul_cpu.exe 

// Then,  
time ./matrixMul_cpu.exe 

// To execute the  cuda file //
interactive -p gpu-build

// Run // 
nvcc matrixMul_gpu.cu -o matrixMul_gpu.exe

//Profiling //
nvprof ./matrixMul_gpu.exe



