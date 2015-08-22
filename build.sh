sbcl --load sigil.lisp --eval \
     '(sb-ext:save-lisp-and-die "sigil" :executable t
         :toplevel (lambda ()  (main sb-ext:*posix-argv*)))'
