@implementation PHACurareShadowEvaluationRecipeDecoder

+ (id)decodeRecipeUserInfo:(id)a3 models:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 trialDeploymentID:(id)a7 trialExperimentID:(id)a8 trialTreatmentID:(id)a9 decodingError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PHACurareShadowEvaluationRecipeOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PHAPrivateFederatedLearningFiltersDecoder *v37;
  void *v38;
  PHAPrivateFederatedLearningFiltersDecoder *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  char v45;
  PHACurareShadowEvaluationRunner *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v60;
  uint8_t buf[16];

  v16 = a3;
  v60 = a4;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = objc_alloc_init(PHACurareShadowEvaluationRecipeOptions);
  -[PHAPrivateFederatedLearningRecipeOptions setPhotoLibrary:](v22, "setPhotoLibrary:", v21);

  -[PHAPrivateFederatedLearningRecipeOptions setGraphManager:](v22, "setGraphManager:", v20);
  -[PHACurareShadowEvaluationRecipeOptions setTrialDeploymentID:](v22, "setTrialDeploymentID:", v19);

  -[PHACurareShadowEvaluationRecipeOptions setTrialExperimentID:](v22, "setTrialExperimentID:", v18);
  -[PHACurareShadowEvaluationRecipeOptions setTrialTreatmentID:](v22, "setTrialTreatmentID:", v17);

  objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("modelInputName"), v16, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningRecipeOptions setModelInputName:](v22, "setModelInputName:", v23);

  -[PHAPrivateFederatedLearningRecipeOptions modelInputName](v22, "modelInputName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("modelOutputName"), v16, a10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningRecipeOptions setModelOutputName:](v22, "setModelOutputName:", v25);

    -[PHAPrivateFederatedLearningRecipeOptions modelOutputName](v22, "modelOutputName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(a1, "objectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("lossName"), v16, a10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningRecipeOptions setLossName:](v22, "setLossName:", v27);

      -[PHAPrivateFederatedLearningRecipeOptions lossName](v22, "lossName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("fingerprintVersion"), v16, a10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setFingerprintVersionName:](v22, "setFingerprintVersionName:", v29);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("datasetPolicy"), v16, a10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setDatasetPolicyString:](v22, "setDatasetPolicyString:", v30);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("labelPolicy"), v16, a10);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setLabelPolicyString:](v22, "setLabelPolicyString:", v31);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("positivesDatasetName"), v16, a10);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setPositivesDatasetName:](v22, "setPositivesDatasetName:", v32);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("positivesSubsetName"), v16, a10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setPositivesSubsetName:](v22, "setPositivesSubsetName:", v33);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("negativesDatasetName"), v16, a10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setNegativesDatasetName:](v22, "setNegativesDatasetName:", v34);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("negativesSubsetName"), v16, a10);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningRecipeOptions setNegativesSubsetName:](v22, "setNegativesSubsetName:", v35);

        objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("filters"), v16, a10);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = [PHAPrivateFederatedLearningFiltersDecoder alloc];
        -[PHAPrivateFederatedLearningRecipeOptions fingerprintVersionName](v22, "fingerprintVersionName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PHAPrivateFederatedLearningFiltersDecoder initWithFingeprintVersionString:](v37, "initWithFingeprintVersionString:", v38);

        if (v36)
        {
          -[PHAPrivateFederatedLearningFiltersDecoder filtersByDatasetNameFromDictionary:error:](v39, "filtersByDatasetNameFromDictionary:error:", v36, a10);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningRecipeOptions setFiltersByDatasetName:](v22, "setFiltersByDatasetName:", v40);

          -[PHAPrivateFederatedLearningRecipeOptions filtersByDatasetName](v22, "filtersByDatasetName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v41)
            goto LABEL_22;
        }
        if (PFOSVariantHasInternalDiagnostics())
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "BOOLForKey:", CFSTR("PHACurareShadowEvaluationSimulateExternalDevice"));

          if (!v43)
          {
            v45 = 1;
LABEL_15:
            -[PHAPrivateFederatedLearningRecipeOptions filtersByDatasetName](v22, "filtersByDatasetName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(a1, "isValidFiltersByDatasetName:", v48);

            if ((v45 & 1) != 0 || (v49 & 1) != 0)
            {
              objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("datasetSource"), v16, a10);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHAPrivateFederatedLearningRecipeOptions setDatasetSource:](v22, "setDatasetSource:", v51);

              objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("numberOfClasses"), v16, a10);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHAPrivateFederatedLearningRecipeOptions setNumberOfClasses:](v22, "setNumberOfClasses:", objc_msgSend(v52, "unsignedIntegerValue"));

              objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("learningFramework"), v16, a10);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHAPrivateFederatedLearningRecipeOptions setLearningFramework:](v22, "setLearningFramework:", v53);

              objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("evaluationMetricNames"), v16, a10);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHAPrivateFederatedLearningRecipeOptions setEvaluationMetricNames:](v22, "setEvaluationMetricNames:", v54);

              objc_msgSend(a1, "optionalObjectOfClass:forKey:inDictionary:error:", objc_opt_class(), CFSTR("modelSpecificInfo"), v16, a10);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v60;
              objc_msgSend(a1, "decodeModelSpecificInfo:models:", v50, v60);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHACurareShadowEvaluationRecipeOptions setModelInfoArray:](v22, "setModelInfoArray:", v55);

              -[PHACurareShadowEvaluationRecipeOptions modelInfoArray](v22, "modelInfoArray");
              v56 = objc_claimAutoreleasedReturnValue();
              if (v56)
              {
                v57 = (void *)v56;
                -[PHACurareShadowEvaluationRecipeOptions modelInfoArray](v22, "modelInfoArray");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (PHACurareShadowEvaluationRunner *)objc_msgSend(v58, "count");

                if (v46)
                  v46 = -[PHACurareShadowEvaluationRunner initWithRecipeOptions:]([PHACurareShadowEvaluationRunner alloc], "initWithRecipeOptions:", v22);
              }
              else
              {
                v46 = 0;
              }
              goto LABEL_24;
            }
            if (a10)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PHACurareShadowEvaluationRecipeDecoder] Invalid filter"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "decodingErrorWithMessage:", v50);
              v46 = 0;
              *a10 = (id)objc_claimAutoreleasedReturnValue();
              v47 = v60;
