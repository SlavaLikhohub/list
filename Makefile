PREF = arm-none-eabi-
AR ?= $(PREF)ar
CC = $(PREF)gcc
PREFIX ?= /usr/local

CFLAGS ?= #Should be given by previous level
#CFLAGS = -O2 -Wall -Wextra -Ideps
#CFLAGS +=-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard --static -nostartfiles -lnosys -Lbuild/release -Wl,--start-group -lc -lgcc -Wl,--end-group -labst_stm32f4 -lopencm3 -llist -Wl,--gc-sections -Wl,--print-gc-sections -specs=nano.specs -specs=nosys.specs
SRCS = src/list.c \
		   src/list_node.c \
		   src/list_iterator.c

OBJS = $(SRCS:.c=.o)

all: build/liblist.a

build/liblist.a: $(OBJS)
	@mkdir -p build
	$(AR) rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -fr bin build *.o src/*.o

.PHONY: clean
