# End-to-End CI/CD Pipeline on AWS (Terraform + Jenkins + ECS)

## 📌 Overview
This project demonstrates a **production-grade End-to-End CI/CD pipeline** built on AWS using modern DevOps best practices.  
It automates **infrastructure provisioning**, **containerized application builds**, and **zero-downtime deployments** using **Blue-Green strategy**.

Designed to reflect **real-world enterprise DevOps workflows**, this project showcases strong expertise in **AWS, Terraform, Jenkins, Docker, and ECS**.

---

## 🏗 Architecture
![Architecture](architecture.png)

---

## 🚀 Key Features
- Infrastructure as Code using **Terraform**
- CI/CD automation using **Jenkins**
- Containerization using **Docker**
- Image storage in **Amazon ECR**
- Application deployment on **Amazon ECS (Fargate)**
- **Application Load Balancer (ALB)**
- **Blue-Green Deployment** (Zero Downtime)
- Centralized logging with **CloudWatch Logs**
- Secure secrets management via Jenkins credentials
- Rollback-ready deployment strategy

---

## 🛠 Tech Stack

| Category | Tools |
|--------|------|
| Cloud | AWS (VPC, ECS, ECR, ALB, IAM, CloudWatch) |
| CI/CD | Jenkins |
| IaC | Terraform |
| Containers | Docker |
| Runtime | Node.js |
| Deployment | ECS Fargate |
| Strategy | Blue-Green Deployment |

---


## 📂 Repository Structure
```text
end-to-end-cicd-aws/
│
├── app/
│   ├── app.js
│   ├── package.json
│   └── Dockerfile
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── security.tf
│   ├── ecr.tf
│   ├── iam.tf
│   ├── ecs.tf
│   ├── alb.tf
│   ├── cloudwatch.tf
│   └── outputs.tf
│
├── Jenkinsfile
├── README.md
└── architecture.png




## 🔁 CI/CD Workflow

1. Developer pushes code to GitHub
2. Jenkins pipeline is triggered
3. Docker image is built and tagged
4. Image is pushed to Amazon ECR
5. ECS deploys to **Green environment**
6. ALB switches traffic from **Blue → Green**
7. Blue environment is kept for rollback

---

## 🧪 How to Deploy

### 1️⃣ Provision Infrastructure
```bash
cd terraform
terraform init
terraform apply


### 2️⃣ Configure Jenkins Credentials
Credential ID	Description
aws-access-key	AWS Access Key
aws-secret-key	AWS Secret Key
ecr-url	ECR Repository URL


### 3️⃣ Run Jenkins Pipeline
Create Jenkins Pipeline Job
   -> Connect GitHub repository
       -> Click Build Now




🌐 Access Application

terraform output alb_dns
Open in browser:
http://<ALB-DNS>


### 🔄 Rollback Strategy
If Green deployment fails:
        - ALB listener is reverted to Blue target group
        - No downtime or data loss

📈 Learning Outcomes:

-Designed scalable AWS infrastructure using Terraform
-Implemented enterprise-grade CI/CD pipeline
-Implemented Blue-Green deployments on ECS
-Applied DevOps security and reliability best practices
-Hands-on experience with production-like AWS environments

👨‍💻 Author
Pruthviraj Phadatare
AWS Cloud & DevOps Engineer