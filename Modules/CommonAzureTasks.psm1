<#
    .SYNOPSIS
        Activate an Azure subscription using its name

    .DESCRIPTION
        Activate an Azure subscription using the subscription name provided by the user.
        If the subscription is already active then the script continues

    .PARAMETER SubscriptionName
        Name of the subscription 
        
    .INPUTS
        None. You cannot pipe objects to Set-SubscriptionIfNotActive

    .OUTPUTS
        None. Set-SubscriptionIfNotActive does not generate any output.

    .EXAMPLE
        Set-SubscriptionIfNotActive "Subscription Name"
        
    .EXAMPLE
        Set-SubscriptionIfNotActive -SubscriptionName "Subscription Name"
#>
Function Set-SubscriptionIfNotActive {
    param (
        [Parameter(Mandatory = $True, HelpMessage =
            "Enter subscription name.")]
        $SubscriptionName
    )

    try {
        Write-Host ""
        Write-HostTextWithNewLine -Text "Set-SubscriptionIfNotActive Start"
        if ($SubscriptionName -ne (Get-AzContext).Subscription.Name) {
            Get-AzSubscription -SubscriptionName $SubscriptionName | Select-AzSubscription
        }
        else {
            Write-HostTextWithNewLine -Text "Subscription is already active"
        }

        Write-HostTextWithNewLine -Text "Set-SubscriptionIfNotActive End"
        Write-HostTextWithNewLine -Text "-------------------------------"
    }
    catch {
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}

<#
    .SYNOPSIS
        Login to Azure if session is not already logged in    

    .DESCRIPTION
        Login to Azure if session is not already logged in. The prompt will be displayed if not logged in, otherwise the script will continue

    .INPUTS
        None. You cannot pipe objects to Connect-ToAzureIfNecessary

    .OUTPUTS
        None. Connect-ToAzureIfNecessary does not generate any output.

    .EXAMPLE
        Set-SubscriptionIfNotActive "Subscription Name"
        
#>
Function Connect-ToAzureIfNecessary {
    # Check if user is logged into Azure already
    if ([string]::IsNullOrEmpty($(Get-AzContext).Account)) {
        # If not then connect
        Connect-AzAccount
    }
    else {
        Write-Host "Logged in using $($(Get-AzContext).Account)"
    }
}

Export-ModuleMember -Function Set-SubscriptionIfNotActive
Export-ModuleMember -Function Connect-ToAzureIfNecessary