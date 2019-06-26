Import-Module $PSScriptRoot\CommonTasks.psm1 -Force
#. $PSScriptRoot\CommonTasks.psm1

Describe 'CommonTasks' {
    Context 'Write-HostTextWithNewLine' {

    }

    Context 'Confirm-ModuleInstalled' {
        # It "Given a module that doesn't exist, it should throw an error" {
        #     Confirm-ModuleInstalled "ModuleNameToFail" | Should throw
        # }
    }

    Context 'Write-Log' {

    }

    Context 'test-run' {
        It 'Should return 5' {
            test-run | should -Be 5
        }

        It 'Should not return 6' {
            test-run | should -Not -Be 6
        }
    }
}