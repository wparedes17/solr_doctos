#!/usr/bin/env bash
#set -euo pipefail

declare -a cores=("doctos_testing")
declare -a configsets=("doctos_core_conf")

arraylength=${#cores[@]}

for (( i=1; i<${arraylength}+1; i++ ));
do
    echo "Creating core " ${cores[$i-1]} "with configset" ${configsets[$i-1]}
    docker exec -it doctos_console_solr_server solr create_core -c ${cores[$i-1]} -d /opt/configsets/${configsets[$i-1]}
done