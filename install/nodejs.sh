# most of this extracted from: https://deb.nodesource.com/setup_6.x

removerepo "chris-lea/node.js"

# Adding key
addrawpre "wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -"
addrawpre "wget -qO /dev/null -o /dev/null 'https://deb.nodesource.com/node_6.x/dists/xenial/Release'"
addrawpre "sudo rm -f /etc/apt/sources.list.d/nodesource.list"

addrawpre "sudo bash -c \"echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list\""
addrawpre "sudo bash -c \"echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list\""

addpkg apt-transport-https lsb-release curl nodejs npm nodejs-legacy

#sudo npm install -g npm
