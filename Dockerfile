# Use a Windows Server Core image as the base
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set environment variables
ENV UNITY_VERSION 2021.3.0f1
ENV UNITY_INSTALLER_URL https://download.unity3d.com/download_unity/%UNITY_VERSION%/Windows64EditorInstaller/UnitySetup64-%UNITY_VERSION%.exe
ENV UNITY_INSTALLER_PATH C:\UnitySetup.exe

# Download and install Unity
RUN Invoke-WebRequest -Uri $env:UNITY_INSTALLER_URL -OutFile $env:UNITY_INSTALLER_PATH -UseBasicParsing ; \
    Start-Process -FilePath $env:UNITY_INSTALLER_PATH -ArgumentList "/S" -Wait ; \
    Remove-Item $env:UNITY_INSTALLER_PATH -Force

# Set the PATH environment variable to include Unity
RUN setx /M PATH "%PATH%;C:\Program Files\Unity\Editor"

# Optional: Add any additional dependencies or configurations here

# Set the working directory
WORKDIR C:\UnityProject

# Start a shell session or a custom command (e.g., PowerShell)
CMD ["powershell"]
