{{/*
Expand the name of the chart.
*/}}
{{- define "java-hello-world.name" }}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the Helm chart label.
*/}}
{{- define "java-hello-world.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Helm Labels
*/}}
{{- define "java-hello-world.labels" }}
generator: "helm"
helm.sh/chart: {{ include "java-hello-world.chart" . }}
helm.sh/release: "{{ .Release.Name }}"
helm.sh/date: "{{ now | date "2006.01.02-15.04.05" }}"
app.kubernetes.io/name: {{ include "java-hello-world.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common Labels
*/}}
{{- define "java-hello-world.commonLabels" }}
app_name: {{ .Values.name }}
{{- end }}

