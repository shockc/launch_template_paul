<powershell>
# Install AWS CLI
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn
Start-Sleep -s 90

# Create Folder C:\downloads
New-Item -ItemType Directory -Path "C:\downloads"

# download deploy script
cd "C:\Program Files\Amazon\AWSCLIV2"
.\aws.exe s3 cp s3://u-xy-bucket-02/SYS/PS/AutoDeploy/u-BU_AutoDeploy_Windows2019.ps1 C:\downloads\

# exec script
C:\downloads\u-BU_AutoDeploy_Windows2019.ps1
</powershell>