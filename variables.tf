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

variable "algorithm" {
  type        = string
  default     = "ECDSA"
  description = "The cryptographic algorithm (e.g. RSA, ECDSA)"
}

variable "ecdsa_curve" {
  type        = string
  default     = "P256"
  description = "The elliptic curve (e.g. P256, P384, P521)"
}


### github
variable "GITHUB_OWNER" {
  type        = string
  description = "The GitHub owner"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "FLUX_GITHUB_REPO" {
  type        = string
  default     = "flux-gitops"
  description = "GitHub repository"
}

variable "repository_visibility" {
  type        = string
  default     = "private"
  description = "The visibility of the GitOps repository"
}

variable "branch" {
  type        = string
  default     = "main"
  description = "GitHub branch"
}

# variable "public_key_openssh" {
#   type        = string
#   description = "OpenSSH public key repository access"
# }

# variable "public_key_openssh_title" {
#   type        = string
#   description = "The title for OpenSSH public key"
# }

variable "target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}