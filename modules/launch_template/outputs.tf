# output "template_details" {
#   value = local.template_details
# }

# output "template_entry_list" {
#   value = local.template_entry_list
# }

output "aws_template" {
  description = "aws_template"
  value       = aws_launch_template.ec2_template
}