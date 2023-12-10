# mapup


## Prerequisites:
- Github account (if not created, create one)
- Visual-Studio Code (optional)
- Required extensions for Visual Studio, such as Docker, etc. (optional)
- AWS account
- Working phone for SMS notification (optional for mail setup)


## Workflow of the project:


1. Created a Git repository named "Mapup" and cloned it to Visual Studio Code. I used a git cloned local command prompt to git add, git commit, and git push the changes to the git repository.
2. Created a node.js file along with package.json and package-lock.json, which displayed a text line as 'Hello World, I am Dhiraj. Bye Bye!'
3. Created a Docker file for image building named "dockerfile."
4. Created a.github/workflows/main1.yml file and used "latest" as an image tag.
5. Images were scanned for vulnerabilities, and SMS notifications were sent using AWS SNS.

This GitHub Actions workflow automates the build and push process of an application to the AWS Elastic Container Registry (ECR) upon code changes in the main branch.

**Main Steps:**
- Checkout:
Uses the actions/checkout action to fetch the repository contents.
   
- Configure AWS credentials:
Utilizes the aws-actions/configure-aws-credentials action to set up AWS access credentials securely using GitHub secrets.
   
- Login to Amazon ECR:
Uses the aws-actions/amazon-ecr-login action to authenticate with Amazon ECR.
   
- Auto-Tagging of Releases:
Runs a script (git-update.sh) to increment the git tag version, allowing for version control.
   
- Build, tag, and push the image to Amazon ECR:
Builds a Docker image and pushes it to Amazon ECR.
Utilizes the output from the login-ecr step for the ECR registry.
Uses the incremented git tag as the image tag.

- Image scanned for vulnerabilities.
   
- Send an SMS notification on workflow failure:
Sends an SMS notification via AWS SNS if the workflow encounters a failure.
Uses the AWS SNS publish command to send a message to the specified topic.
   
- Send an SMS notification on workflow success:
Sends an SMS notification via AWS SNS if the workflow succeeds.
Uses the AWS SNS publish command to send a success message to the specified topic.


*** IMOPORTANT NOTES FOR ABOVE ***
- Ensured that the AWS access credentials (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) are properly set as GitHub secrets to avoid exposing sensitive information.
- Defined the policy with specific permissions required for the workflow, such as ECR access and SNS.
- Customized the AWS region (AWS_REGION) and SNS topic ARN based on specific configurations.
modified the mapuppnotification SNS topic ARN (arn:aws:sns:us-east-1:841012855588:mapupnotification) to match the AWS account and topic settings.
- The IAM policy was created to grant necessary permissions to the IAM user associated with the provided AWS access key and secret.
- I attached the created IAM policy to the IAM user used for configuring the AWS access key and secret in the GitHub Secrets.
- This ensured the access key and secret had appropriate permissions to execute actions within the GitHub Actions workflow.
- AWS SNS was used to send notification to phone in case the Workflow was successfull or not. 
- We can also use mailing as the option here by updating our main1.yaml file with the code which consists of server_address, server_ports, username, password and recipient mail ID.




