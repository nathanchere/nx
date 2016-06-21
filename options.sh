# 1) add any random aptitude packages you want here
#    Syntax:
#         addpkg example1 example2 someotherpackage
#
# 2) add any extra repositories you want to use (minus the ppa:)
#    Syntax:
#         addrepo webupd8/megathemes
#

addrawpre "GITNAME=''"
addrawpre "GITEMAIL=''"
addrawpre "GITHUBUSERNAME=''"

addpkg git git-core mercurial
addpkg curl sharutils sed awk jq autoconf
addpkg build-essential libssh-dev m4
addpkg ncurses-dev libncurses5-dev openssl libssl-dev unzip
addpkg libsdl-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev
addpkg libsmpeg-dev libportmidi-dev libavformat-dev libswscale-dev libjpeg-dev libfreetype6-dev
addpkg libunwind8 autotools-dev automake libtool pkg-config
addpkg libdevil-dev libfreetype6-dev libluajit-5.1-dev libphysfs-dev libsdl2-dev
addpkg libopenal-dev libogg-dev libvorbis-dev libflac-dev libflac++-dev libmodplug-dev libmpg123-dev libmng-dev libturbojpeg
addpkg screenfetch

#lightdm-webkit-greeter 
install kernel

install refind
install nerdfonts
install zsh
install ohmyzsh

# Misc software

install vivaldi
install launchy

# Dev langauges / frameworks / etc

install asdf

install java6
install java7
install java8
install clojure
install scala

install erlang
install elixir

install javascript
install nodejs

install python
install mono
install haskell
install love2d

configure git
configure github
#configure lightdm
