@implementation PHAPrivateFederatedLearningFiltersDecoder

- (PHAPrivateFederatedLearningFiltersDecoder)initWithFingeprintVersionString:(id)a3
{
  id v5;
  PHAPrivateFederatedLearningFiltersDecoder *v6;
  PHAPrivateFederatedLearningFiltersDecoder *v7;
  uint64_t v8;
  NSDictionary *assetFeatureExtractorNameToClass;
  uint64_t v10;
  NSDictionary *graphFeatureExtractorNameToClass;
  uint64_t v12;
  NSDictionary *facesFeatureExtractorNameToClass;
  uint64_t v14;
  NSDictionary *assetPhotoLibraryFeatureExtractorNameToClass;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[18];
  _QWORD v23[18];
  _QWORD v24[55];
  _QWORD v25[56];

  v25[55] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHAPrivateFederatedLearningFiltersDecoder;
  v6 = -[PHAPrivateFederatedLearningFiltersDecoder init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fingerprintVersionString, a3);
    v24[0] = *MEMORY[0x1E0D763F0];
    v25[0] = objc_opt_class();
    v24[1] = *MEMORY[0x1E0D76450];
    v25[1] = objc_opt_class();
    v24[2] = *MEMORY[0x1E0D76338];
    v25[2] = objc_opt_class();
    v24[3] = *MEMORY[0x1E0D76340];
    v25[3] = objc_opt_class();
    v24[4] = *MEMORY[0x1E0D76350];
    v25[4] = objc_opt_class();
    v24[5] = *MEMORY[0x1E0D76360];
    v25[5] = objc_opt_class();
    v24[6] = *MEMORY[0x1E0D762D0];
    v25[6] = objc_opt_class();
    v24[7] = *MEMORY[0x1E0D76480];
    v25[7] = objc_opt_class();
    v24[8] = *MEMORY[0x1E0D76330];
    v25[8] = objc_opt_class();
    v24[9] = *MEMORY[0x1E0D76320];
    v25[9] = objc_opt_class();
    v24[10] = *MEMORY[0x1E0D763C0];
    v25[10] = objc_opt_class();
    v24[11] = *MEMORY[0x1E0D76398];
    v25[11] = objc_opt_class();
    v24[12] = *MEMORY[0x1E0D76348];
    v25[12] = objc_opt_class();
    v24[13] = *MEMORY[0x1E0D763A0];
    v25[13] = objc_opt_class();
    v24[14] = *MEMORY[0x1E0D763C8];
    v25[14] = objc_opt_class();
    v24[15] = *MEMORY[0x1E0D76400];
    v25[15] = objc_opt_class();
    v24[16] = *MEMORY[0x1E0D76458];
    v25[16] = objc_opt_class();
    v24[17] = *MEMORY[0x1E0D76488];
    v25[17] = objc_opt_class();
    v24[18] = *MEMORY[0x1E0D76328];
    v25[18] = objc_opt_class();
    v24[19] = *MEMORY[0x1E0D76478];
    v25[19] = objc_opt_class();
    v24[20] = *MEMORY[0x1E0D76388];
    v25[20] = objc_opt_class();
    v24[21] = *MEMORY[0x1E0D762D8];
    v25[21] = objc_opt_class();
    v24[22] = *MEMORY[0x1E0D76418];
    v25[22] = objc_opt_class();
    v24[23] = *MEMORY[0x1E0D76498];
    v25[23] = objc_opt_class();
    v24[24] = *MEMORY[0x1E0D76490];
    v25[24] = objc_opt_class();
    v24[25] = *MEMORY[0x1E0D764A0];
    v25[25] = objc_opt_class();
    v24[26] = *MEMORY[0x1E0D76460];
    v25[26] = objc_opt_class();
    v24[27] = *MEMORY[0x1E0D76390];
    v25[27] = objc_opt_class();
    v24[28] = *MEMORY[0x1E0D76438];
    v25[28] = objc_opt_class();
    v24[29] = *MEMORY[0x1E0D763D0];
    v25[29] = objc_opt_class();
    v24[30] = *MEMORY[0x1E0D76440];
    v25[30] = objc_opt_class();
    v24[31] = *MEMORY[0x1E0D76420];
    v25[31] = objc_opt_class();
    v24[32] = *MEMORY[0x1E0D763A8];
    v25[32] = objc_opt_class();
    v24[33] = *MEMORY[0x1E0D76428];
    v25[33] = objc_opt_class();
    v24[34] = *MEMORY[0x1E0D76430];
    v25[34] = objc_opt_class();
    v24[35] = *MEMORY[0x1E0D763E8];
    v25[35] = objc_opt_class();
    v24[36] = *MEMORY[0x1E0D76410];
    v25[36] = objc_opt_class();
    v24[37] = *MEMORY[0x1E0D763B0];
    v25[37] = objc_opt_class();
    v24[38] = *MEMORY[0x1E0D763B8];
    v25[38] = objc_opt_class();
    v24[39] = *MEMORY[0x1E0D76408];
    v25[39] = objc_opt_class();
    v24[40] = *MEMORY[0x1E0D763E0];
    v25[40] = objc_opt_class();
    v24[41] = *MEMORY[0x1E0D76308];
    v25[41] = objc_opt_class();
    v24[42] = *MEMORY[0x1E0D76300];
    v25[42] = objc_opt_class();
    v24[43] = *MEMORY[0x1E0D762F8];
    v25[43] = objc_opt_class();
    v24[44] = *MEMORY[0x1E0D762E0];
    v25[44] = objc_opt_class();
    v24[45] = *MEMORY[0x1E0D76318];
    v25[45] = objc_opt_class();
    v24[46] = *MEMORY[0x1E0D76310];
    v25[46] = objc_opt_class();
    v24[47] = *MEMORY[0x1E0D762E8];
    v25[47] = objc_opt_class();
    v24[48] = *MEMORY[0x1E0D762F0];
    v25[48] = objc_opt_class();
    v24[49] = *MEMORY[0x1E0D76468];
    v25[49] = objc_opt_class();
    v24[50] = *MEMORY[0x1E0D763D8];
    v25[50] = objc_opt_class();
    v24[51] = *MEMORY[0x1E0D76470];
    v25[51] = objc_opt_class();
    v24[52] = *MEMORY[0x1E0D76448];
    v25[52] = objc_opt_class();
    v24[53] = CFSTR("AssetPropertiesFilter");
    v25[53] = objc_opt_class();
    v24[54] = CFSTR("AssetInternalPropertiesFilter");
    v25[54] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 55);
    v8 = objc_claimAutoreleasedReturnValue();
    assetFeatureExtractorNameToClass = v7->_assetFeatureExtractorNameToClass;
    v7->_assetFeatureExtractorNameToClass = (NSDictionary *)v8;

    v22[0] = CFSTR("Meaning");
    v23[0] = objc_opt_class();
    v22[1] = CFSTR("InvariantFamily");
    v23[1] = objc_opt_class();
    v22[2] = CFSTR("InvariantCoworker");
    v23[2] = objc_opt_class();
    v22[3] = CFSTR("InvariantPartner");
    v23[3] = objc_opt_class();
    v22[4] = CFSTR("PublicEventCategory");
    v23[4] = objc_opt_class();
    v22[5] = CFSTR("BusinessCategory");
    v23[5] = objc_opt_class();
    v22[6] = CFSTR("InvariantPet");
    v23[6] = objc_opt_class();
    v22[7] = CFSTR("InvariantBaby");
    v23[7] = objc_opt_class();
    v22[8] = CFSTR("Scene");
    v23[8] = objc_opt_class();
    v22[9] = CFSTR("MyHome");
    v23[9] = objc_opt_class();
    v22[10] = CFSTR("MyWork");
    v23[10] = objc_opt_class();
    v22[11] = CFSTR("Mobility");
    v23[11] = objc_opt_class();
    v22[12] = CFSTR("PartOfDay");
    v23[12] = objc_opt_class();
    v22[13] = CFSTR("Season");
    v23[13] = objc_opt_class();
    v22[14] = CFSTR("Weekend");
    v23[14] = objc_opt_class();
    v22[15] = CFSTR("Weekday");
    v23[15] = objc_opt_class();
    v22[16] = CFSTR("POI");
    v23[16] = objc_opt_class();
    v22[17] = CFSTR("ROI");
    v23[17] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 18);
    v10 = objc_claimAutoreleasedReturnValue();
    graphFeatureExtractorNameToClass = v7->_graphFeatureExtractorNameToClass;
    v7->_graphFeatureExtractorNameToClass = (NSDictionary *)v10;

    v20[0] = *MEMORY[0x1E0D76378];
    v21[0] = objc_opt_class();
    v20[1] = *MEMORY[0x1E0D76370];
    v21[1] = objc_opt_class();
    v20[2] = *MEMORY[0x1E0D76380];
    v21[2] = objc_opt_class();
    v20[3] = *MEMORY[0x1E0D76368];
    v21[3] = objc_opt_class();
    v20[4] = *MEMORY[0x1E0D76358];
    v21[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v12 = objc_claimAutoreleasedReturnValue();
    facesFeatureExtractorNameToClass = v7->_facesFeatureExtractorNameToClass;
    v7->_facesFeatureExtractorNameToClass = (NSDictionary *)v12;

    v18 = *MEMORY[0x1E0D763F8];
    v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    assetPhotoLibraryFeatureExtractorNameToClass = v7->_assetPhotoLibraryFeatureExtractorNameToClass;
    v7->_assetPhotoLibraryFeatureExtractorNameToClass = (NSDictionary *)v14;

  }
  return v7;
}

