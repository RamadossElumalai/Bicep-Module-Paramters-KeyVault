param appInsightsName string 
param location string

//creating application insights with out linking it
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties:{
    Application_Type: 'web'
  }
}

output oInstrumentationKey string = appInsights.properties.InstrumentationKey
