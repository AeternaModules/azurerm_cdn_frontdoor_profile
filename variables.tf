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
    response_timeout_seconds = optional(number)
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
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        v.response_timeout_seconds == null || (v.response_timeout_seconds >= 16 && v.response_timeout_seconds <= 240)
      )
    ])
    error_message = "must be between 16 and 240"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