LABEL_24:

              goto LABEL_25;
            }
LABEL_22:
            v46 = 0;
            v47 = v60;
LABEL_25:

            goto LABEL_26;
          }
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_136);
          v44 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CAC16000, v44, OS_LOG_TYPE_INFO, "PHACurareShadowEvaluationSimulateExternalDevice is TRUE. Simulating external device", buf, 2u);
          }
        }
        v45 = 0;
        goto LABEL_15;
      }
    }
  }
  v46 = 0;
  v47 = v60;
LABEL_26:

  return v46;
}

+ (id)cameraPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("additionalAttributes.importedBy"), 1, CFSTR("additionalAttributes.importedBy"), 2);
}

+ (id)allowedPredicates
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cameraPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isValidFiltersByDatasetName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  BOOL v19;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allowedPredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v22 = *(_QWORD *)v29;
    v23 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "predicate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v5, "containsObject:", v18) & 1) == 0)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v18, "predicateFormat");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v33 = v21;
                  v34 = 2112;
                  v35 = v11;
                  _os_log_error_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PHACurareShadowEvaluationRecipeDecoder] Filter %@ for %@ dataset is not allowed for external devices", buf, 0x16u);

                }
                v19 = 0;
                v6 = v23;
                goto LABEL_21;
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            if (v15)
              continue;
            break;
          }
        }

        v9 = v22;
        v6 = v23;
      }
      v8 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      v19 = 1;
    }
    while (v8);
  }
  else
  {
    v19 = 1;
  }
LABEL_21:

  return v19;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "castObject:withName:toClass:error:", v11, v10, a3, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "castObject:withName:toClass:error:", v11, v10, a3, a6);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No value for key: (%@)"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodingErrorWithMessage:", v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a6 = (id *)v10;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object with name (%@) has class (%@), expected (%@)"), v11, objc_opt_class(), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodingErrorWithMessage:", v12);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)decodingErrorWithMessage:(id)a3
{
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = CFSTR("No error message");
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);

  v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHACurareShadowEvaluationRecipeDecoder"), 1, v6);
  return v8;
}

+ (id)decodeModelSpecificInfo:(id)a3 models:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  id v31;
  void *v32;
  void *v34;
  uint64_t v35;
  id obj;
  id obja;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = v5;
  v34 = v6;
  if (v5)
  {
    v41 = 0uLL;
    v42 = 0uLL;
    v39 = 0uLL;
    v40 = 0uLL;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        v35 = v9;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("modelPath"));
          objc_msgSend(v12, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByDeletingPathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v38, "valueForKeyPath:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              objc_msgSend(v18, "valueForKeyPath:", CFSTR("labelIndex"));
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              if (v20)
                v22 = (const __CFString *)v20;
              else
                v22 = CFSTR("1");
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("labelIndex"), v34);
              objc_msgSend(v19, "valueForKeyPath:", CFSTR("labelOperatingPoint"));
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = (void *)v23;
              if (v23)
                v25 = (const __CFString *)v23;
              else
                v25 = CFSTR("0.5");
              v9 = v35;
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("labelOperatingPoint"));
              objc_msgSend(v7, "addObject:", v13);

            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v9);
    }
  }
  else
  {
    v45 = 0uLL;
    v46 = 0uLL;
    v43 = 0uLL;
    v44 = 0uLL;
    obja = v6;
    v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(obja);
          v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("modelPath"));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("labelIndex"));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("0.5"), CFSTR("labelOperatingPoint"));
          objc_msgSend(v7, "addObject:", v31);

        }
        v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v27);
    }
  }

  v32 = (void *)objc_msgSend(v7, "copy");
  return v32;
}

void __163__PHACurareShadowEvaluationRecipeDecoder_decodeRecipeUserInfo_models_photoLibrary_graphManager_trialDeploymentID_trialExperimentID_trialTreatmentID_decodingError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
