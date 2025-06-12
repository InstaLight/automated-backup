# 🛡️ Automated Backup System (PowerShell)

This project is part of my personal IT lab portfolio. It’s a **PowerShell-based backup automation script** designed to regularly back up user profile folders and critical server configuration files. It supports logging, error handling, and scheduling with Windows Task Scheduler.

> ✅ Built and tested in a Windows Server 2022 and Windows 10 virtual lab  
> ✅ Handles system-level paths and locked files gracefully  
> ✅ Fully documented and configurable with `config.json`

---

## 🔧 Features

- 📁 **Backs up multiple directories** (user data + config files)
- 🗂️ **Compresses files** into ZIP archives with timestamped names
- 🕒 **Supports daily automation** via Task Scheduler
- ⚠️ **Handles permission errors and locked system files**
- 📜 **Generates log file** of all backup activity
- ⚙️ **Easily configurable** via JSON

---

## ⚙️ Configuration

The script reads from `config/config.json`:

```json
{
  "BackupItems": [
    "C:\\Users\\vboxuser\\Documents",
    "C:\\Users\\vboxuser\\Desktop",
    "C:\\Windows\\System32\\inetsrv\\config",
    "C:\\Windows\\System32\\dhcp"
  ],
  "BackupDestination": "C:\\Backups",
  "LogFile": "C:\\Backups\\backup-log.txt"
}
```
---

## 🚀 How to Use

    Open PowerShell as Administrator

    Clone or download this repository

    Edit config/config.json with your desired settings

    Run the script manually:

    .\scripts\backup.ps1

    (Optional) Create a scheduled task with Task Scheduler for automation

---

## 🖼️ Screenshots

Screenshots are available in the /screenshots folder, including:

    PowerShell output from a successful run

    backup-log.txt contents

    ZIP files in the destination folder

    Task Scheduler configuration

    Example error handling

---

## 🧠 What I Learned

    PowerShell scripting for automation

    System administration file handling

    Logging and error capture in scripts

    Managing locked and permission-protected files

    Task automation with Task Scheduler

---

