# Terraform Auto Scaling Web Application (ELB + ASG)

This project demonstrates how to use **Terraform** to deploy a **highly available and auto-scaled web application on AWS** using:

* EC2 instances
* Launch Templates (modern replacement for Launch Configurations)
* Auto Scaling Group (ASG)
* Classic Load Balancer (ELB)
* Security Groups

The EC2 instances run a simple web server that returns **"Hello, World"**.

---

## 🏗️ Architecture Overview

```
User
  ↓
Elastic Load Balancer (Port 80)
  ↓
Auto Scaling Group
  ↓
EC2 Instances (Hello World App)
```

Resources are distributed across **multiple Availability Zones** for high availability.

---

## 📦 Resources Created

* **AWS Provider** (eu-west-1 region)
* **Availability Zones data source**
* **Security Group for EC2** (allows app traffic)
* **Security Group for ELB** (allows HTTP traffic)
* **Launch Template** for EC2 instances
* **Auto Scaling Group** (min 2, max 10 instances)
* **Classic Elastic Load Balancer (ELB)**

---

## 🔐 Security Groups

### EC2 Security Group

* Allows inbound traffic on `server_port` (default: 8080)
* Allows all outbound traffic

### ELB Security Group

* Allows inbound HTTP traffic on port 80
* Allows all outbound traffic

---

## 🚀 Launch Template

The Launch Template defines how EC2 instances are created:

* AMI ID: `ami-785db401`
* Instance type: `t2.micro`
* User data script:

  * Starts a lightweight web server using `busybox`
  * Serves `Hello, World` on the configured port

---

## 📈 Auto Scaling Group

* Uses the Launch Template
* Spans all availability zones in the region
* Minimum instances: **2**
* Maximum instances: **10**
* Registers instances with the ELB
* Performs health checks via ELB

---

## ⚖️ Elastic Load Balancer (ELB)

* Listens on port **80**
* Forwards traffic to EC2 instances on `server_port`
* Performs HTTP health checks
* Distributes traffic evenly across healthy instances

---

## 📂 File Structure

```
.
├── main.tf        # Main Terraform configuration
├── variables.tf   # Input variables (optional)
├── README.md      # Project documentation
```

---

## 🧪 Prerequisites

* AWS account
* AWS CLI configured (`aws configure`)
* Terraform installed (v1.x recommended)

---

## ▶️ How to Use

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Format & Validate

```bash
terraform fmt
terraform validate
```

### 3️⃣ Plan the Deployment

```bash
terraform plan
```

### 4️⃣ Apply the Configuration

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🌐 Access the Application

After deployment:

1. Go to **AWS EC2 → Load Balancers**
2. Copy the **ELB DNS name**
3. Open it in your browser:

```
http://<ELB-DNS-NAME>
```

You should see:

```
Hello, World
```

---

## 🧹 Cleanup

To delete all resources created by Terraform:

```bash
terraform destroy
```

---

## 📘 Notes

* Launch Templates are used because **Launch Configurations are deprecated** by AWS
* Classic ELB is used for learning purposes; in production, **ALB is recommended**
* This project is suitable for **DevOps / Cloud beginner to intermediate level**

---

## 📌 Next Improvements (Optional)

* Migrate ELB → Application Load Balancer (ALB)
* Deploy inside a custo
