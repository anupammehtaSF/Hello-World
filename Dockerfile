FROM ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos:7.2.1511@sha256:458bed527fc20d16b7cbc4105ff7eca6d76ed6ac16f66b024144601e15d98dc3

ARG YUM_URL
ENV YUM_URL ${YUM_URL:-'http://localhost/yum/centos7/'}

# generate a yum repo conf from the endpoint arg
RUN rm -rf /etc/yum.repos.d || true
RUN mkdir -p /etc/yum.repos.d
RUN echo [docker] > /etc/yum.repos.d/docker.repo
RUN echo name=Docker containerized yum >> /etc/yum.repos.d/docker.repo
RUN echo baseurl=${YUM_URL} >> /etc/yum.repos.d/docker.repo
RUN echo enabled=1 >> /etc/yum.repos.d/docker.repo
RUN echo gpgcheck=0 >> /etc/yum.repos.d/docker.repo

RUN yum install -y bzip2
RUN yum install -y git
RUN yum install -y golang

ARG GOVERSION
ENV GOVERSION ${GOVERSION:-'1.8rc3'}

ADD go /go
WORKDIR /go

# workaround for older version of git that can't track branches in submodules
RUN rm .git
ADD .git/modules/go .git
RUN git checkout go${GOVERSION}

ENV GOOS=linux
ENV GOARCH=amd64
ENV GOROOT_BOOTSTRAP=/usr/lib/golang
ENV GOROOT=/usr/lib/go
ENV PATH=${PATH}:${GOROOT}/bin

WORKDIR /go/src
RUN ./bootstrap.bash --no-clean
RUN ./make.bash -no-rebuild
RUN rm -rf ${GOROOT}
RUN mkdir ${GOROOT}
RUN mv /go/src ${GOROOT}/
RUN mv /go/pkg ${GOROOT}/
RUN mv /go/bin ${GOROOT}/
RUN rm /usr/bin/go*
RUN go version

### RELEASE ###
RUN mkdir /release
RUN cp -r ${GOROOT} /release/

# simple way to copy artifacts out of this image...
CMD ["/bin/sleep", "30"]
