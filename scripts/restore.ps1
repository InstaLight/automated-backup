# restore.ps1 - Restore Script

$backupZip = Read-Host "Enter path to ZIP backup file"
$restorePath = Read-Host "Enter restore location"

if (-not (Test-Path $restorePath)) {
    New-Item -ItemType Directory -Path $restorePath | Out-Null
}

Expand-Archive -Path $backupZip -DestinationPath $restorePath -Force
Write-Host "✅ Backup restored to $restorePath"
