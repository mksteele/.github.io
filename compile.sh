#!/bin/bash

set -e

ROOT_DIR=$(pwd)
HARP_DIR=harp-project
OUTPUT_DIR=www

# Prompt that we're in the right directory
read -p "Move compiled code into $ROOT_DIR? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "Continuing..."
    ;;
    * )
        echo "Exiting"
        exit
    ;;
esac

# Go into harp project directory
pushd $HARP_DIR

# Compile code
harp compile

# Copy compiled files from www to root directory
cp -vR $OUTPUT_DIR/* $ROOT_DIR
