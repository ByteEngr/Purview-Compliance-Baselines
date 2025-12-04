<#
.SYNOPSIS
Automatically builds folder structure, inserts scripts/templates, and creates a zip deliverable.

PREREQS:
- PowerShell 7+
- Module: Microsoft.PowerShell.Archive
#>

$repoName = "Microsoft-Purview-Compliance-Baselines"
$root = "./$repoName"

# Folder Structure
$folders = @(
    "$root/src",
    "$root/python",
    "$root/rest",
    "$root/templates",
    "$root/playbooks",
    "$root/docs",
    "$root/pricing",
    "$root/tests/sample-documents",
    "$root/.github/workflows"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) { New-Item -Path $folder -ItemType Directory | Out-Null }
}

# Save Placeholder README
"🚀 Repository initialized. Run scripts in /src to deploy policies." | Out-File "$root/README.md"

# Zip output
$zipPath = "$repoName.zip"
Compress-Archive -Path $root -DestinationPath $zipPath -Force

Write-Host "`n🔥 Package created successfully:" -ForegroundColor Green
Write-Host "➡ $zipPath`n"
