pipeline {
    parameters {
         booleanParam (description: 'Immediately run apply after plan?', defaultValue: false,  name: 'autoApprove')
    }
    environment {
        AWS_ACCESS_KEY_ID      = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY  = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any 
    stages {
        stage('Checkout SCM') {
            steps {
                script{
                    dir("terraform")
                    {
                        git "https://github.com/anamikaa17/Basic-Devops.git"
                    }
                }
            }
        }

    stage('Plan'){
        steps {
            sh 'pwd;cd terraform/ ; terraform init'
            sh "pwd;cd terraform/ ; terraform plan -out tfplan"
            sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
        }
    }
    stage('Approval') {
        when {
            not{
                equals expected: true, actual: params.autoApprove
            }
        }

        steps {
            script {
                def plan = readFile 'terraform/tfplan.txt'
                input message: "Do you want to apply the plan?",
                parameters: [text(name: 'Plan', description:'Review the plan', defaultValue: plan)]
            }
        }
    }

    stage('Apply') {
        steps {
            sh "pwd;cd terraform/ ; terraform apply -input=flase tfplan"
            }
        }
    }
}