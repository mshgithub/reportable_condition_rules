# Measles

*Last Update: 6/4/2025*

---

## Summary of Specifications, Value Sets, and Rules Logic

* **Condition** = Measles
* **Organism** = Measles virus
* **SNOMED Code** = `14189004 | Measles (disorder)`
* **NNDSS Event Code** = `10140 | Measles (rubeola)`
* **RCKMS Authoring Tool Version** = `5.0 Release 20250228`

---

## Release History

| Release Date        | Release  | Latest Revision Date |
| ------------------- | -------- | -------------------- |
| 12/12/2018          | 20181212 | 9/19/2018            |
| 01/10/2020          | 20200110 | 01/02/2020           |
| 6/9/2021            | 20210609 | 3/29/2021            |
| 1/28/2022           | 20220128 | 9/19/2021            |
| 4/5/2024 (Emergent) | 20240405 | 4/3/2024             |
| 2/28/2025           | 20250228 | 6/4/2025             |

---

## Revision History

| Implemented By   | Date       | Revision / Reason                                                                                                                                                                                                                                                                                                                                        |
| ---------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Natalie Raketich | 11/01/2019 | During a review of Measles RS for Jan 2020 release: <br>• Updated snapshot of logic table to editable version <br>• Added “(Not implemented)” note for epidemiologic criteria <br>• Updated formatting for unimplemented value sets <br>• Added notes for Measles IgG Antibody value sets <br>• Updated logic rules (3, 7, 9, 10, 12) with details/notes |
| Emily Augustini  | 11/25/2019 | Value set table updates: <br>• Added “N/A – not currently implemented in logic sets” note for IgG Antibody value sets <br>• Added codes (e.g., Measles virus by culture) <br>• Removed codes (e.g., Rubella virus IgG Ab avidity)                                                                                                                        |
| Natalie Raketich | 12/20/2019 | • Added “(Not implemented)” note for 4-fold IgG antibody titer increase criteria <br>• Updated logic rule 12 with additional details                                                                                                                                                                                                                     |
| Natalie Raketich | 01/02/2020 | Value set table: <br>• Changed trigger status of Koplik spots (ICD10CM) and certain test panels to N/A (value sets don’t exist)                                                                                                                                                                                                                          |
| Gib Parrish      | 3/29/2021  | • Removed “Preliminary status not yet implemented” note (status now available) <br>• Updated logic rule 4 accordingly                                                                                                                                                                                                                                    |
| Natalie Raketich | 9/1/2021   | Added reporting criterion across 19 immediately notifiable conditions: <br>• **Suspected Measles** as default diagnosis criterion <br>• Added suspected Measles value sets (SNOMED, ICD10CM) <br>• Added new default logic rule, renumbered subsequent                                                                                                   |
| Susan Downer     | 9/19/2021  | Value set table: <br>• Added Measles \[Suspected] (SNOMED) OID `2.16.840.1.113762.1.4.1146.1436`                                                                                                                                                                                                                                                         |
| Natalie Raketich | 3/28/2024  | QA alignment with templates: <br>• Added SNOMED-CT + NNDSS Event Code <br>• Added timeboxing details to Measles, Suspected Measles, Koplik spots <br>• Added new epidemiologic criteria (Exposure, Increased risk) <br>• Removed/added value sets <br>• Updated logic rules (timeboxing, epidemiology, organism tests, 4-fold rise template)             |
| Susan Downer     | 3/29/2024  | Value set table: <br>• Created Exposure to Measles (SNOMED) and Increased Risk for Exposure (SNOMED)                                                                                                                                                                                                                                                     |
| Natalie Raketich | 4/3/2024   | • Updated default CLIN + LAB logic set (criteria N)                                                                                                                                                                                                                                                                                                      |
| Sam Spoto        | 1/14/2025  | Value sets: Added Fever (SNOMED, ICD10CM) + Body Temp (Vital Sign). <br>Criteria & Logic rules: <br>• Merged 4-fold IgG rule into default rule 3 <br>• Added fever criterion + new optional rules 13 & 14 <br>• Updated rule 4 wording to include individual epi criteria                                                                                |
| Sam Spoto        | 1/22/2025  | • Removed draft wording about IgG conversion/ratio (not in logic snapshot) from rules 3 & 13                                                                                                                                                                                                                                                             |
| Sam Spoto        | 2/19/2025  | • Re-added clause for IgG ratio ≤ 1/4 in rules 3 & 13 (method for 4-fold rise evaluation)                                                                                                                                                                                                                                                                |
| Natalie Raketich | 6/4/2025   | • Added tool version to file name and header <br>• Updated formatting of logic snapshot table                                                                                                                                                                                                                                                            |

