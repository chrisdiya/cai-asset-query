#!/bin/bash

#Make sure you "gcloud auth login" prior to running this script
#This script requires an active SCC Premium subscription

#Enables Cloud Asset Inventory API on the project you're using to query the constraint
gcloud services enable cloudasset.googleapis.com

#Ask for details
echo Google Cloud Org ID?
read ORG_ID

#Run Query (https://cloud.google.com/asset-inventory/docs/query-assets)
gcloud asset query \
--organization="$ORG_ID" \
--statement="
SELECT
  osInventory.osInfo.hostname,
  osInventory.osInfo.longName
FROM
  OS_INVENTORY
WHERE
  osInventory.osInfo.longName LIKE '%Ubuntu%'"