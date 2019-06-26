<#
    .SYNOPSIS
        Writes text to host and includes a new line underneath

    .DESCRIPTION
        Writes text to host and includes a new line underneath

    .PARAMETER Text
        Text to be written
        
    .INPUTS
        None. You cannot pipe objects to Write-HostTextWithNewLine

    .OUTPUTS
        None. Write-HostTextWithNewLine does not generate any output.

    .EXAMPLE
        Write-HostTextWithNewLine "Text to write"
        
    .EXAMPLE
        Write-HostTextWithNewLine -Text "Text to write"
#>
Function Write-HostTextWithNewLine {
    param (
        [Parameter(Mandatory = $True, HelpMessage =
            "Text to write")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Text
    )
    
    Write-Host $Text
    Write-Host ""
}

<#
    .SYNOPSIS
        Checks if the module is installed on the machine

    .DESCRIPTION
        Checks if module is installed and throws an error if it is not installed

    .PARAMETER ModuleName
        Specifies the name of the module to look for
        
    .INPUTS
        None. You cannot pipe objects to Confirm-ModuleInstalled.

    .OUTPUTS
        None. Confirm-ModuleInstalled does not generate any output.

    .EXAMPLE
        Confirm-ModuleInstalled "Az"
        
    .EXAMPLE
        Confirm-ModuleInstalled -ModuleName "Az"
#>
function Confirm-ModuleInstalled {
    param (
        [Parameter(Mandatory = $True, HelpMessage =
            "Module name to look for")]
        [ValidateNotNullOrEmpty()]
        [string]
        $ModuleName
    )
    
    if ([string]::IsNullOrEmpty($(Get-Module -Name $ModuleName).Name)) {
        throw @{
            Exception = "Module is not installed"
        }
    }
    
}

<#
    Found https://stackoverflow.com/questions/7834656/create-log-file-in-powershell
#>
Function Write-Log {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $False)]
        [ValidateSet("INFO", "WARN", "ERROR", "FATAL", "DEBUG")]
        [String]
        $Level = "INFO",

        [Parameter(Mandatory = $True)]
        [string]
        $Message,

        [Parameter(Mandatory = $False)]
        [string]
        $logfile
    )

    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Line = "$Stamp $Level $Message"
    If ($logfile) {
        Add-Content $logfile -Value $Line
    }
    Else {
        Write-Output $Line
    }
}

Function test-run {
    return 5;
}

Export-ModuleMember -Function Write-HostTextWithNewLine
Export-ModuleMember -Function Confirm-ModuleInstalled
Export-ModuleMember -Function Write-Log
Export-ModuleMember -Function test-run