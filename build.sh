#!/bin/sh

# Check for sbcl
which sbcl || { echo "Please install SBCL to build sigil."; exit 1; }

# Pull down quicklisp
[ ! -e quicklisp.lisp ] && wget https://beta.quicklisp.org/quicklisp.lisp

sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install :path "./quicklisp")' --eval '(ql:quickload :parenscript)' \
     --load sigil.lisp --eval '(sb-ext:save-lisp-and-die "sigil" :executable t
                                   :toplevel (lambda ()  (main sb-ext:*posix-argv*)))'
