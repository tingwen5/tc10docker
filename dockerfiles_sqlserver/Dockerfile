FROM mcr.microsoft.com/windows/servercore:10.0.14393.1066_zh-cn

LABEL maintainer "wangshuai"
ENV sa_password="_" \
    attach_dbs="[]" \
    ACCEPT_EULA="_" \
    sa_password_path="C:\ProgramData\Docker\secrets\sa-password"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
COPY InstallFile /

RUN Dism.exe /online /add-package /packagepath:.\NetFx3.cab; \
     Remove-Item -Recurse -Force .\NetFx3.cab ;

RUN Start-Process -Wait -FilePath .\SQLFULL_x64_CHS_Install.exe -ArgumentList /qs, /x:setup ; \
        .\SQLFULL_x64_CHS\setup.exe /q /ACTION=Install /ENU=0 /INSTANCENAME=MSSQLSERVER /FEATURES=SQLENGINE /UPDATEENABLED=0 /SQLSVCACCOUNT='NT AUTHORITY\System' /SQLSYSADMINACCOUNTS='BUILTIN\ADMINISTRATORS' /TCPENABLED=1 /NPENABLED=0 /IACCEPTSQLSERVERLICENSETERMS ; \
        Remove-Item -Recurse -Force .\SQLFULL* ;
RUN Get-Service MSSQLSERVER* | stop-service  ; \
        set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQLServer\SuperSocketNetLib\Tcp\IPAll' -name tcpdynamicports -value '' ; \
        set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQLServer\SuperSocketNetLib\Tcp\IPAll' -name tcpport -value 1433 ; \
        set-itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQLServer\' -name LoginMode -value 2 ; 

HEALTHCHECK CMD [ "sqlcmd", "-Q", "select 1" ]

CMD .\start -sa_password $env:sa_password -ACCEPT_EULA $env:ACCEPT_EULA -attach_dbs \"$env:attach_dbs\" -Verbose