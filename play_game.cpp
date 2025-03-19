#include <iostream>
#include <string>

bool is_fibonacci_number(int n) {
	for (int i = 0; i <= n; i++) {
		int previous{0}, current{1};

		while (current < n) {
			int next{previous + current};

			previous = current;
			current = next;
		}
		if (current == n)
			return true;
	}
	return false;
}

std::string fizz_buzz(int n) {
	if (is_fibonacci_number(n)) {
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
