#include <iostream>
#include <string>
#include <vector>

int main() {
    std::vector<std::string> instructions{};
    std::string input;

    while (std::getline(std::cin, input)) {
        instructions.push_back(input);
    }

    int res = 0;
    int curr = 50;

    for (const auto &instruction : instructions) {
        char direction = instruction[0];
        int mag = std::stoi(instruction.substr(1));
        res += mag / 100;

        mag %= 100;
        int old = curr;

        if (direction == 'L') {
            curr = (curr - mag + 100) % 100;
            if (curr > old && mag > 0) {
                res++;
            }
        } else if (direction == 'R') {
            curr = (curr + mag) % 100;
            if (curr < old && mag > 0) {
                res++;
            }
        }

    }
    std::cout << res << std::endl;

    return 0;
}
