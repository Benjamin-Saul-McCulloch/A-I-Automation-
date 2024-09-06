#Pull Current User Info
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.Split('\')[-1]

# Construct the path to the user's folder inside C:\Users
$userFolderPath = Join-Path -Path "C:\Users" -ChildPath $currentUser

# Display the folder path
Write-Host "The folder path for the current signed-in user is: $userFolderPath"

$folderName = Read-Host "Enter the name of the folder"

# Define the hard-coded path for the main folder
$mainFolderPath = "C:\Users\$currentUser\OneDrive - Avertium\Architecture and Integration\Projects\$folderName"

# Define the list of preset folder names
$presetFolders = @("Deliverables", "SOW", "WBS", "Working")

# Create the main folder if it doesn't exist
if (-Not (Test-Path -Path $mainFolderPath)) {
    New-Item -ItemType Directory -Path $mainFolderPath
}

# Create the preset folders inside the main folder
foreach ($folder in $presetFolders) {
    $folderPath = Join-Path -Path $mainFolderPath -ChildPath $folder
    if (-Not (Test-Path -Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath
    }
}

Write-Host "Folders created successfully!"
