variable "binary_authorization_attestors" {
  description = <<EOT
Map of binary_authorization_attestors, attributes below
Required:
    - name
    - attestation_authority_note (block):
        - note_reference (required)
        - public_keys (optional, block):
            - ascii_armored_pgp_public_key (optional)
            - comment (optional)
            - id (optional)
            - pkix_public_key (optional, block):
                - public_key_pem (optional)
                - signature_algorithm (optional)
Optional:
    - deletion_policy
    - description
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    project         = optional(string)
    attestation_authority_note = object({
      note_reference = string
      public_keys = optional(list(object({
        ascii_armored_pgp_public_key = optional(string)
        comment                      = optional(string)
        id                           = optional(string)
        pkix_public_key = optional(object({
          public_key_pem      = optional(string)
          signature_algorithm = optional(string)
        }))
      })))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

