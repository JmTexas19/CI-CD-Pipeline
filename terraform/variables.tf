variable "docker_image" {
  description = "The full URI of the Docker image to deploy"
  default     = ""
  type        = string
}

variable "gcp_project" {
  description = "The GCP project ID"
  default     = "simple-web-app-422301"
  type        = string
}

variable "gcp_region" {
  description = "The region where the Cloud Run service will be located"
  default     = "us-central1"
}