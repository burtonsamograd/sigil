sigil
-----

Sigil is a Parenscript to Javascript command line compiler and REPL.

    What is Parenscript?

    Parenscript is a translator from an extended subset of Common Lisp
    to JavaScript. Parenscript code can run almost identically on both
    the browser (as JavaScript) and server (as Common Lisp).

    Parenscript code is treated the same way as Common Lisp code,
    making the full power of Lisp macros available for
    JavaScript. This provides a web development environment that is
    unmatched in its ability to reduce code duplication and provide
    advanced metaprogramming facilities to web developers.
    
    https://github.com/vsedach/Parenscript

    https://common-lisp.net/project/parenscript/reference.html

Usage:

    sigil [-i] [-I load-directory] [--eval <CL code>] [--pseval <PS Code>] app.ps > app.js

Installation:

Run 'make' or './build.sh' to compile sigil. It requires sbcl (or
maybe some other Common Lisp but I haven't tried) to be installed,
which you can grab from http://www.sbcl.org/platform-table.html, or
through something like 'apt-get install sbcl'.

You can 'npm install sigil_' (note the underscore) locally into
node_modules; the -g option doesn't work yet.

Load:

Sigil adds the 'load' command to Parenscript, so you can load macros
and other files during compilation, like (load "macros.ps"). Use -I to
specify the load paths to search.

Interactive REPL:

Sigil comes with an interactive REPL (Read-Eval-Print-Loop) when
invoked with -i (or no arguments), allowing you to type and evaluate
Parenscript commands interactively.

License
-------

MIT

--
Burton Samograd
2015