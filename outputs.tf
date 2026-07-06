output "cdn_frontdoor_profiles" {
  description = "All cdn_frontdoor_profile resources"
  value       = azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles
}
output "cdn_frontdoor_profiles_identity" {
  description = "List of identity values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.identity]
}
output "cdn_frontdoor_profiles_log_scrubbing_rule" {
  description = "List of log_scrubbing_rule values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.log_scrubbing_rule]
}
output "cdn_frontdoor_profiles_name" {
  description = "List of name values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.name]
}
output "cdn_frontdoor_profiles_resource_group_name" {
  description = "List of resource_group_name values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.resource_group_name]
}
output "cdn_frontdoor_profiles_resource_guid" {
  description = "List of resource_guid values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.resource_guid]
}
output "cdn_frontdoor_profiles_response_timeout_seconds" {
  description = "List of response_timeout_seconds values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.response_timeout_seconds]
}
output "cdn_frontdoor_profiles_sku_name" {
  description = "List of sku_name values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.sku_name]
}
output "cdn_frontdoor_profiles_tags" {
  description = "List of tags values across all cdn_frontdoor_profiles"
  value       = [for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : v.tags]
}

