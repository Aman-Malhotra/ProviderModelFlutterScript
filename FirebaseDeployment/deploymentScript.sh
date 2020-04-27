#!/bin/bash

cd public
rm index.html
cd ..
cp ../providerFilesScript.sh ./public/index.html
firebase deploy
