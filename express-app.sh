#!/usr/bin/bash

# Checks for init
if [ "$1" == "init" ];
then
  echo -e "\033[35mGenerating express app...\033[0m\n"

  # Adds app #
  if [ -z "$2" ]
  then
    filename="app.js"
  else
    filename="$2"
  fi

  touch "$filename".js

  # Initialize npm package
  npm init -y

  # Install dependencies and dev-dependencies
  npm install express morgan express-session connect-loki dotenv --save # No database specified, that can be a project-by-project decision
  npm install nodemon eslint@7.12.1 eslint-cli babel-eslint --save-dev

  # adds a "start" command to package.json "script" object with value of "nodemon app.js"
  APP_MAIN=$(grep -Eo '"main":.*?[^\\]",?' package.json | sed 's/"main": "\(.*\)",/\1/')
  npm set-script start "npx nodemon $APP_MAIN"
  npm set-script kill "pkill -f ."
  # code here

  # Create necessary directories
  mkdir views public public/stylesheets
  mkdir public/images
  mkdir pulic/javascripts
  mkdir lib
  mkdir db

  # Create necessary files
  touch views/layout.pug
  touch public/stylesheets/application.css
  touch views/${APP_MAIN:0: -3}.pug
  touch db/session-store.db

  # Add .gitignore
  echo node_modules >> .gitignore
  echo session-store.db >> .gitignore
  echo .eslintrc.yml >> .gitignore

  # Output instructions for running the app
  echo -e "\n\033[96mYour express app is ready! To start, run: npm start\033[0m"
fi

