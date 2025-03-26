#include "is_fibonacci_number.h"
#include <benchmark/benchmark.h>

static const int fibonacci_number = 987;

static void BENCHMARK_is_fibonacci_number_slow(benchmark::State &state) {
	for (auto _ : state) {
		is_fibonacci_number_slow(fibonacci_number);
	}
}

static void BENCHMARK_is_fibonacci_number_fast(benchmark::State &state) {
	for (auto _ : state) {
		is_fibonacci_number_fast(fibonacci_number);
	}
}

BENCHMARK(BENCHMARK_is_fibonacci_number_slow);
BENCHMARK(BENCHMARK_is_fibonacci_number_fast);

BENCHMARK_MAIN();
