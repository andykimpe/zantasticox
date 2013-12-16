#!/bin/bash
# download git and create environnement
git clone https://github.com/andykimpe/zantasticox.git
cd zantasticox
rm -rf .git .gitignore LICENSE
mkdir packages
cd packages

# generate create packages and xml file

# generate mybb 1.6.12 all language
# mybb translation system http://community.mybb.com/thread-114917.html
mkdir mybb
cd mybb
wget http://www.mybb.com/download/latest
unzip *.zip
rm -f *.zip
cp -R Upload/* ./
rm -rf Upload/

# French (FranÃ§ais) Language
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

# Persian (ÙØ§Ø±Ø³ÛŒ) language
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

# Spanish (EspaÃ±ol) language
wget "http://community.mybb.com/attachment.php?aid=30427"
unzip -u "attachment.php?aid=30427"
rm -f "attachment.php?aid=30427"
rm -f readme.html

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

# generate phpbb 3.0.12 all language
# phpbb translation system https://www.phpbb.com/languages/index.php
wget https://www.phpbb.com/files/release/phpBB-3.0.12.zip
unzip phpBB-3.0.12.zip
rm -f phpBB-3.0.12.zip
cd phpBB3

# American (English) language
wget https://www.phpbb.com/customise/db/download/id_91116
unzip id_91116
rm -f id_91116
cp -R american_english_1_3_0/* ./
rm -rf american_english_1_3_0

# French (FranÃ§ais) language
wget https://www.phpbb.com/customise/db/download/id_91611
unzip -u id_91611
rm -f id_91611
cp -R french_1_4_1/* ./
rm -rf french_1_4_1

# Arabic (Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©) language
wget https://www.phpbb.com/customise/db/download/id_92651
unzip -u id_92651
rm -f id_92651
cp -R arabic_1_6_0_3/* ./
rm -rf arabic_1_6_0_3

# Argentinian Spanish (EspaÃ±ol Argentino) language
wget https://www.phpbb.com/customise/db/download/id_91866
unzip -u id_91866
rm -f id_91866
cp -R argentinian_spanish_formal_honorifics_1_0_2/argentinian_spanish_1_0_2/* ./
rm -rf argentinian_spanish_formal_honorifics_1_0_2

# Basque (Euskara) language
wget https://www.phpbb.com/customise/db/download/id_84782
unzip -u id_84782
rm -f id_84782
cp -R basque_1_1_2/* ./
rm -rf basque_1_1_2

# Belarusian (Ð‘ÐµÐ»Ð°Ñ€ÑƒÑÐºÐ°Ñ) language
wget https://www.phpbb.com/customise/db/download/id_85375
unzip -u id_85375
rm -f id_85375
cp -R belarusian_3_0_11/* ./
rm -rf belarusian_3_0_11

# Brazilian Portuguese (Ð‘ÐµÐ»Ð°Ñ€ÑƒÑÐºÐ°Ñ) language
wget https://www.phpbb.com/customise/db/download/id_91801
unzip -u id_91801
rm -f id_91801
cp -R brazilian_portuguese_1_0_7/* ./
rm -rf brazilian_portuguese_1_0_7

# Bulgarian (Ð‘ÐµÐ»Ð°Ñ€ÑƒÑÐºÐ°Ñ) language
wget https://www.phpbb.com/customise/db/download/id_85730
unzip -u id_85730
rm -f id_85730
cp -R bulgarian_1_0_5/* ./
rm -rf bulgarian_1_0_5

# Catalan (CatalÃ ) language
wget https://www.phpbb.com/customise/db/download/id_91531
unzip -u id_91531
rm -f id_91531
cp -R catalan_1_0_6/* ./
rm -rf catalan_1_0_6

# Croatian (CatalÃ ) language
wget https://www.phpbb.com/customise/db/download/id_85022
unzip -u id_85022
rm -f id_85022
cp -R croatian_1_0_5/* ./
rm -rf croatian_1_0_5

# Czech (ÄŒeÅ¡tina) language
wget https://www.phpbb.com/customise/db/download/id_85593
unzip -u id_85593
rm -f id_85593
cp -R czech_1_7/* ./
rm -rf czech_1_7

# Danish (Dansk) language
wget https://www.phpbb.com/customise/db/download/id_91386
unzip -u id_91386
rm -f id_91386
cp -R danish_1_0_26/* ./
rm -rf danish_1_0_26

# Dutch Casual Honorifics (Nederlands Informeel) language
wget https://www.phpbb.com/customise/db/download/id_91751
unzip -u id_91751
rm -f id_91751
cp -R dutch_casual_honorifics_1_0_13_1/dutch_*/* ./
rm -rf dutch_casual_honorifics_1_0_13_1

