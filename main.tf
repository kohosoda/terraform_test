provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_v2_job" "sample_job" {
  name     = "sample-job"
  location = var.region

  template {
    template {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}