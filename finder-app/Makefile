CC = gcc
CROSS_COMPILE ?=

ifeq ($(CROSS_COMPILE),)
	TARGET = writer
else
	TARGET = writer-arm
endif

CFLAGS = -Werror

all: $(TARGET)

writer: writer.c
	$(CC) $(CFLAGS) writer.c -o writer -lm

writer-arm: writer.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) writer.c -o writer -lm

clean:
	rm -f writer *.o