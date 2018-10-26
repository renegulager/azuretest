#!/usr/bin/bash

az login
az group create --name TestSentiaRG --location "westeurope"  --resource-group TestSentiaRG --tags "envioment=test" "company=sentia"

az group deployment create \
  --name SentiaDeployment \
  --template-file "./azuredeploy.json" \
  --resource-group TestSentiaRG \
  --parameters @azuredeploy.parameters.json



## create policyRule do not work
az policy definition create --name 'allowed-resourcetypes' --display-name 'Allowed resource types' --description 'This policy enables you to specify the resource types that your organization can deploy.' --rules './azurepolicy.rules.json' --params './azurepolicy.parameters.json' --mode All
az policy assignment create --name 'allowed-resourcetypes' --scope "/subscriptions/a7a9a08b-3738-4969-ad77-0dae1f98357a" --policy "allowed-resourcetypes"
