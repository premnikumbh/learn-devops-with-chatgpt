#!/bin/bash

CRON_BACKUP="logs/current_cron.bak"
CRON_TEMP="logs/updated_cron.tmp"
mkdir -p logs

print_menu() {
  echo ""
  echo "=== CRON JOB MANAGER ==="
  echo "1. List Cron Jobs"
  echo "2. Add New Cron Job"
  echo "3. Remove Cron Job"
  echo "4. Modify Cron Job Interval"
  echo "5. Exit"
  echo "========================"
}

list_crons() {
  crontab -l > "$CRON_BACKUP" 2>/dev/null
  if [[ ! -s "$CRON_BACKUP" ]]; then
    echo "No cron jobs scheduled."
    return
  fi
  echo "Current Cron Jobs:"
  nl -w2 -s'. ' "$CRON_BACKUP"
}

add_cron() {
  read -p "Enter full path of script to schedule: " script_path
  read -p "Enter cron interval (e.g. '0 * * * *'): " interval

  if [[ ! -f "$script_path" ]]; then
    echo "Script does not exist at $script_path"
    return
  fi

  (crontab -l 2>/dev/null; echo "$interval bash $script_path") | crontab -
  echo "Cron job added!"
}

remove_cron() {
  crontab -l > "$CRON_BACKUP" 2>/dev/null
  if [[ ! -s "$CRON_BACKUP" ]]; then
    echo "No cron jobs found."
    return
  fi

  nl -w2 -s'. ' "$CRON_BACKUP"
  read -p "Enter the line number to delete: " del_line

  total_lines=$(wc -l < "$CRON_BACKUP")
  if (( del_line < 1 || del_line > total_lines )); then
    echo "Invalid line number."
    return
  fi

  sed "${del_line}d" "$CRON_BACKUP" > "$CRON_TEMP"
  crontab "$CRON_TEMP"
  echo "Cron job removed."
}

modify_cron() {
  crontab -l > "$CRON_BACKUP" 2>/dev/null
  if [[ ! -s "$CRON_BACKUP" ]]; then
    echo "No cron jobs found."
    return
  fi

  nl -w2 -s'. ' "$CRON_BACKUP"
  read -p "Enter line number to modify interval: " mod_line
  total_lines=$(wc -l < "$CRON_BACKUP")

  if (( mod_line < 1 || mod_line > total_lines )); then
    echo "Invalid line number."
    return
  fi

  old_line=$(sed -n "${mod_line}p" "$CRON_BACKUP")
  echo "Current entry: $old_line"
  read -p "Enter new interval (e.g. '*/5 * * * *'): " new_interval

  cmd_only=$(echo "$old_line" | cut -d' ' -f6-)
  echo "Updated command: $new_interval $cmd_only"

  sed "${mod_line}s~.*~$new_interval $cmd_only~" "$CRON_BACKUP" > "$CRON_TEMP"
  crontab "$CRON_TEMP"
  echo "Cron job interval updated."
}

# MAIN MENU
while true; do
  print_menu
  read -p "Choose option: " option
  case $option in
    1) list_crons ;;
    2) add_cron ;;
    3) remove_cron ;;
    4) modify_cron ;;
    5) break ;;
    *) echo "Invalid option!" ;;
  esac
done
