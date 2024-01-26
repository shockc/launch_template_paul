# output "template_lists" {
#   value = module.template.template_lists
# }

# output "template_entry_list" {
#   value = module.template.template_entry_list
# }

output "aws_template" {
  description = "aws_template"
  value       = module.template.aws_template
}
