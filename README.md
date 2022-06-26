# Bicep-Module-Paramters-KeyVault
deploying resource using bicep and parameters added it and read value from keyvault

This way we can easily pass different configuration based on the different file. 

az deployment group create -r $yourResourceGroupName -f $yourFileName -p $Yourparamterfile(dev,uat,prod)
