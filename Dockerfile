FROM ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos-sfci-maven:d2c5ec0
RUN yum install -y golang
WORKDIR /home/jenkins
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
