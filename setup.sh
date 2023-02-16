#!/bin/bash
# Author    : Martin L. Putra (martinluttap@uchicago.edu)
# Use       : Set up development environment for workflows translation.
set -o errexit
set -o nounset
set -o pipefail

SCRIPTS_DIR=./scripts
GDC_WF_DIR=gdc-workflows
CWL_TOOLS_DIR=cwl

# Create folder for GDC's CWL workflows
mkdir -p ${GDC_WF_DIR}

# Now we clone each of GDC's workflows listed here:
# https://github.com/NCI-GDC/gdc-workflow-overview
${SCRIPTS_DIR}/clone_gdc_workflows.sh ${GDC_WF_DIR}

# Then we prepare workspaces for translating each workflow's tools
for WF in ${GDC_WF_DIR}/*; do
    ${SCRIPTS_DIR}/copy_tools.sh ${WF} ${CWL_TOOLS_DIR}
done

# Finally we prepare an .env file for testing translation results
echo ""
echo "Preparing .env file ..."
THIS_DIR=$(pwd)
TRANS_TEST_DIR=${THIS_DIR}/translation-test/
## We use the example.env file as a template 
cp ${TRANS_TEST_DIR}/example.env ${TRANS_TEST_DIR}/.env 
sed -i "s|TOP_DIR=|TOP_DIR=$(pwd)|" ${TRANS_TEST_DIR}/.env

echo ""
echo "Setup done! Please manually fill up the .env file (${TRANS_TEST_DIR}/.env)"