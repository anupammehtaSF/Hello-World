FROM ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos-sfci-maven:47fa3a9772b84dd480cd13bc72b384c871d838c1
RUN yum install -y golang
WORKDIR /home/jenkins
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
