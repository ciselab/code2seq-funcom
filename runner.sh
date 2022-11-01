#!/usr/bin/env bash

# This script runs all (known) docker-composes in this directory.
# In the folders in this directory all the experiments are specified with there respective docker composes and configuration files.

cores=$1
echo "Running all experiments on ${cores} cores"

find . -name "docker-compose.yml" -print0 | xargs -I {} -0 -P ${cores} sh -c 'docker-compose -f {} up; docker-compose -f {} down'

echo "Finished running all experiments"
