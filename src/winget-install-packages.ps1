$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packagesList = Join-Path $Dir "..\configs\winget-packages.txt"
$packages = Get-Content $packagesList 

Write-Host "[ Winget is going to install these packages: ]"
$packages
Write-Host "---------------------------------------------"
foreach ($package in $packages) {
    Write-Host "[ $package ]" 
    winget install -e --id $package
}