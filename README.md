sigil
-----

Sigil is a Parenscript to Javascript command line compiler.

    https://github.com/vsedach/Parenscript

    https://common-lisp.net/project/parenscript/reference.html

Usage:

    sigil [-i] [-I load-directory] [--eval <CL code>] [--pseval <PS Code>] app.ps > app.js

Interactive REPL:

Sigil comes with an interactive REPL (Read-Eval-Print-Loop) when
invoked with -i (or no arguments), allowing you to type and evaluate
Parenscript commands interactively.

Installation:

Run 'make' or './build.sh' to compile sigil. It requires sbcl (or
maybe some other Common Lisp but I haven't tried) to be installed,
which you can grab from http://www.sbcl.org/platform-table.html, or
through something like 'apt-get install sbcl'.

License
-------

MIT

--
Burton Samograd
2015