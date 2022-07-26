# Initialize oh-my-posh
oh-my-posh init pwsh --config "C:\Program Files (x86)\oh-my-posh\themes\clean-detailed.omp.json" | Invoke-Expression

# Macros
Function MyLS { ls -Force @args }
New-Alias -Name ll -Value MyLS -Force -Option AllScope

Function Get-Docs { cat $PROFILE | grep New\-Alias | cut -c 17- }
New-Alias -Name docs -Value Get-Docs
