/*resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}
*/
resource "google_compute_instance" "dev" {
  machine_type = "t2-micro"
  zone         = var.zone
  count        = var.is_dev_env == true ? 1:0
  name         = "dev_env"


  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  /*  scratch_disk {
    interface = "NVME"
  }
*/
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  /*  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  
  }
*/
}
/*resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}
*/
resource "google_compute_instance" "prod" {
  machine_type = "t2-small"
  zone         = var.zone
  count        = var.is_dev_env == false ? 1:0
  name         = "prod_env"


  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  /*  scratch_disk {
    interface = "NVME"
  }
*/
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  /*  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  
  }
*/
}
