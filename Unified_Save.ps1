Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$url = "https://docs.google.com/uc?export=download&id=14QIaEfxKCd0qWMtDOWVEdUd39LEtzPv3"
$file = "$env:USERPROFILE\Desktop\Unified_Save_Drive.ps1"

Write-Host ">>> FETCHING LATEST SCRIPT FROM GOOGLE DRIVE..." -ForegroundColor Cyan

curl.exe -L -o $file $url

if (Test-Path $file) {
    powershell.exe -ExecutionPolicy Bypass -File $file
} else {
    Write-Host "FAILED TO FETCH SCRIPT FROM DRIVE" -ForegroundColor Red
}