# Dutch Formal Honorifics (Nederlands Formeel) language
wget https://www.phpbb.com/customise/db/download/id_91666
unzip -u id_91666
rm -f id_91666
cp -R dutch_formal_honorifics_1_0_5/dutch_*/* ./
rm -rf dutch_formal_honorifics_1_0_5

# Estonian (Eesti keel) language
wget https://www.phpbb.com/customise/db/download/id_82848
unzip -u id_82848
rm -f id_82848
cp -R estonian_3_0_10/* ./
rm -rf estonian_3_0_10

# Finnish (Suomi) language
wget https://www.phpbb.com/customise/db/download/id_92961
unzip -u id_92961
rm -f id_92961
cp -R finnish_3_0_12_2/* ./
rm -rf finnish_3_0_12_2

# Galician (Suomi) language
wget https://www.phpbb.com/customise/db/download/id_84646-sid_2754c1a7b6fdf695730ebb00edeb08b7
unzip -u id_84646-sid_2754c1a7b6fdf695730ebb00edeb08b7
rm -f id_84646-sid_2754c1a7b6fdf695730ebb00edeb08b7
cp -R galician_1_3_0/* ./
rm -rf galician_1_3_0

# German Casual Honorifics (Deutsch Du) language
wget https://www.phpbb.com/customise/db/download/id_91416-sid_087ec79dd9c721bb96cbcb5b8a45e076
unzip -u id_91416-sid_087ec79dd9c721bb96cbcb5b8a45e076
rm -f id_91416-sid_087ec79dd9c721bb96cbcb5b8a45e076
cp -R german_casual_honorifics_3_0_12/german_*/* ./
rm -rf german_casual_honorifics_3_0_12

