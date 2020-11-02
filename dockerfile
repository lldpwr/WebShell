FROM mcr.microsoft.com/powershell:7.0.3-debian-10
RUN pwsh -c 'Install-Module -Name Pode -Confirm:$false'
COPY . /usr/src/app/
EXPOSE 8085
CMD [ "pwsh", "-c", "cd /usr/src/app; ./launch.ps1" ]