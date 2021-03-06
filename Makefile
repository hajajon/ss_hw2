CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=myBank.o
FLAGS= -Wall -g

all: libmyBank.so libmyBank.a progmains progmaind
progmains: $(OBJECTS_MAIN) libmyBank.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libmyBank.a
progmaind: $(OBJECTS_MAIN) 
	$(CC) $(FLAGS) -o maind $(OBJECTS_MAIN) ./libmyBank.so
libmyBank.so: $(OBJECTS_LIB)
	$(CC) -shared -o libmyBank.so $(OBJECTS_LIB)
libmyBank.a: $(OBJECTS_LIB)
	$(AR) -rcs libmyBank.a $(OBJECTS_LIB)
myBank.o: myBank.c myBank.h
	$(CC) $(FLAG) -c myBank.c
main.o: main.c myBank.h myBank.c
	$(CC) $(FLAGS) -c main.c myBank.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maind
