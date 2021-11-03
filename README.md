# breast_cancer_recurrence_classifier

Our breast cancer study published on [PNSA](https://www.pnas.org/content/116/38/19200) indicated potential application of SILVER-Seq on breast cancer and identified some promising breast cancer related diagnostic panels, for cancer and recurrence prediction. To further validate the model, we've collected serum samples from 2 additional sources and processed the samples with SILVER-Seq (as shown below). 

- Moores Cancer Center (MCC): A total of 83 breast cancer serum samples provided by Moores Cancer Center were processed to SILVER-Seq libraries and sequenced with successful data generation. The libraries were sequenced on NovaSeq SP100 to generate PE50 + 16 Index 1 reads. These MCC samples were processed and sequenced together with SDBB samples
- San Diego Blood Bank (SDBB): A total of 78 normal serum samples provided by San Diego Blood Bank were processed to SILVER-Seq libraries and sequenced with successful data generation. The libraries were sequenced on NovaSeq SP100 to generate PE50 + 16 Index 1 reads. These SDBB samples were processed and sequenced together with MCC samples

## Project goal

As stated in the section above, the goal of this project is 
- 1. Re-produce the breast cancer recurrence classifier model from PNAS paper.
- 2. Use MCC data to further validate the breast cancer recurrence model.

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

## MCC and SDBB Samples and Data
### Raw Data
NOTE: BCSC_S5_87 is a positive control sample. This sample is not related to the project and please ignore it during analysis.  
#### Concepts
- Mapping ID (e.g. BCSC_S5_01): A unique ID given to data for each sample to connect data with metainfo of the corresponding sample
- SDBB ID or MCC ID: The ID labeled on the vial of each sample. A unique ID for each sample, usually provided by the sample provider. If you are going to ask sample providers any questions about a specific sample, please refer to this SDBB Id or MCC ID. 
- Sample ID (e.g. 192447): Usually a part of the SDBB/MCC ID, only an abbreviation of SDBB/MCC ID making referring to each sample easier. 
- Hemolysis Level: Severity of hemolysis judged based on color of the samples. Samples affected by hemolysis may contain more cell-derived RNA that could potentially affect the analysis. 
  + 0 = almost no hemolysis (normal serum color); 
  + = potential hemolysis (a little bit red in color); 
  + = observed hemolysis (very red in color)
#### Documents
- BCSC_S5 and BCSC_S6 MetaInfo_MCC Samples_20210826.xlsx: Metainfo for MCC samples based on their Mapping ID. 
- BCSC_S5 and BCSC_S6 MetaInfo_SDBB Samples_20210826.xlsx: Metainfo for SDBB samples based on their Mapping ID
- bcsc_exon_counts: Exon level read counts for MCC and SDBB samples based on their Mapping ID. Please exclude the unrelated samples BCSC_S5_87 from analysis. It is only a positive control sample.
- bcsc_exon_tpm: Exon level TPM for MCC and SDBB samples based on their Mapping ID. Please exclude the unrelated samples BCSC_S5_87 from analysis. It is only a positive control sample.



