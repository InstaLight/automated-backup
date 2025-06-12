# 🔄 Project 2: Automated Backup System (PowerShell)

## 🎯 Objective
Automate the backup of user profile folders and key server config files using PowerShell, with scheduling and logging.

## 🛠️ Tools & Technologies
- PowerShell
- Windows Server 2022
- Task Scheduler
- JSON Config Files
- Compress-Archive (ZIP)

## 📁 Backup Sources
- `C:\Users\Administrator\Documents`
- `C:\Users\Administrator\Desktop`
- `C:\Windows\System32\inetsrv\config` (IIS)
- `C:\Windows\System32\dhcp` (DHCP)

## 🔧 How It Works
1. `backup.ps1` reads paths from `config.json`
2. Each folder is compressed into a timestamped ZIP
3. Logs are written to `backup-log.txt`
4. Script is scheduled using Windows Task Scheduler

## 🧪 Testing & Validation
- Confirmed backup ZIPs are created with correct contents
- Simulated file loss and restored using `restore.ps1`
- Validated task runs automatically via Task Scheduler

## 🧠 Lessons Learned
- Managing file paths in PowerShell
- Scheduling scripts in production-like environments
- Importance of logging and error handling in automation


