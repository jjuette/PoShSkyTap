<#

.SYNOPSIS
Add template to a Project

.DESCRIPTION
Adds the Template ID to the Project ID given

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER TemplateID
The ID number of the Template

.PARAMETER ProjectID
The ID number of the Project

.EXAMPLE
$responseTemplateProject = Set-TemplateProject -SkyTapAuth $authSkyTap -TemplateID 12345 -ProjectID 67890

.OUTPUTS
Returns the response received from the REST API call

#>

function Set-TemplateProject {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,

        [Parameter(Mandatory=$true)]
        [int]$TemplateID,

        [Parameter(Mandatory=$true)]
        [string]$ProjectID

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/${ProjectID}/templates/${TemplateID}"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method POST -Body $body -ContentType "application/json" -Headers $headers

} # end Function: Set-TemplateProject