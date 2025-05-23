pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Lấy mã nguồn từ repository
                git url: 'https://github.com/anhtn98/web-performance-project1-initial.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                // Cài đặt Node.js và Firebase CLI
                sh '''
                npm install
                npm run build
                '''
            }
        }
        stage('Deploy') {
            steps {
                // Đặt biến môi trường cho credentials
                withCredentials([file(credentialsId: '9fc6f59f-3f3d-4045-9cb2-707d89c0ca76', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh '''
                    firebase deploy --only hosting --project=jenkins-57747
                    '''
                }
            }
        }
    }

    post {
        // success {
        //     // Gửi thông báo thành công
        //     slackSend(channel: '#your-slack-channel', message: "Deploy thành công!")
        // }
        // failure {
        //     // Gửi thông báo thất bại
        //     slackSend(channel: '#your-slack-channel', message: "Deploy thất bại!")
        // }
    }
}