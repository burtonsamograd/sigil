all: sigil

sigil: sigil.lisp
	./build.sh

clean:
	rm -f sigil *~
