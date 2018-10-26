#!/usr/bin/bash

az login
#  --resource-group TestSentiaRG \

#az group create --name TestSentiaRG --location "westeurope"  --resource-group TestSentiaRG
  ##--location "westeurope" \
az group deployment create \
  --name SentiaDeployment \
  --template-file "./azuredeploy.json" \
  --parameters storageAccountType=Standard_GRS \
  --resource-group TestSentiaRG
