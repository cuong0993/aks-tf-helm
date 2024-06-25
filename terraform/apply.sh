#!/bin/bash

set -e

set -o allexport
source ../.env
set +o allexport

terraform init -reconfigure -backend-config="conn_str=$TF_BACKEND" -upgrade
# terraform providers lock -platform=linux_arm64 -platform=linux_amd64 -platform=darwin_amd64 -platform=windows_amd64
# export TF_LOG="TRACE"
terraform apply -var-file=../.env
