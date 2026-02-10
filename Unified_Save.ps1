Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$url = "https://pastebin.com/raw/1jPPAir1"
$file = "$env:USERPROFILE\Desktop\Unified_Save_Drive.ps1"

Write-Host ">>> FETCHING LATEST SCRIPT FROM CLOUD..." -ForegroundColor Cyan

curl.exe -L -o $file $url

if (Test-Path $file) {
    powershell.exe -ExecutionPolicy Bypass -File $file
} else {
    Write-Host "FAILED TO FETCH SCRIPT" -ForegroundColor Red
}
