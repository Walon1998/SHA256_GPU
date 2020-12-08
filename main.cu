#include <iostream>
#include "sha256_on_gpu.h"


int main(int argc, char *argv[]) {

    sha256_on_gpu_test();
    if (argc == 3) {
        int threads_per_block = atoi(argv[1]);
        int blocks = atoi(argv[2]);
        sha256_on_gpu_bench(threads_per_block, blocks);
    }

    return 0;
}
