
param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'appServicePlan'
  location: location
  tags: {}
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

output appServicePlan string = appServicePlan.id

