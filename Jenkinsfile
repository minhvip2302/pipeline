pipeline {
    agent any
    // parameters {
    //     gitParameter type: 'PT_BRANCH',
    //                  name: 'BRANCH',
    //                  defaultValue: 'main',
    //                  description: 'Choose a branch to checkout',
    //                  selectedValue: 'DEFAULT',
    //                  branchFilter: 'origin/(.*)',
    //                  sortMode: 'DESCENDING_SMART'
    // }
    stages {
        // Uncomment and use the following stages as needed
        
        // stage('Checkout Code') {
        //     steps {
        //         dir('/tmp/info') {
        //             checkout scm: [
        //                 $class: 'GitSCM',
        //                 branches: [[name: "*/${params.BRANCH}"]],
        //                 userRemoteConfigs: [[url: 'https://github.com/minhvip2302/pipeline.git']]
        //             ]
        //         }
        //     }
        // }
        
        stage('Deploy') {
            steps {
                withCredentials([file(credentialsId: 'firebase-jenkins-57747', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh "firebase deploy --only hosting --project=jenkins-57747"
                }
            }
        }

        success {
            emailext(
                subject: "Build Successful: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "The build was successful. Check it at ${env.BUILD_URL}",
                to: 'anhnguyenbinhminh2302@gmail.com'
            )
        }
        failure {
            emailext(
                subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "The build has failed. Check it at ${env.BUILD_URL}",
                to: 'anhnguyenbinhminh2302@gmail.com'
            )
        }
    }
}
