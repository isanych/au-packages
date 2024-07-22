$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = $env:chocolateyPackageName
  file           = "$$toolsPath\timemem.exe"
  url            = 'https://github.com/isanych/timemem/releases/download/v1.0/timemem.exe'
  checksum       = '5F8E45FCEBC0949D77D428FDA2902CDD1AAE16ABD128B5036FCB7D96BE00DCFE'
  checksumType   = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

Install-BinFile 'timemem' $installLocation\timemem.exe
