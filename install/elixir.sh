addraw "git clone https://github.com/elixir-lang/elixir.git $INSTALLDIR/tmp/elixir"
addraw "cd $INSTALLDIR/tmp/elixir"
addraw "make clean test"
addraw "sudo make install"
