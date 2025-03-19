#include "play_game.h"
#include <iostream>
#include <cstdlib>

int main(int argc, char *argv[]) {
	if (argc > 1 && std::isdigit(argv[0][1]) {
		int <i{std::atoi(argv[1]);

		play_game(i, true);
	} else {
		std::cout << "Please, enter a positive integer to play..." << std::endl;
	}
	return 0;
}
