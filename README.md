# dtc-de-2025-IaaC-terraform

Reporistory to acquire resouces on the GCP platform via terraform

**Project Info**

```
    Project name: dtc-de-course
    Project number: 206097052671
    Project ID: dtc-de-course-454511
```

**Deploy resources in GCP using Terraform**

```
    Google Cloud Storage (GCS): dtc-de-course-454511-demo-gcs
    Google Cloud Storage (GCS): dtc-de-course-454511-ny-taxi-gcs
```

## Setup

1. Load the credentials
   a. export the credentials as an variable ```GOOGLE_CREDENTIALS```

    ```
    export GOOGLE_CREDENTIALS=<PATH_TO_CREDENTIAL_FILE>
    ```

   b. place the credentail file into ```keys``` folder and rename as ```my-cred.json```

2. set the appropriate variables for resource allocation and creation.

3. Run the terraform command to initialize, plan, apply and destroy the resources.

    ```
        # Initialize state file (.tfstate)
        terraform init

        # Check changes to new infra plan
        terraform plan -var="project=<your-gcp-project-id>"

        # Create new infra
        terraform apply -var="project=<your-gcp-project-id>"

        # Delete infra after your work, to avoid costs on any running services
        terraform destroy
    ```
