# make all scripts executable
find $pwd -exec chmod +755 {} \;

echo "[begin run]"

source ./.presetup.sh
source ./options.sh
source ./.postsetup.sh

chmod +755 -R $OUTPUTDIR

echo "--[[ Done! ]]--"
echo "Look in ./tmp for your new setup package"
