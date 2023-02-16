#!/bin/bash
# Author    : Martin L. Putra (martinluttap@uchicago.edu)
# Use       : Undo setup.sh, assuming directories used are the same. 
set -o errexit
set -o nounset
set -o pipefail

GDC_WF_DIR=gdc-workflows
TOOLS_DIR=cwl

rm -rf ${GDC_WF_DIR}
rm -rf ${TOOLS_DIR}
