# Pull base image.
FROM ubuntu
LABEL maintainer="Dana Gertsch"
LABEL version="1.0"
LABEL description="Image for VMW CodeStream Pipelines using Terraform"
LABEL tfversion="1.5.4"
ENV DEBIAN_FRONTEND=noninteractive
# build command on ARM Mac for linux/amd64
# docker buildx build --platform linux/amd64 -t americanbwana/cas-terraform-146:latest --push .


WORKDIR /build
RUN apt-get update && apt-get install -y git unzip wget curl gnupg software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip && \
    unzip terraform_1.5.4_linux_amd64.zip && rm terraform_1.5.4_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
# Install AZ Cli
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
# Install Kubectl 
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin && \
# Install Helm
    wget https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz && \
    tar zxvf helm-v3.12.2-linux-amd64.tar.gz && rm helm-v3.12.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && \
    rm -rf linux-amd64

