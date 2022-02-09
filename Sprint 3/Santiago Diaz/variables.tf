variable "my_intance_type" {
    type = string
    description = "My instance type"
    default = null
}
variable "my_ami" {
    type = string
    description = "AMI"
    default = null
}
variable "instance_tags" {
    type = object({
        Name = string
        Año = number
        SO = string
        Nombre_del_equipo = string
        Carrera = string
        Institucion = string
        Entorno = string
    })
    default = null
}