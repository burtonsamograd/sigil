sigil
-----

Sigil is a Parenscript to Javascript command line compiler.

    https://github.com/vsedach/Parenscript

Usage:

    sigil [-I load-directory] [--eval <CL code>] [--pseval <PS Code>] app.ps > app.js

Installation:

Run build.sh to compile ps2js. Use install.sh to build and install in /usr/local/bin.

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