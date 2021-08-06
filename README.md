# Helm Charts
[Helm](https://helm.sh) repo with custom charts which can be installed on [Kubernetes](https://kubernetes.io)

## Add Helm repository

To install the repo just run:

```
helm repo add shellclear https://shellclear.github.io/helm
helm repo update
```

## Helm Charts

* [sb-hello-world](https://github.com/shellclear/helm/tree/main/sb-hello-world)

```
helm install my-release shellclear/sb-hello-world
```

