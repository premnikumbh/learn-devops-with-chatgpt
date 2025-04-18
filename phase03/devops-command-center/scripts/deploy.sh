#!/bin/bash

DEPLOY_DIR="deploy"
LOG_FILE="logs/toolkit.log"
mkdir -p "$DEPLOY_DIR" logs

echo " Deploying static site to $DEPLOY_DIR..." | tee -a "$LOG_FILE"
cp -r ./static-site/* "$DEPLOY_DIR"

# Uncomment this if you're on a real Linux server and want to restart nginx:
# sudo systemctl restart nginx

echo "$(date): Site deployed to $DEPLOY_DIR" | tee -a "$LOG_FILE"

