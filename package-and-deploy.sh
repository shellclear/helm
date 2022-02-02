#!/bin/sh

set -e

JAVA_CHART_NAME="java-hello-world"
PYTHON_CHART_NAME="python-hello"
PACKAGE="${CHART_NAME}-0.1.0.tgz"
MASTER_BRANCH="feat/new-chart-labels"
PKGS_BRANCH="gh-pages"

echo "Package and deploy: $JAVA_CHART_NAME and $PYTHON_CHART_NAME"

<<<<<<< HEAD
echo -e "\n[1/6] Checkout master, package and stash"
git stash
=======
echo -e "\n[1/6] Checkout master, package"
>>>>>>> 0ecc2103a0ceb0c2eef7406f7da20e435d412c88
git checkout $MASTER_BRANCH
git pull -a

echo -e "\n[2/6] Package $JAVA_CHART_NAME"
<<<<<<< HEAD
cd $JAVA_CHART_NAME
helm dependencies update
=======
>>>>>>> 0ecc2103a0ceb0c2eef7406f7da20e435d412c88
helm package $JAVA_CHART_NAME $PYTHON_CHART_NAME -d /tmp

echo -e "\n[3/6] Checkout gh-pages and update package"
git checkout $PKGS_BRANCH
<<<<<<< HEAD
cp -f /tmp/${JAVA_CHART_NAME}-0.1.0.tgz helm-packages/
cp -f /tmp/${PYTHON_CHART_NAME}-0.1.0.tgz helm-packages/
git add -A helm-packages/

echo -e "\n[4/6] Update Helm Index"
helm repo index --merge --url https://shellclear.github.io/helm/ .
git add index.yaml

# echo -e "\n[5/6] Git commit and push"
# git commit -m "Update packages and index files to the latest commit on master"
# git push
=======
cp -f /tmp/${JAVA_CHART_NAME}-0.1.0.tgz /tmp/${PYTHON_CHART_NAME}-0.1.0.tgz helm-packages/
git add -A helm-packages/

echo -e "\n[5/6] Update Helm Index"
helm repo index --merge index.yaml --url https://shellclear.github.io/helm/ .
git add index.yaml

echo -e "\n[6/6] Git commit and push"
git commit -m "Update package and index files to the latest commit on master"
git push
>>>>>>> 0ecc2103a0ceb0c2eef7406f7da20e435d412c88

# echo -e "\n[END] Return to previous state"
# git checkout $MASTER_BRANCH
# cd -