variable "my_intance_type" {
    type = string
    description = "My instance type"
    default = null
}
variable "instance_tags" {
    type = object({
        Name = string
        NumberEJ = number
    })
    default = null
}