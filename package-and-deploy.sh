#!/bin/sh

set -e

JAVA_CHART_NAME="java-hello-world"
PYTHON_CHART_NAME="python-hello"
PACKAGE="${CHART_NAME}-0.1.0.tgz"
MASTER_BRANCH="demo"
PKGS_BRANCH="gh-pages"

echo "Package and deploy: $JAVA_CHART_NAME and $PYTHON_CHART_NAME"

echo -e "\n[1/6] Checkout master, package and stash"
git stash
git checkout $MASTER_BRANCH
git pull -a

echo -e "\n[2/6] Package $JAVA_CHART_NAME"
cd $JAVA_CHART_NAME
helm dependencies update
helm package $JAVA_CHART_NAME $PYTHON_CHART_NAME -d /tmp

echo -e "\n[3/6] Checkout gh-pages and update package"
git checkout $PKGS_BRANCH
cp -f /tmp/${JAVA_CHART_NAME}-0.1.0.tgz helm-packages/
cp -f /tmp/${PYTHON_CHART_NAME}-0.1.0.tgz helm-packages/
git add -A helm-packages/

echo -e "\n[4/6] Update Helm Index"
helm repo index --merge --url https://shellclear.github.io/helm/ .
git add index.yaml

# echo -e "\n[5/6] Git commit and push"
# git commit -m "Update packages and index files to the latest commit on master"
# git push

# echo -e "\n[END] Return to previous state"
# git checkout $MASTER_BRANCH
# cd -