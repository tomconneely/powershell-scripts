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