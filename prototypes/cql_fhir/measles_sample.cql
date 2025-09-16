-- CQL for Measles v5 20250228

library MeaslesReporting version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'

-- ValueSets
-- Clinical (Diagnoses, Problems, Symptoms, and Clinical Findings)
valueset "Measles (Disorders) (SNOMED)": '2.16.840.1.113762.1.4.1146.127'
valueset "Measles (Disorders) (ICD10CM)": '2.16.840.1.113762.1.4.1146.126'
valueset "Measles [Suspected] (Disorders) (SNOMED)": '2.16.840.1.113762.1.4.1146.1436'
-- valueset "Measles [Suspected] (Disorders) (ICD10CM)": 'No codes available'
valueset "Measles (Koplik Spots) (Disorders) (SNOMED)": '2.16.840.1.113762.1.4.1146.51'
-- valueset "Measles (Koplik Spots) (ICD10CM)": 'No codes available'
valueset "Rash (SNOMED)": '2.16.840.1.113762.1.4.1146.668'
valueset "Rash (ICD10CM)": '2.16.840.1.113762.1.4.1146.669'
valueset "Fever (SNOMED)": '2.16.840.1.113762.1.4.1146.670'
valueset "Fever (ICD10CM)": '2.16.840.1.113762.1.4.1146.671'
valueset "Body Temperature (Vital Sign)": '2.16.840.1.113762.1.4.1146.1306'

-- Laboratory Test Names that are Organism or Substance Specific
valueset "Culture and Identification Method)": '2.16.840.1.113762.1.4.1146.296'
valueset "Measles (Tests for measles virus Nucleic Acid)": '2.16.840.1.113762.1.4.1146.297'
valueset "Measles (Tests for measles virus Antigen)": '2.16.840.1.113762.1.4.1146.298'
valueset "Measles (Tests for measles virus IgM Antibody)": '2.16.840.1.113762.1.4.1146.299'
valueset "Measles (Tests for measles virus IgG Antibody [Ratio] in Serum)": '2.16.840.1.113762.1.4.1146.818'

-- Laboratory Test Panel Names
-- valueset "Measles (Test Panels for Measles virus by Culture and Identification Method)": 'No codes available'
valueset "Measles (Test Panels for measles virus Nucleic Acid)": '2.16.840.1.113762.1.4.1146.759'
-- valueset "Measles (Test Panels for Measles virus Antigen)": 'No codes available'
valueset "Measles (Test Panels for Measles virus IgM Antibody)": '2.16.840.1.113762.1.4.1146.369'

-- Laboratory Test Names that are NOT Organism or Substance Specific
valueset "Organisms (Tests by Culture and Identification)": '2.16.840.1.113762.1.4.1146.1041'
valueset "Organisms (Tests by Unspecified Method)": '2.16.840.1.113762.1.4.1146.1040'
valueset "Organisms (Tests for Nucleic Acid)": '2.16.840.1.113762.1.4.1146.994'

-- Laboratory (Result Values, Abnormal Interpretation, Specimen Type, or Status)
valueset "Measles (Organism or Substance in Lab Results)": '2.16.840.1.113762.1.4.1146.292'
valueset "Present or Positive Lab Result Value": '2.16.840.1.113762.1.4.1146.272'
valueset "Abnormal Interpretation of an Observation": '2.16.840.1.113762.1.4.1146.295'

-- Epidemiological Criteria (Implemented through presence of Diagnoses/Problems)
valueset "Exposure to Measles (SNOMED)": '2.16.840.1.113762.1.4.1146.2341'
-- valueset "Exposure to Measles (ICD10CM)": 'No codes available'
valueset "Increased Risk for Exposure to Measles (SNOMED)": '2.16.840.1.113762.1.4.1146.2342'
-- valueset "Increased Risk for Exposure to Measles (ICD10CM)": 'No codes available'

-- Context
context Patient

