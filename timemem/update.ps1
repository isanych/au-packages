﻿import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$GitHubRepositoryUrl = 'https://github.com/isanych/timemem'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+url:).*"    = "`${1} $($Latest.URL64)"
            "(?i)(checksum:).*"  = "`${1} $($Latest.Checksum64)"
        }
     }
 }

 function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $url = Get-GitHubReleaseUrl $GitHubRepositoryUrl
    $version = $url -split '/' | select -Last 1 -Skip 1

    return @{
        Version      = $version -replace '^v'
        URL64        = $url
        ReleaseNotes = "$GitHubRepositoryUrl/releases/tag/$version"
    }
}

update -ChecksumFor none