# German Formal Honorifics (Deutsch Sie) language
wget https://www.phpbb.com/customise/db/download/id_91421-sid_0fc5aa71d66e7b0a956a92d0ef7b0bb6
unzip -u id_91421-sid_0fc5aa71d66e7b0a956a92d0ef7b0bb6
rm -f id_91421-sid_0fc5aa71d66e7b0a956a92d0ef7b0bb6
cp -R german_formal_honorifics_3_0_12/german_*/* ./
rm -rf german_formal_honorifics_3_0_12

# Greek (Deutsch Sie) language
wget https://www.phpbb.com/customise/db/download/id_82608-sid_efa1f03bfd4f422559d76a3fe3d418fd
unzip -u id_82608-sid_efa1f03bfd4f422559d76a3fe3d418fd
rm -f id_82608-sid_efa1f03bfd4f422559d76a3fe3d418fd
cp -R greek_3_0_10/* ./
rm -rf greek_3_0_10

# Hebrew (×¢×‘×¨×™×ª) language
wget https://www.phpbb.com/customise/db/download/id_93006-sid_2eb01c61bf64f5e4798ae1912fb7fa2f
unzip -u id_93006-sid_2eb01c61bf64f5e4798ae1912fb7fa2f
rm -f id_93006-sid_2eb01c61bf64f5e4798ae1912fb7fa2f
cp -R hebrew_3_0_12/* ./
rm -rf hebrew_3_0_12

# Hungarian (Magyar) language
wget https://www.phpbb.com/customise/db/download/id_82916-sid_e52a72d233d0bbd7e78521c288b702d0
unzip -u id_82916-sid_e52a72d233d0bbd7e78521c288b702d0
rm -f id_82916-sid_e52a72d233d0bbd7e78521c288b702d0
cp -R hungarian_233/* ./
rm -rf hungarian_233

# Indonesian (Bahasa Indonesia) language
wget https://www.phpbb.com/customise/db/download/id_81607-sid_d2186b087731f1eaa1406bf534181643
unzip -u id_81607-sid_d2186b087731f1eaa1406bf534181643
rm -f id_81607-sid_d2186b087731f1eaa1406bf534181643
cp -R indonesian_1_0_1/* ./
rm -rf indonesian_1_0_1

# Italian (Italiano) language
wget https://www.phpbb.com/customise/db/download/id_91861-sid_89f63e5c30e659b42f810054b6886a62
unzip -u id_91861-sid_89f63e5c30e659b42f810054b6886a62
rm -f id_91861-sid_89f63e5c30e659b42f810054b6886a62
cp -R italian_1_2_2/* ./
rm -rf italian_1_2_2

# Japanese (æ—¥æœ¬èªž) language
wget https://www.phpbb.com/customise/db/download/id_92251-sid_92d17f55e0b3661ed520877ada517b21
unzip -u id_92251-sid_92d17f55e0b3661ed520877ada517b21
rm -f id_92251-sid_92d17f55e0b3661ed520877ada517b21
cp -R japanese_1_0_5/* ./
rm -rf japanese_1_0_5

# Kurdish (Ú©ÙˆØ±Ø¯ÛŒ) language
wget https://www.phpbb.com/customise/db/download/id_84789
unzip -u id_84789
rm -f id_84789
cp -R kurdish_1_0_5/* ./
rm -rf kurdish_1_0_5

# Lithuanian (LietuviÅ³) language
wget https://www.phpbb.com/customise/db/download/id_94446
unzip -u id_94446
rm -f id_94446
cp -R lithuanian_2013_10_20/* ./
rm -rf lithuanian_2013_10_20

# Macedonian (Ð¼Ð°ÐºÐµÐ´Ð¾Ð½ÑÐºÐ¸ Ñ˜Ð°Ð·Ð¸Ðº) language
wget https://www.phpbb.com/customise/db/download/id_83006
unzip -u id_83006
rm -f id_83006
cp -R macedonian_1_0_1/* ./
rm -rf macedonian_1_0_1

# Mandarin Chinese Simplified (ç®€ä½“ä¸­æ–‡) language
wget https://www.phpbb.com/customise/db/download/id_91456
unzip -u id_91456
rm -f id_91456
cp -R mandarin_chinese_simplified_script_1_0_3/mandarin_chinese*/* ./
rm -rf mandarin_chinese_simplified_script_1_0_3

# Mandarin Chinese Traditional (æ­£é«”ä¸­æ–‡) language
wget https://www.phpbb.com/customise/db/download/id_91411
unzip -u id_91411
rm -f id_91411
cp -R mandarin_chinese_traditional_script_1_0_5/mandarin_chinese*/* ./
rm -rf mandarin_chinese_traditional_script_1_0_5

# Mexican Spanish (EspaÃ±ol Mexicano) language
wget https://www.phpbb.com/customise/db/download/id_92146
unzip -u id_92146
rm -f id_92146
cp -R mexican_spanish_casual_honorifics_1_0_5/mexican_spanish_1_0_5/* ./
rm -rf mexican_spanish_casual_honorifics_1_0_5

# Persian (ÙØ§Ø±Ø³ÛŒ) language
wget https://www.phpbb.com/customise/db/download/id_84784
unzip -u id_84784
rm -f id_84784
cp -R persian_1_5_1/* ./
rm -rf persian_1_5_1

# Polish (Polski) language
wget https://www.phpbb.com/customise/db/download/id_84758
unzip -u id_84758
rm -f id_84758
cp -R polish_r210/* ./
rm -rf polish_r210

# Portuguese (PortuguÃªs) language
wget https://www.phpbb.com/customise/db/download/id_91501-sid_fa44101f2b16ccf1e77b33415cdf1501
unzip -u id_91501-sid_fa44101f2b16ccf1e77b33415cdf1501
rm -f id_91501-sid_fa44101f2b16ccf1e77b33415cdf1501
cp -R portuguese_1_0_6/* ./
rm -rf portuguese_1_0_6

# Romanian (RomÃ¢nÄƒ) language
wget https://www.phpbb.com/customise/db/download/id_84641-sid_49a52b2c944ade82a404f0e3f02cfc38
unzip -u id_84641-sid_49a52b2c944ade82a404f0e3f02cfc38
rm -f id_84641-sid_49a52b2c944ade82a404f0e3f02cfc38
cp -R romanian_1_0_5/* ./
rm -rf romanian_1_0_5

# Russian (Ð ÑƒÑÑÐºÐ¸Ð¹) language
wget https://www.phpbb.com/customise/db/download/id_91291-sid_2f1105bcdc80fe1235ffece076b9edd2
unzip -u id_91291-sid_2f1105bcdc80fe1235ffece076b9edd2
rm -f id_91291-sid_2f1105bcdc80fe1235ffece076b9edd2
cp -R russian_1_0_11/* ./
rm -rf russian_1_0_11

# Serbian Cyrillic (Ð¡Ñ€Ð¿ÑÐºÐ¸) language
wget https://www.phpbb.com/customise/db/download/id_92921-sid_e74a8dc46463d7f3fafeb1ade076fec0
unzip -u id_92921-sid_e74a8dc46463d7f3fafeb1ade076fec0
rm -f id_92921-sid_e74a8dc46463d7f3fafeb1ade076fec0
cp -R serbian_cyrillic_script_3_0_12/serbian_*/* ./
rm -rf serbian_cyrillic_script_3_0_12

