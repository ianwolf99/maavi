#!/bin/bash
echo -e "[>] Installing and Configuring";
git clone https://github.com/EnableSecurity/wafw00f.git
cd wafw00f
python setup.py install
cd ..
gem install watir
mkdir assessment
mkdir xss
chmod u+x assessment/
chmod u+x xss/
echo -e "[>] Installed and Configured";
echo -e "[>] run ./maavi.sh";