- (id)filtersByDatasetNameFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28[0] = CFSTR("positive");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28[1] = CFSTR("negative");
  v29[0] = v6;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
    goto LABEL_15;
  v11 = v10;
  v12 = *(_QWORD *)v24;
  while (2)
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(__CFString **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid filters format: value for dataset name is not a string."));
LABEL_18:

        goto LABEL_19;
      }
      if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("all")) & 1) == 0
        && (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("positive")) & 1) == 0
        && (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("negative")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dataset name %@ is not a supported."), v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 2, v21);

        goto LABEL_18;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningFiltersDecoder filtersFromDictionary:error:](self, "filtersFromDictionary:error:", v15, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_18;
      if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("all")))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("positive"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:", v16);

        v14 = CFSTR("negative");
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v16);

      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
      continue;
    break;
  }
LABEL_15:

  if (-[PHAPrivateFederatedLearningFiltersDecoder validateFiltersForDatasetName:error:](self, "validateFiltersForDatasetName:error:", v8, a4))
  {
    v19 = v8;
  }
  else
  {
LABEL_19:
    v19 = 0;
  }

  return v19;
}

- (id)filtersFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v22 = v6;
      v23 = *(_QWORD *)v25;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v23)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid filters format: value for feature extractor name is not a string."));
LABEL_16:

            v20 = 0;
            v6 = v22;
            goto LABEL_17;
          }
          -[PHAPrivateFederatedLearningFiltersDecoder featureExtractorFromName:error:](self, "featureExtractorFromName:error:", v12, a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[PHAPrivateFederatedLearningFiltersDecoder featureValidatorTypeForFeatureExtractorName:](self, "featureValidatorTypeForFeatureExtractorName:", v12);
          v15 = -[PHAPrivateFederatedLearningFiltersDecoder featureExtractorTypeForFeatureExtractorName:](self, "featureExtractorTypeForFeatureExtractorName:", v12);
          if (!v13)
            goto LABEL_16;
          v16 = v15;
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningFiltersDecoder featureValidatorsForFilterConfigList:featureExtractor:featureValidatorType:featureExtractorType:error:](self, "featureValidatorsForFilterConfigList:featureExtractor:featureValidatorType:featureExtractorType:error:", v17, v13, v14, v16, a4);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            goto LABEL_16;
          }
          v19 = (void *)v18;
          objc_msgSend(v7, "addObjectsFromArray:", v18);

          ++v11;
        }
        while (v10 != v11);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v6 = v22;
        if (v10)
          continue;
        break;
      }
    }

    v20 = v7;
