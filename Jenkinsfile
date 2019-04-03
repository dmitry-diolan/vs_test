/*
def setBuildStatus(String message, String state, String context, String sha) {
    step([
        $class: "GitHubCommitStatusSetter",
        reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/dmitry-diolan"],
        contextSource: [$class: "ManuallyEnteredCommitContextSource", context: context],
        errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
        commitShaSource: [$class: "ManuallyEnteredShaSource", sha: sha ],
        statusBackrefSource: [$class: "ManuallyEnteredBackrefSource", backref: "${BUILD_URL}flowGraphTable/"],
        statusResultSource: [$class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
    ]);
}
*/
pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building2..'
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing2..'
                //setBuildStatus("In Progress","PENDING",jobContext,"${gitCommit}")
                //githubNotify gitApiUrl: 'https://github.mycompany.com/api/v3', context: 'something test', description: 'This commit is being built',  status: 'PENDING'
                githubNotify context: 'something test', description: 'This commit is being built',  status: 'PENDING'
            }
        }
    }
}
