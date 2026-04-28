resource vnet 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'petervnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

@secure()
@minLength(3)
@maxLength(24)
param storageName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}


// param rgLocation string = resourceGroup().location 
// param storageNames array = [ 
// 	'contoso' 
// 	'fabrikam' 
// 	'coho' ] 

// resource storageAcct 'Microsoft.Storage/storageAccounts@2021-02-01' = [for name in storageNames: { 
// 	name: '${name}${uniqueString(resourceGroup().id)}${indexOf(storageNames, name)}' 
// 	location: rgLocation}]

// more