---

## Snapshot of Logic

### Logic Sets

* **DEFAULT - LOGIC SETS**
* **OPTIONAL - LOGIC SETS**

**Lab Reporting**
**Provider / Facility Reporting**

The patient record being evaluated contains evidence of:

| Logic Rule(s) | Logic Set(s) |
| ------------- | ------------ |
| 1–2           | DX           |
| 5–10          | LAB          |
| 3             | CLIN + LAB   |
| 4             | CLIN + EPI   |
| 11            | CLIN         |
| 12            | LAB 2        |
| 13            | CLIN + LAB 2 |
| 14            | CLIN + LAB 3 |

---

### Criterion Descriptions

#### Clinical

| Criterion                                                  | DX | LAB | CLIN+LAB | CLIN+EPI | CLIN | LAB2 | CLIN+LAB2 | CLIN+LAB3 |
| ---------------------------------------------------------- | -- | --- | -------- | -------- | ---- | ---- | --------- | --------- |
| **Measles (as a diagnosis or active problem)\***           | S  |     |          |          |      |      |           |           |
| **Suspected Measles (as a diagnosis or active problem)\*** | S  |     |          |          |      |      |           |           |
| **Koplik spots (for Measles)\***                           |    |     |          |          | S    |      |           |           |
| **Rash (any)**                                             |    |     | N        | N        |      |      |           |           |
| **Fever (temperature ≥ 38°C / ≥ 100.4°F)**                 |    |     | N        | N        |      |      |           |           |

---

#### Laboratory

| Criterion                                                                               | DX | LAB | CLIN+LAB | CLIN+EPI | CLIN | LAB2 | CLIN+LAB2 | CLIN+LAB3 |
| --------------------------------------------------------------------------------------- | -- | --- | -------- | -------- | ---- | ---- | --------- | --------- |
| Identification of Measles virus in specimen by culture (incl. isolate, prelim. results) | S  |     | S        |          |      |      |           |           |
| Detection of Measles virus nucleic acid (any method)                                    | S  |     | S        |          |      |      |           |           |
| Detection of Measles virus antigen (any method)                                         |    |     |          |          |      | S    |           |           |
| Detection of Measles virus IgM antibody (any method)                                    | S  |     | S        |          |      |      |           |           |
| Detection of 4-fold ↑ in IgG antibody titer (paired sera, 10–180 days apart)\*\*        |    |     |          |          |      | O    |           | O         |
| Lab test ordered – culture (incl. isolate)                                              | S  |     | S        |          |      |      |           |           |
| Lab test ordered – nucleic acid (any method)                                            | S  |     | S        |          |      |      |           |           |
| Lab test ordered – antigen (any method)                                                 | S  |     | S        |          |      |      |           |           |
| Lab test ordered – IgM antibody (any method)                                            |    |     |          |          |      | O    |           | O         |

---

#### Epidemiologic

| Criterion                                             | DX | LAB | CLIN+LAB | CLIN+EPI | CLIN | LAB2 | CLIN+LAB2 | CLIN+LAB3 |
| ----------------------------------------------------- | -- | --- | -------- | -------- | ---- | ---- | --------- | --------- |
| Exposure to Measles                                   |    |     |          | O        |      |      |           | O         |
| Increased risk for exposure to Measles                |    |     |          | O        |      |      |           | O         |
| Contact with diagnosed Measles case\*\*               |    |     |          | O        |      |      |           | O         |
| Member of risk group (per PH authorities)\*\*         |    |     |          | O        |      |      |           | O         |
| Resides in endemic/outbreak area\*\*                  |    |     |          | O        |      |      |           | O         |
| Travelled (past 21 days) to endemic/outbreak area\*\* |    |     |          | O        |      |      |           | O         |

---

