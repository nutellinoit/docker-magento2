#!/usr/bin/env bash

echo "Deleting old magento2 folder"
rm -rf magento2
echo "Deleting containers..."
docker-compose down
echo "Installing magento2 composer way"
./install_via_composer.sh
echo "Chmod 777 magento2 folder for develop"
sudo chmod -R 777 magento2
