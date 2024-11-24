:: How to Launch a Powershell script from a .bat file:

SET CurrentDirectory=%~dp0

powershell -NoProfile -ExecutionPolicy Bypass -File "Path\To\YourScript.ps1"
