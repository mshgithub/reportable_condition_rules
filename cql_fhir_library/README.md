# Option: Clinical Quality Language (CQL) + FHIR Library Resource
## Overview
This option uses two industry standards, FHIR Clinical Reasoning and CQL, to keep the rules human-readable (CQL) and the exchange format standard (FHIR JSON). It encodes the rule logic in CQL and attaches it to a FHIR Library resource enabling execution engines (e.g., CQF Ruler, CDS Hooks services) to evaluate the rule.

## Sample Workflow

\[ eICR CDA \] ==> \[ CDA-to-FHIR Conversion \] ==> \[ CQL-enabled Rules Engine \] ==> \[ Reportability Determination \]

## Sample Resources
- [measles_sample.cql]()
- [measles_fhir_library.json]()
