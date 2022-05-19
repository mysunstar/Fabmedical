#!/bin/bash

# Public IP address
IP="52.136.117.177"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-wxq_fabmedical-wxq_eastus"

# Name to associate with public IP address
DNSNAME="fabmedical-wxq-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME