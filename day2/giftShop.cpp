#include <cstdint>
#include <iostream>
#include <string>

void processRange(const std::string& rangeStr, uint64_t& res) {
    size_t dash = rangeStr.find('-');
    if (dash == std::string::npos) return;

    uint64_t start = std::stoull(rangeStr.substr(0, dash));
    uint64_t end = std::stoull(rangeStr.substr(dash + 1));

    for (uint64_t num = start; num <= end; num++) {
        uint64_t curr = num;
        uint64_t digits = 0;
        while (curr) {
            digits++;
            curr /= 10;
        }
        if (digits % 2) continue;

        uint64_t factor = pow(10, digits / 2) + 1;
        if (!(num % factor)) {
            res += num;
        }
    }


}

int main() {
    std::string input;
    std::cin >> input;
    uint64_t res = 0;

    size_t pos = 0;
    while ((pos = input.find(',')) != std::string::npos) {
        processRange(input.substr(0, pos), res);
        input = input.substr(pos + 1);
    }
    processRange(input, res);
    std::cout << res << std::endl;
    return 0;
}
