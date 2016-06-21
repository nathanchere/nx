drawHeader "Configuring git"
git config --global user.name "$GITNAME"
git config --global user.email "$GITEMAIL"
mkdir ~/.ssh
rm -f ~/.ssh/id_rsa
echo -e 'y'|ssh-keygen -t rsa -b 4096 -C "$GITEMAIL" -f ~/.ssh/id_rsa -N ''
ssh-agent -c
ssh-add ~/.ssh/id_rsa
