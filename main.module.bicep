param appServicePlanName string 
param appServiceName string
param appInsightsName string 
param sqlServerName string 
param sqlServerFireWallName string 
param sqlServerDataBaseName string 
param location string = resourceGroup().location
param dataBaseUserName string
@secure()
param dataBasePassword string

module Appservice 'app-service.bicep' = {
  name: 'AppServicePlan'
  params:{
    location: location
    appServiceName: appServiceName
    appServicePlanName: appServicePlanName
    instrumentationKey: AppInsights.outputs.oInstrumentationKey
  }
}

module SqlDataBase 'sql-database.bicep' = {
  name: 'SqlDataBase'
  params:{
    location: location
    sqlServerName: sqlServerName
    sqlServerFireWallName: sqlServerFireWallName
    sqlServerDataBaseName: sqlServerDataBaseName
    dataBaseUserName:dataBaseUserName
    dataBasePassword: dataBasePassword
  }
}


module AppInsights 'app-insights.bicep' = {
  name: 'AppInsights'
   params:{
    location: location
    appInsightsName: appInsightsName
   }
}
