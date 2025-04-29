provider "google" {
  project = "test-kohosoda"
  region  = "us-central1"
}

provider "google-beta" {
  project = "test-kohosoda"
  region  = "us-central1"
}

resource "google_cloud_run_v2_job" "default" {
  name     = "cloud-run-job"
  location = "us-central1"
  provider = google-beta

  template {
    task_count = 1
    template {
      containers {
        image = "gcr.io/cloudrun/hello"
        resources {
          limits = {
            cpu    = "1"
            memory = "512Mi"
          }
        }
      }
      max_retries = 3
      timeout     = "300s"
    }
  }
}
