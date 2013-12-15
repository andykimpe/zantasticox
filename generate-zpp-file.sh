#!/bin/bash
## download git and create environnement
cd /root
git clone https://github.com/andykimpe/zantasticotx.git
cd zantasticotx
rm -rf .git .gitignore
mkdir packages
cd packages

## generate xml file and create packages
