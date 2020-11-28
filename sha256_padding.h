//
// Created by neville on 03.11.20.
//

#include <string>
#include <vector>
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <cstring>

// Padding is performed on cpu

#ifndef SHAONGPU_PADDING_H
#define SHAONGPU_PADDING_H

// return vector is currently passed by value, could be optimized
std::vector<uint32_t> sha256_padding(const std::string &in) {


        // Padding is always performed!
        int remainder = in.length() % 64;
        int k;

        // Calculate k
        if (remainder < 55) {
            k = 56 - remainder - 1;
        } else {
            k = (56 + 64) - remainder - 1;

        }
        const int newlength = in.length() + k + 1 + 8; // new lenngth in uint8
        std::vector<uint32_t> out(newlength / 4);

        std::memcpy(out.data(), in.data(), in.length() * sizeof(char)); // copy existing data

    // Write leading 1
    auto *start_point = (uint8_t *) out.data();
    start_point[in.length()] = 0x80;

    // Fill leading zeros
    for (unsigned int i = in.length() + 1; i < newlength - 4; i++) {
        start_point[i] = 0;
    }

//        // Write L at the end
    auto end_point = (uint64_t *) &start_point[newlength - 8];
    const uint64_t bitlength = in.length() * sizeof(char) * 8;
//    end_point[0] = __builtin_bswap64(bitlength); // Save length and change byte ordering
    end_point[0] = _byteswap_uint64(bitlength); // Save length and change byte ordering
    return out;

}

#endif //SHAONGPU_PADDING_H
