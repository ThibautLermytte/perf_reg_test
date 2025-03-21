#include "play_game.h"
#include <benchmark/benchmark.h>
#include <iostream>

static void BENCHMARK_game_100(benchmark::State &state) {
	for (auto _ : state) {
		play_game(100, false);
	}
}

static void BENCHMARK_game_1_000_000(benchmark::State &state) {
	for (auto _ : state) {
		play_game(1000000, false);
	}
}

BENCHMARK(BENCHMARK_game_100);
BENCHMARK(BENCHMARK_game_1_000_000);

BENCHMARK_MAIN();
