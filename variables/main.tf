variable "image_name" {
    description = "Image of a container"
    default = "ghost:latest"
}

variable "container_name" {
    description = "Name of the container"
    default = "ghost_blog"
}

variable "ext_port" {
    description = "External port of a container"
    default = "80"
}
 
#Download the latest Ghost image
resource "docker_image" "ghost_image" {
    name = "${var.image_name}"
}

resource "docker_container" "ghost_container" {
    name = "${var.container_name}"
    image = "${docker_image.ghost_image.latest}"
    ports {
        internal = "2368"
        external = "${var.ext_port}"
    }
}

