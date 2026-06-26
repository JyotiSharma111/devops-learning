## Day 3
- Created IAM user and role, learned access keys vs IAM roles for EC2
- Installed and configured AWS CLI
- Created S3 bucket, uploaded files via CLI
- Attached IAM role to EC2 instance (replaced static credentials)#Devops Learning Journey
# trigger
## container-health-check.sh
Bash script that checks if url-backend container is running every 5 minutes via cron.
Logs status with timestamp. Sends Discord webhook alert if container is down.
