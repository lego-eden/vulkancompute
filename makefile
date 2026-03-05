compile: | build
	cmake --build build

build:
	cmake -G Ninja -B build
	ln -s build/compile_commands.json compile_commands.json

run: | build
	cmake --build build --target run

clean: | build
	cmake --build build --target clean

clean-all:
	rm -rf build
	rm -f compile_commands.json

.PHONY: run compile clean clean-all 
