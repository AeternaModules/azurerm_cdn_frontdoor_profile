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
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_profiles : (
        v.response_timeout_seconds == null || (v.response_timeout_seconds >= 16 && v.response_timeout_seconds <= 240)
      )
    ])
    error_message = "must be between 16 and 240"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_cdn_frontdoor_profile's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.FrontDoorName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: sku_name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: log_scrubbing_rule.match_variable
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

