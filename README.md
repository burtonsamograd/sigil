sigil
-----

Sigil is a Parenscript to Javascript command line compiler.

    https://github.com/vsedach/Parenscript

Usage:

    sigil [-i] [-I load-directory] [--eval <CL code>] [--pseval <PS Code>] app.ps > app.js

Interactive REPL:

Sigil comes with an interactive REPL (Read-Eval-Print-Loop) when
invoked with -i (or no arguments), allowing you to type and evaluate
Parenscript commands interactively.

Installation:

Run 'build.sh' or 'make' to compile sigil. Use install.sh to build and
install in /usr/local/bin.

Requires sbcl to be installed along with parenscript in your ASDF
instal path. The easiest way is to use quicklisp, but you can also get
this is to run the following (but there might be other dependencies
that need to be installed):

    cd ~/common-lisp && git clone https://github.com/vsedach/Parenscript

License
-------

MIT

--
Burton Samograd
2015