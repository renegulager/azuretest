#!/usr/bin/bash

az login
#  --resource-group TestSentiaRG \

#az group create --name TestSentiaRG --location "westeurope"
az deployment create \
  --location "westeurope" \
  --name SentiaDeployment \
  --template-file "./deploy.json" \
  --parameters storageAccountType=Standard_GRS
