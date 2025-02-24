//
// Created by neville on 03.11.20.
//

#ifndef SHAONGPU_SHA256_ON_GPU_H
#define SHAONGPU_SHA256_ON_GPU_H

#include <assert.h>
#include <string>
#include "sha256_padding.h"
#include "sha256_kernel_gpu.h"
#include <iostream>
#include <cmath>
#include "cuda_profiler_api.h"

std::string sha256_on_gpu(const std::string in, const bool benchmark = false, const int threads_per_block = 1, const int blocks = 1) {

    // 1. Padding
    std::vector<uint32_t> padded = sha256_padding(in);


    // 2. Change byte ordering since SHA-256 uses big endian byte ordering
    // This is only necessary to get the same result as other implementations
    for (int i = 0; i < padded.size(); i++) {
//        padded[i] = __builtin_bswap32(padded[i]);
        padded[i] = _byteswap_ulong(padded[i]);
    }

    // Copy data to gpu memory
    uint32_t *dev_In;
    uint32_t *dev_Out;

    cudaMalloc(&dev_In, padded.size() * sizeof(uint32_t));
    cudaMalloc(&dev_Out, 8 * sizeof(uint32_t));

    cudaMemcpy(dev_In, padded.data(), padded.size() * sizeof(uint32_t), cudaMemcpyHostToDevice);

    // Cal kernel
    sha256_kernel_gpu<<<1, 1>>>(dev_In, padded.size(), dev_Out);

    if (benchmark) {

        for (int i = 0; i < 10; i++) {
            sha256_kernel_gpu<<<blocks,threads_per_block>>>(dev_In, padded.size(), dev_Out);
        }
        cudaProfilerStart();
        for (int i = 0; i < 100; i++) {
            sha256_kernel_gpu<<<blocks,threads_per_block>>>(dev_In, padded.size(), dev_Out);
        }
        cudaProfilerStop();

    }


    // Copy result back
    std::vector<int> res_int(8);
    cudaMemcpy(res_int.data(), dev_Out, 8 * sizeof(int), cudaMemcpyDeviceToHost);


    // Convert Result to String
    std::string res_string = "";
    char buffer[50];
    for (int i = 0; i < res_int.size(); i++) {
        int curr = res_int[i];
        sprintf(buffer, "%x", curr);
        res_string += buffer;

    }
    return res_string;
}

void sha256_on_gpu_test() {

    std::string out = sha256_on_gpu("abc");
    assert(out == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");

    out = sha256_on_gpu("");
    assert(out == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");

    out = sha256_on_gpu("Neville");
    assert(out == "359ef5c170178ca7309c92222e3a03707f03194eed16b262ab35536cbd72536f");

    out = sha256_on_gpu("Basil");
    assert(out == "a3ef49d473eec07b75d8a7a93a71b1f46b0b7573aa35e4789b7572c52acff793");

    out = sha256_on_gpu(
            "Der Begriff Secure Hash Algorithm (kurz SHA, englisch für sicherer Hash-Algorithmus) bezeichnet eine Gruppe standardisierter kryptologischer Hashfunktionen. Diese dienen zur Berechnung eines Prüfwerts für beliebige digitale Daten (Nachrichten) und sind unter anderem die Grundlage zur Erstellung einer digitalen Signatur.\n"
            "Der Prüfwert wird verwendet, um die Integrität einer Nachricht zu sichern. Wenn zwei Nachrichten den gleichen Prüfwert ergeben, soll die Gleichheit der Nachrichten nach normalem Ermessen garantiert sein, unbeschadet gezielter Manipulationsversuche an den Nachrichten. Darum fordert man von einer kryptologischen Hashfunktion die Eigenschaft der Kollisionssicherheit: es soll praktisch unmöglich sein, zwei verschiedene Nachrichten mit dem gleichen Prüfwert zu erzeugen. ");
    assert(out == "598ae7a5cd9e62a4b605063f1f353a82aeb75a854a35e322c710275ed3f82883");

    out = sha256_on_gpu("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
    assert(out == "cd372fb85148700fa88095e3492d3f9f5beb43e555e5ff26d95f5a6adc36f8e6");
}

void sha256_on_gpu_bench(const int threads_per_block = 1, const int blocks = 1) {

    for (int i = 0; i < 9; i++) {
        std::cout << std::pow(10, i) << ": <" << threads_per_block << ", " << blocks << ">" << std::endl;
        sha256_on_gpu(std::string(std::pow(10, i), 'a'), true, threads_per_block, blocks);
    }

}


#endif //SHAONGPU_SHA256_ON_GPU_H
