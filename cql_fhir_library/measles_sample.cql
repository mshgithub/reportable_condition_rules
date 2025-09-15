library MeaslesReporting version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'

-- ValueSets
valueset "Measles (SNOMED)": '[VS: Measles (Disorders) (SNOMED)]'
valueset "Measles (ICD10CM)": '[VS: Measles (Disorders) (ICD10CM)]'
valueset "Suspected Measles (SNOMED)": '[VS: Measles [Suspected] (Disorders) (SNOMED)]'
valueset "Rash (SNOMED)": '[VS: Rash (SNOMED)]'
valueset "Rash (ICD10CM)": '[VS: Rash (ICD10CM)]'
valueset "Measles IgM Test": '[VS: Measles (Tests for measles virus IgM Antibody)]'
valueset "Measles IgG Test": '[VS: Measles (Tests for measles virus IgG Antibody [Ratio] in Serum)]'
valueset "Positive Lab Result": '[VS: Present or Positive Lab Result Value]'
valueset "Organism/Substance Results": '[VS: Measles (Organism or Substance in Lab Results)]'
valueset "Abnormal Interpretation": '[VS: Abnormal Interpretation of an Observation]'

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
