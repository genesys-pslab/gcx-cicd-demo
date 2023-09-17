variable "gcxSuffix" {
    description = "Suffix to use for project to distinguish between other participants"
}
variable "gcxQueueName" {
    description = "Name of queue to create"
}
variable "gcxSkillName" {
  description = "Name of skill - will add suffixes"
}
variable "gcxAcwTimeout" {
    description = "ACW timeout value for queue"
    default = 30000
}