#!/bin/bash
## download git and create environnement
cd /root
git clone https://github.com/andykimpe/zantasticotx.git
cd zantasticotx
rm -rf .git .gitignore
mkdir packages
cd packages

## generate xml file and create packages

#generate mybb all language
mkdir mybb
cd mybb
wget http://www.mybb.com/download/latest
unzip *.zip
rm -f *.zip
cp -R Upload/* ./
rm -rf Upload/

# French (Français) Language
wget http://upload.mybb.fr/French_language_pack.1.6.11.zip
unzip -u French_language_pack.1.6.11.zip
rm -f French_language_pack.1.6.11.zip
rm -f readme.html

# German (Deutsch) (Informal - Deutsch Du) Language
wget http://files.mybb-forum.de/downloads/lang_deutsch_du_1611.zip
unzip -u lang_deutsch_du_1611.zip
rm -f lang_deutsch_du_1611.zip
cp -R -n Buttons/* images
rm -rf Buttons
rm -rf "Installation & Upgrade"
cp -R -n Sprachdateien/* inc/languages
rm -rf Sprachdateien

# German (Deutsch) (Formal - Deutsch Sie) language
wget http://files.mybb-forum.de/downloads/lang_deutsch_sie_1611.zip
unzip -u lang_deutsch_sie_1611.zip
rm -f lang_deutsch_sie_1611.zip
cp -R -n Buttons/* images
rm -rf Buttons
rm -rf "Installation & Upgrade"
cp -R -n Sprachdateien/* inc/languages
rm -rf Sprachdateien

# Persian (فارسی) language
wget "http://community.mybb.com/attachment.php?aid=30300"
unzip -u "attachment.php?aid=30300"
rm -f "attachment.php?aid=30300"

# Portuguese (Portugal) language
wget "http://community.mybb.com/attachment.php?aid=30423"
unzip -u "attachment.php?aid=30423"
rm -f "attachment.php?aid=30423"
cp -R -n Upload/* ./
rm -rf Upload

# Romanian language
wget "http://community.mybb.com/attachment.php?aid=30318"
unzip -u "attachment.php?aid=30318"
rm -f "attachment.php?aid=30318"
cp -R -n MyBB_1611/Upload/* ./
rm -rf MyBB_1611

# Spanish (Español) language
wget "http://community.mybb.com/attachment.php?aid=30427"
unzip -u "attachment.php?aid=30427"
rm -f "attachment.php?aid=30427"

# Serbian language
wget "http://community.mybb.com/attachment.php?aid=30301"
unzip -u "attachment.php?aid=30301"
rm -f "attachment.php?aid=30301"

# Swedish language
wget "http://mybboard.se/attachment.php?aid=12"
unrar -y e "attachment.php?aid=12"
rm -f "attachment.php?aid=12"

# create zip file
zip -r ../mybb1611.zip *
cd ..
rm -rf mybb

























