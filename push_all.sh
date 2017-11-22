#!/usr/bin/env bash


docker push nutellinoit/magento2-apache-php
docker push nutellinoit/magento2-cron
docker push nutellinoit/redis-volatile
docker push nutellinoit/varnish
docker push nutellinoit/magento2-composer
echo "Completed!"