# BizCode Helm Charts

Helm charts for deploying BizCode products on Kubernetes.

> [!IMPORTANT]
> **These are installers only, not open-source software.**
> The container images are proprietary and require a commercial license from BizCode.
> These charts contain only deployment configuration.
>
> **Interested?** Contact us at **info@bizcode.pl** to discuss licensing and pricing.
>
> [www.bizcode.pl](https://www.bizcode.pl)

## Available Charts

| Chart | Description |
|-------|-------------|
| [integration-platform](charts/integration-platform/) | BizCode Integration Platform — Node-RED for SAP Business One |
| [bizflow-nh](charts/bizflow-nh/) | BizFlow NH — KSeF integration for SAP Business One |

## Quick Start — BizFlow NH

```bash
kubectl create namespace bizflow-nh

kubectl create secret docker-registry acr-secret \
  --namespace bizflow-nh \
  --docker-server=bizcode.azurecr.io \
  --docker-username=YOUR_ACR_USER \
  --docker-password=YOUR_ACR_PASS

helm install bizflow-nh oci://bizcode.azurecr.io/helm/bizflow-nh \
  --namespace bizflow-nh \
  --set jwt.key=$(openssl rand -base64 48) \
  --set ingress.enabled=true \
  --set ingress.host=bizflow.yourcompany.com
```

## Quick Start — Integration Platform

```bash
kubectl create namespace bip

kubectl create secret docker-registry acr-secret \
  --namespace bip \
  --docker-server=bizcode.azurecr.io \
  --docker-username=YOUR_ACR_USER \
  --docker-password=YOUR_ACR_PASS

helm install bip oci://bizcode.azurecr.io/helm/integration-platform \
  --namespace bip \
  --set admin.password=YourSecurePass \
  --set ingress.enabled=true \
  --set ingress.host=integrations.yourcompany.com
```

## Custom Values

Create a `values.yaml` per client and install with `-f values.yaml`.

## Upgrade

```bash
helm upgrade <release> <chart> -n <namespace> -f values.yaml
```

## License

Proprietary — BizCode Sp. z o.o. All rights reserved.

This software is not open-source. Unauthorized use, copying, or distribution is prohibited.
Contact **info@bizcode.pl** for licensing.
