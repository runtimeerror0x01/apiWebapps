targetScope = 'subscription'

param location string = 'westus'

resource rgProd 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-prod-01'
  tags: {

    Business : 'JJ', Group : 'GG'
  }
  location: location
}

module appServicePlan './Modules/appServPlan.bicep' = {
  scope: rgProd
  name: 'appServicePlan'
  params: {
    location: location
  }
}

module webApps './Modules/webapps.bicep' = {
  scope: rgProd
  name: 'webApps'
  params: {
    location: location
    appServicePlan: appServicePlan.outputs.appServicePlan
  }
}