# Serbian Latin (Srpski Latinica) language
wget https://www.phpbb.com/customise/db/download/id_84606-sid_073df919f91add3e6881720d784f424d
unzip -u id_84606-sid_073df919f91add3e6881720d784f424d
rm -f id_84606-sid_073df919f91add3e6881720d784f424d
cp -R serbian_latin_script_3_0_11/* ./
rm -rf serbian_latin_script_3_0_11

# Slovak (SlovenÄina) language
wget https://www.phpbb.com/customise/db/download/id_93561
unzip -u id_93561
rm -f id_93561
cp -R slovak_3_0_12_2/* ./
rm -rf slovak_3_0_12_2

# Slovenian (SlovenÅ¡Äina) language
wget https://www.phpbb.com/customise/db/download/id_91736-sid_3ba16b2eab910ee3911daa093e204fe5
unzip -u id_91736-sid_3ba16b2eab910ee3911daa093e204fe5
rm -f id_91736-sid_3ba16b2eab910ee3911daa093e204fe5
cp -R slovenian_1_3_0/* ./
rm -rf slovenian_1_3_0

# Spanish Casual Honorifics (EspaÃ±ol TÃº) language
wget https://www.phpbb.com/customise/db/download/id_92696-sid_a3b2a72f9b2800d65cbddf442649a0e3
unzip -u id_92696-sid_a3b2a72f9b2800d65cbddf442649a0e3
rm -f id_92696-sid_a3b2a72f9b2800d65cbddf442649a0e3
cp -R spanish_casual_honorifics_1_0_6/spanish_*/* ./
rm -rf spanish_casual_honorifics_1_0_6

