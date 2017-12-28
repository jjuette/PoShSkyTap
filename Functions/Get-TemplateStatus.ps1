<#

.SYNOPSIS
Get the current status of a Template

.DESCRIPTION
Returns the current details of a Template

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER TemplateID
The ID number of the Template

.EXAMPLE
$responseTemplateStatus = Get-TemplateStatus -SkyTapAuth $authSkyTap -TemplateID 12345

.OUTPUTS
Returns the response received from the REST API call

#>

function Get-TemplateStatus {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,

        [Parameter(Mandatory=$true)]
        [int]$TemplateID

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/templates/${TemplateID}"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method GET -Body $body -ContentType "application/json" -Headers $headers

} # end Function: Get-TemplateStatus
