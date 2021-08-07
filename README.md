# Helm Charts
[Helm](https://helm.sh) repo with custom charts which can be installed on [Kubernetes](https://kubernetes.io)

## Add Helm repository

To install the repo just run:

```
helm repo add shellclear https://shellclear.github.io/helm
helm repo update
```

## Helm charts

* [sb-hello-world](https://github.com/shellclear/helm/tree/main/sb-hello-world)
* [python-hello](https://github.com/shellclear/helm/tree/main/python-hello)

```
> helm search repo shellclear
NAME                            CHART VERSION   APP VERSION     DESCRIPTION                                       
shellclear/python-hello         0.1.0           1.0.0           A Helm chart to deploy a Python hello-world app...
shellclear/sb-hello-world       0.1.0           1.0.0           A Helm chart to deploy a Java hello-world appli...
```

## Installing charts

```
> helm install my-release shellclear/sb-hello-world
NAME: my-release
LAST DEPLOYED: Sat Aug  7 23:48:27 2021
NAMESPACE: my-apps
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Great! Your hello would application was deployed.
```

