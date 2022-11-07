#!/bin/bash

sudo apt update 
sudo apt -y install git
sleep 3
sudo apt -y install python3-pip
sleep 3
git clone https://github.com/SubornaN/kuralabs_deployment_3.git
sleep 2
cd kuralabs_deployment_3/
pip install -r requirements.txt
pip install gunicorn
python3 -m gunicorn -w 4 application:app -b 0.0.0.0 --daemon
sleep 3
cd /tmp/
sudo wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
sudo unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sleep 3
cd /kuralabs_deployment_3/cypress_test
sudo apt install -y nodejs npm maven libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
npm install
npm install cypress --save-dev
NO_COLOR=1 npx cypress run --config video=false --spec ./cypress/e2e/test.cy.js