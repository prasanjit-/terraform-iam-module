# AWS Identity and Access Management (IAM) Terraform module

---

AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources. The terraform state file is stored on S3 as the backend.

---

### Features

This Terraform module is meant to create the following:

- A role, with no permissions, which can be assumed by users within the same account
- A policy, allowing users / entities to assume the above role
- A group, with the above policy attached
- A user, belonging to the above group

---

###  Usage

- Populate the variables in the `development.tfvars` & `production.tfvars` files as per the environment as shown below:

```bash
# cat development.tfvars

role_name     = "btc-dev-role"
policy_name   = "btc-dev-policy"
group_name    = "btc-dev-group"
iam_user_name = "btc-dev-user"
account_id    = "your-aws-account-id-here"
```

or,
```bash
# cat production.tfvars

role_name     = "btc-prod-role"
policy_name   = "btc-prod-policy"
group_name    = "btc-prod-group"
iam_user_name = "btc-prod-user"
account_id    = "your-aws-account-id-here"
```

---

- Toggle the environment name and execute the script as shown below:

```bash
terraform plan -out plan -var-file=production.tfvars
terraform apply plan
```

or,
```bash
terraform plan -out plan -var-file=development.tfvars
terraform apply plan
```

---

<p align='center'>

  <a href="https://www.linkedin.com/in/prasanjit-singh/">
    <img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />
  </a>&nbsp;&nbsp;
  <a href="https://youtube.com/binpipe">
    <img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" />        
  </a>&nbsp;&nbsp;

</p>
