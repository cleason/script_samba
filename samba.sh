#!/bin/bash

# Installe les paquets nécessaires
sudo apt-get update
sudo apt-get install samba

# Crée un utilisateur pour Samba
sudo useradd sambauser
sudo smbpasswd -a sambauser

# Configure Samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak # sauvegarde la configuration actuelle
sudo echo "[shared_folder]" >> /etc/samba/smb.conf
sudo echo "path = /home/sambauser/shared_folder" >> /etc/samba/smb.conf
sudo echo "valid users = sambauser" >> /etc/samba/smb.conf
sudo echo "read only = no" >> /etc/samba/smb.conf
sudo echo "create mask = 0755" >> /etc/samba/smb.conf
sudo echo "directory mask = 0755" >> /etc/samba/smb.conf

# Redémarre le service Samba
sudo systemctl restart smbd.service

# Affiche un message de confirmation
echo "Samba a été configuré avec succès !"
