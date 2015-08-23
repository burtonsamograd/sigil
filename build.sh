# Pull down quicklisp
[[ ! -e quicklisp.lisp ]] && wget https://beta.quicklisp.org/quicklisp.lisp

sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install)' --eval '(ql:quickload :parenscript)' \
     --load sigil.lisp --eval '(sb-ext:save-lisp-and-die "sigil" :executable t
                                   :toplevel (lambda ()  (main sb-ext:*posix-argv*)))'
