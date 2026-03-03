CC=g++
CPPFLAGS=
CFLAGS=-g -std=c++20 -O1 -Wall -Wpedantic
LDLIBS=-lSDL3 -ltinyobjloader -lktx -lslang

SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, out/%.o, $(SRC))
DEP = $(patsubst src/%.cpp, out/%.d, $(SRC))

TARGET = main

out/$(TARGET): $(OBJ) | out/
	$(CC) $^ $(LDFLAGS) $(LDLIBS) -o out/$(TARGET)

.PHONY: run
run: out/$(TARGET)
	./out/$(TARGET)

.PHONY: clean
clean:
	rm -rf out/

out/%.d: src/%.cpp | out/
	@echo making dep file $@
	@set -e; rm -f $@; \
	 $(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
	 sed 's,\($*\)\.o[ :]*,out/\1.o $@ : ,g' < $@.$$$$ > $@; \
	 rm -f $@.$$$$

out/%.o: src/%.cpp | out/
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

include $(DEP)

out/:
	mkdir out
