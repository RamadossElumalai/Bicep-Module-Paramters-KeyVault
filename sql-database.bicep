param sqlServerName string 
param sqlServerFireWallName string
param sqlServerDataBaseName string
param location string 
param dataBaseUserName string
@secure()
param dataBasePassword string
// Sql server
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: dataBaseUserName
    administratorLoginPassword: dataBasePassword
  }
}

// whitelisting the ip address or allowing ip address to access
resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2020-11-01-preview' = {
  parent: sqlServer
  name: sqlServerFireWallName
  properties: {
    startIpAddress: ''
    endIpAddress: ''
  }
}

// Sql Server Database
resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: sqlServerDataBaseName
  location: location
  properties: {
    collation: 'collation' //SQL_Latin1_General_CP1_CI_AS
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}
