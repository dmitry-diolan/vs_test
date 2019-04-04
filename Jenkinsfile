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

def buildStat

pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *')
    }
    
    stages {
        stage('Build') {
            steps {
                githubNotify context: 'Building', description: 'This commit is being built',  status: 'PENDING'
				script {
					buildStat = bat(script: 'Root\\Project\\build.bat', returnStatus: true)
					echo buildStat
				}
                githubNotify context: 'Building', description: 'Build succeeded',  status: 'SUCCESS'
                
            }
        }
        stage('Test') {
            steps {
                githubNotify context: 'Testing', description: 'This commit is being test',  status: 'PENDING'
                echo 'Testing2..'
                sleep 3
                githubNotify context: 'Testing', description: 'Test succeeded',  status: 'SUCCESS'
                //githubNotify context: 'Testing', description: 'Test succeeded',  status: 'FAILURE'
                //setBuildStatus("In Progress","PENDING",jobContext,"${gitCommit}")
                //githubNotify gitApiUrl: 'https://github.mycompany.com/api/v3', context: 'something test', description: 'This commit is being built',  status: 'PENDING'
                //githubNotify context: 'something test', description: 'This commit is being built',  status: 'PENDING'
            }
        }
    }
}
