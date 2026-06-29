# URL Shortener DevOps Project
## Overview - A full stack URL shortner with a complete devops pipeline - containerised with Docker, deployed via CI/CD, monitored with Prometheus and Grafana, and infrastructure provisioned with Terraform. Includes automated health checks and alerting via Discord.
##Technologies Used — list: Docker, GitHub Actions, Kubernetes, Prometheus, Grafana, Terraform, Bash
##Project Structure - devops-learning-root folder
		URL-shortner- the app
		backend
		 docker-compose.yml
		 frontend 
		 k8s 
		 prometheus.yml
		 terraform		
## How to Run

### 1. Clone the repository
```bash
git clone ___your repo url___
```

### 2. Start the application
```bash
cd url-shortener
docker-compose url-shortner
```

### 3. View monitoring
Open browser and go to `http://your-ec2-ip:___` for Grafana

### 4. Provision infrastructure with Terraform
```bash
cd terraform-ec2
terraform init
terraform plan
terraform apply
```

### 5. Set up automated health checks
```bash
crontab -e
# Add: */5 * * * * /home/ubuntu/devops-learning/container-health-check.sh
```
