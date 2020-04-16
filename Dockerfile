FROM ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos
RUN yum install -y golang
CMD ["go", "version"]
