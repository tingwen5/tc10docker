FROM mcr.microsoft.com/windows/servercore:10.0.14393.1066_zh-cn

LABEL maintainer "wangshuai"
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY InstallFile /

RUN Start-Process -FilePath '.\SPLMLicenseServer_v9.1.0_win_setup.exe' -PassThru -Wait -ArgumentList "'--mode unattended','--installer-language zh_CN','--upgradeexit Upgrade','--repairreplace Replace','--installdir C:/Siemens/PLMLicenseServer','--licensefile C:/splm9.lic'" ;\
    Copy-Item "C:\splm9.lic" -Destination "C:\Siemens\PLMLicenseServer\splm9.lic" -Force; \
    Remove-Item '.\SPLMLicenseServer_v9.1.0_win_setup.exe','.\splm9.lic';
CMD .\start -Verbose

EXPOSE 28000
EXPOSE 38000

