#!/bin/sh

set -e

CHART_NAME="$1"
CHART_NAME="java-hello-world"
PACKAGE="${CHART_NAME}-0.1.0.tgz"
MASTER_BRANCH="demo"
PKGS_BRANCH="gh-pages"

cd ${CHART_NAME}

echo "Package and deploy: ${CHART_NAME}"

echo -e "\n[1/4] Checkout master, package and stash"
git checkout $MASTER_BRANCH
git pull -a
helm dependencies update
helm package .
git add -f ${PACKAGE}
git stash push ${PACKAGE}

echo -e "\n[2/4] Checkout gh-pages and update package"
git checkout $PKGS_BRANCH
rm -rf ${PACKAGE}
git add *.tgz
git stash pop
git add *.tgz
git clean -fd

echo -e "\n[3/4] Update Helm Index"
helm repo index . --url https://shellclear.github.io/helm/
git add index.yaml

echo -e "\n[4/4] Git commit and push"
git commit -m "Update package to the latest commit on master"
# git push

echo -e "\n[END] Return to previous state"
git checkout $MASTER_BRANCH
cd -
