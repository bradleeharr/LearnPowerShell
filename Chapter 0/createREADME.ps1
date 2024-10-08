<#
Generates the README.md file based on header comments within each Chapter Folder.
#>

$global:MyReadme = ""
function AddLog ($string) {
    $global:MyReadme += ($string) + "`r`n"
}

$titles = @{
    0="Personal Scripts"
    1="Getting Started";
    2="";
    3="Using the Help System";
    4="";
}

$pwd = pwd
$N_CHAPTERS = $titles.count
for ($i = 0; $i -lt $N_CHAPTERS; $i++) {

    $title = $titles[$i]
    AddLog "### Chapter $i\: $title"

    $chapter_dir = "$pwd\..\Chapter $i"
    if (Test-Path $chapter_dir) {
        Write-Host $chapter_dir
        foreach ($name in dir $chapter_dir -Name) {
            AddLog " * $name"
            $fileContent = Get-Content "$chapter_dir\$name" -Raw
            $description = $fileContent -replace "`r`n", " " 
            $description = $description -replace '[ ]*<#', "" 
            $description = $description -replace '#>.*', "" 
            Write-Host $description
            AddLog "    * $description"
        }
    }
}
AddLog "### Personal Scripts"
AddLog "* createREADME.ps1"
AddLog "* elevate-to-admin.ps1"

echo $global:MyReadme 

# Encoding issue:
# $global:MyReadme > "README.md" 
# Instead do:
[System.IO.File]::WriteAllText("README.md", $global:MyReadme, [System.Text.Encoding]::UTF8)

pwd
