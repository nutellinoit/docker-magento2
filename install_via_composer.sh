#!/usr/bin/env bash

docker run --rm --interactive --tty --volume $PWD:/app nutellinoit/magento2-composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2