TARGET				:=	game
MACROBENCH_TARGET	:=	macrobenchmark_game
MICROBENCH_TARGET	:=	microbenchmark_game

CXXFLAGS			:= 	-std=c++11 -isystem
LDFLAGS  			:= 	-L/usr/lib -lstdc++ -lm
INCLUDE  			:= 	-Iinclude/`

BENCH_DIR			:=	./benchmarks
MACROBENCH_DIR		:=	./benchmarks/macro
MICROBENCH_DIR		:=	./benchmarks/micro

BUILD_DIR  			:= 	./build
OBJ_DIR  			:= 	$(BUILD_DIR)/objects
BIN_DIR  			:= 	$(BUILD_DIR)/bin

SRCS      			:= 	$(shell find $(SRC_DIRS) -name '*.cpp')
MACROBENCH_SRCS 	:= 	$(shell find $(MACROBENCH_DIR) -name '*.cpp')
MICROBENCH_SRCS 	:= 	$(shell find $(MICROBENCH_DIR) -name '*.cpp')

OBJS 				:= $(SRCS:%=$(BUILD_DIR)/%.o)
MACROBENCH_OBJS 	:= $(SRCS:%=$(BUILD_DIR)/$(MACROBENCH_DIR)%.o)
MICROBENCH_OBJS 	:= $(SRCS:%=$(BUILD_DIR)/$(MICROBENCH_DIR)%.o)

