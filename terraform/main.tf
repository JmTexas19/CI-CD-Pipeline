provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
}

resource "google_cloud_run_service" "default" {
  name     = "simple-web-app-service"
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

resource "google_cloud_run_service_iam_member" "invoker" {
  service  = simple-web-app-service
  location = var.gcp_region
  role     = "roles/run.invoker"
  member   = "allUsers" # This special identifier represents anyone on the internet.
}

output "service_url" {
  value = google_cloud_run_service.default.status[0].url
}