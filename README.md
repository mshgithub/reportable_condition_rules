# Public Health Reportable Condition Rules Format Prototypes
## Project Description
This project proposes different rule formats for serializing rules for identifying and reporting on reportable conditions from the [Reportable Conditions Knowledge Management System (RCKMS)](https://www.rckms.org/). It builds on and complements the work begun in the [Public Health Condition Routing Rules](https://github.com/CDCgov/routes/tree/main/prototypes) project.

All samples in this project use the rule specification for measles found here: [rule_specifications](https://github.com/mshgithub/reportable_condition_rules/tree/main/rule_specifications)

## Background
We are exploring options for leveraging the national US health information exchange infrastructure to improve the quality, delivery, and value of public health data, beginning with electronic case reporting.

## Goals
We are pursuing the following goals as we prototype potential rule formats. 
- Rules should be portable. Rules engines should be able to consume the rules and use them to determine if an initial case report is reportable to a jurisdiction.
- Rule formatting should use industry standards. We should avoid inventing a new standard if possible and build on existing standards to ease adoption.

## Prototypes
This project includes prototypes of the following approaches:

| Approach | Description |
| -------- | ----------- |
| [CQL + FHIR](https://github.com/mshgithub/reportable_condition_rules/tree/main/prototypes/cql_fhir) | Encode the rule logic in CQL and attach it to a FHIR Library resource to enable execution engines to evaluate the rule. |
| [JSON Logic](https://github.com/mshgithub/reportable_condition_rules/tree/main/prototypes/json_logic) | Use JSON Logic, which has interpreters in many languages, to express the rules. |

## Open Questions
1. Should the base rules and the jurisdiction-specific rules both be syndicated? Do we want (or need) to have the consumers store both or is a hybrid that combines both sufficient?
