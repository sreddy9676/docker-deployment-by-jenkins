
node{
    stage('scm checkout'){
       git credentialsId: 'github', url: 'https://github.com/sreddy9676/my-app.git'
    }
    stage('build the code'){
        def mvnHome =  tool name: 'maven3', type: 'maven'   
      sh "${mvnHome}/bin/mvn package"
    }
    stage('Deploy the war file to docker server'){
        sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''docker build -t tomcat .
docker run -d --name myapp -p 8080:8080 tomcat''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/home/ubuntu', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: '*/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
    }
}
