#!/bin/sh

set -e

if [ -z "$INPUT_SP_CLIENT_ID" ]; then
  echo "Service Principal Client ID is not specified - Exiting"
  exit 1
fi

if [ -z "$INPUT_SP_CLIENT_SECRET" ]; then
  echo "Service Principal CLient Secret is not specified - Exiting"
  exit 1
fi

if [ -z "$INPUT_TENANT_ID" ]; then
  echo "Tenant ID is not specified - Exiting"
  exit 1
fi

if [ -z "$INPUT_RESOURCEGROUP_NAME" ]; then
  echo "Resource Group name is not specified - Exiting"
  exit 1
fi

if [ -z "$INPUT_STORAGEACCOUNT_NAME" ]; then
  echo "Storage Account name is not specified - Exiting"
  exit 1
fi

if [ -z "$INPUT_CONFIGURE_FIREWALL_DEFAULT_ACTION" ]; then
  echo "Default Action (Allow or Deny) for Storage Account Firewall is not specified - Exiting"
  exit 1
fi

az login --service-principal -u ${INPUT_SP_CLIENT_ID} -p ${INPUT_SP_CLIENT_SECRET} --tenant ${INPUT_TENANT_ID}
az storage account update --resource-group ${INPUT_RESOURCEGROUP_NAME} --name ${INPUT_STORAGEACCOUNT_NAME} --default-action ${INPUT_CONFIGURE_FIREWALL_DEFAULT_ACTION}
