#include <iostream>
#include "sha256_on_gpu.h"


int main(int argc, char* argv[]) {
    int threads = atoi(argv[1]);
    int blocks = atoi(argv[2]);
    sha256_on_gpu_test();
    sha256_on_gpu_bench(threads,blocks);
//    std::cout << "Hello, World!" << std::endl;
    return 0;
}
