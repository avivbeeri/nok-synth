.PHONY: synth.dylib 




synth.dylib: synth.c
	gcc -dynamiclib -o synth.dylib synth.c -undefined dynamic_lookup -O3

synth.so: synth.c
	gcc -O3 -std=c11 -shared -o synth.so -fPIC  -lm synth.c

synth.dll: synth.c
	gcc -O3 -std=gnu11 -shared -fPIC synth.c -lm -Wl,--unresolved-symbols=ignore-in-object-files -o synth.dll

synth.wasm: synth.c
	emcc -O3 -s WASM=1 -s SIDE_MODULE=1 -o synth.wasm synth.c

