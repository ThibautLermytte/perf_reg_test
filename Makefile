MACROBENCH_TARGET	:=	macrobenchmark_game
MICROBENCH_TARGET	:=	microbenchmark_game
MACROBENCH_RESULT	:=	macrobnechmark_result.json
MICROBENCH_RESULT	:=	microbnechmark_result.json

CXXFLAGS		:= 	-std=c++11 -isystem
LDFLAGS  		:= 	-Llib -lbenchmark -lpthread
INCLUDE  		:= 	include/
BENCH_FLAGS		:=	--benchmark_out_format=json --benchmark_out=

SRC_DIR			:=	src
BENCH_DIR		:=	benchmarks
BUILD_DIR  		:= 	build
OBJ_DIR  		:= 	$(BUILD_DIR)/objects
BIN_DIR  		:= 	$(BUILD_DIR)/bin
MACROBENCH_DIR		:=	$(BENCH_DIR)/macro
MICROBENCH_DIR		:=	$(BENCH_DIR)/micro

SRCS      		:= 	$(wildcard $(SRC_DIR)/*.cpp)
MACROBENCH_SRCS 	:= 	$(wildcard $(MACROBENCH_DIR)/*.cpp)
MICROBENCH_SRCS 	:= 	$(wildcard $(MICROBENCH_DIR)/*.cpp)

OBJS 			:= 	$(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.o,$(SRCS))
MACROBENCH_OBJS 	:= 	$(MACROBENCH_SRCS:.cpp=.o)
MICROBENCH_OBJS 	:= 	$(MICROBENCH_SRCS:.cpp=.o)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp 
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

$(MACROBENCH_DIR)/%.o: $(MACROBENCH_DIR)/%.cpp
	@mkdir -p $(MACROBENCH_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

$(MICROBENCH_DIR)/%.o: $(MICROBENCH_DIR)/%.cpp
	@mkdir -p $(MICROBENCH_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

macrobenchmark: $(OBJS) $(MACROBENCH_OBJS)
	$(CXX) $^ $(LDFLAGS) -o $(MACROBENCH_DIR)/$(MACROBENCH_TARGET)
	./$(MACROBENCH_DIR)/$(MACROBENCH_TARGET) $(BENCH_FLAGS)$(MACROBENCH_RESULT)

microbenchmark: $(OBJS) $(MICROBENCH_OBJS)
	$(CXX) $^ $(LDFLAGS) -o $(MICROBENCH_DIR)/$(MICROBENCH_TARGET)
	./$(MICROBENCH_DIR)/$(MICROBENCH_TARGET) $(BENCH_FLAGS)$(MICROBENCH_RESULT)

all: macrobenchmark microbenchmark

clean:
	@rm -rf $(BUILD_DIR) $(MACROBENCH_DIR)/*.o $(MICROBENCH_DIR)/*.o $(MACROBENCH_DIR)/$(MACROBENCH_TARGET) $(MICROBENCH_DIR)/$(MICROBENCH_TARGET)

clean_results:
	@rm -f $(MACROBENCH_RESULT) $(MICROBENCH_RESULT)

clean_all: clean clean_results
