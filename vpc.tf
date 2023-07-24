variable "project_id" {
  description = "project id"
}


provider "google" {
  project     = var.project_id
  region      = "asia-east1"
  credentials = "/var/lib/jenkins/workspace/jenkins-terraform-gke/sa.json"
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "krala-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "krala-subnet"
  region        = "asia-east1"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
