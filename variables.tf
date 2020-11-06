variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource in Azure (default: 'eastus', less expensive location)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Ressource Group in which this ressource will be"
}

variable "application_short_name" {
  type        = string
  description = "Short name of your application using abbreviations or acronyms."
  validation {
    condition     = can(regex("^\\w+$", var.application_short_name))
    error_message = "Application short name can only consist of letters and numbers."
  }
}

variable "application_environment" {
  type        = string
  default     = "prod"
  description = "Name of the environment (example: dev, test, prod, ...)"
}

variable "acr_purpose" {
  type        = string
  description = "Usage of this container registry"
  default     = ""
  validation {
    condition     = length(var.acr_purpose) == 0 || can(regex("^\\w+$", var.acr_purpose))
    error_message = "Container registry purpose can only consist of letters and numbers."
  }
}