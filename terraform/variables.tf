variable "docker_image" {
  description = "The full URI of the Docker image to deploy"
  type        = string
}

variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "The region where the Cloud Run service will be located"
  default     = "us-central1"
}