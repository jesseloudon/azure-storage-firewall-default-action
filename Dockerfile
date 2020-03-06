FROM microsoft/azure-cli

LABEL "com.github.actions.name"="azure-storage-firewall-allow"
LABEL "com.github.actions.description"="Configures Azure Storage Account to Allow Access from All Networks"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/jesseloudon/azure-storage-firewall-allow"
LABEL "homepage"="https://github.com/jesseloudon/azure-storage-firewall-allow"
LABEL "maintainer"="Jesse Loudon <loudoninbox@outlook.com>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
