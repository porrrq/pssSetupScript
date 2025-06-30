$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packagesList = Join-Path $Dir "..\configs\scoop-packages.txt"
$packages = Get-Content $packagesList 

Write-Host "[ Scoop is going to install these packages: ]"
$packages
Write-Host "---------------------------------------------"
foreach ($package in $packages) {
    Write-Host "[ $package ]" 
    scoop install $package 
}