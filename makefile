CC = gcc
CFLAGS = -Wall -Werror -g
OBJ = main.o common.o addition.o subtraction.o multiplication.o division.o
TARGET = calc

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

%.o: %.c apc.h
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(OBJ) $(TARGET)
