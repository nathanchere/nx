# ASDF is awesome for managing installations/versions of various languages / frameworks / runtimes / etc

if [ ! -d "$HOME/.asdf" ]; then
	addraw "git clone https://github.com/asdf-vm/asdf.git ~/.asdf"
	addraw "echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc"
	addraw "echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc"
fi

addraw "asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git"
addraw "asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"
addraw "asdf plugin-add riak https://github.com/smashedtoatoms/asdf-riak.git"
addraw "asdf plugin-add redis https://github.com/smashedtoatoms/asdf-redis.git"
addraw "asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git"
addraw "asdf plugin-add python https://github.com/tuvistavie/asdf-python.git"
addraw "asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git"
addraw "asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git"
addraw "asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git"
addraw "asdf plugin-add golang https://github.com/kennyp/asdf-golang.git"

