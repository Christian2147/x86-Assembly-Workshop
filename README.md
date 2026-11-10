https://embedenv.com/online-compiler/assembly

OR

https://x64.halb.it/

If neither works, you can install NASM if you have WSL:

sudo apt update

sudo apt install nasm build-essential

Code is run with:

nasm -f elf64 -g -F dwarf example.asm -o example.o

ld -o example example.o

./example
