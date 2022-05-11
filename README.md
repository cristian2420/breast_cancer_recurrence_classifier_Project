# breast_cancer_recurrence_classifier

Our breast cancer study published on [PNAS](https://www.pnas.org/content/116/38/19200) indicated potential application of SILVER-Seq on breast cancer and identified some promising breast cancer related diagnostic panels, for cancer and recurrence prediction. To further validate the model, we've collected serum samples from 2 additional sources and processed the samples with SILVER-Seq (as shown below). 

- Validation breast cancer dataset: A total of 83 breast cancer serum samples provided by Moores Cancer Center were processed to SILVER-Seq libraries and sequenced with successful data generation. The libraries were sequenced on NovaSeq SP100 to generate PE50 + 16 Index 1 reads. These samples were processed and sequenced together with the normal samples
- Validation normal dataset: A total of 78 normal serum samples provided by San Diego Blood Bank were processed to SILVER-Seq libraries and sequenced with successful data generation. The libraries were sequenced on NovaSeq SP100 to generate PE50 + 16 Index 1 reads. These samples were processed and sequenced together with breast cancer samples

## Project goal

As stated in the section above, the goal of this project is 
- 1. Develop the breast cancer classifier model from PNAS paper using the PNAS breast cancer and normal datasets.
- 2. Develop the breast cancer recurrence classifier model from PNAS paper using the PNAS breast cancer dataset.
- 3. Validate the above models using the validation datasets.

## PNAS Samples and Data
### Raw Data
#### Concepts
- poiseid: A unique ID assigned to each donor. There might be several samples from one single donor, usually collected at different timepoints, samples from one donor shared the same poiseid
- fu: Short for “follow-up”. There might be several samples from one single donor, usually collected at different timepoints, samples collected at different timepoints are assigned with different fu number
- sample_id: A unique ID given to data for each sample to connect data with metainfo of the corresponding sample. 
#### Documents
- pnas_counts_96_nodup.txt: Exon level reads counts for all 96 breast cancer samples in PNAS paper. Column 1-96 (S01-S96) in the file corresponds to row 1-96 (S01-S96) in “pnas_patient_info.csv”
- pnas_tpm_96_nodup: Exon level TPM for all 96 breast cancer samples in PNAS paper. Column 1-96 (S01-S96) in the file corresponds to row 1-96 (S01-S96) in “pnas_patient_info.csv”
- pnas_patient_info.csv: Metadata for all 96 breast cancer samples in PNAS paper, row 1-96 corresponds to S01-S96. Column 1-96 in “pnas_counts_96_nodup.txt” and “pnas_tpm_96_nodup” corresponds to row 1-96 in “pnas_patient_info.csv”.
- pnas_normal_tpm.txt: Exon level TPM for all 32 normal samples in PNAS paper.
- pnas_normal_readcounts.txt: Exon level reads counts for all 32 normal samples in PNAS paper.

## Validation Samples and Data
### Raw Data
#### Concepts
- Mapping ID (e.g. BCSC_S5_01): A unique ID given to data for each sample to connect data with metainfo of the corresponding sample
#### Documents
- validation_bc_meta.xlsx: Metainfo for validation breast cancer samples based on their Mapping ID. 
- validation_normal_meta.xlsx: Metainfo for SDBB validation normal samples based on their Mapping ID
- validation_exon_readcounts: Exon level read counts for validation breast cancer and normal samples based on their Mapping ID.
- validation_exon_tpm: Exon level TPM for validation breast cancer and normal samples based on their Mapping ID.



