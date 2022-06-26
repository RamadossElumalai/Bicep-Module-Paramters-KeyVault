param appServicePlanName string 
param appServiceName string 
param location string
param instrumentationKey string

// creating app service plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'S1' //Pricing tier
    capacity: 1 //Number of instance,
  }
}

// creating app service
resource appService 'Microsoft.Web/sites@2021-03-01' = {
  name: appServiceName
  location: location
  properties:{
    //Important we should give your app service plan name
    serverFarmId: resourceId('Microsoft.Web/serverfarms', appServicePlanName)
  }
  dependsOn:[
    //if your creating your app service plan with this file 
    //then you have to mention your app service plan name
    appServicePlan
  ]
  
}

// creating application setting for the app service and linking application insights
resource appServiceAppSettings 'Microsoft.Web/sites/config@2021-03-01' = {
  name: 'web'
  kind: 'string'
  parent: appService
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATION_KEY'
        value: instrumentationKey
      }
    ]
  }
}



