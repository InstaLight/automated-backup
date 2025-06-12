# backup.ps1 - Automated Backup Script

# Load config
$configPath = "$PSScriptRoot\config.json"
$config = Get-Content $configPath | ConvertFrom-Json

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logPath = $config.LogFile
$destination = $config.BackupDestination

# Ensure backup directory exists
if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

Add-Content -Path $logPath -Value "=== Backup Started: $timestamp ==="

foreach ($item in $config.BackupItems) {
    if (-not (Test-Path $item)) {
        Add-Content -Path $logPath -Value "⚠️ WARNING: Path not found - $item"
        continue
    }

    $itemName = Split-Path $item -Leaf
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $zipName = "${itemName}_$timestamp.zip"
    $zipPath = Join-Path $destination $zipName

    try {
        # Create a temp staging folder
        $temp = Join-Path $env:TEMP ("backup_" + [guid]::NewGuid().ToString())
        $robocopyLog = "$env:TEMP\robocopy.log"
	robocopy $item $temp /MIR /R:1 /W:1 /NFL /NDL /NJH /NJS /LOG:$robocopyLog > $null

        Compress-Archive -Path $temp\* -DestinationPath $zipPath -ErrorAction Stop

        Remove-Item -Path $temp -Recurse -Force
        Add-Content -Path $logPath -Value "✅ Backed up $item to $zipPath"
    } catch {
        Add-Content -Path $logPath -Value "❌ ERROR: Failed to back up $item - $($_.Exception.Message)"
    }
}

Add-Content -Path $logPath -Value "=== Backup Finished: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss") ===`n"
