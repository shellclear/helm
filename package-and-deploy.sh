#!/bin/sh

set -e

JAVA_CHART_NAME="java-hello-world"
PYTHON_CHART_NAME="python-hello"
PACKAGE="${CHART_NAME}-0.1.0.tgz"
MASTER_BRANCH="refactor/define-chart-image-by-hash"
PKGS_BRANCH="gh-pages"

echo "Package and deploy: $JAVA_CHART_NAME and $PYTHON_CHART_NAME packages"

echo -e "\n[1/6] Checkout to $MASTER_BRANCH branch and run <git pull>"
git checkout $MASTER_BRANCH
git push --set-upstream origin $MASTER_BRANCH
git pull

echo -e "\n[2/6] Creating $JAVA_CHART_NAME and $PYTHON_CHART_NAME packages"
helm package $JAVA_CHART_NAME $PYTHON_CHART_NAME -d /tmp

echo -e "\n[3/6] Running <git stash> command at $MASTER_BRANCH, checkout to $PKGS_BRANCH branch and copy packages"
git stash
git checkout $PKGS_BRANCH
git pull
cp -f /tmp/${JAVA_CHART_NAME}-0.1.0.tgz /tmp/${PYTHON_CHART_NAME}-0.1.0.tgz helm-packages/

echo -e "\n[5/6] Update Helm Index using --merge parameter"
helm repo index --merge index.yaml --url https://shellclear.github.io/helm/ .

echo -e "\n[6/6] Commit and push to $PKGS_BRANCH branch"
git add index.yaml helm-packages/
git commit -m "Update packages and index files to the latest version"
git push

echo -e "\n[END] Checkout to $MASTER_BRANCH branch and return to previous state"
git checkout $MASTER_BRANCH
cd -
git stash pop
