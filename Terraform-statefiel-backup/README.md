# Terraform Remote Backend with S3 & DynamoDB

## Overview

This project sets up a **Terraform remote backend** using **AWS S3** for state storage and **DynamoDB** for state locking.  
It ensures safe collaboration and prevents state corruption when multiple people manage the same infrastructure.

---

## Why Use a Remote Backend?

- **Safe state storage:** Keeps `terraform.tfstate` in the cloud instead of locally.  
- **Collaboration:** Multiple team members can work on infrastructure safely.  
- **State locking:** DynamoDB prevents simultaneous updates.  
- **Versioning & rollback:** S3 versioning allows recovering previous state.  

---

## Setup Steps

1. **Create backend resources** (S3 bucket + DynamoDB table) using local state:
```bash
terraform init
terraform apply
