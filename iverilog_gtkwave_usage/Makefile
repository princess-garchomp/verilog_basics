# this is a sample Makfile

TB	:= $(wildcard *tb.v)
V	:= $(wildcard *_.v)
VDC	:= $(wildcard *.vdc)


all: test run

test:
	iverilog -o test $(TB) $(V)
run:
	vvp test
gtk:
	gtkwave $(VDC)
clean:
	rm -rf $(VDC)
	rm test
