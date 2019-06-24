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

Export-ModuleMember -Function Write-HostTextWithNewLine
Export-ModuleMember -Function Confirm-ModuleInstalled