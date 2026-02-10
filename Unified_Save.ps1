Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$githubWatcher = {
    $parentPath = "$env:USERPROFILE\Desktop", "$env:USERPROFILE\Downloads"
    while($true) {
        $projects = Get-ChildItem -Path $parentPath -Directory -Filter "rfcity-*"
        foreach ($p in $projects) {
            if (Test-Path "$($p.FullName)\.git") {
                Set-Location $p.FullName
                if (git status --porcelain) {
                    $branchName = "ai-updates-$(Get-Date -Format 'yyyy-MM-dd')"
                    $currentBranch = git rev-parse --abbrev-ref HEAD
                    if ($currentBranch -ne $branchName) {
                        git checkout -b $branchName 2>$null -or git checkout $branchName
                    }
                    git add .
                    $preciseTime = Get-Date -Format "HH:mm:ss"
                    git commit -m "AI-Agent-Update-$preciseTime" --allow-empty
                }
            }
        }
        Start-Sleep -Milliseconds 500
    }
}

Start-Job -ScriptBlock $githubWatcher -Name "AI_GitHub_Watcher"

$url = "https://pastebin.com/raw/1jPPAir1"
$file = "$env:USERPROFILE\Desktop\Unified_Save_Drive.ps1"

Write-Host ">>> FETCHING LATEST SCRIPT FROM CLOUD..." -ForegroundColor Cyan

curl.exe -L -o $file $url

if (Test-Path $file) {
    powershell.exe -ExecutionPolicy Bypass -File $file
} else {
    Write-Host "FAILED TO FETCH SCRIPT" -ForegroundColor Red
}
