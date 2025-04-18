#!/bin/bash

LOG_FILE="./logs/toolkit.log"
mkdir -p logs

function log() {
  echo "$(date): $1" | tee -a "$LOG_FILE"
}

function deploy_static_site() {
  DEPLOY_DIR="$HOME/devops-deploy"
  mkdir -p "$DEPLOY_DIR"
  cp -r ./static-site/* "$DEPLOY_DIR"
  echo "$(date): Deployed static site to $DEPLOY_DIR" | tee -a $LOG_FILE
}

trap "echo 'Exiting safely...'; exit" SIGINT

while true; do
  echo "======== DevOps Command Center ========"
  echo "1. Backup Home Folder"
  echo "2. Monitor Disk/CPU"
  echo "3. Git Auto Push"
  echo "4. Deploy Static Site"
  echo "5. Cleanup Logs & Temps"
  echo "6. Setup Cron Job"
  echo "7. Exit"
  read -p "Choose option: " opt

  case $opt in
    1) bash scripts/backup.sh ;;
    2) bash scripts/monitor.sh ;;
    3) bash scripts/git-push.sh ;;
    4) bash scripts/deploy.sh ;;
    5) bash scripts/cleanup.sh ;;
    6) bash scripts/schedule.sh ;;
    7) log "User exited command center"; break ;;
    *) echo "Invalid option." ;;
  esac
done