-- -----------------------------------------------------------------
-- Atomic Rules
-- -----------------------------------------------------------------

define "Measles Diagnosis or Active Problem":
  exists (
    [Condition: "Measles (SNOMED)"]
    union [Condition: "Measles (ICD10CM)"]
    union ([Condition: "Measles (SNOMED)"] C where C.clinicalStatus ~ ToConcept('active'))
    union ([Condition: "Measles (ICD10CM)"] C where C.clinicalStatus ~ ToConcept('active'))
  )
  and Encounter/Problem observation effective date within timebox -- Placeholder

define "Suspected Measles":
  exists ([Condition: "Suspected Measles (SNOMED)"]) -- ICD10CM not implemented
  and Encounter/Problem observation effective date within timebox -- Placeholder

define "Rash Any":
  exists ([Condition: "Rash (SNOMED)"]
    union [Condition: "Rash (ICD10CM)"]
    union ([Condition: "Rash (SNOMED)"] C where C.clinicalStatus ~ ToConcept('active'))
    union ([Condition: "Rash (ICD10CM)"] C where C.clinicalStatus ~ ToConcept('active'))
  )

define "Rash AND Lab IgM or IgG":
  "Rash Any"
  and (
    exists ([Observation: "Measles IgM Test"] O
            where O.value in "Positive Lab Result")
    or exists ([Observation: "Measles IgG Test"] O
               where O.value in "Positive Lab Result") -- Placeholder for 4-fold rise
  )

define "Rash AND Epidemiologic Link":
  "Rash Any"
  and (
    false -- Placeholder: Exposure to Measles / Increased risk / Contact / Risk group / Endemic area / Travel
  )

define "Lab Detection - Culture":
  exists ([Observation: 'Measles (Tests for measles virus by Culture and Identification Method)'] O
          where O.value in "Positive Lab Result"
             or O.value in "Organism/Substance Results"
             or O.interpretation in "Abnormal Interpretation")
  or exists ([Observation: 'Organisms (Tests by Culture and Identification)'] O
             where O.value in "Organism/Substance Results")

define "Lab Detection - Nucleic Acid":
  exists ([Observation: 'Measles (Tests for measles virus Nucleic Acid)'] O
          where O.value in "Positive Lab Result"
             or O.value in "Organism/Substance Results"
             or O.interpretation in "Abnormal Interpretation")
  or exists ([Observation: 'Organisms (Tests for Nucleic Acid)'] O
             where O.value in "Organism/Substance Results")

define "Lab Detection - IgM Antibody":
  exists ([Observation: "Measles IgM Test"] O
          where O.value in "Positive Lab Result"
             or O.value in "Organism/Substance Results"
             or O.interpretation in "Abnormal Interpretation")

define "Lab Test Ordered - Culture":
  exists ([ProcedureRequest: 'Measles (Tests for measles virus by Culture and Identification Method)'])
  or false -- Panel not implemented

define "Lab Test Ordered - Nucleic Acid":
  exists ([ProcedureRequest: 'Measles (Tests for measles virus Nucleic Acid)'])
  or exists ([ProcedureRequest: 'Measles (Test Panels for measles virus Nucleic Acid)'])

define "Lab Test Ordered - Antigen":
  exists ([ProcedureRequest: 'Measles (Tests for measles virus Antigen)'])
  or false -- Panel not implemented

-- -----------------------------------------------------------------
-- Top-Level Rule
-- -----------------------------------------------------------------

define "Reportable Measles":
  "Measles Diagnosis or Active Problem"
  or "Suspected Measles"
  or "Rash AND Lab IgM or IgG"
  or "Rash AND Epidemiologic Link"
  or "Lab Detection - Culture"
  or "Lab Detection - Nucleic Acid"
  or "Lab Detection - IgM Antibody"
  or "Lab Test Ordered - Culture"
  or "Lab Test Ordered - Nucleic Acid"
  or "Lab Test Ordered - Antigen"
