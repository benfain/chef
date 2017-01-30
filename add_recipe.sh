#!/bin/bash
# purpose: adds recipe to all nodes in provided environment
# todos:
#  - add proper input parsing
#  - validate recipe existence
#  - allow for other knife.rb locations

# assign arguments
RECIPE=$1
CHEF_ENV=$2

echo "Adding $RECIPE recipe to all nodes in $CHEF_ENV..."
# set working directory to use cwd knife.rb
cd "$(dirname "$0")"
CHEF_NODES=($(knife node list -E $1))
for node in "${CHEF_NODES[@]}"
do
  echo "Adding recipe to $node..."
  knife node run_list add $node "recipe[$RECIPE]"
done
