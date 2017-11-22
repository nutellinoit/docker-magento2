#!/usr/bin/env bash

cd build_magento2-apache-php
make build
cd ../build_magento2-cron/
make build
cd ../build_magento2-apache-php/
make build
cd ../build_redis-volatile/
make build
cd ../build_varnish/
make build
echo "Completed!"