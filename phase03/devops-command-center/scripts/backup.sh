#!/bin/bash
BACKUP_DIR="$HOME/devops-backups"
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/home-backup-$(date +%F).tar.gz" "$HOME"
