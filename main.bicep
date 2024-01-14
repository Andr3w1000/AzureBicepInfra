@description('Specifies the location for resources.')
param location string = 'westeurope'
param containerName string = 'bronze'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'banditoylaunchstorage'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    isHnsEnabled: true
    minimumTlsVersion: 'TLS1_2'
  }

}

resource service 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: service
  name: containerName
}
