$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = $env:chocolateyPackageName
  file           = "$toolsPath\timemem.exe"
  url            = 'https://github.com/isanych/timemem/releases/download/v2.0/timemem.exe'
  checksum       = '741C35165E9E68D34D616E3992231F885431458E3808FDEDA6B8895249F1F42A'
  checksumType   = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

Install-BinFile 'timemem' "$toolsPath\timemem.exe"
