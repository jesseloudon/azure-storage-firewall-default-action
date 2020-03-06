# azure-storage-firewall-default-action
Configures Azure Storage Firewall default action (Allow or Deny) for network access

## Usage

### Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: Azure Storage Firewall Default Action
on: push

jobs:
  safirewall:
    runs-on: ubuntu-latest
    steps:
      - uses: jesseloudon/azure-storage-firewall-default-action/v1.0
        with:
          sp_client_id: ${{ secrets.sp_client_id }}
          sp_client_secret: ${{ secrets.sp_client_secret }}
          tenant_id: ${{ secrets.tenant_id }}
          resourcegroup_name: "AZURE-RG"
          storageaccount_name: ${{ secrets.storageaccount_name }}
          configure_firewall_default_action: "Allow" or "Deny"
```

### Required Variables

| Key | Value |
| ------------- | ------------- |
| `sp_client_id` | Service Principal Client ID |
| `sp_client_secret` | Service Principal Client Secret |
| `tenant_id` | Azure Tenant ID where the SP is created |
| `resourcegroup_name` | The name of the resource group containing the storage account |
| `storageaccount_name` | The name of the storage account to configure |
| `configure_firewall_default_action` | Allowed Values = `"Allow"` or `"Deny"` |


### Configure Azure credentials:

To fetch the credentials required to authenticate with Azure, run the following command to generate an Azure Service Principal (SPN) with Contributor permissions:

```sh
az ad sp create-for-rbac --name "myApp" --role contributor \
                            --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
                            --sdk-auth
                            
  # Replace {subscription-id}, {resource-group} with the subscription, resource group where your storage account is setup.

  # The command should output a JSON object similar to this:

  {
    "clientId": "<GUID>",
    "clientSecret": "<GUID>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    (...)
  }
```
Add the `clientid`, `clientSecret`, `tenantId` json output as [secrets](https://aka.ms/create-secrets-for-GitHub-workflows) (to match the required variables above) in your GitHub repository. 