LABEL_17:

  }
  else
  {
    -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 1, CFSTR("Invalid filters format: value for feature extractor config is not a dictionary."));
    v20 = 0;
  }

  return v20;
}

- (id)featureValidatorsForFilterConfigList:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v12;
    obj = v12;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(obj);
          -[PHAPrivateFederatedLearningFiltersDecoder featureValidatorForFilterConfig:featureExtractor:featureValidatorType:featureExtractorType:error:](self, "featureValidatorForFilterConfig:featureExtractor:featureValidatorType:featureExtractorType:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18), v13, a5, a6, a7, v23);
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19)
          {

            v21 = 0;
            goto LABEL_13;
          }
          v20 = (void *)v19;
          objc_msgSend(v14, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v16)
          continue;
        break;
      }
    }

    v21 = v14;
LABEL_13:

    v12 = v23;
  }
  else
  {
    -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a7, 1, CFSTR("Invalid filters format: value for filter config is not an array."));
    v21 = 0;
  }

  return v21;
}

- (id)featureValidatorForFilterConfig:(id)a3 featureExtractor:(id)a4 featureValidatorType:(int64_t)a5 featureExtractorType:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  id *v19;

  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("featureName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("predicate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        switch(a5)
        {
          case 0:
            -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a7, 3, CFSTR("Unknown feature validator type is unsupported"));
            a7 = 0;
            break;
          case 1:
            v17 = (objc_class *)MEMORY[0x1E0D75F58];
            goto LABEL_14;
          case 2:
            v17 = (objc_class *)MEMORY[0x1E0D76008];
            goto LABEL_14;
          case 3:
            v17 = (objc_class *)MEMORY[0x1E0D75D20];
            goto LABEL_14;
          case 4:
            v18 = (objc_class *)MEMORY[0x1E0D75C60];
            goto LABEL_16;
          case 5:
            v17 = (objc_class *)MEMORY[0x1E0D75C78];
LABEL_14:
            v19 = (id *)objc_msgSend([v17 alloc], "initWithPredicate:featureExtractor:featureName:", v16, v13, v14);
            goto LABEL_17;
          case 6:
            v18 = (objc_class *)MEMORY[0x1E0D761B0];
LABEL_16:
            v19 = (id *)objc_msgSend([v18 alloc], "initWithPredicate:featureExtractor:featureExtractorType:featureName:", v16, v13, a6, v14);
LABEL_17:
            a7 = v19;
            break;
          default:
            break;
        }

      }
      else
      {
        -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a7, 1, CFSTR("Invalid filter config format: predicate is not a string."));
        a7 = 0;
      }

    }
    else
    {
      -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a7, 1, CFSTR("Invalid filter config format: feature name is not a string."));
      a7 = 0;
    }

  }
  else
  {
    -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a7, 1, CFSTR("Invalid filter config format: filter configuration is not dictionary."));
    a7 = 0;
  }

  return a7;
}

