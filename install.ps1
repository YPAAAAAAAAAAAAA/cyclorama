# Installs Cyclorama as a real app for the current user (no admin):
#   publish -> %LOCALAPPDATA%\Programs\Cyclorama -> Start Menu + Desktop shortcuts -> Open-with entry.
# Run from the repo root:  .\install.ps1        Remove everything with:  .\install.ps1 -Uninstall
param([switch]$Uninstall)
$ErrorActionPreference = "Stop"

$dest = Join-Path $env:LOCALAPPDATA "Programs\Cyclorama"
$exe = Join-Path $dest "Cyclorama.exe"
$startMenuLnk = Join-Path ([Environment]::GetFolderPath("StartMenu")) "Programs\Cyclorama Curved Screen.lnk"
$desktopLnk = Join-Path ([Environment]::GetFolderPath("Desktop")) "Cyclorama Curved Screen.lnk"

if ($Uninstall) {
    if (Test-Path $exe) { & $exe --unregister }
    Remove-Item $dest, $startMenuLnk, $desktopLnk -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Cyclorama removed."
    exit 0
}

Write-Host "publishing..."
dotnet publish (Join-Path $PSScriptRoot "Cyclorama.csproj") -c Release -o $dest --nologo | Out-Null
if (-not (Test-Path $exe)) { throw "publish produced no exe at $exe" }

$shell = New-Object -ComObject WScript.Shell
foreach ($lnkPath in $startMenuLnk, $desktopLnk) {
    $lnk = $shell.CreateShortcut($lnkPath)
    $lnk.TargetPath = $exe
    $lnk.WorkingDirectory = $dest
    $lnk.Description = "A curved screen, floating on your desktop"
    $lnk.IconLocation = "$exe,0"
    $lnk.Save()
}

& $exe --register   # Open-with entries now point at the installed copy

Write-Host "installed -> $dest"
Write-Host "shortcuts -> Start Menu + Desktop"
Write-Host "right-click any film or picture -> Open with -> Cyclorama"
