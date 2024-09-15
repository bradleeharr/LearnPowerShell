# CMD       # DESCRIPTION
Dir         # Listing of files and folders from the current folder
Copy        # Copy a file to a different Location
Cd          # Change Directories
Move        # Move a file to a new location
Ren         # Rename an existing file
MkDir       # Create a new Directory
Del         # Delete a File
Type        # Dispaly the contents of a text file

# Combining Commands ===============================
# Pipe Command
Dir | More              # Paged - List all Directories

# Angle Redirection
Dir > file.txt          # Directs output to a file

# Double Angle Redirection
Dir >> file.txt         # Directs output to a file (appending the file)

# PSDrives
Cd HKCU:                # Change to the HKEY_CURRENT_USER registry hive
Cd ENV:                 # Change to the Environment variables
Get-PSDrive             # View PSDrives
New-PSDrive             # Create New PSDrive

 