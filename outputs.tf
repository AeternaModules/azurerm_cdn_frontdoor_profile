output "cdn_frontdoor_profiles_id" {
  description = "Map of id values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.id }
}
output "cdn_frontdoor_profiles_identity" {
  description = "Map of identity values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.identity }
}
output "cdn_frontdoor_profiles_log_scrubbing_rule" {
  description = "Map of log_scrubbing_rule values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.log_scrubbing_rule }
}
output "cdn_frontdoor_profiles_name" {
  description = "Map of name values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.name }
}
output "cdn_frontdoor_profiles_resource_group_name" {
  description = "Map of resource_group_name values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.resource_group_name }
}
output "cdn_frontdoor_profiles_resource_guid" {
  description = "Map of resource_guid values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.resource_guid }
}
output "cdn_frontdoor_profiles_response_timeout_seconds" {
  description = "Map of response_timeout_seconds values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.response_timeout_seconds }
}
output "cdn_frontdoor_profiles_sku_name" {
  description = "Map of sku_name values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.sku_name }
}
output "cdn_frontdoor_profiles_tags" {
  description = "Map of tags values across all cdn_frontdoor_profiles, keyed the same as var.cdn_frontdoor_profiles"
  value       = { for k, v in azurerm_cdn_frontdoor_profile.cdn_frontdoor_profiles : k => v.tags }
}

