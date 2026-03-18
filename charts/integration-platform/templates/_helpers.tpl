{{/*
Common labels
*/}}
{{- define "bip.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: bizcode-integration-platform
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Node-RED instance labels
*/}}
{{- define "bip.instanceLabels" -}}
{{ include "bip.labels" .context }}
app.kubernetes.io/name: {{ .name }}
app.kubernetes.io/instance: {{ .context.Release.Name }}
app.kubernetes.io/component: nodered
{{- end }}

{{/*
Full name with release
*/}}
{{- define "bip.fullname" -}}
{{ .Release.Name }}
{{- end }}
