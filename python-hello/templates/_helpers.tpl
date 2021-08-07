{{/*
Expand the name of the chart.
*/}}
{{- define "python-hello.name" }}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the Helm chart label.
*/}}
{{- define "python-hello.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Helm Labels
*/}}
{{- define "python-hello.labels" }}
generator: "helm"
helm.sh/chart: {{ include "python-hello.chart" . }}
helm.sh/release: "{{ .Release.Name }}"
helm.sh/date: "{{ now | date "2006.01.02-15.04.05" }}"
app.kubernetes.io/name: {{ include "python-hello.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common Labels
*/}}
{{- define "python-hello.commonLabels" }}
app_name: {{ .Values.name }}
{{- end }}

