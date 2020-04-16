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
def envDef = [ buildImage: 'ops0-artifactrepo1-0-prd.data.sfdc.net/dci/centos-sfci-python2']
//def envDef = [:]

// define any release branches here
env.RELEASE_BRANCHES = ['master','develop']

// The following statement is optional
env.SHARE_LIB_VERSION = 'v1'

executePipeline(envDef) {
    
    stage('test'){
      
        sh 'ls -al /'
        sh 'go --help'
    }
}
