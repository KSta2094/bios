
all:
	make build
	make run
	make clean


run:
	qemu-system-x86_64 -display cocoa,zoom-to-fit=on -drive format=raw,file=build/os.img 
build:
	mkdir build
	nasm boot/boot.s -o build/boot
	nasm boot/sector_2.s -o build/sector_2
	cat build/boot build/sector_2 > build/os.img
clean:
	rm -fr build

