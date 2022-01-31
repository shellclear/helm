#!/bin/sh

set -e

JAVA_CHART_NAME="java-hello-world"
PYTHON_CHART_NAME="python-hello"
PACKAGE="${CHART_NAME}-0.1.0.tgz"
MASTER_BRANCH="demo"
PKGS_BRANCH="gh-pages"

echo "Package and deploy: $JAVA_CHART_NAME and $PYTHON_CHART_NAME"

echo -e "\n[1/6] Checkout master, package and stash"
git checkout $MASTER_BRANCH
git pull -a

echo -e "\n[2/6] Package $JAVA_CHART_NAME"
cd $JAVA_CHART_NAME
helm dependencies update
helm package .
cp ${JAVA_CHART_NAME}-0.1.0.tgz /tmp
rm -rf ${JAVA_CHART_NAME}-0.1.0.tgz
cd -

echo -e "\n[3/6] Package $PYTHON_CHART_NAME"
cd $PYTHON_CHART_NAME
helm dependencies update
helm package .
cp ${PYTHON_CHART_NAME}-0.1.0.tgz /tmp
rm -rf ${PYTHON_CHART_NAME}-0.1.0.tgz
cd -

echo -e "\n[4/6] Checkout gh-pages and update package"
git checkout $PKGS_BRANCH
rm -rf helm-packages/*
cp /tmp/${JAVA_CHART_NAME}-0.1.0.tgz helm-packages/
cp /tmp/${PYTHON_CHART_NAME}-0.1.0.tgz helm-packages/

echo -e "\n[5/6] Update Helm Index"
helm repo index . --url https://shellclear.github.io/helm/
git add index.yaml

echo -e "\n[6/6] Git commit and push"
git commit -m "Update package to the latest commit on master"
# git push

echo -e "\n[END] Return to previous state"
git checkout $MASTER_BRANCH
cd -