# Spanish Formal Honorifics (EspaÃ±ol Usted) language
wget https://www.phpbb.com/customise/db/download/id_92601-sid_94c4839135d8d8cb4e1a9e6df904f29c
unzip -u id_92601-sid_94c4839135d8d8cb4e1a9e6df904f29c
rm -f id_92601-sid_94c4839135d8d8cb4e1a9e6df904f29c
cp -R spanish_formal_honorifics_1_0_6/spanish_*/* ./
rm -rf spanish_formal_honorifics_1_0_6

# Swedish (Svenska) language
wget https://www.phpbb.com/customise/db/download/id_94846-sid_466897cf485fb7361c4df2fa651caecd
unzip -u id_94846-sid_466897cf485fb7361c4df2fa651caecd
rm -f id_94846-sid_466897cf485fb7361c4df2fa651caecd
cp -R svenska_1_4_8/swedish_1_4_8/* ./
rm -rf svenska_1_4_8

# Thai (à¸ à¸²à¸©à¸²à¹„à¸—à¸¢) language
wget https://www.phpbb.com/customise/db/download/id_92706-sid_44ea5d7f2a312e9fb9f1d569d31c7ed8
unzip -u id_92706-sid_44ea5d7f2a312e9fb9f1d569d31c7ed8
rm -f id_92706-sid_44ea5d7f2a312e9fb9f1d569d31c7ed8
cp -R thai_1_0_9/* ./
rm -rf thai_1_0_9

# Turkish (TÃ¼rkÃ§e) language
wget https://www.phpbb.com/customise/db/download/id_91371
unzip -u id_91371
rm -f id_91371
cp -R turkish_1_0_6/* ./
rm -rf turkish_1_0_6

# Ukrainian (Ð£ÐºÑ€Ð°Ñ—Ð½ÑÑŒÐºÐ°) language
wget https://www.phpbb.com/customise/db/download/id_92276
unzip -u id_92276
rm -f id_92276
cp -R ukrainian_1_0_9/* ./
rm -rf ukrainian_1_0_9

# Urdu (Ø§Ø±Ø¯Ùˆ) language
wget https://www.phpbb.com/customise/db/download/id_81743
unzip -u id_81743
rm -f id_81743
cp -R urdu_1_0_1/* ./
rm -rf urdu_1_0_1

# Vietnamese (Tiáº¿ng Viá»‡t) language
wget https://www.phpbb.com/customise/db/download/id_84900
unzip -u id_84900
rm -f id_84900
cp -R vietnamese_1_3_1/* ./
rm -rf vietnamese_1_3_1


# create zip file
zip -r ../phpbb3012.zip *
cd ..
rm -rf phpBB3



# generate joomla 3.2.0 all language
# all language auto include in installers
wget http://joomlacode.org/gf/download/frsrelease/18838/86936/Joomla_3.2.0-Stable-Full_Package.zip
mv Joomla_3.2.0-Stable-Full_Package.zip Joomla320.zip


# WordPress 3.8 English
wget http://wordpress.org/latest.zip
unzip latest.zip
rm -f latest.zip
cd wordpress
zip -r ./wordpress38.zip *
cd ..
rm -rf wordpress

# WordPress 3.8 French
wget http://fr.wordpress.org/wordpress-3.8-fr_FR.zip
unzip wordpress-3.8-fr_FR.zip
rm -f wordpress-3.8-fr_FR.zip
cd wordpress
zip -r ./wordpress38fr.zip *
cd ..
rm -rf wordpress

# Drupal 7.24 all language
# drupal translation system https://localize.drupal.org/
# default language include in archive french and english
wget http://drupalfr.org/sites/default/files/drupal-7.latest.tar.gz
unzip drupal-7.latest.tar.gz
cd drupal-7.24

cp sites/default/default.settings.php sites/default/settings.php

cd profiles/minimal/translations

# Afrikaans
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.af.po

# Albanian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.sq.po

# Amharic
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.am.po

# Arabic
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ar.po

# Armenian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.hy.po

# Asturian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ast.po

# Azerbaijani
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.az.po

# Bahasa Malaysia
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ms.po

# Basque
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.eu.po

# Belarusian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.be.po

# Bengali
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.bn.po

# Bosnian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.bs.po

# Bulgarian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.bg.po

# Burmese
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.my.po

# Catalan
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ca.po

# Chinese, Simplified
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.zh-hans.po

# Chinese, Traditional
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.zh-hant.po

# Croatian
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.hr.po

# Czech
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po


# Danish
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.da.po

# Dutch

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.nl.po


# Dzongkha

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.dz.po


# English, British

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.en-gb.po


# Esperanto

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.eo.po


# Estonian

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.et.po


# Faeroese

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.fo.po

# Filipino

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.fil.po

# Finnish

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.fi.po

# Frisian, Western

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.fy.po

# Galician

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.gl.po

# Georgian

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ka.po


# German

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.de.po

# Greek

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.el.po

# Gujarati

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.gu.po

# Haitian Creole

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.ht.po

# Hebrew

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.he.po

# 

wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-7.23.cs.po




for file in drupal-7.23*; do
mv $file ${file/drupal-7.23/drupal-7.24}
done
rm -f ../../standard/translations/drupal-7.24.fr.po
cp *.po ../../standard/translations
