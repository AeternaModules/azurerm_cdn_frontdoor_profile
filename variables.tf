variable "cdn_frontdoor_profiles" {
  description = <<EOT
Map of cdn_frontdoor_profiles, attributes below
Required:
    - name
    - resource_group_name
    - sku_name
Optional:
    - response_timeout_seconds
    - tags
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - log_scrubbing_rule (block):
        - match_variable (required)
EOT

  type = map(object({
    name                     = string
    resource_group_name      = string
    sku_name                 = string
    response_timeout_seconds = optional(number) # Default: 120
    tags                     = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    log_scrubbing_rule = optional(list(object({
      match_variable = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        v.log_scrubbing_rule == null || (length(v.log_scrubbing_rule) <= 3)
      )
    ])
    error_message = "Each log_scrubbing_rule list must contain at most 3 items"
  }
}

