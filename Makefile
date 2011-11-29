all: build

build: rosella lib

lib:
	winxed setup.winxed

rosella: Rosella/Makefile
	$(MAKE) -C Rosella build
	ln -s Rosella/rosella rosella

Rosella/Makefile:
	git submodule init
	git submodule update

.PHONY: clean test
clean:
	winxed setup.winxed clean
	$(MAKE) -C Rosella clean
	rm -f rosella

test: build
	winxed setup.winxed test
