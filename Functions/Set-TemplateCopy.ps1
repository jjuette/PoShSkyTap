<#

.SYNOPSIS
Copy SkyTap Template to a different region

.DESCRIPTION
Copies a specific SkyTap Template ID to any region
specified in the API call

.PARAMETER SkyTapAuth
Base64-encoded string containing Username:Password
that was set using the Set-SkyTapAuth function

.PARAMETER TemplateID
The ID number of the Template to copy

.PARAMETER TargetRegion
The Region to copy the Template to

.PARAMETER CopyOverride
Whether to override the power status of the VMs
associated with the Template being copied.  All
VMs in the template are required to be Suspended
or Powered Off in order to copy successfully.

.EXAMPLE
$responseTemplateCopy = Set-TemplateCopy -SkyTapAuth $authSkyTap -TemplateID 12345 -TargetRegion "EMEA" -CopyOverride $false

.OUTPUTS
Returns the response received from the REST API call

#>

function Set-TemplateCopy {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory=$true)]
        [string]$SkyTapAuth,

        [Parameter(Mandatory=$true)]
        [int]$TemplateID,

        [Parameter(Mandatory=$true)]
        [string]$TargetRegion,

        [Parameter(Mandatory=$false)]
        [bool]$CopyOverride=$true

    )

    # Set URI endpoint to send call to
    $uri = "https://cloud.skytap.com/templates.json"

    # Set headers required for authentication and format
    $headers = @{"Accept" = "application/json"; "Authorization" = ("Basic {0}" -f ${SkyTapAuth})}

    # Set content of body to be sent
    $body = @{
        "template_id" = $TemplateID
        "target_region" = $TargetRegion
        "copy_to_region_vm_status_override" = $CopyOverride
    } | ConvertTo-Json

    # Send the API call & return response received
    Invoke-RestMethod -Uri $uri -Method POST -Body $body -ContentType "application/json" -Headers $headers

}