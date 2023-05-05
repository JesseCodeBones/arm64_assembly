# QEMU compile and execute assembly 

### compile
`aarch64-linux-gnu-gcc -o ./build/hello 1helloworld.S`  
### run
`qemu-aarch64 -L /usr/aarch64-linux-gnu ./build/hello`  
### compile with C runner
`aarch64-linux-gnu-gcc -no-pie main.c string.s -o ./build/hello`  
### compile C to assembly
`aarch64-linux-gnu-gcc test.c -S   -o ./build/hello.S`  

