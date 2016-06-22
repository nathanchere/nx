INSTALLDIR=`pwd`
OUTPUTDIR="$INSTALLDIR/tmp"
OUTPUTSCRIPT="$OUTPUTDIR/setup.sh"
rm -drf $OUTPUTDIR
mkdir $OUTPUTDIR

chmod +755 -R $INSTALLDIR/install
chmod +755 -R $INSTALLDIR/configure
chmod +755 -R $INSTALLDIR/util

APT_REPOS=()
APT_PKGS=()
DEBS=()
RAWSCRIPTSPRE=()
RAWSCRIPTS=()
CONFIGSCRIPTS=()

################################################
# HELPERS
################################################

resetdir(){
	cd $INSTALLDIR
}

drawHeader() {
	echo " "
	echo "#######################################################################"
	echo "# $1"
	echo "#######################################################################"		
	echo " "
}

# add a ppd repo to be added before apt update and package download
addrepo() {
	APT_REPOS+=($@)
	# sudo apt-add-repository ppa:noobslab/themes
}

removerepo(){
	addrawpre "sudo add-apt-repository -y -r ppa:$1"
}


# add an apt package to be installed
addpkg() {
	APT_PKGS+=($@)
	# sudo apt-get install -qq --fix-missing "#@"
}

# add a .deb url to be downloaded and dpkg'd after the apt stuff
adddeb() {
	DEBS+=($@)
}

# add a script which needs to be run before all the apt repo/pkg stuff
addrawpre() {
	RAWSCRIPTSPRE+=("$@")
}

# add a script which runs after all the apt/pkg/repo stuff
addraw() {
	RAWSCRIPTS+=("$@")	
}

# Color constants
ansi_black='\033[30m'
ansi_black_bold='\033[0;30;1m'
ansi_red='\033[31m'
ansi_red_bold='\033[0;31;1m'
ansi_green='\033[32m'
ansi_green_bold='\033[0;32;1m'
ansi_yellow='\033[33m'
ansi_yellow_bold='\033[0;33;1m'
ansi_blue='\033[34m'
ansi_blue_bold='\033[0;34;1m'
ansi_magenta='\033[35m'
ansi_magenta_bold='\033[0;35;1m'
ansi_cyan='\033[36m'
ansi_cyan_bold='\033[0;36;1m'
ansi_white='\033[37m'
ansi_white_bold='\033[0;37;1m'
ansi_reset='\033[0m'

# Argument $1 = color (defaults to white, if not specified)
# Other arguments will be passed directly to echo
function cecho {
  local opt=
  if [ "$1" == "-n" ]; then
    opt=$1
    shift
  fi

  local color=${1:-$ansi_white}
  shift

  echo -ne $color
  echo -n "$@"
  echo -e $opt "$ansi_reset"
}

################################################
# MAIN METHODS - call these to build the setup script
################################################

install() {
	. $INSTALLDIR/install/$1.sh
}

configure() {
	CONFIGSCRIPTS+=("$INSTALLDIR/configure/$1.sh")
}

# install fonts
# install themes
# install util scripts

