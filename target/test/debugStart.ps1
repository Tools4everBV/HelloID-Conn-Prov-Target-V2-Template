#####################################################
# DebugStart
# PowerShell V2
#####################################################

# Select the code below and press F8 to initialize the variable(s) in your PSSession
$warningPreference = 'Continue'
$VerbosePreference = 'Continue'
$InformationPreference = 'Continue'
$config = (Get-content '{folderPath}\config.json'| ConvertFrom-Json)
$personContext = @{Person = (Get-content '{folderPath}\demoPerson.json'| ConvertFrom-Json)}

$actionContext = @{
    Configuration = $config
    DryRun        = $false
    Operation     = 'undefined'
    Data = @{
        externalId = $($personContext.Person.ExternalId)
        firstName  = $($personContext.Person.Name.GivenName)
        lastName   = $($personContext.Person.Name.FamilyName)
        email      = $($personContext.Person.Contact.Business.Email)
    }
    CorrelationConfiguration = @{
        Enabled           = $true
        PersonField       = 'Person.ExternalId'
        PersonFieldValue  = $($personContext.Person.ExternalId)
        AccountField      = 'externalId'
        AccountFieldValue = $($personContext.Person.ExternalId)
    }
    AccountCorrelated = $true
    References = @{
        Account        = ''
        ManagerAccount = ''
    }
}

$outputContext = @{
    Data              = $null
    PreviousData      = $null
    AuditLogs         = [System.Collections.Generic.List[object]]::new()
    AccountReference  = $null
    Success           = $null
    Permissions       = [System.Collections.Generic.List[object]]::new()
    AccountCorrelated = $false
}
