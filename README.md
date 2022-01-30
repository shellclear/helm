# Helm Charts
[Helm](https://helm.sh) repo with custom charts which can be installed on [Kubernetes](https://kubernetes.io)

## Add Helm repository

To install the repo just run:

```
> helm repo add shellclear https://shellclear.github.io/helm
> helm repo update
```

## Helm charts

* [sb-hello-world](https://github.com/shellclear/helm/tree/main/java-hello-world)
* [python-hello](https://github.com/shellclear/helm/tree/main/python-hello)

```
> helm search repo shellclear
NAME                            CHART VERSION   APP VERSION     DESCRIPTION                                       
shellclear/python-hello         0.1.0           1.0.0           A Helm chart to deploy a Python hello-world app...
shellclear/java-hello-world       0.1.0           1.0.0           A Helm chart to deploy a Java hello-world appli...
```

## Installing charts

```
> helm install --generate-name shellclear/java-hello-world && helm install --generate-name shellclear/python-hello
NAME: java-hello-world-1643543879
LAST DEPLOYED: Sun Jan 30 12:58:00 2022
NAMESPACE: hello
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Great! Your hello would application was deployed.
NAME: python-hello-1643543880
LAST DEPLOYED: Sun Jan 30 12:58:01 2022
NAMESPACE: hello
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Great! Your hello would application was deployed.
```

