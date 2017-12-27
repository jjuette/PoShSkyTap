<#

.SYNOPSIS
Prepares SkyTap Username & API Key for Authentication

.DESCRIPTION
Converts SkyTap Username:APIKey to Base64 encoded format for
authenticating to the SkyTap API using Basic Authentication.

.PARAMETER Username
SkyTap Username (i.e. address@email.com)

.PARAMETER APIKey
SkyTap API Key (https://help.skytap.com/kb-find-api-token.html?Highlight=api%20token)

.EXAMPLE
$authSkyTap = Set-SkyTapAuth -Username Joseph.Garcia@cyberark.com -Password 1caf650714f5acec93a490ees9c

.EXAMPLE
[xml]$config = Get-Content -Path "settings.xml"
$authSkyTap = Set-SkyTapAuth -Username ${config.Settings.SkyTap.Authentication.SkyTapAPIUser} `
    -Password ${config.Settings.SkyTap.Authentication.SkyTapAPIPass}

.OUTPUTS
Returns Base64-encoded Username:APIKey string.

#>

function Set-SkyTapAuth {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory=$true)]
        [string]$Username,

        [Parameter(Mandatory=$true)]
        [string]$APIKey

    )

    # Converts Username:Password to Base64-encoded string
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Username,$APIKey)))

    # Returns Base64-encoded string
    $base64AuthInfo

} # end Function: Set-SkyTapAuth