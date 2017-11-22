#!/usr/bin/env bash

rm -rf magento2
cp -r magento2-sample-ce magento2
cd magento2
docker run --rm --interactive --tty --volume $PWD:/app nutellinoit/magento2-composer install