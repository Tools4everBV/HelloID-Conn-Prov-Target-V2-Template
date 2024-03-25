#####################################################
# debugStart
# PowerShell V2
#####################################################

# Select the code below and press F8 to initialize the variable(s) in your PSSession
$warningPreference = 'Continue'
$VerbosePreference = 'Continue'
$InformationPreference = 'Continue'
$config = (Get-Content '{folderPath}/config.json'| ConvertFrom-Json)
$personContext = @{Person = (Get-Content '{folderPath}/demoPerson.json'| ConvertFrom-Json)}

$actionContext = @{
    Configuration = $config
    DryRun        = $false
    Operation     = 'undefined'
    Data = @{
        Department  = $($personContext.person.PrimaryContract.Department.DisplayName)
        DisplayName = $($personContext.Person.Name.DisplayName)
        EndDate     = $($personContext.person.PrimaryContract.EndDate)
        ExternalId  = $($personContext.Person.ExternalId)
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


# The 'CustomList' is a wrapper class around '[System.Collections.Generic.List].
# Its being used in the 'outputContext.AuditLogs'.
# When a new auditLog is added, the message will be automatically displayed within the VSCode UI.
class CustomList {
    $list = [System.Collections.Generic.List[object]]::new()
    [void] Add([object] $obj) {
        $this.list.Add($obj)
        $scriptBlock = {
            if ($obj.IsError){
                $psEditor.Window.ShowErrorMessage("Message: [$($obj.Message)]. Action: [$($obj.Action)]")
            } else {
                $psEditor.Window.ShowInformationMessage("Message: [$($obj.Message)]. Action: [$($obj.Action)]")
            }
        }
        $method = [ScriptBlock]::Create($scriptBlock)
        $method.Invoke()
    }
}

$outputContext = @{
    Data              = $null
    PreviousData      = $null
    AuditLogs         = [CustomList]::new()
    AccountReference  = $null
    Success           = $null
    Permissions       = [System.Collections.Generic.List[object]]::new()
    AccountCorrelated = $false
}



