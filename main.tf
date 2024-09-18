module "gke_cluster" {
  source           = "github.com/adlerkot/tf-google-gke-cluster"
  GOOGLE_REGION    = var.GOOGLE_REGION
  GOOGLE_PROJECT   = var.GOOGLE_PROJECT
  GKE_NUM_NODES    = var.GKE_NUM_NODES
  GKE_MACHINE_TYPE = var.GKE_MACHINE_TYPE
}

terraform {
  backend "gcs" {
    bucket = "my_demo_tf_state"
    prefix = "terraform/state"
  }
}

module "tls_private_key" {
  source      = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  algorithm   = var.algorithm
  ecdsa_curve = var.ecdsa_curve
}

module "github_repository" {
  source                   = "github.com/den-vasyliev/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.github_token
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux01"
}

module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = module.gke_cluster.kubeconfig
  github_token      = var.github_token
}