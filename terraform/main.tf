provider "google" {
  project     = "simple-web-app-422301 "
  region      = "us-central1"
}

resource "google_cloud_run_service" "default" {
  name     = "example-service"
  location = var.gcp_region

  template {
    spec {
      containers {
        image = var.docker_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

output "service_url" {
  value = google_cloud_run_service.default.status[0].url
}