# QEMU compile and execute assembly 

### compile
`aarch64-linux-gnu-gcc -o ./build/hello 1helloworld.S`  
### run
`qemu-aarch64 -L /usr/aarch64-linux-gnu ./build/hello`  
