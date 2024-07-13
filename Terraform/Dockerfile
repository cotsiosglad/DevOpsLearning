FROM oraclelinux:9-slim

# Set environment variables
ENV TERRAFORM_VERSION=1.9.2

# Install required packages and Terraform
RUN yum install -y yum-utils \
    && yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
    && yum install -y terraform-${TERRAFORM_VERSION} \
    && yum clean all

WORKDIR /app

COPY . /app

RUN chmod +x /app/*.sh

CMD ["terraform", "version"]