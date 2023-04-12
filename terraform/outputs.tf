output "nodejs_url" {
  description = "URL"
  value       = { for k, v in google_cloud_run_v2_service.nodejs_app : k => v.uri }
}