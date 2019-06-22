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