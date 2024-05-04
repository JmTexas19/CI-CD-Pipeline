provider "google" {
  project     = var.gcp_project
  region      = "us-central1"
}

resource "google_cloud_run_service" "default" {
  name     = "simple-web-app-service"
  location = "us-central1"

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