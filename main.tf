module "gke_cluster" {
  source         = "github.com/adlerkot/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}

terraform {
  backend "gcs" {
    bucket = "my_demo_tf_state"
    prefix = "terraform/state"
  }
}