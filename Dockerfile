FROM microsoft/azure-cli

LABEL "com.github.actions.name"="azure-storage-firewall-default-action"
LABEL "com.github.actions.description"="Configures Azure Storage Firewall default action (Allow or Deny) for network access"
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/jesseloudon/azure-storage-firewall-default-action"
LABEL "homepage"="https://github.com/jesseloudon/azure-storage-firewall-default-action"
LABEL "maintainer"="Jesse Loudon <gitbao@outlook.com>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
