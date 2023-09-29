#!/usr/bin/bash

if [ "$1" == 'init' ]
then
  cp ~/bin/eslint_config.yml ~configs/.eslintrc.yml
  npm install eslint@7.12.1 eslint-cli babel-eslint --save-dev
fi
