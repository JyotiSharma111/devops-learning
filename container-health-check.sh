#!/bin/bash
if  docker ps --filter "name=url-backend" --format "{{.Names}}" | grep -q "url-backend"; then
	echo "$(date)  working" >>~/devops-learning/health-check.log
else
	echo "$(date) not working" >>~/devops-learning/health-check.log
	curl -X POST "https://discord.com/api/webhooks/1520081953263456449/375ivC3PRLxyZPc9rNeatlk4_s-r-kSCOzmefHo4DUCgmvMUFuiwu8Ci--WJSYyN4Pvf" \
		-H "Content-Type: application/json" \
		-d "{\"content\": \"$(date) - backend api not working\nRecent log:\n$(tail -5 ~/devops-learning/health-check.log | tr '\n' ' ')\"}"
fi
