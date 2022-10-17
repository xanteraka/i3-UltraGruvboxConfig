sudo echo ""
echo "========================================================================="
echo "setting the folders in the directory .config"
if [[ $(ls ~/.config/ | grep "OldConfig") ]]; then
  echo -e "it seems the scripts already run on the system, you might \nneed to remove the folder ~/.config/OldConfig folder to execute the script"
  exit 
fi
mkdir ~/.config/OldConfig
if [[ $(ls ~/.config/ | grep "alacritty") ]]; then
  mv -f ~/.config/alacritty ~/.config/OldConfig

fi
cp -r src/alacritty ~/.config/

if [[ $(ls ~/.config/ | grep "i3") ]]; then
  mv -f ~/.config/i3 ~/.config/OldConfig
fi
cp -r src/i3/ ~/.config/

if [[ $(ls ~/.config/ | grep "picom") ]]; then
  mv -f ~/.config/picom ~/.config/OldConfig
fi
cp -r src/picom ~/.config/

if [[ $(ls ~/.config/ | grep "rofi") ]]; then
  mv -f ~/.config/rofi ~/.config/OldConfig
fi
cp -r src/rofi ~/.config/

if [[ $(ls ~/.config/ | grep "fish") ]]; then
  mv -f ~/.config/fish ~/.config/OldConfig
fi
cp -r src/fish ~/.config/

if [[ $(ls ~/.config/ | grep "polybar") ]]; then
  mv -f ~/.config/polybar ~/.config/OldConfig
fi
cp -rf src/polybar ~/.config/
sudo chown -R ${USER}:${USER} ~/.config/polybar/scripts/

echo "========================================================================="
echo "getting the gtk Theme"
sudo git clone https://github.com/jmattheis/gruvbox-dark-gtk ~/usr/share/themes/gruvbox-theme 
echo "========================================================================="
echo "getting nerd JetBrainsMono Nerd Fonts"
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
mkdir -p JBNF
mv *.ttf JBNF && rm -r JetBrainsMono.zip
rm -rf /usr/share/fonts/JBNF
sudo mv -f JBNF /usr/share/fonts/
echo "JetBrainsMono Nerd Fonts installed in the directory /usr/share/fonts/JBNF"
echo "========================================================================="
echo "                                 done                                    "
echo "========================================================================="
echo " - now you need to install omf with bobthefish theme and you're done  :)"

