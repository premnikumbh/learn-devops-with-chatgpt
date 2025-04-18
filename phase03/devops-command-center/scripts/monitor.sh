#!/bin/bash

LOG_FILE="logs/monitor.log"
mkdir -p logs

echo "==============================" | tee "$LOG_FILE"
echo " System Monitoring Report" | tee -a "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"
echo "==============================" | tee -a "$LOG_FILE"

echo -e "\n Disk Usage:" | tee -a "$LOG_FILE"
df -h | tee -a "$LOG_FILE"

echo -e "\n CPU & RAM Stats (top 10):" | tee -a "$LOG_FILE"
top -b -n1 | head -n 10 | tee -a "$LOG_FILE"

echo -e "\n Log saved to $LOG_FILE"

