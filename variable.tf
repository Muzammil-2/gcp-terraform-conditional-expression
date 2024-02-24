/*
variable "instance_name" {
  type        = list(string)
  description = "name given to vm_instance"
  default     = ["webapp","dbapp"]
}

variable "machine_type" {
  type        = string
  description = "configure machine size"
  default     = "e2-micro"
}
variable "node_count" {
  type    = number
  default = 2
}
*/
variable "zone" {
  default = "asia-east1-a"
}

variable "image" {
  description = "os of machine"
  default     = "debian-cloud/debian-11"
}

variable "region" {
  description = "allocate our machine"
  default     = "asia-east1"
}

variable "project" {

}

variable "is_dev_env" {
  type = bool
}