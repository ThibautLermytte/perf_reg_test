all:
	g++ benchmark_game.cpp play_game.cpp -std=c++11 -isystem include/ -L. -lbenchmark -lpthread -o mybenchmark
clean:
	rm mybenchmark
perf:
	bencher run --project thibaut-lermytte-s-project --adapter cpp_google "./mybenchmark --benchmark_format=json"	
