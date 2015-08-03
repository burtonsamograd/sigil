sbcl --load ps2js.lisp --eval '(sb-ext:save-lisp-and-die "ps2js" :executable t :toplevel (lambda () (ignore-errors (main sb-ext:*posix-argv*))))'
