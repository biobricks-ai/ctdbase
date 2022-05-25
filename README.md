---
title: ctdbase
namespace: ctdbase
description: ctdbase aggregates data about how environmental exposures impact human health
dependencies: 
  - name: ctdbase downloads
    url: http://ctdbase.org/downloads
---

<a href="https://github.com/biobricks-ai/ctdbase/actions"><img src="https://github.com/biobricks-ai/ctdbase/actions/workflows/bricktools-check.yaml/badge.svg?branch=main"/></a>

# Comparative Toxicogenomics Database [ctdbase.org](http://ctdbase.org/downloads)
> CTD is a robust, publicly available database that aims to advance understanding about how environmental exposures affect human health - http://ctdbase.org/

Biobricks.ai transforms ctdbase into parquet and [OBO](https://owlcollab.github.io/oboformat/doc/GO.format.obo-1_4.html) files. To use an individual file, install dvc and import or install the file:

```
# TODO major - we need to give people a way to download the data themselves, this won't work.
dvc get    git@github.com:insilica/oncindex-bricks.git bricks/ctdbase/data/CTD_Phenotype-Disease_biological_process_associations.parquet
dvc import git@github.com:insilica/oncindex-bricks.git bricks/ctdbase/data/CTD_Phenotype-Disease_biological_process_associations.parquet
```

# Data description

### Chemical–gene interactions

`CTD_chem_gene_ixns.parquet`

Fields:
- ChemicalName
- ChemicalID (MeSH identifier)
- CasRN (CAS Registry Number, if available)
- GeneSymbol
- GeneID (NCBI Gene identifier)
- GeneForms ('|'-delimited list)
- Organism (scientific name)
- OrganismID (NCBI Taxonomy identifier)
- Interaction
- InteractionActions ('|'-delimited list)
- PubMedIDs ('|'-delimited list)

### Chemical–gene interaction types

`CTD_chem_gene_ixn_types.parquet`

Fields (non-OBO):

- TypeName
- Code
- Description

ParentCode

`CTD_chem_gene_ixn_types.obo`
 OBO-edit format
 
### Chemical–disease associations

`CTD_chemicals_diseases.parquet`

Fields:

- ChemicalName
- ChemicalID (MeSH identifier)
- CasRN (CAS Registry Number, if available)
- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- DirectEvidence ('|'-delimited list)
- InferenceGeneSymbol
- InferenceScore
- OmimIDs ('|'-delimited list)
- PubMedIDs ('|'-delimited list)

### Chemical–GO enriched associations

`CTD_chem_go_enriched.parquet`

Fields:

- ChemicalName
- ChemicalID (MeSH identifier)
- CasRN (CAS Registry Number, if available)
- Ontology
- GOTermName
- GOTermID
- HighestGOLevel
- PValue
- CorrectedPValue
- TargetMatchQty
- TargetTotalQty
- BackgroundMatchQty
- BackgroundTotalQty

### Chemical–pathway enriched associations

`CTD_chem_pathways_enriched.parquet`

Fields:

- ChemicalName
- ChemicalID (MeSH identifier)
- CasRN (CAS Registry Number, if available)
- PathwayName
- PathwayID (KEGG or REACTOME identifier)
- PValue
- CorrectedPValue
- TargetMatchQty
- TargetTotalQty
- BackgroundMatchQty
- BackgroundTotalQty

### Gene–disease associations

`CTD_genes_diseases.parquet`

*Large file size: 2.4GB*

Fields:

- GeneSymbol
- GeneID (NCBI Gene identifier)
- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- DirectEvidence ('|'-delimited list)
- InferenceChemicalName
- InferenceScore
- OmimIDs ('|'-delimited list)
- PubMedIDs ('|'-delimited list)

### Gene–pathway associations

`CTD_genes_pathways.parquet`

Fields:

- GeneSymbol
- GeneID (NCBI Gene identifier)
- PathwayName
- PathwayID (KEGG or REACTOME identifier)

### Disease–pathway associations

`CTD_diseases_pathways.parquet`

Fields:

- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- PathwayName
- PathwayID (KEGG or REACTOME identifier)
- InferenceGeneSymbol (a gene via which the association is inferred)

### Chemical–phenotype interactions

`CTD_pheno_term_ixns.parquet`

Fields:
- ChemicalName
- ChemicalID (MeSH identifier)
- CASRN (CAS Registry Number, if available)
- PhenotypeName
- PhenotypeID (GO identifier)
- CoMentionedTerms ('|'-delimited list ) entries formatted as Name^Id^Source
- Organism (scientific name)
- OrganismID (NCBI Taxonomy identifier)
- Interaction
- InteractionActions ('|'-delimited list)
- AnatomyTerms (MeSH term; '|'-delimited list) entries formatted as SequenceOrder^Name^Id
- InferenceGeneSymbols ('|'-delimited list) entries formatted as Name^Id
- PubMedIDs ('|'-delimited list)

### Exposure–study associations

`CTD_exposure_studies.parquet`

Fields:

- Reference
- StudyFactors ( | delimited list)
- ExposureStressors ( | delimited list ) entries formatted as Name^Id^Source
- Receptors ( | delimited list) formatted as Name^Id^Source^description
- StudyCountries (| delimited list)
- Mediums (| delimited list)
- ExposureMarkers ( | delimited list) entries formatted as Name^Id^Source
- Diseases ( | delimited list) entries formatted as Name^Id^Source
- Phenotypes ( | delimited list) entries formatted as Name^Id^Source
- AuthorSummary

### Exposure–event associations

`CTD_exposure_events.parquet`

Fields:

- ExposureStressorName
- ExposureStressorID (MeSH identifier)
- StressorSourceCategory ('|'-delimited list)
- StressorSourceDetails
- NumberOfStressorSamples
- StressorNotes
- NumberOfReceptors
- Receptors
- ReceptorNotes
- SmokingStatus ('|'-delimited list)
- Age
- AgeUnitsOfMeasurement
- AgeQualifier
- Sex('|'-delimited list)
- Race ('|'-delimited list)
- Methods ('|'-delimited list)
- DetectionLimit
- DetectionLimitUnitsOfMeasurement
- DetectionFrequency
- Medium
- ExposureMarker
- ExposureMarkerID (MeSH or NCBI Gene identifier)
- MarkerLevel
- MarkerUnitsOfMeasurement
- MarkerMeasurementStatistic
- AssayNotes
- StudyCountries ('|'-delimited list)
- StateOrProvince ('|'-delimited list)
- City,Town,Region,Area ('|'-delimited list)
- ExposureEventNotes
- OutcomeRelationship
- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- PhenotypeName
- PhenotypeID (GO identifier)
- PhenotypeActionDegreeType
- Anatomy (MeSH term; '|'-delimited list)
- ExposureOutcomeNotes
- Reference
- AssociatedStudyTitles ('|'-delimited list)
- EnrollmentStartYear
- EnrollmentEndYear
- StudyFactors ('|'-delimited list)

### Phenotype (GO)–Disease Inference Networks

`CTD_Phenotype-Disease_biological_process_associations.parquet`
`CTD_Phenotype-Disease_cellular_component_associations.parquet`
`CTD_Phenotype-Disease_molecular_function_associations.parquet`

Fields:

- GOName
- GOID (GO identifer)
- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- InferenceChemicalQty
- InferenceChemicalNames ('|' delimited list)
- InferenceGeneQty
- InferenceGeneSymbols ('|' delimited list)

### Chemical vocabulary

`CTD_chemicals.parquet`

Fields:

- ChemicalName
- ChemicalID (MeSH identifier)
- CasRN (CAS Registry Number, if available)
- Definition
- ParentIDs (identifiers of the parent terms; '|'-delimited list)
- TreeNumbers (identifiers of the chemical's nodes; '|'-delimited list)
- ParentTreeNumbers (identifiers of the parent nodes; '|'-delimited list)
- Synonyms ('|'-delimited list)

### Disease vocabulary (MEDIC)

`CTD_diseases.parquet`

Fields (non-OBO):

- DiseaseName
- DiseaseID (MeSH or OMIM identifier)
- Definition
- AltDiseaseIDs (alternative identifiers; '|'-delimited list)
- ParentIDs (identifiers of the parent terms; '|'-delimited list)
- TreeNumbers (identifiers of the disease's nodes; '|'-delimited list)
- ParentTreeNumbers (identifiers of the parent nodes; '|'-delimited list)
- Synonyms ('|'-delimited list)
- SlimMappings (MEDIC-Slim mappings; '|'-delimited list)

CTD's MEDIC disease vocabulary is a modified subset of descriptors from the “Diseases” [C] branch of the U.S. National Library of Medicine's Medical Subject Headings ([MeSH](http://www.nlm.nih.gov/mesh/meshhome.html)®), combined with genetic disorders from the Online Mendelian Inheritance in Man® ([OMIM](http://www.omim.org/)®) database. Each disease occurs in one or more nodes of this hierarchical vocabulary.

MEDIC-Slim classifies MEDIC diseases into high-level categories.

### Anatomy vocabulary

`CTD_anatomy.parquet`

Fields:

- AnatomyName
- AnatomyID (MeSH identifier)
- Definition
- AltAnatomyIDs (alternative identifiers; '|'-delimited list)
- ParentIDs (identifiers of the parent terms; '|'-delimited list)
- TreeNumbers (identifiers of the anatomical term's nodes; '|'-delimited list)
- ParentTreeNumbers (identifiers of the parent nodes; '|'-delimited list)
- Synonyms ('|'-delimited list)
- ExternalSynonyms ('|'-delimited list)

### Gene vocabulary

`CTD_genes.parquet`

Fields:

- GeneSymbol
- GeneName
- GeneID (NCBI Gene identifier)
- AltGeneIDs (alternative NCBI Gene identifiers; '|'-delimited list)
- Synonyms ('|'-delimited list)
- BioGRIDIDs ('|'-delimited list)
- PharmGKBIDs ('|'-delimited list)
- UniprotIDs ('|'-delimited list)

### Pathway vocabulary

`CTD_pathways.parquet`

Fields:

- PathwayName
- PathwayID (KEGG or REACTOME identifier)

### Exposure Ontology (ExO)

`CTD_exposure_ontology.obo`
