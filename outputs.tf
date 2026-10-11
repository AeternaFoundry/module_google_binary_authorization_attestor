output "binary_authorization_attestors_id" {
  description = "Map of id values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no id are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "binary_authorization_attestors_attestation_authority_note" {
  description = "Map of attestation_authority_note values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no attestation_authority_note are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => one(v.attestation_authority_note) if v.attestation_authority_note != null && length(v.attestation_authority_note) > 0 }
}
output "binary_authorization_attestors_deletion_policy" {
  description = "Map of deletion_policy values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no deletion_policy are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "binary_authorization_attestors_description" {
  description = "Map of description values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no description are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => v.description if v.description != null && length(v.description) > 0 }
}
output "binary_authorization_attestors_name" {
  description = "Map of name values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no name are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => v.name if v.name != null && length(v.name) > 0 }
}
output "binary_authorization_attestors_project" {
  description = "Map of project values across all binary_authorization_attestors, keyed the same as var.binary_authorization_attestors except keys with no project are omitted"
  value       = { for k, v in google_binary_authorization_attestor.binary_authorization_attestors : k => v.project if v.project != null && length(v.project) > 0 }
}

