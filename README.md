# Helm Repo

This repository stores the Helm charts used to deploy sample applications in Kubernetes.

## Requirements
- Openshift/Minikube
- Nginx Ingress (Minikube)
- Helm
- ArgoCD (Optional)

> **NOTE**: _I'm using the GitHub Pages as a Helm repository and you'll find all the instructions to install the packages here -> https://shellclear.github.io/helm/_

*GitOps - ArgoCD*

Use the _top-level-chart_ folder to deploy applications using ArgoCD.

![Argo CD UI](docs/assets/argocd.png)

Ref:

- https://minikube.sigs.k8s.io/docs/
- https://kubernetes.github.io/ingress-nginx/
- https://helm.sh/
- https://argo-cd.readthedocs.io/en/stable/
- https://pages.github.com/
