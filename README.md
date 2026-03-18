# BizCode Helm Charts

Helm charts for deploying BizCode Integration Platform on Kubernetes.

## Quick Start

```bash
# Create namespace
kubectl create namespace bip

# Create ACR pull secret (credentials provided by BizCode)
kubectl create secret docker-registry acr-secret \
  --namespace bip \
  --docker-server=bizcode.azurecr.io \
  --docker-username=YOUR_ACR_USER \
  --docker-password=YOUR_ACR_PASS

# Install from OCI registry (ACR)
helm install bip oci://bizcode.azurecr.io/helm/integration-platform \
  --namespace bip \
  --set admin.password=YourSecurePass \
  --set ingress.enabled=true \
  --set ingress.host=integrations.yourcompany.com

# Or install from GitHub Pages
helm repo add bizcode https://bizcode-sp-z-o-o.github.io/bizcode-helm-charts
helm install bip bizcode/integration-platform --namespace bip
```

## Custom values

Create a `values-client.yaml`:

```yaml
instances: 5

admin:
  username: admin
  password: SecurePassword123!

ingress:
  enabled: true
  className: nginx
  host: integrations.klient.pl
  tls:
    enabled: true

cups:
  enabled: true

extraHosts:
  - host: sapserver
    ip: 192.168.1.100
  - host: sapdb
    ip: 192.168.1.101

redis:
  enabled: true

rabbitmq:
  enabled: true

postgresql:
  enabled: true
  auth:
    password: MyDbPassword!
```

```bash
helm install bip bizcode/integration-platform -n bip -f values-client.yaml
```

## Upgrade

```bash
helm upgrade bip bizcode/integration-platform -n bip -f values-client.yaml
```

## Uninstall

```bash
helm uninstall bip -n bip
```

**Note:** PVCs are retained after uninstall to protect data. Delete manually if needed.

## Chart Components

| Component | Description | Default |
|-----------|-------------|---------|
| Node-RED (bip-00..bip-09) | Integration instances | 10 instances |
| Redis | Cache and pub/sub | enabled |
| RabbitMQ | Message queue | enabled |
| PostgreSQL | Database | enabled |
| CUPS | Print server | enabled |
| Ingress | SSL termination + routing | disabled |
