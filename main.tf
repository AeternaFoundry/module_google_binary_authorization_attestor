resource "google_binary_authorization_attestor" "binary_authorization_attestors" {
  for_each = var.binary_authorization_attestors

  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  project         = each.value.project

  attestation_authority_note {
    note_reference = each.value.attestation_authority_note.note_reference
    dynamic "public_keys" {
      for_each = each.value.attestation_authority_note.public_keys != null ? each.value.attestation_authority_note.public_keys : []
      content {
        ascii_armored_pgp_public_key = public_keys.value.ascii_armored_pgp_public_key
        comment                      = public_keys.value.comment
        id                           = public_keys.value.id
        dynamic "pkix_public_key" {
          for_each = public_keys.value.pkix_public_key != null ? [public_keys.value.pkix_public_key] : []
          content {
            public_key_pem      = pkix_public_key.value.public_key_pem
            signature_algorithm = pkix_public_key.value.signature_algorithm
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

