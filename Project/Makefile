all: 
	cpu GPU_Part1 GPU_Part2 GPU_Part3 GPU_Part4

cpu:
	g++ matrixMul_cpu.cpp -o matrixMul_cpu.exe
GPU_Part1:
	nvcc matrix_Mul_gpu_part1.cu -o matrix_Mul_gpu_part1.exe
GPU_Part2:
	nvcc matrix_Mul_gpu_part2.cu -o matrix_Mul_gpu_part2.exe
GPU_Part3:
	nvcc matrix_Mul_gpu_part3.cu -o matrix_Mul_gpu_part3.exe
GPU_Part4:
	nvcc matrix_Mul_gpu_part4.cu -o matrix_Mul_gpu_part4.exe
clean:
	rm *.exe 