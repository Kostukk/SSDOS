terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("gcp.json")

  project = "propane-karma-286218"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  
  tags = ["http-server"]
  
  

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

 metadata_startup_script =  file("/a2.sh")

  network_interface {
    network = "default"
    access_config {
    }
	
	
	
	
  }
}