- (int64_t)featureValidatorTypeForFeatureExtractorName:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("PhotoLibraryAverage-")) & 1) != 0)
  {
    v5 = 6;
  }
  else
  {
    -[PHAPrivateFederatedLearningFiltersDecoder assetPhotoLibraryFeatureExtractorNameToClass](self, "assetPhotoLibraryFeatureExtractorNameToClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "objectForKeyedSubscript:", v4);

    if (v7)
    {
      v5 = 5;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0D75F68];
      -[PHAPrivateFederatedLearningFiltersDecoder fingerprintVersionString](self, "fingerprintVersionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "fingerprintVersionForName:", v9);

      if ((objc_msgSend(MEMORY[0x1E0D75F68], "isMomentFingerprintVersion:", v10) & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D75F68], "isMemoryFingerprintVersion:", v10) & 1) != 0)
      {
        v5 = 4;
      }
      else
      {
        -[PHAPrivateFederatedLearningFiltersDecoder assetFeatureExtractorNameToClass](self, "assetFeatureExtractorNameToClass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v4);

        if (v13)
        {
          v5 = 1;
        }
        else
        {
          -[PHAPrivateFederatedLearningFiltersDecoder graphFeatureExtractorNameToClass](self, "graphFeatureExtractorNameToClass");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v4);

          if (v15)
          {
            v5 = 2;
          }
          else
          {
            -[PHAPrivateFederatedLearningFiltersDecoder facesFeatureExtractorNameToClass](self, "facesFeatureExtractorNameToClass");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "objectForKeyedSubscript:", v4);

            if (v17)
              v5 = 3;
            else
              v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

- (int64_t)featureExtractorTypeForFeatureExtractorName:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PhotoLibraryAverage-"), &stru_1E85223A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningFiltersDecoder assetFeatureExtractorNameToClass](self, "assetFeatureExtractorNameToClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[PHAPrivateFederatedLearningFiltersDecoder graphFeatureExtractorNameToClass](self, "graphFeatureExtractorNameToClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", v4);

    if (v9)
    {
      v7 = 2;
    }
    else
    {
      -[PHAPrivateFederatedLearningFiltersDecoder facesFeatureExtractorNameToClass](self, "facesFeatureExtractorNameToClass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "objectForKeyedSubscript:", v4);

      if (v11)
        v7 = 3;
      else
        v7 = 0;
    }
  }

  return v7;
}

- (id)featureExtractorFromName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;

  v6 = a3;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PhotoLibraryAverage-"), &stru_1E85223A0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningFiltersDecoder assetFeatureExtractorNameToClass](self, "assetFeatureExtractorNameToClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", v7);

  -[PHAPrivateFederatedLearningFiltersDecoder graphFeatureExtractorNameToClass](self, "graphFeatureExtractorNameToClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v7);

  -[PHAPrivateFederatedLearningFiltersDecoder facesFeatureExtractorNameToClass](self, "facesFeatureExtractorNameToClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v7);

  -[PHAPrivateFederatedLearningFiltersDecoder assetPhotoLibraryFeatureExtractorNameToClass](self, "assetPhotoLibraryFeatureExtractorNameToClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v7);

  if (v9)
  {
    v16 = (void *)v9;
  }
  else
  {
    if (v11)
    {
      objc_msgSend(v11, "featureExtractorWithError:", a4);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (v13)
    {
      v16 = (void *)v13;
    }
    else
    {
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid filters format: feature extractor name %@ is not valid."), v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](self, "_generateError:errorCode:errorMessage:", a4, 0, v20);

        v18 = 0;
        goto LABEL_7;
      }
      v16 = (void *)v15;
    }
  }
  objc_msgSend(v16, "featureExtractor");
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v18 = (void *)v17;
LABEL_7:

  return v18;
}

- (BOOL)validateFiltersForDatasetName:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  PHAPrivateFederatedLearningFiltersDecoder *v23;
  id *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = a3;
  v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v23 = self;
    v24 = a4;
    v7 = *(_QWORD *)v33;
    v27 = v6;
    v22 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v6);
        v26 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v8);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v6, "objectForKeyedSubscript:", v9, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v16, "featureName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v17, "isEqualToString:", CFSTR("AssetPropertiesFilter")) & 1) != 0)
              {
                v18 = 1;
              }
              else
              {
                objc_msgSend(v16, "featureName");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v19, "isEqualToString:", CFSTR("AssetInternalPropertiesFilter"));

              }
              if ((v18 & v13 & 1) != 0)
              {
                -[PHAPrivateFederatedLearningFiltersDecoder _generateError:errorCode:errorMessage:](v23, "_generateError:errorCode:errorMessage:", v24, 4, CFSTR("Invalid filters: setting multiple asset properties filters for the same dataset is not allowed."));

                v20 = 0;
                v6 = v27;
                goto LABEL_22;
              }
              v13 |= v18;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v12)
              continue;
            break;
          }
        }

        v8 = v26 + 1;
        v6 = v27;
        v7 = v22;
      }
      while (v26 + 1 != v25);
      v20 = 1;
      v25 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }
  else
  {
    v20 = 1;
  }
LABEL_22:

  return v20;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningFiltersDecoder"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 0;
}

- (NSDictionary)assetFeatureExtractorNameToClass
{
  return self->_assetFeatureExtractorNameToClass;
}

- (NSDictionary)graphFeatureExtractorNameToClass
{
  return self->_graphFeatureExtractorNameToClass;
}

- (NSDictionary)facesFeatureExtractorNameToClass
{
  return self->_facesFeatureExtractorNameToClass;
}

- (NSDictionary)assetPhotoLibraryFeatureExtractorNameToClass
{
  return self->_assetPhotoLibraryFeatureExtractorNameToClass;
}

- (NSString)fingerprintVersionString
{
  return self->_fingerprintVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintVersionString, 0);
  objc_storeStrong((id *)&self->_assetPhotoLibraryFeatureExtractorNameToClass, 0);
  objc_storeStrong((id *)&self->_facesFeatureExtractorNameToClass, 0);
  objc_storeStrong((id *)&self->_graphFeatureExtractorNameToClass, 0);
  objc_storeStrong((id *)&self->_assetFeatureExtractorNameToClass, 0);
}

@end
