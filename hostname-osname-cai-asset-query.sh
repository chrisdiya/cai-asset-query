#!/bin/bash

#Make sure you "gcloud auth login" prior to running this script
#This script requires an active SCC Premium subscription

#Enables Cloud Asset Inventory API on the project you're using
gcloud services enable cloudasset.googleapis.com

#Grab current Org ID
ORG_ID=$(gcloud organizations list --format=[no-heading] | grep ^${org_name} | awk '{print $2}')

#Run Query (https://cloud.google.com/asset-inventory/docs/query-assets)
gcloud asset query \
--organization=$ORG_ID \
--statement="
SELECT
  osInventory.osInfo.hostname,
  osInventory.osInfo.longName
FROM
  OS_INVENTORY
WHERE
  osInventory.osInfo.longName LIKE '%Ubuntu%'"