variable "GOOGLE_PROJECT" {
  type        = string
  description = "Google project name"
}
variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region"
}
variable "GKE_MACHINE_TYPE" {
  type        = string
  default     = "g1-small"
  description = "machine type"
}
variable "GKE_NUM_NODES" {
  type        = number
  default     = 2
  description = "numbers of nodes"
}
