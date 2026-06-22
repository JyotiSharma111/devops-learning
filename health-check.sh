#!/bin/bash

# Check the health endpoint
if curl -s -f http://localhost:4000/health > /dev/null; then
  STATUS=1   # healthy
else
  STATUS=0   # unhealthy
fi

# Push the metric to CloudWatch
aws cloudwatch put-metric-data \
  --namespace "URLShortener" \
  --metric-name "HealthCheckStatus" \
  --value $STATUS \
  --region us-east-1