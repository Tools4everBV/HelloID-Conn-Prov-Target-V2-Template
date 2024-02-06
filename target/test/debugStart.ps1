#####################################################
# debugStart
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
        Department  = $($personContext.person.PrimaryContract.Department.DisplayName)
        DisplayName = $($personContext.Person.Name.GivenName)
        EndDate     = $($personContext.person.PrimaryContract.EndDate)
        ExternalId  = $($personContext.Person.Contact.Business.Email)
        FamilyName  = $($personContext.Person.Name.FamilyName)
        Manager     = $($personContext.person.PrimaryManager.DisplayName)
        NickName    = $($personContext.Person.Name.NickName)
        StartDate   = $($personContext.person.PrimaryContract.StartDate)
        Title       = $($personContext.person.PrimaryContract.Title.Name)
        UserName    = 'casey.bos1'
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
