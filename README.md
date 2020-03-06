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
      - uses: jesseloudon/auzre-storage-firewall-default-action
        with:
          resourcegroup_name: "AZURE-RG"
          storageaccount_name: "azurestoragename"
          configure_firewall_default_action: "Allow" or "Deny"
```

### Required Variables

| Key | Value |
| ------------- | ------------- |
| `resourcegroup_name` | The name of the resource group containing the storage account |
| `storageaccount_name` | The name of the storage account to configure |
| `configure_firewall_default_action` | Allowed Values = `"Allow"` or `"Deny"` |
