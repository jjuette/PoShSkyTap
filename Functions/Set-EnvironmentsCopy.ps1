<#

.SYNOPSIS
Copy SkyTap Environment - Making a backup 

.DESCRIPTION
Copies a specific SkyTap Environment ID
specified in the API call

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER EnvironmentID
The ID number of the Environment to copy

.EXAMPLE
$responseTemplateCopy = Set-EnvironmentsCopy -SkyTapAuth $authSkyTap -EnvironmentID 12345

.OUTPUTS
Returns the response received from the REST API call

#>

function Set-EnvironmentsCopy {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,

        [Parameter(Mandatory=$true)]
        [int]$EnvironmentID

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/configurations.json"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Set content of body to be sent
    $body = @{
        "configuration_id" = $EnvironmentID
    } | ConvertTo-Json

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method POST -Body $body -ContentType "application/json" -Headers $headers

}