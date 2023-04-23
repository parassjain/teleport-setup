sudo systemctl stop teleport
sudo systemctl disable teleport
sudo apt-get -y remove teleport
sudo rm -rf /etc/teleport.yaml
sudo rm -rf /var/lib/teleport
sudo rm -f /etc/tsh.yaml
rm -rf ~/.tsh