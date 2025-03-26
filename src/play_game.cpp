#include <iostream>
#include <string>
#include "is_fibonacci_number.h"

std::string fizz_buzz(int n) {
	if (is_fibonacci_number_slow(n)) {
		return "Fibonacci";
	} else if (n % 15 == 0) {
		return "FizzBuzz";
	} else if (n % 3 == 0) {
		return "Fizz"; 
	} else if (n % 5 == 0) {
		return "Buzz";
	} else {
		return std::to_string(n);
	}
}

void play_game(int n, bool should_print) {
	std::string res{fizz_buzz(n)};

	if (should_print) {
		std::cout << res << std::endl;
	}
}
