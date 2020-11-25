#include <iostream>
#include "sha256_on_gpu.h"


int main() {
    sha256_on_gpu_test();
    sha256_on_gpu_bench();
//    std::cout << "Hello, World!" << std::endl;
    return 0;
}
