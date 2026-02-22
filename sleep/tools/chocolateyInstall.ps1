$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName  = $env:chocolateyPackageName
  file         = "$toolsPath\sleep.exe"
  url          = 'https://github.com/isanych/sleep/releases/download/v1.0/sleep.exe'
  checksum     = 'BAF72C434283FCF2FB4B1B4BCFD89F6AAF5645D5D9947305B867BFC768D6B75D'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

Install-BinFile 'sleep' "$toolsPath\sleep.exe"