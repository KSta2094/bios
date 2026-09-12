run:
	qemu-system-x86_64 -display cocoa,zoom-to-fit=on  build/boot
build:
	mkdir build
	nasm boot/boot.s -o build/boot
clean:
	rm -fr build
exec:
	make build
	make run
	make clean

