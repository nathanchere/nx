drawHeader "Configuring GitHub"
echo "Please enter the password for your Github account ($GITHUBUSERNAME)"
curl -u "$GITHUBUSERNAME" --data "{\"title\":\"DevVm_`date +%Y%m%d%H%M%S`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys

