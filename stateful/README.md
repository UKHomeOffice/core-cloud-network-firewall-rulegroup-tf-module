<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_rule_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Capacity of the network firewall group rule | `number` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of firewall group rule | `string` | n/a | yes |
| <a name="input_domain_rule_type"></a> [domain\_rule\_type](#input\_domain\_rule\_type) | Configuration of domain based firewall rule | `string` | `""` | no |
| <a name="input_domain_target_type"></a> [domain\_target\_type](#input\_domain\_target\_type) | The type of domains used in the firewall rule | `list(string)` | `[]` | no |
| <a name="input_domain_targets"></a> [domain\_targets](#input\_domain\_targets) | The actual list of domains to allow or block | `list(string)` | `[]` | no |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | Encryption configuration of firewall rules | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the firewall group rule | `string` | n/a | yes |
| <a name="input_stateful_rule_order"></a> [stateful\_rule\_order](#input\_stateful\_rule\_order) | Specify the process order of rules in the rule group | `string` | `""` | no |
| <a name="input_stateful_rules"></a> [stateful\_rules](#input\_stateful\_rules) | Configuration of standard stateful firewall rules | `map(any)` | `{}` | no |
| <a name="input_suricata_rules"></a> [suricata\_rules](#input\_suricata\_rules) | Configuration of suricata firewall rule variables | `string` | `""` | no |
| <a name="input_suricata_rules_variables"></a> [suricata\_rules\_variables](#input\_suricata\_rules\_variables) | Configuration of suricata firewall rules | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->