# Terraform Azure Infrastructure with NetApp Automation

This Project is fully functional on Terraform now moving to Azure DevOps This configuration has been tested with the Hashicorp organization and was successfully deployed.

Setup Variables
Copy the example variable file and edit it with your own values.

cp terraform.tfvars.example terraform.tfvars

Update terraform.tfvars with your environment configuration before running Terraform.

## Overview

This project provisions a complete Azure infrastructure environment using **Terraform**.
The infrastructure includes compute, networking, storage, and Azure NetApp Files resources, automated using Infrastructure as Code principles.

The goal of this project is to demonstrate a **production-style Terraform workflow** with remote state management, CI/CD pipeline integration, and modular infrastructure deployment.

---

## Infrastructure Components

The following Azure resources are deployed using Terraform:

* Resource Group
* Virtual Network (VNet)
* Subnet
* Network Interface
* Windows Virtual Machine
* Azure Storage Account
* Azure NetApp Account
* NetApp Capacity Pool
* NetApp Volume (NFSv4.1)
* NetApp Backup Vault
* NetApp Backup Policy
* User Assigned Managed Identity

---

## Architecture

High-level infrastructure design:

Azure Resource Group
│
├── Virtual Network
│   └── Subnet
│
├── Windows Virtual Machine
│   └── Network Interface
│
├── Storage Account
│
└── Azure NetApp Files
    ├── NetApp Account
    ├── Capacity Pool
    └── NFS Volume

---

## Technologies Used

* Terraform
* Azure Resource Manager (AzureRM Provider)
* Azure NetApp Files
* GitHub Actions (CI/CD)
* Terraform Cloud (Remote State)

---

## CI/CD Pipeline

This repository includes a **GitHub Actions pipeline** that performs:

1. Terraform Initialization
2. Terraform Format Check
3. Terraform Validation
4. Terraform Plan
5. Terraform Apply (on merge to main branch)

This ensures infrastructure changes are validated before deployment.

---

## Repository Structure

```text
.github/workflows/
   terraform.yml

main.tf
variables.tf
outputs.tf
terraform.tfvars.example

README.md
LICENSE
.gitignore
```

---

## Prerequisites

Before using this project, ensure you have the following installed:

* Terraform
* Azure CLI
* Git
* Access to an Azure subscription

---

## Setup Instructions

Clone the repository:

```
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

Initialize Terraform:

```
terraform init
```

Create a variables file:

```
cp terraform.tfvars.example terraform.tfvars
```

Update the variable values as needed.

Run Terraform plan:

```
terraform plan
```

Deploy the infrastructure:

```
terraform apply
```

---

## Security Notes

Sensitive values such as:

* Azure credentials
* VM administrator passwords
* NetApp Active Directory passwords

should **never be committed to the repository** and should instead be stored using:

* Terraform Cloud variables
* GitHub Secrets
* Azure Key Vault

---

## Author

Arjun

Terraform | Azure | Infrastructure as Code | Cloud Automation
