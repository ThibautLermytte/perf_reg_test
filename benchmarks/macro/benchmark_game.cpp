#include "play_game.h"
#include <benchmark/benchmark.h>
#include <iostream>

static void BENCHMARK_game_1_000(benchmark::State &state) {
	for (auto _ : state) {
		play_game(1000, false);
	}
}

BENCHMARK(BENCHMARK_game_1_000);

BENCHMARK_MAIN();
