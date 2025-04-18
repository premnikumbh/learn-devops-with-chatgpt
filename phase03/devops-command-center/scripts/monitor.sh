#!/bin/bash
echo "Disk Usage:" > logs/monitor.log
df -h >> logs/monitor.log
echo "CPU & RAM Stats:" >> logs/monitor.log
top -b -n1 | head -n 10 >> logs/monitor.log
