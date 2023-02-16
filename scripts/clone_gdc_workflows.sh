#!/bin/bash
# Author    : Martin L. Putra (martinluttap@uchicago.edu)
# Use       : Clone all GDC workflows listed here: https://github.com/NCI-GDC/gdc-workflow-overview
set -o errexit
set -o nounset
set -o pipefail

GDC_WF_DIR=$1

echo "Cloning GDC's DNA-Seq Alignment ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/gdc-dnaseq-cwl
echo ""
echo "Cloning GDC's RNA-Seq Alignment ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/gdc-rnaseq-cwl
echo ""
echo "Cloning GDC's miRNA Alignment and Profiling ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/gdc-mirnaseq-cwl
echo ""
echo "Cloning GDC's RNA-Seq HTSeq Quantification ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/htseq-cwl
echo ""
echo "Cloning GDC's WXS Variant Calling ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/gdc-somatic-variant-calling-workflow --recursive
echo ""
echo "Cloning GDC's WXS Variant Filtering ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/variant-filtration-cwl
echo ""
echo "Cloning GDC's WGS Variant Calling ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/gdc-sanger-somatic-cwl
echo ""
echo "Cloning GDC's VEP Variant Annotation ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/vep-cwl
echo ""
echo "Cloning GDC's Mutation Annotation File (MAF) ..."
git -C ${GDC_WF_DIR} clone https://github.com/NCI-GDC/aliquot-maf-cwl
echo ""
