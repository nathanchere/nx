echo "[Generating setup package...]"

output(){
	echo $@ >> $OUTPUTSCRIPT
}
outputcaption() {
	echo "Scripting: $1"
	output " "
	output "#############################################"
	output "#  $1"
	output "#############################################"
	output " "
}

################################################
# Bootstrap
################################################

outputcaption "Bootstrap"
output "INSTALLDIR=`pwd`"
output "TEMPDIR=\$INSTALLDIR/.tmp"
output "resetdir(){
	cd \$INSTALLDIR
}"

################################################
# PRE-APT SCRIPTS
################################################

outputcaption "Pre-apt scripts"
for s in "${RAWSCRIPTSPRE[@]}"
do
	output "$s"
done

################################################
# APTITUDE PACKAGES
################################################

outputcaption "PPA repositories"
for r in "${APT_REPOS[@]}"
do	
	output "sudo add-apt-repository ppa:$r -y"
done

outputcaption "Update apt repositories"
output "sudo apt-get update"

outputcaption "Upgrade all packages"
output "sudo apt-get upgrade -q -y --force-yes"


outputcaption "Install new apt packages"
output "sudo apt-get install -y -q ${APT_PKGS[@]}"

################################################
# POST-APT SCRIPTS
################################################

outputcaption "Post-apt scripts"
for s in "${RAWSCRIPTS[@]}"
do
	output "$s"
done

################################################
# DEB INSTALLATION
################################################

outputcaption ".deb downloads and installation"
for d in "${DEBS[@]}"
do
	wget -P $OUTPUTDIR/deb/ $d
done

outputcaption "Installing .deb files"
output "dpkg -i \$INSTALLDIR/deb/*.deb"


################
# CONFIG SCRIPTS
################

outputcaption "Config scripts"
for c in "${CONFIGSCRIPTS[@]}"
do
	cat $c >> $OUTPUTSCRIPT
done

################################################
# UTILS
################################################
outputcaption "Utility scripts"
cp -r $INSTALLDIR/util $OUTPUTDIR/util
output "sudo /bin/cp -n \$INSTALLDIR/util/* /usr/local/bin"

################
# CLEANUP
################

outputcaption "Cleanup"
output "sudo apt-get clean -y -q"
output "sudo apt-get autoremove -y -q"
output "sudo rm -rf $TEMPDIR"
output "echo '--[[ Complete! ]]--'"

