{{/*
Expand the name of the chart.
*/}}
{{- define "hello-world-sb.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hello-world-sb.fullname" -}}
{{- $name := default .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hello-world-sb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Helm Labels
*/}}
{{- define "hello-world-sb.labels" -}}
generator: "helm"
helm.sh/chart: {{ include "hello-world-sb.chart" . }}
helm.sh/release: "{{ .Release.Name }}"
helm.sh/date: "{{ now | date "2006.01.02-15.04.05" }}"
app.kubernetes.io/name: {{ include "hello-world-sb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common Labels
*/}}
{{- define "hello-world-sb.commonLabels" -}}
app: {{ .Values.name }}
app_name: {{ .Values.name }}
{{- end }}

