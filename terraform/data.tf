data "google_container_registry_image" "nodejs_app_image" {
  region = "eu"
  name   = "nodejs-app"
  tag    = var.docker_tag
}