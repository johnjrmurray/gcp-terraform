terraform {
  required_version = ">= 1.4.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.61.0"
    }
  }
}

provider "google" {
  project = "GCP-PROJECT-HERE"
  region  = "europe-west1"
}

resource "google_cloud_run_v2_service" "nodejs_app" {
  for_each = local.regions

  name     = "nodejs-app"
  location = each.key

  template {
    containers {
      image = data.google_container_registry_image.nodejs_app_image.image_url
    }
  }
}

resource "google_cloud_run_v2_service_iam_binding" "nodejs_app_noauth" {
  for_each = local.regions

  name     = google_cloud_run_v2_service.nodejs_app[each.key].name
  location = google_cloud_run_v2_service.nodejs_app[each.key].location

  role    = "roles/run.invoker"
  members = ["allUsers"]
}