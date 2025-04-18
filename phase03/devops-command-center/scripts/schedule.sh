#!/bin/bash
echo "0 6 * * * $HOME/devops-command-center/scripts/backup.sh >> $HOME/backup-cron.log 2>&1" | crontab -
