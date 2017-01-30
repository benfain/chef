#!/bin/bash
# purpose: removes recipe from all nodes in provided environment
# todos:
#  - add proper input parsing
#  - validate recipe existence
#  - allow for other knife.rb locations

# assign arguments
RECIPE=$1
CHEF_ENV=$2

echo "Removing $RECIPE recipe from all nodes in $CHEF_ENV..."
# set working directory to use cwd knife.rb
cd "$(dirname "$0")"
CHEF_NODES=($(knife node list -E $1))
for node in "${CHEF_NODES[@]}"
do
  echo "Removing recipe to $node..."
  knife node run_list remove $node "recipe[$RECIPE]"
done
