#!/bin/bash
# Author    : Martin L. Putra (martinluttap@uchicago.edu)
# Use       : Copy tools from workflows and put each of them in a single folder.
set -o errexit
set -o nounset
set -o pipefail

WF_PATH=$1
TOOLS_DIR=$2

WF_NAME=$(basename $WF_PATH)
if [ -e "${TOOLS_DIR}/${WF_NAME}" ]; then
    echo "$WF_NAME exists in ${TOOLS_DIR}, exiting ..."
    exit
else
    if [ $WF_NAME != "gdc-somatic-variant-calling-workflow" ]; then
        echo "Copying tools from $WF_NAME ..."
        mkdir -p ${TOOLS_DIR}/${WF_NAME}
        for TOOL_PATH in ${WF_PATH}/tools/*; do
            # Tool name is the name of the file without suffix
            TOOL_NAME=$(basename $TOOL_PATH)
            TOOL_NAME=${TOOL_NAME%.*}
            
            mkdir -p ${TOOLS_DIR}/${WF_NAME}/${TOOL_NAME}
            cp $TOOL_PATH ${TOOLS_DIR}/${WF_NAME}/${TOOL_NAME}
        done
    else
        echo "Skipping $WF_NAME ..."
    fi
fi