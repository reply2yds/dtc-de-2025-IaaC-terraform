terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  # Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  # credentials = ".keys/my-cred.json"
  project = var.project
  region  = var.region
}



resource "google_storage_bucket" "data-lake-bucket" {
  name     = var.gcs_bucket_name
  location = var.location

  # Optional, but recommended settings:
  storage_class               = var.gcs_storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 1 // days
    }
  }

  force_destroy = true
}

resource "google_storage_bucket" "data-lake-ny-taxi" {
  name     = var.gcs_ny_taxi
  location = var.location

  # Optional, but recommended settings:
  storage_class               = var.gcs_storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 2 // days
    }
  }

  force_destroy = true
}

# resource "google_bigquery_dataset" "dataset" {
#   dataset_id = var.bq_dataset_name
#   project    = var.project
# }
