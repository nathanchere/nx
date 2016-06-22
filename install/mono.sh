addrawpre "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
addrawpre "echo \"deb http://download.mono-project.com/repo/debian wheezy main\" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list"

addrawpre "echo \"deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main\" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list"

addpkg mono-devel mono-complete mono-xsp4
