#  AI-Powered Auto-Healing Infrastructure on AWS

An intelligent, self-healing cloud infrastructure that uses **AWS CloudWatch**, **Lambda**, and a simple **AI model (Isolation Forest)** to automatically detect EC2 instance failures and recover by launching a backup server.

---

##  Project Overview

This project simulates a real-world production-grade setup that can **automatically detect when a primary EC2 instance is failing** (e.g., high CPU usage) and take action **without any manual intervention** by:

- Running an **AI-based anomaly detection model**
- Starting a backup EC2 instance in another region
- Sending a real-time **SNS alert notification**

---

##  Features

- 📊 **CloudWatch Monitoring** for CPU spikes  
- 🧠 **AI Anomaly Detection** using Isolation Forest in Python  
- ⚙️ **Lambda Function** auto-triggered on alarm  
- 🔁 **EC2 Auto Recovery** by launching backup instance  
- 🔔 **SNS Notification** for real-time alerting  
- 🔐 **IAM Role-based Access Control**

---

## Tech Stack

| Category       | Tools Used                        |
|----------------|----------------------------------|
| Cloud          | AWS EC2, CloudWatch, Lambda, SNS |
| Language       | Python (AI), Bash                 |
| AI Model       | Isolation Forest (Scikit-learn)   |
| Monitoring     | CloudWatch Alarm                 |
| Notifications  | Amazon SNS (Email)               |
| Security       | IAM Role for Lambda              |

---



