#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)

# color
grenbo="\e[92;1m"
NC='\e[0m'

# Install dependencies
apt update && apt upgrade -y
apt install python3 python3-pip git python3-venv -y

# Set up a virtual environment
cd /usr/bin

# Download and unzip the bot files
wget  https://raw.githubusercontent.com/xyzstoree/v7/main/limit/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip

# Download and unzip the kyt files
clear
wget  https://raw.githubusercontent.com/xyzstoree/v7/main/limit/kyt.zip
unzip kyt.zip

# Set up a virtual environment
python3 -m venv /usr/bin/kyt/venv

# Activate the virtual environment and install dependencies
source /usr/bin/kyt/venv/bin/activate
pip install -r /usr/bin/kyt/requirements.txt
deactivate

# Check if var.txt exists
if [ ! -f /usr/bin/kyt/var.txt ]; then
  echo ""
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "${grenbo}Tutorial Create Bot and ID Telegram${NC}"
  echo -e "${grenbo}[*] Create Bot and Token Bot : @BotFather${NC}"
  echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , command /info${NC}"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  read -e -p "[*] Input your Bot Token : " bottoken
  read -e -p "[*] Input Your Id Telegram :" admin

  # Store bot data
  echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
  echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
  echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
  echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
  echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
else
  # If var.txt exists, load the values from it
  echo "Using existing bot configuration from var.txt"
  bottoken=$(grep 'BOT_TOKEN' /usr/bin/kyt/var.txt | cut -d'=' -f2 | tr -d '"')
  admin=$(grep 'ADMIN' /usr/bin/kyt/var.txt | cut -d'=' -f2 | tr -d '"')
  domain=$(grep 'DOMAIN' /usr/bin/kyt/var.txt | cut -d'=' -f2 | tr -d '"')
  PUB=$(grep 'PUB' /usr/bin/kyt/var.txt | cut -d'=' -f2 | tr -d '"')
  NS=$(grep 'HOST' /usr/bin/kyt/var.txt | cut -d'=' -f2 | tr -d '"')
  echo -e "Loaded the following from var.txt:"
  echo "Token Bot       : $bottoken"
  echo "Admin           : $admin"
  echo "Domain          : $domain"
  echo "Pub             : $PUB"
  echo "Host            : $NS"
fi
clear

# Deleting old session files (.session)
echo "Deleting old session files..."
sudo find /usr/bin -type f -name "*.session" -exec rm -f {} \;

# Create the systemd service
cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/kyt/venv/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

# Start and enable the service
systemctl start kyt
systemctl enable kyt
systemctl restart kyt

# Clean up
cd /root
rm -rf kyt.sh

# Display user information
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin            : $admin"
echo "Domain           : $domain"
echo "Pub              : $PUB"
echo "Host             : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo "Installations complete, type /menu on your bot"
