# Basic-Devops
Launch cloud resources using Infrastructure as code and automate the workflow by Jenkins build. 
Setup Jenkins : 
1. Launch Jenkins on free-tier Ec2 instance. Reference for RHEL OS the installation steps using remote computing tool [ Mobxterm ]
  Jenkins installation guide :  https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos
2. Security group of Ec2 instance must have 8080 inbound port enabled for jenkins accessibility
3. Create IAM user for providing programmatic access to the Jenkins. This allows Jenkins pipeline to run the terraform scripts of AWS resources on the Cloud and launch the required resources 
Note: Only Programmatic access is required to run the scripts and automation pipeline.
4. In the Manage Jenkins / Credentials /System / Global Credential (Setup the AWS credentials)
   
