#!/bin/bash

# 1. Install NPM packages
if [ -e "$DEPLOYMENT_TARGET/package.json" ]; then
  cd "$DEPLOYMENT_TARGET"
  eval $NPM_CMD install --production
  exitWithMessageOnError "npm failed"
  cd - > /dev/null
fi


# 2. Install Bower modules
if [ -e "$DEPLOYMENT_TARGET/bower.json" ]; then
  cd "$DEPLOYMENT_TARGET"
  eval rm -rf bower_components
  echo deleted bower components
  eval ./node_modules/.bin/bower install
  exitWithMessageOnError "bower failed"
  cd - > /dev/null
fi

echo "Finished successfully."