provider "yandex" {
  token     = "AQAAAABVwuqxAATuwXda0YvKGk4fgbot-KFMES4"
  cloud_id  = "b1gunccvfss6nmd16o92"
  folder_id = "b1g3bastprflpmc7m3a5"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8gi9lilbslr1ab6ssi"
    }
  }

  network_interface {
    subnet_id = "e9b6jsv5mc6ugbd2p385"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/appuser.pub")}"
  }

  connection {
  type = "ssh"
  host = yandex_compute_instance.app.network_interface.0.nat_ip_address
  user = "ubuntu"
  agent = false
  private_key = file("~/.ssh/appuser")
  }

  provisioner "file" {
  source = "files/puma.service"
  destination = "/tmp/puma.service"
}
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
