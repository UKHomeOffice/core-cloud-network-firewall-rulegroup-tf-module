resource "aws_networkfirewall_rule_group" "this" {
  name        = var.name
  description = var.description
  type        = "STATELESS"
  capacity    = var.capacity

  dynamic "encryption_configuration" {
    for_each = length(var.encryption_configuration) > 0 ? [var.encryption_configuration] : []

    content {
      key_id = try(encryption_configuration.value.key_id, null)
      type   = encryption_configuration.value.type
    }
  }

  rule_group {
    rules_source {
      stateless_rules_and_custom_actions {

        dynamic "custom_action" {
          for_each = var.custom_actions

          content {
            action_name = custom_action.key

            action_definition {
              publish_metric_action {
                dynamic "dimension" {
                  for_each = toset(custom_action.value.dimensions)
                  content {
                    value = dimension.key
                  }
                }
              }
            }
          }
        }

        dynamic "stateless_rule" {
          for_each = var.stateless_rules

          content {
            priority = stateless_rule.value.priority
            rule_definition {
              actions = stateless_rule.value.action
              match_attributes {
                dynamic "source" {
                  for_each = toset(stateless_rule.value.source)
                  content {
                    address_definition = source.key
                  }
                }

                dynamic "source_port" {
                  for_each = stateless_rule.value.sourcePorts
                  content {
                    from_port = source_port.value.from
                    to_port   = source_port.value.to
                  }
                }

                dynamic "destination" {
                  for_each = toset(stateless_rule.value.destination)
                  content {
                    address_definition = destination.key
                  }
                }

                dynamic "destination_port" {
                  for_each = stateless_rule.value.destinationPorts
                  content {
                    from_port = destination_port.value.from
                    to_port   = destination_port.value.to
                  }
                }

                protocols = stateless_rule.value.protocols

                dynamic "tcp_flag" {
                  for_each = length(try(stateless_rule.value.tcp, {})) > 0 ? [1] : []
                  content {
                    flags = try(stateless_rule.value.tcp.flags, [])
                    masks = try(stateless_rule.value.tcp.masks, [])
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  tags = var.tags
}
