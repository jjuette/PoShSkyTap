<#

.SYNOPSIS
Change the Template Owner to another user

.DESCRIPTION
Changes the Template OwnerID to the UserID of
a different user.

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER TemplateID
The ID number of the Template

.PARAMETER OwnerID
The ID number of the User to make the new owner

.EXAMPLE
$responseTemplateOwner = Set-TemplateOwner -SkyTapAuth $authSkyTap -TemplateID 12345 -OwnerID 123

.OUTPUTS
Returns the response received from the REST API call

#>

function Set-TemplateOwner {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,
        
        [Parameter(Mandatory=$true)]
        [int]$TemplateID,
        
        [Parameter(Mandatory=$true)]
        [int]$OwnerID

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/templates/${TemplateID}.json"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Set content of body to be sent
    $body = @{
        "owner" = $OwnerID
    } | ConvertTo-Json

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method PUT -Body $body -ContentType "application/json" -Headers $headers

} # end Function: Set-TemplateOwner