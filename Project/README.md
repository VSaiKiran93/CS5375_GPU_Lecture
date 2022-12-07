Matrix Multiplication Kernel
===============================================================

**Texas Tech University, CS5375 Computer Systems Organization and Architecture, Project# 2**

  * Venkata Sai Kiran Kureti
  * R# 11786485
  * TTU e-mail: vkureti@ttu.edu

### Steps to execute the files
Include comments and analysis, etc.

Part-1
==================================================================================
 
 // Run the command to execute the given cpp file and store the file in .exe //
         g++ matrixMul_cpu.cpp -o matrixMul_cpu.exe 

// Then,  
         time ./matrixMul_cpu.exe 

// To execute the  cuda file //
         interactive -p gpu-build

// Run the command to execute cuda file and store the file in .exe // 
         nvcc matrixMul_gpu.cu -o matrixMul_gpu.exe

// for computation time on avg //
         ./matrixMul_gpu.exe

//Profiling //
         nvprof ./matrixMul_gpu.exe

Part-2
====================================================================================

// Run // 
           nvcc matrixMul_gpu_Part2.cu -o matrixMul_gpu_Part2.exe

// for computation time on avg //
           ./matrixMul_gpu_Part2.exe

//Profiling //
           nvprof ./matrixMul_gpu_Part2.exe


Part-3
===================================================================================
// Run to execute // 
           nvcc matrixMul_gpu_Part3.cu -o matrixMul_gpu_Part3.exe

// for computation time on avg //
           ./matrixMul_gpu_Part3.exe

//Profiling //
           nvprof ./matrixMul_gpu_Part3.exe


Part-4
====================================================================================
// Run // 
           nvcc matrixMul_gpu_Part4.cu -o matrixMul_gpu_Part4.exe

// for computation time on avg //
          ./matrixMul_gpu_Part4.exe

//Profiling //
         nvprof ./matrixMul_gpu_Part4.exe




