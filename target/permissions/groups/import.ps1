####################################################################
# HelloID-Conn-Prov-Target-{connectorName]-Permissions-Groups-Import
# PowerShell V2
####################################################################

# Enable TLS1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12

#region functions
function Resolve-{connectorName}Error {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [object]
        $ErrorObject
    )
    process {
        $httpErrorObj = [PSCustomObject]@{
            ScriptLineNumber = $ErrorObject.InvocationInfo.ScriptLineNumber
            Line             = $ErrorObject.InvocationInfo.Line
            ErrorDetails     = $ErrorObject.Exception.Message
            FriendlyMessage  = $ErrorObject.Exception.Message
        }
        if (-not [string]::IsNullOrEmpty($ErrorObject.ErrorDetails.Message)) {
            $httpErrorObj.ErrorDetails = $ErrorObject.ErrorDetails.Message
        } elseif ($ErrorObject.Exception.GetType().FullName -eq 'System.Net.WebException') {
            if ($null -ne $ErrorObject.Exception.Response) {
                $streamReaderResponse = [System.IO.StreamReader]::new($ErrorObject.Exception.Response.GetResponseStream()).ReadToEnd()
                if (-not [string]::IsNullOrEmpty($streamReaderResponse)) {
                    $httpErrorObj.ErrorDetails = $streamReaderResponse
                }
            }
        }
        try {
            $errorDetailsObject = ($httpErrorObj.ErrorDetails | ConvertFrom-Json)
            # Make sure to inspect the error result object and add only the error message as a FriendlyMessage.
            # $httpErrorObj.FriendlyMessage = $errorDetailsObject.message
            $httpErrorObj.FriendlyMessage = $httpErrorObj.ErrorDetails # Temporarily assignment
        } catch {
            $httpErrorObj.FriendlyMessage = "Error: [$($httpErrorObj.ErrorDetails)] [$($_.Exception.Message)]"
        }
        Write-Output $httpErrorObj
    }
}
#endregion

try {
    Write-Information 'Starting {connectorName} permission group entitlement import'

    # $splatImportPermissionParams = @{
    #     Uri     = '<URL to API>'
    #     Method  = 'GET'
    # }
    # $importedPermissions = Invoke-RestMethod @splatGetAllAccountParams

    # Example with dummy data
    $importedPermissions = @(
        @{
            id = 'Permission1'
            description = 'First permission'
            displayName = 'First permission'
            members = @('1001', '1002', '1003')
        },
        @{
            id = 'Permission2'
            description = 'Second permission'
            displayName = 'Second permission'
            members = @('1004', '1005')
        }
    )

    foreach ($importedPermission in $importedPermissions) {
        $permission = @{
            PermissionReference = @{
                Reference = $importedPermission.id
            }
            Description       = "$($importedPermission.description)"
            DisplayName       = "$($importedPermission.name)"
            AccountReferences = $null
        }

        # Batch members based on the amount of account references,
        # to make sure the output objects are not above the limit with a max of 500
        $batchSize = 3
        $batches = 0..($importedPermission.members.Count - 1) | Group-Object { [math]::Floor($_ / $batchSize) }
        foreach ($batch in $batches) {
            $permission.AccountReferences = [array]($batch.Group | ForEach-Object { $importedPermission.members[$_] })
            Write-Output $permission
        }
    }
    Write-Information '{connectorName} permission group entitlement import completed'
} catch {
    $ex = $PSItem
    if ($($ex.Exception.GetType().FullName -eq 'Microsoft.PowerShell.Commands.HttpResponseException') -or
        $($ex.Exception.GetType().FullName -eq 'System.Net.WebException')) {
        $errorObj = Resolve-GoogleWSError -ErrorObject $ex
        Write-Warning "Error at Line '$($errorObj.ScriptLineNumber)': $($errorObj.Line). Error: $($errorObj.ErrorDetails)"
        Write-Error "Could not import {connectorName} permission group entitlements. Error: $($errorObj.FriendlyMessage)"
    } else {
        Write-Warning "Error at Line '$($ex.InvocationInfo.ScriptLineNumber)': $($ex.InvocationInfo.Line). Error: $($ex.Exception.Message)"
        Write-Error "Could not import {connectorName} permission group entitlements. Error: $($ex.Exception.Message)"
    }
}