<# Lab 1
Create a text file that contains
the names of the files and folders
in C:\Windows (don't worry about
including subdirectories- that would 
take too long). Name the text file
MyDir.txt)#>

$searchDir = "C:\Windows"


$outFileName = "myDir.txt"

Dir $searchDir -recurse > $outFileName