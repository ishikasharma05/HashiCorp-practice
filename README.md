# Terraform Fundamentals: HashiCorp AWS Get Started

Assignment 5 (Weeks 9-10), DevOps Institute Mumbai.
Hands-on completion of the official HashiCorp AWS tutorials using my own AWS account (region: `ap-south-1`).

## Tutorials completed (mandatory 1-8)

| # | Tutorial | Key learning |
|---|----------|--------------|
| 1 | What is Infrastructure as Code with Terraform? | IaC turns infrastructure into version-controlled, repeatable code instead of manual console clicks. |
| 2 | Install Terraform | Verified the install with `terraform -version`. Terraform is a single binary, and providers are downloaded separately per project. |
| 3 | Build Infrastructure (AWS) | The core workflow is `init`, `plan`, `apply`. The plan shows exactly what will change before anything is created, and a data source can look up the AMI instead of hardcoding it. |
| 4 | Change Infrastructure | Editing the config and re-applying lets Terraform compare state with config and change only the difference. |
| 5 | Destroy Infrastructure | `terraform destroy` removes everything tracked in state, which avoids surprise AWS charges. |
| 6 | Define Input Variables | Variables in `variables.tf` replace hardcoded values, so the same config can be reused. |
| 7 | Query Data with Outputs | Outputs in `outputs.tf` expose useful values such as the instance ID and public IP after apply. |
| 8 | Store Remote State (S3 Backend) | The `backend "s3"` block moves state out of the local file into a versioned, encrypted bucket. Backend blocks can't use variables, and `use_lockfile` provides state locking. |

## Repository structure

```
HashiCorp-practice/
├── main.tf            # provider, AMI data source, EC2 instance
├── terraform.tf       # terraform block, provider version constraints
├── variables.tf       # input variables
├── outputs.tf         # output values
├── s3-remote-state/   # Tutorial 8: same config with an S3 backend
└── README.md
```

## Notes

- `.terraform/` and `*.tfstate` files are excluded via `.gitignore`. Provider binaries are hundreds of MB, and state files can contain sensitive data.
- `.terraform.lock.hcl` is committed so provider versions stay consistent.
- All resources were destroyed with `terraform destroy` after each tutorial.
- The HCP Terraform tutorial was not part of the mandatory scope, so I did not complete it.

## Challenges

- Accidentally committed the `.terraform/` provider binary (674 MB), which exceeded GitHub's 100 MB limit. I rewrote git history to remove it and added a `.gitignore`.