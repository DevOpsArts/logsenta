{{/*
Expand the name of the chart.
*/}}
{{- define "logsnare.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "logsnare.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "logsnare.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "logsnare.labels" -}}
helm.sh/chart: {{ include "logsnare.chart" . }}
{{ include "logsnare.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "logsnare.selectorLabels" -}}
app.kubernetes.io/name: {{ include "logsnare.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ include "logsnare.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "logsnare.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "logsnare.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the namespace name
*/}}
{{- define "logsnare.namespace" -}}
{{- if .Values.namespace.name }}
{{- .Values.namespace.name }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}

{{/*
Create secret name for database credentials
*/}}
{{- define "logsnare.secretName" -}}
{{- printf "%s-credentials" (include "logsnare.fullname" .) }}
{{- end }}

{{/*
Create configmap name
*/}}
{{- define "logsnare.configmapName" -}}
{{- printf "%s-config" (include "logsnare.fullname" .) }}
{{- end }}

{{/*
Check if any database connection is enabled
*/}}
{{- define "logsnare.secretsEnabled" -}}
{{- if or .Values.connections.mongodb.enabled .Values.connections.mysql.enabled .Values.connections.postgresql.enabled .Values.connections.influxdb.enabled .Values.connections.elasticsearch.enabled .Values.connections.azure.enabled .Values.connections.gcp.enabled .Values.connections.aws.enabled }}
{{- true }}
{{- end }}
{{- end }}
