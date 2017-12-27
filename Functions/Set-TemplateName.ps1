<#

.SYNOPSIS
Change the Template Name to a different one

.DESCRIPTION
Same as Synopsis

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER TemplateID
The ID number of the Template

.PARAMETER TemplateName
The new Template Name to change to

.EXAMPLE
$responseTemplateName = Set-TemplateName -SkyTapAuth $authSkyTap -TemplateID 12345 -TemplateName "EMEA CyberArk Global Demo - GA"

.OUTPUTS
Returns the response received from the REST API call

#>

function Set-TemplateName {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,

        [Parameter(Mandatory=$true)]
        [int]$TemplateID,

        [Parameter(Mandatory=$true)]
        [string]$TemplateName

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/templates/${TemplateID}?name=${TemplateName}"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method PUT -Body $body -ContentType "application/json" -Headers $headers

} # end Function: Set-TemplateName