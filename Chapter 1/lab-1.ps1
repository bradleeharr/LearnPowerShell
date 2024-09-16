<# 
Lab 1:
Create a text file that contains
the names of the files and folders
# in C:\Windows 
#>

$searchDir = "C:\Windows"

# Name the text file myDir.txt
$outFileName = "myDir.txt"

Dir $searchDir -recurse > $outFileName