\* This criterion can be timeboxed in the RCKMS authoring tool. [More on timeboxing](https://www.rckms.org/rckms-timeboxing/)

\*\* Not Implemented in RCKMS (reporter types not available)

---

## Value Sets Required

### Clinical (Diagnoses, Problems, Symptoms, and Clinical Findings)

| Value Set Name                                  | OID                                  | Description                                                    | Include in Trigger Set   |
| ----------------------------------------------- | ------------------------------------ | -------------------------------------------------------------- | ------------------------ |
| **Measles (Disorders) (SNOMED)**                | 2.16.840.1.113762.1.4.1146.127       | SNOMED codes for Measles (diagnosis/active problem)            | Yes: Diagnosis\_problem  |
| **Measles (Disorders) (ICD10CM)**               | 2.16.840.1.113762.1.4.1146.126       | ICD10CM codes for Measles (diagnosis/active problem)           | Yes: Diagnosis\_problem  |
| **Measles \[Suspected] (Disorders) (SNOMED)**   | 2.16.840.1.113762.1.4.1146.1436      | SNOMED codes for suspected Measles (diagnosis/active problem)  | Yes: Suspected\_Disorder |
| **Measles \[Suspected] (Disorders) (ICD10CM)**  | Not implemented – No codes available | ICD10CM codes for suspected Measles                            | N/A                      |
| **Measles (Koplik Spots) (Disorders) (SNOMED)** | 2.16.840.1.113762.1.4.1146.51        | SNOMED codes for condition-specific symptoms unique to Measles | Yes: Diagnosis\_problem  |
| **Measles (Koplik Spots) (ICD10CM)**            | Not implemented – No codes available | ICD10CM codes for Koplik spots                                 | N/A                      |
| **Rash (SNOMED)**                               | 2.16.840.1.113762.1.4.1146.668       | SNOMED codes for non-specific rash                             | No: Common               |
| **Rash (ICD10CM)**                              | 2.16.840.1.113762.1.4.1146.669       | ICD10CM codes for non-specific rash                            | No: Common               |
| **Fever (SNOMED)**                              | 2.16.840.1.113762.1.4.1146.670       | SNOMED codes for non-specific fever                            | No: Common               |
| **Fever (ICD10CM)**                             | 2.16.840.1.113762.1.4.1146.671       | ICD10CM codes for non-specific fever                           | No: Common               |
| **Body Temperature (Vital Sign)**               | 2.16.840.1.113762.1.4.1146.1306      | LOINC codes for body temperature measurements                  | No: Common               |

---

### Laboratory Test Names – Organism or Substance Specific

| Value Set Name                                                             | OID                            | Description                                                   | Include in Trigger Set                               |
| -------------------------------------------------------------------------- | ------------------------------ | ------------------------------------------------------------- | ---------------------------------------------------- |
| **Measles (Tests for measles virus by Culture and Identification Method)** | 2.16.840.1.113762.1.4.1146.296 | Test names for culture-based identification of Measles virus  | Yes: Lab obs test name <br> Yes: Lab order test name |
| **Measles (Tests for measles virus Nucleic Acid)**                         | 2.16.840.1.113762.1.4.1146.297 | Test names for detection of Measles virus nucleic acid        | Yes: Lab obs test name <br> Yes: Lab order test name |
| **Measles (Tests for measles virus Antigen)**                              | 2.16.840.1.113762.1.4.1146.298 | Test names for detection of Measles virus antigen             | Yes: Lab obs test name <br> Yes: Lab order test name |
| **Measles (Tests for measles virus IgM Antibody)**                         | 2.16.840.1.113762.1.4.1146.299 | Test names for detection of Measles virus IgM antibody        | Yes: Lab obs test name <br> Yes: Lab order test name |
| **Measles (Tests for measles virus IgG Antibody \[Ratio] in Serum)**       | 2.16.840.1.113762.1.4.1146.818 | Test names for quantitative IgG ratio (acute vs convalescent) | Yes: Lab obs test name                               |

---

### Laboratory Test Panels

| Value Set Name                                                                   | OID                                  | Description                                             | Include in Trigger Set   |
| -------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------- | ------------------------ |
| **Measles (Test Panels for Measles virus by Culture and Identification Method)** | Not implemented – No codes available | Panels for culture-based identification of organisms    | N/A                      |
| **Measles (Test Panels for measles virus Nucleic Acid)**                         | 2.16.840.1.113762.1.4.1146.759       | Panels for nucleic acid detection of multiple organisms | Yes: Lab order test name |
| **Measles (Test Panels for Measles virus Antigen)**                              | Not implemented – No codes available | Panels for antigen detection of multiple organisms      | N/A                      |
| **Measles (Test Panels for Measles virus IgM Antibody)**                         | 2.16.840.1.113762.1.4.1146.369       | Panels for antibody detection (multiple organisms)      | Yes: Lab order test name |

---

### Laboratory Test Names – NOT Organism or Substance Specific

| Value Set Name                                      | OID                             | Description                                                | Include in Trigger Set |
| --------------------------------------------------- | ------------------------------- | ---------------------------------------------------------- | ---------------------- |
| **Organisms (Tests by Culture and Identification)** | 2.16.840.1.113762.1.4.1146.1041 | Non-specific organism identification by culture            | No: Common             |
| **Organisms (Tests by Unspecified Method)**         | 2.16.840.1.113762.1.4.1146.1040 | Non-specific organism identification by unspecified method | No: Common             |
| **Organisms (Tests for Nucleic Acid)**              | 2.16.840.1.113762.1.4.1146.994  | Non-specific nucleic acid detection                        | No: Common             |

---

### Laboratory (Result Values, Interpretation, Specimen Type, or Status)

| Value Set Name                                     | OID                            | Description                                                                     | Include in Trigger Set   |
| -------------------------------------------------- | ------------------------------ | ------------------------------------------------------------------------------- | ------------------------ |
| **Measles (Organism or Substance in Lab Results)** | 2.16.840.1.113762.1.4.1146.292 | SNOMED codes for condition-specific organisms/substances (lab results)          | Yes: Organism\_substance |
| **Present or Positive Lab Result Value**           | 2.16.840.1.113762.1.4.1146.272 | Codes for positive results (present, detected, positive, reactive)              | No: Common               |
| **Abnormal Interpretation of an Observation**      | 2.16.840.1.113762.1.4.1146.295 | HL7 Observation Interpretation codes (abnormal, outside range, resistant, etc.) | No: Common               |

---

### Epidemiological Criteria (via Diagnoses/Problems)

| Value Set Name                                       | OID                                  | Description                                  | Include in Trigger Set  |
| ---------------------------------------------------- | ------------------------------------ | -------------------------------------------- | ----------------------- |
| **Exposure to Measles (SNOMED)**                     | 2.16.840.1.113762.1.4.1146.2341      | SNOMED codes for exposure to Measles virus   | Yes: Diagnosis\_problem |
| **Exposure to Measles (ICD10CM)**                    | Not implemented – No codes available | ICD10CM codes for exposure                   | N/A                     |
| **Increased Risk for Exposure to Measles (SNOMED)**  | 2.16.840.1.113762.1.4.1146.2342      | SNOMED codes for increased risk of exposure  | Yes: Diagnosis\_problem |
| **Increased Risk for Exposure to Measles (ICD10CM)** | Not implemented – No codes available | ICD10CM codes for increased risk of exposure | N/A                     |

---

## Default Logic Rules

### Measles (as a diagnosis or active problem)

> **NOTE:** If timeboxing is selected in the specifications grid, portions of the logic rule highlighted in blue will be used in the determination of reportability.

```text
IF
(
    (Patient has a diagnosis of [VS: Measles (Disorders) (SNOMED)]
     OR
     Patient has a diagnosis of [VS: Measles (Disorders) (ICD10CM)])
    AND
    Encounter diagnosis effective date is within the user-defined timebox window
)
OR
(
    ((Patient has a problem list entry of [VS: Measles (Disorders) (SNOMED)] AND status = ACTIVE)
     OR
     (Patient has a problem list entry of [VS: Measles (Disorders) (ICD10CM)] AND status = ACTIVE))
    AND
    Problem observation effective date is within the user-defined timebox window
)
THEN Report
```

---

### Suspected Measles (as a diagnosis or active problem)

> **NOTE:** If timeboxing is selected, blue-highlighted portions are used. Portions not implemented are shown in gray.

```text
IF
(
    (Patient has a diagnosis of [VS: Measles [Suspected] (SNOMED)]
     OR
     Patient has a diagnosis of [VS: Measles [Suspected] (ICD10CM)])  -- Not implemented
    AND
    Encounter diagnosis effective date is within the timebox window
)
OR
(
    ((Patient has a problem list entry of [VS: Measles [Suspected] (SNOMED)] AND status = ACTIVE)
     OR
     (Patient has a problem list entry of [VS: Measles [Suspected] (ICD10CM)] AND status = ACTIVE))  -- Not implemented
    AND
    Problem observation effective date is within the timebox window
)
THEN Report
```

---

### Rash (any) **AND**

(Lab test ordered for IgM antibody **OR** Detection of 4-fold rise in IgG antibody titer)

> **NOTE:** Some portions not currently implemented (gray).

```text
IF
(
    Patient has a diagnosis of [VS: Rash (SNOMED)] OR
    Patient has a diagnosis of [VS: Rash (ICD10CM)] OR
    (Problem list entry of [VS: Rash (SNOMED)] AND status = ACTIVE) OR
    (Problem list entry of [VS: Rash (ICD10CM)] AND status = ACTIVE)
)
AND
(
    (Lab test order: [VS: Measles (Tests for IgM Antibody)]
     OR
     Lab test order: [VS: Measles (Test Panels for IgM Antibody)])
    OR
    (Detection of 4-fold or greater increase in IgG antibody titer between paired sera, 10–180 days apart – NEED TO CREATE RULE)
    OR
    (Lab result with test name [VS: IgG Antibody Ratio in Serum] AND value ≤ 1/4) -- Not implemented
)
THEN Report
```

---

### Rash (any) **AND Epidemiologic Link**

(E.g., Exposure, Increased Risk, Contact, Risk Group, Endemic Area, Travel)

> **NOTE:** Some portions not currently implemented (gray).

```text
IF
(
    Patient has a diagnosis of [VS: Rash (SNOMED)] OR
    Patient has a diagnosis of [VS: Rash (ICD10CM)] OR
    (Problem list entry of [VS: Rash (SNOMED)] AND status = ACTIVE) OR
    (Problem list entry of [VS: Rash (ICD10CM)] AND status = ACTIVE)
)
AND
(
    (Diagnosis or active problem of [VS: Exposure to Measles (SNOMED/ICD10CM)]) -- ICD10CM not implemented
    OR
    (Diagnosis or active problem of [VS: Increased Risk for Exposure (SNOMED/ICD10CM)]) -- ICD10CM not implemented
    OR
    (Contact with diagnosed Measles case = TRUE) -- Not implemented
    OR
    (Member of risk group during outbreak = TRUE) -- Not implemented
    OR
    (Resides in endemic/outbreak area = TRUE) -- Not implemented
    OR
    (Travel in past 21 days to endemic/outbreak area = TRUE) -- Not implemented
)
THEN Report
```

---

### Identification of Measles virus (culture method, incl. prelim. results)

```text
IF
(
    Lab result with test name [VS: Measles (Culture & Identification)]
    AND
    (Result value in [VS: Positive Lab Result Value]
     OR
     Result value in [VS: Measles (Organism/Substance in Results)]
     OR
     Interpretation in [VS: Abnormal Interpretation])
)
OR
(
    (Lab result with test name [VS: Organisms (Culture & Identification)]
     OR
     Lab result with test name [VS: Organisms (Unspecified Method)])
    AND
    Result value in [VS: Measles (Organism/Substance in Results)]
)
THEN Report
```

---

### Detection of Measles virus nucleic acid (any method)

```text
IF
(
    Lab result with test name [VS: Measles (Nucleic Acid)]
    AND
    (Result value in [VS: Positive Lab Result Value]
     OR
     Result value in [VS: Measles (Organism/Substance in Results)]
     OR
     Interpretation in [VS: Abnormal Interpretation])
)
OR
(
    Lab result with test name [VS: Organisms (Nucleic Acid)]
    AND
    Result value in [VS: Measles (Organism/Substance in Results)]
)
THEN Report
```

---

### Detection of Measles virus IgM antibody (any method)

```text
IF
    Lab result with test name [VS: Measles (IgM Antibody)]
    AND
    (Result value in [VS: Positive Lab Result Value]
     OR
     Result value in [VS: Measles (Organism/Substance in Results)]
     OR
     Interpretation in [VS: Abnormal Interpretation])
THEN Report
```

---

### Lab Test Ordered – Culture

> **NOTE:** Some portions not implemented.

```text
IF
    Lab test order: [VS: Measles (Culture & Identification)]
    OR
    Lab test order: [VS: Measles (Culture Test Panels)] -- Not implemented
THEN Report
```

---

### Lab Test Ordered – Nucleic Acid

```text
IF
    Lab test order: [VS: Measles (Nucleic Acid)]
    OR
    Lab test order: [VS: Measles (Nucleic Acid Test Panels)]
THEN Report
```

---

### Lab Test Ordered – Antigen

> **NOTE:** Some portions not implemented.

```text
IF
    Lab test order: [VS: Measles (Antigen)]
    OR
    Lab test order: [VS: Measles (Antigen Test Panels)] -- Not implemented
THEN Report
```

---



