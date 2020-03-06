#!/bin/sh

set -e

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

# Configure Azure Storage Firewall Default Action
az storage account update --resource-group ${INPUT_RESOURCEGROUP_NAME} --name ${INPUT_STORAGEACCOUNT_NAME} --default-action ${INPUT_CONFIGURE_FIREWALL_DEFAULT_ACTION}
