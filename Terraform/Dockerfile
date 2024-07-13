FROM oraclelinux:9-slim

# Set environment variables
ENV TERRAFORM_VERSION=1.9.2

# Install required packages and Terraform
RUN microdnf install -y yum-utils \
    && microdnf install -y dnf \
    && dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
    && microdnf install -y terraform-${TERRAFORM_VERSION} \
    && microdnf clean all

WORKDIR /app

COPY . /app

ENTRYPOINT [ "terraform" ]