{{/*
Expand the name of the chart.
*/}}
<<<<<<< HEAD
{{- define "sb-hello-world.name" }}
=======
{{- define "sb-hello-world.name" -}}
>>>>>>> 5eb4f865607cc4fb9226a1dba731101519197dcd
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the Helm chart label.
*/}}
{{- define "sb-hello-world.chart" -}}
<<<<<<< HEAD
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
=======
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
>>>>>>> 5eb4f865607cc4fb9226a1dba731101519197dcd
{{- end }}

{{/*
Helm Labels
*/}}
<<<<<<< HEAD
{{- define "sb-hello-world.labels" }}
=======
{{- define "sb-hello-world.labels" -}}
>>>>>>> 5eb4f865607cc4fb9226a1dba731101519197dcd
generator: "helm"
helm.sh/chart: {{ include "sb-hello-world.chart" . }}
helm.sh/release: "{{ .Release.Name }}"
helm.sh/date: "{{ now | date "2006.01.02-15.04.05" }}"
app.kubernetes.io/name: {{ include "sb-hello-world.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common Labels
*/}}
<<<<<<< HEAD
{{- define "sb-hello-world.commonLabels" }}
=======
{{- define "sb-hello-world.commonLabels" -}}
>>>>>>> 5eb4f865607cc4fb9226a1dba731101519197dcd
app_name: {{ .Values.name }}
{{- end }}

