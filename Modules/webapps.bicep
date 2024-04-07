param location string
param appServicePlan string
param registryName string = 'appservacr.azurecr.io'
param webApps array = [
  {
    name: 'webApp1'
    sku: 'F1'
    imageName: 'hello-world:latest'
  }
  {
    name: 'webApp2'
    sku: 'F1'
    imageName: 'httpd:latest'
  }
  {
    name: 'webApp3'
    sku: 'F1'
    imageName: 'nginx:latest'
  }
  {
    name: 'webApp4'
    sku: 'F1'
    imageName: 'webapp:1.0'
  }
  {
    name: 'webApp5'
    sku: 'F1'
    imageName: 'webapp:2.0'
  }
]


resource webAppResources 'Microsoft.Web/sites@2021-02-01' = [for (webApp, i) in webApps: {
  name: '${webApp.name}-${i}'
  location: location
  tags: {
    
  }
  properties: {
    serverFarmId: appServicePlan
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://appservacr.azurecr.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: 'appservacr'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: '7g4tnSqLOPv+7qB249tJk46mZ/MD9c8Zck5wL6o9mL+ACRD5omki'
        }
      ]
      linuxFxVersion: 'DOCKER|${registryName}/${webApp.imageName}'
    }
  }
}]
