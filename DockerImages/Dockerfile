FROM container-registry.oracle.com/os/oraclelinux:9

# Import the Oracle Linux GPG key
RUN curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle-ol9 https://yum.oracle.com/RPM-GPG-KEY-oracle-ol9 && \
    gpg --quiet --keyid-format 0xlong --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle-ol9

# Create a temporary yum repository configuration file
RUN echo "[ol9_baseos_latest]" > /etc/yum.repos.d/ol9-temp.repo && \
    echo "name=Oracle Linux 9 BaseOS Latest (\$basearch)" >> /etc/yum.repos.d/ol9-temp.repo && \
    echo "baseurl=https://yum.oracle.com/repo/OracleLinux/OL9/baseos/latest/\$basearch/" >> /etc/yum.repos.d/ol9-temp.repo && \
    echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle" >> /etc/yum.repos.d/ol9-temp.repo && \
    echo "gpgcheck=1" >> /etc/yum.repos.d/ol9-temp.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/ol9-temp.repo

# Install oraclelinux-release-el9
RUN dnf install -y oraclelinux-release-el9

# Remove ol9-temp.repo and any other remaining repo files that may conflict with Oracle Linux yum server
RUN mv /etc/yum.repos.d/ol9-temp.repo /etc/yum.repos.d/ol9-temp.repo.disabled

# Clean up
RUN dnf clean all


RUN dnf update --setopt=ol9_appstream.module_hotfixes=true --allowerasing -y
RUN dnf --security update

CMD ["/bin/bash"]
