# Deploying an Application to Amazon EKS with Terraform and GitHub Actions

## Overview
This project shows how to provision AWS infrastructure using Terraform and deploy a containerized application to Amazon EKS using GitHub Actions and a self-hosted runner (EC2).
The CI/CD pipeline automatically provision the AWS infrastructures, builds the Docker imgae, pushes it to Amazon ECR, and deploys the application to an Amazon EKS cluster.

## Technologies Used
- AWS (VPC, ECR, EKS, EC2)
- Terraform
- Kubernetes
- Docker
- GitHub Actions
- GitHub Actions Self-Hosted Runner 
- Flask

## Project Structure
```
.
├── .github
│   └──  workflows
│       └── deploy.yml
├── AWS-Infrastructure
│   ├── backend.tf
│   ├── ecr.tf
│   ├── eks.tf
│   ├── iam.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── routes.tf
│   ├── subnets.tf
│   ├── variables.tf
│   └── vpc.tf
├── Dockerfile
├── README.md
├── k8s
│   ├── deployment.yml
│   └── service.yml
├── requirements.txt
├── src
│   └── app.py
└── templates
    └── index.html
```

## Prerequisites
Before running the project, the following are required:
- AWS account
- An EC2 instance to use as a GitHub Actions self-hosted runner

## Running this Project
1. Fork the Repository
Fork this repository to your own GitHub account.

2. On AWS Console, Launch the EC2 instance to be used as the self-hosted runner.

3. Set up a self-hosted GitHub Actions runner
The GitHub Actions workflow in this project uses:
```yaml
runs-on: self-hosted
```
Therefore, there's need to configuring the EC2 instance created as the self-hosted runner.
From the forked repository, go to:
```
Repository
→ Settings
→ Actions
→ Runners
→ New self-hosted runner
```
Select:

```
Linux
x64
```
Commands for downloading and configuring the runner will be provider. 
Follow the commands provided by GitHub.
Start the runner inside the EC2:
```bash
./run.sh
```

4. Configure AWS Permissions for the Runner
The EC2 instance running the self-hosted runner needs an IAM role that allows the GitHub Actions workflow to interact with AWS.

The role should have permissions required to:
- Authenticate with Amazon ECR
- Push Docker images to ECR
- Access the EKS cluster
- Deploy Kubernetes resources
The IAM permissions should follow the **principle of least privilege**.

5. Update Repository Configuration
Update this project-specific values to match the AWS resources created in your account.  

6. Configure the GitHub Actions Workflow
The workflow is located at:
```text
.github/workflows/
```
The workflow performs the deployment automatically.

7. Verify the Deployment on EC2 runner terminal
Connect to EKS cluster
```bash
aws eks update-kubeconfig --region <aws_region> --name <eks_cluster_name>
```

Check the nodes
```bash
kubectl get nodes
```

Check the application pods:
```bash
kubectl get pods
```

8. Access the Application
Copy the `EXTERNAL-IP`/LoadBalancer hostname:
```bash
kubectl get svc <project_service_name>
```

Contributions
Contributions are welcome.








