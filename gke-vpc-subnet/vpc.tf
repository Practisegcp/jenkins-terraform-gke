variable "project_id" {
  description = "project id"
}


provider "google" {
  project     = var.project_id
  region      = "us-central1"
  credentials = "/var/lib/jenkins/workspace/jenkins-terraform-gke/gke-vpc-subnet/sa.json"
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "kr-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "kr-subnet"
  region        = "us-central1"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
