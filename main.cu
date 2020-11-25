#include <iostream>
#include "sha256_on_gpu.h"


int main() {
    int threads = 1;
    int blocks = 1;
    sha256_on_gpu_test();
    sha256_on_gpu_bench(threads,blocks);
//    std::cout << "Hello, World!" << std::endl;
    return 0;
}
