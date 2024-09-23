@implementation PREResponseSuggestionsExpConfig

- (PREResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5
{
  NSString *v9;
  id v10;
  PREResponseSuggestionsExpConfig *v11;
  PREResponseSuggestionsExpConfig *v12;
  NSObject *v13;
  NSString **p_namespaceName;
  uint64_t v15;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  uint64_t v17;
  TRIExperimentIdentifiers *experimentIdentifiers;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSString *treatmentName;
  void *v29;
  uint64_t v30;
  NSString *inferenceModelDescription;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  PREResponseSuggestionsExpConfig *v38;
  NSObject *v39;
  void *v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSString *inferenceModelFilePath;
  uint64_t v48;
  NSString *inferenceModelConfigPath;
  uint64_t v50;
  NSString *espressoBinFilePath;
  uint64_t v52;
  NSString *vocabFilePath;
  void *v54;
  NSString *v55;
  void *v56;
  char v57;
  NSString *v58;
  void *v59;
  char v60;
  NSString *v61;
  void *v62;
  char v63;
  NSString *v64;
  NSObject *v65;
  NSString *v66;
  void *v67;
  void *v68;
  _BOOL4 isMLModelEnabled;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSString *namespaceName;
  uint64_t v76;
  NSString *v78;
  NSObject *v79;
  NSString *v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  NSString *v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  _QWORD v92[4];
  PREResponseSuggestionsExpConfig *v93;
  _QWORD v94[4];
  NSString *v95;
  objc_super v96;
  uint8_t buf[4];
  NSString *v98;
  __int16 v99;
  NSString *v100;
  __int16 v101;
  NSString *v102;
  __int16 v103;
  NSString *v104;
  __int16 v105;
  NSString *v106;
  __int16 v107;
  NSString *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  _BOOL4 v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v9 = (NSString *)a3;
  v10 = a4;
  v96.receiver = self;
  v96.super_class = (Class)PREResponseSuggestionsExpConfig;
  v11 = -[PREResponseSuggestionsExpConfig init](&v96, sel_init);
  v12 = v11;
  if (v11)
  {
    if (!v9)
    {
      -[PREResponseSuggestionsExpConfig _setDefaultValuesForFactors](v11, "_setDefaultValuesForFactors");
      goto LABEL_34;
    }
    pre_responses_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v9;
      _os_log_impl(&dword_1C35DB000, v13, OS_LOG_TYPE_DEFAULT, "PRE Experiment config -- setting up config for namespace %@", buf, 0xCu);
    }

    objc_msgSend(v10, "refresh");
    p_namespaceName = &v12->_namespaceName;
    objc_storeStrong((id *)&v12->_namespaceName, a3);
    objc_msgSend(v10, "rolloutIdentifiersWithNamespaceName:", v12->_namespaceName);
    v15 = objc_claimAutoreleasedReturnValue();
    rolloutIdentifiers = v12->_rolloutIdentifiers;
    v12->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v15;

    objc_msgSend(v10, "experimentIdentifiersWithNamespaceName:", v12->_namespaceName);
    v17 = objc_claimAutoreleasedReturnValue();
    experimentIdentifiers = v12->_experimentIdentifiers;
    v12->_experimentIdentifiers = (TRIExperimentIdentifiers *)v17;

    -[TRIExperimentIdentifiers treatmentId](v12->_experimentIdentifiers, "treatmentId");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v19, "length"))
    {
      -[TRIRolloutIdentifiers rolloutId](v12->_rolloutIdentifiers, "rolloutId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
        goto LABEL_9;
      pre_responses_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C35DB000, v19, OS_LOG_TYPE_DEFAULT, "Smart Reply using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_9:
    -[TRIExperimentIdentifiers treatmentId](v12->_experimentIdentifiers, "treatmentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      -[TRIExperimentIdentifiers experimentId](v12->_experimentIdentifiers, "experimentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (!v24)
      {
        pre_responses_handle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          v78 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v98 = v78;
          _os_log_fault_impl(&dword_1C35DB000, v25, OS_LOG_TYPE_FAULT, "Smart Reply: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_30;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("modelName"), v12->_namespaceName);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringValue");
    v27 = objc_claimAutoreleasedReturnValue();
    treatmentName = v12->_treatmentName;
    v12->_treatmentName = (NSString *)v27;

    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("modelDescription"), v12->_namespaceName);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = objc_claimAutoreleasedReturnValue();
    inferenceModelDescription = v12->_inferenceModelDescription;
    v12->_inferenceModelDescription = (NSString *)v30;

    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("mlModelEnabled"), v12->_namespaceName);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_isMLModelEnabled = objc_msgSend(v32, "BOOLeanValue");

    if (!-[NSString length](v12->_treatmentName, "length"))
    {
      pre_responses_handle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C35DB000, v37, OS_LOG_TYPE_FAULT, "Smart Reply: treatment name required but not found", buf, 2u);
      }

      goto LABEL_30;
    }
    if (v12->_isMLModelEnabled)
    {
      if (!-[NSString length](v12->_inferenceModelDescription, "length"))
      {
        pre_responses_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C35DB000, v33, OS_LOG_TYPE_FAULT, "Smart Reply: model description expected but not found", buf, 2u);
        }

      }
      objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("modelAssets"), *p_namespaceName);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "directoryValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v35, "hasPath") & 1) != 0 || (objc_msgSend(v35, "isOnDemand") & 1) != 0)
      {
        if ((objc_msgSend(v35, "hasPath") & 1) != 0 || a5)
        {
          if ((objc_msgSend(v35, "hasPath") & 1) != 0)
          {
            objc_msgSend(v35, "path");
            v36 = objc_claimAutoreleasedReturnValue();
            v91 = 0;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "fileExistsAtPath:isDirectory:", v36, &v91);

            if (v41 && v91)
            {
              -[NSString stringByAppendingString:](v12->_treatmentName, "stringByAppendingString:", CFSTR(".model.chunk"));
              v42 = objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingString:](v12->_treatmentName, "stringByAppendingString:", CFSTR(".config.plist"));
              v43 = objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingString:](v12->_treatmentName, "stringByAppendingString:", CFSTR(".espresso.bin"));
              v44 = objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingString:](v12->_treatmentName, "stringByAppendingString:", CFSTR(".vocab.trie"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v42);
              v46 = objc_claimAutoreleasedReturnValue();
              inferenceModelFilePath = v12->_inferenceModelFilePath;
              v12->_inferenceModelFilePath = (NSString *)v46;

              v90 = (void *)v43;
              -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v43);
              v48 = objc_claimAutoreleasedReturnValue();
              inferenceModelConfigPath = v12->_inferenceModelConfigPath;
              v12->_inferenceModelConfigPath = (NSString *)v48;

              v89 = (void *)v44;
              -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v44);
              v50 = objc_claimAutoreleasedReturnValue();
              espressoBinFilePath = v12->_espressoBinFilePath;
              v12->_espressoBinFilePath = (NSString *)v50;

              v88 = v45;
              -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v45);
              v52 = objc_claimAutoreleasedReturnValue();
              vocabFilePath = v12->_vocabFilePath;
              v12->_vocabFilePath = (NSString *)v52;

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v43) = objc_msgSend(v54, "isReadableFileAtPath:", v12->_inferenceModelFilePath);

              if ((v43 & 1) == 0)
              {
                v55 = v12->_inferenceModelFilePath;
                v12->_inferenceModelFilePath = 0;

              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "isReadableFileAtPath:", v12->_inferenceModelConfigPath);

              if ((v57 & 1) == 0)
              {
                v58 = v12->_inferenceModelConfigPath;
                v12->_inferenceModelConfigPath = 0;

              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "isReadableFileAtPath:", v12->_espressoBinFilePath);

              if ((v60 & 1) == 0)
              {
                v61 = v12->_espressoBinFilePath;
                v12->_espressoBinFilePath = 0;

              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "isReadableFileAtPath:", v12->_vocabFilePath);

              if ((v63 & 1) == 0)
              {
                v64 = v12->_vocabFilePath;
                v12->_vocabFilePath = 0;

              }
              if (v12->_inferenceModelConfigPath && (v12->_inferenceModelFilePath || v12->_espressoBinFilePath))
              {
                pre_responses_handle();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = v12->_treatmentName;
                  v83 = v12->_inferenceModelDescription;
                  v84 = v12->_inferenceModelFilePath;
                  v85 = v12->_inferenceModelConfigPath;
                  v86 = v12->_espressoBinFilePath;
                  v87 = v12->_vocabFilePath;
                  -[TRIExperimentIdentifiers experimentId](v12->_experimentIdentifiers, "experimentId");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIExperimentIdentifiers treatmentId](v12->_experimentIdentifiers, "treatmentId");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  isMLModelEnabled = v12->_isMLModelEnabled;
                  *(_DWORD *)buf = 138414338;
                  v98 = v66;
                  v99 = 2112;
                  v100 = v83;
                  v101 = 2112;
                  v102 = v84;
                  v103 = 2112;
                  v104 = v85;
                  v105 = 2112;
                  v106 = v86;
                  v107 = 2112;
                  v108 = v87;
                  v109 = 2112;
                  v110 = v67;
                  v111 = 2112;
                  v112 = v68;
                  v113 = 1024;
                  v114 = isMLModelEnabled;
                  _os_log_impl(&dword_1C35DB000, v65, OS_LOG_TYPE_DEFAULT, "Smart Reply reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelFilePath: %@ inferenceModelConfigPath: %@ espresso.bin: %@ vocab: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x58u);

                }
                v38 = v12;
                v71 = v89;
                v70 = v90;
                v45 = v88;
              }
              else
              {
                pre_responses_handle();
                v79 = objc_claimAutoreleasedReturnValue();
                v71 = v89;
                v70 = v90;
                if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
                {
                  v80 = v12->_inferenceModelFilePath;
                  v81 = v12->_inferenceModelConfigPath;
                  v82 = v12->_espressoBinFilePath;
                  *(_DWORD *)buf = 138412802;
                  v98 = v80;
                  v99 = 2112;
                  v100 = v81;
                  v101 = 2112;
                  v102 = v82;
                  _os_log_fault_impl(&dword_1C35DB000, v79, OS_LOG_TYPE_FAULT, "Smart Reply: some required file factor not readable with config path %@, inference path %@, and espresso bin path %@", buf, 0x20u);
                }

                v38 = 0;
              }

            }
            else
            {
              pre_responses_handle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1C35DB000, v42, OS_LOG_TYPE_FAULT, "Smart Reply: directory factor download completed, but directory path not found", buf, 2u);
              }
              v38 = 0;
            }

            goto LABEL_62;
          }
          pre_responses_handle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C35DB000, v72, OS_LOG_TYPE_DEFAULT, "Smart Reply: assets directory factor is being queued for download", buf, 2u);
          }

          if (initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1)
            dispatch_once(&initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_1066);
          v115[0] = CFSTR("modelAssets");
          v73 = (void *)MEMORY[0x1E0C99D20];
          v36 = (id)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
          objc_msgSend(v73, "arrayWithObjects:count:", v115, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          namespaceName = v12->_namespaceName;
          v76 = MEMORY[0x1E0C809B0];
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2;
          v94[3] = &unk_1E7D9E0A8;
          v95 = v9;
          v92[0] = v76;
          v92[1] = 3221225472;
          v92[2] = __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_55;
          v92[3] = &unk_1E7D9E0D0;
          v93 = v12;
          objc_msgSend(v10, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v74, namespaceName, v36, 0, v94, v92);

        }
        else
        {
          pre_responses_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v98 = v9;
            _os_log_impl(&dword_1C35DB000, v36, OS_LOG_TYPE_DEFAULT, "Smart Reply: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
          }
        }
      }
      else
      {
        pre_responses_handle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C35DB000, v36, OS_LOG_TYPE_FAULT, "Smart Reply: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
        }
      }
      v38 = 0;
LABEL_62:

      goto LABEL_63;
    }
    pre_responses_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v39, OS_LOG_TYPE_DEFAULT, "Smart Reply using default values since the ML model is not enabled.", buf, 2u);
    }

    -[PREResponseSuggestionsExpConfig _fillDefaultValueForFactors](v12, "_fillDefaultValueForFactors");
LABEL_34:
    v38 = v12;
    goto LABEL_63;
  }
LABEL_30:
  v38 = 0;
LABEL_63:

  return v38;
}

- (void)_setDefaultValuesForFactors
{
  NSString *treatmentName;
  NSString *inferenceModelFilePath;
  NSString *inferenceModelConfigPath;
  NSString *espressoBinFilePath;
  NSString *vocabFilePath;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  TRIExperimentIdentifiers *experimentIdentifiers;

  treatmentName = self->_treatmentName;
  self->_treatmentName = (NSString *)CFSTR("DEFAULT_RESPONSE_KIT");

  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = 0;

  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = 0;

  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = 0;

  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = 0;

  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = 0;

  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = 0;

  self->_isMLModelEnabled = 0;
}

- (void)_fillDefaultValueForFactors
{
  id *p_treatmentName;
  __CFString *v4;
  NSString *inferenceModelFilePath;
  NSString *inferenceModelConfigPath;
  NSString *espressoBinFilePath;
  NSString *vocabFilePath;
  void *v9;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  id *p_experimentIdentifiers;
  TRIExperimentIdentifiers *experimentIdentifiers;
  id v13;
  id v14;

  p_treatmentName = (id *)&self->_treatmentName;
  if (-[NSString length](self->_treatmentName, "length"))
    v4 = (__CFString *)*p_treatmentName;
  else
    v4 = CFSTR("DEFAULT_RESPONSE_KIT");
  objc_storeStrong(p_treatmentName, v4);
  if (-[NSString length](self->_inferenceModelFilePath, "length"))
    inferenceModelFilePath = self->_inferenceModelFilePath;
  else
    inferenceModelFilePath = 0;
  objc_storeStrong((id *)&self->_inferenceModelFilePath, inferenceModelFilePath);
  if (-[NSString length](self->_inferenceModelConfigPath, "length"))
    inferenceModelConfigPath = self->_inferenceModelConfigPath;
  else
    inferenceModelConfigPath = 0;
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, inferenceModelConfigPath);
  if (-[NSString length](self->_espressoBinFilePath, "length"))
    espressoBinFilePath = self->_espressoBinFilePath;
  else
    espressoBinFilePath = 0;
  objc_storeStrong((id *)&self->_espressoBinFilePath, espressoBinFilePath);
  if (-[NSString length](self->_vocabFilePath, "length"))
    vocabFilePath = self->_vocabFilePath;
  else
    vocabFilePath = 0;
  objc_storeStrong((id *)&self->_vocabFilePath, vocabFilePath);
  -[TRIRolloutIdentifiers rolloutId](self->_rolloutIdentifiers, "rolloutId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    rolloutIdentifiers = self->_rolloutIdentifiers;
  else
    rolloutIdentifiers = 0;
  objc_storeStrong((id *)&self->_rolloutIdentifiers, rolloutIdentifiers);

  experimentIdentifiers = self->_experimentIdentifiers;
  p_experimentIdentifiers = (id *)&self->_experimentIdentifiers;
  -[TRIExperimentIdentifiers treatmentId](experimentIdentifiers, "treatmentId");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
    v13 = *p_experimentIdentifiers;
  else
    v13 = 0;
  objc_storeStrong(p_experimentIdentifiers, v13);

}

- (BOOL)isEqualToConfig:(id)a3
{
  id *v4;
  id *v5;
  NSString *treatmentName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *inferenceModelFilePath;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *inferenceModelConfigPath;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *espressoBinFilePath;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *vocabFilePath;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  TRIRolloutIdentifiers *v32;
  TRIRolloutIdentifiers *v33;
  TRIRolloutIdentifiers *v34;
  char v35;
  TRIExperimentIdentifiers *experimentIdentifiers;
  TRIExperimentIdentifiers *v37;
  TRIExperimentIdentifiers *v38;
  TRIExperimentIdentifiers *v39;
  char v40;
  BOOL v41;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_28;
  treatmentName = self->_treatmentName;
  v7 = (NSString *)v4[3];
  if (treatmentName == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = treatmentName;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_28;
  }
  inferenceModelFilePath = self->_inferenceModelFilePath;
  v12 = (NSString *)v5[5];
  if (inferenceModelFilePath == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = inferenceModelFilePath;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_28;
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  v17 = (NSString *)v5[6];
  if (inferenceModelConfigPath == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = inferenceModelConfigPath;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_28;
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  v22 = (NSString *)v5[7];
  if (espressoBinFilePath == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = espressoBinFilePath;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_28;
  }
  vocabFilePath = self->_vocabFilePath;
  v27 = (NSString *)v5[8];
  if (vocabFilePath == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = vocabFilePath;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_28;
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  v32 = (TRIRolloutIdentifiers *)v5[9];
  if (rolloutIdentifiers == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = rolloutIdentifiers;
    v35 = -[TRIRolloutIdentifiers isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_28;
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  v37 = (TRIExperimentIdentifiers *)v5[10];
  if (experimentIdentifiers == v37)
  {

    goto LABEL_31;
  }
  v38 = v37;
  v39 = experimentIdentifiers;
  v40 = -[TRIExperimentIdentifiers isEqual:](v39, "isEqual:", v38);

  if ((v40 & 1) != 0)
  {
LABEL_31:
    v41 = self->_isMLModelEnabled == *((unsigned __int8 *)v5 + 16);
    goto LABEL_29;
  }
LABEL_28:
  v41 = 0;
LABEL_29:

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  PREResponseSuggestionsExpConfig *v4;
  PREResponseSuggestionsExpConfig *v5;
  BOOL v6;

  v4 = (PREResponseSuggestionsExpConfig *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PREResponseSuggestionsExpConfig isEqualToConfig:](self, "isEqualToConfig:", v5);

  return v6;
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (NSString)inferenceModelDescription
{
  return self->_inferenceModelDescription;
}

- (NSString)inferenceModelFilePath
{
  return self->_inferenceModelFilePath;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (NSString)vocabFilePath
{
  return self->_vocabFilePath;
}

- (TRIRolloutIdentifiers)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (BOOL)isMLModelEnabled
{
  return self->_isMLModelEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_vocabFilePath, 0);
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_inferenceModelFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pre_responses_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v5;
    _os_log_impl(&dword_1C35DB000, v4, OS_LOG_TYPE_DEFAULT, "Smart Reply: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }

}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_55(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BYTE v13[14];
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pre_responses_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v5, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = 138412802;
      *(_QWORD *)v13 = v9;
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = a2;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1C35DB000, v6, OS_LOG_TYPE_DEFAULT, "Smart Reply: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);

    }
  }
  else if (v7)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = 67109378;
    *(_DWORD *)v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = v11;
    _os_log_impl(&dword_1C35DB000, v6, OS_LOG_TYPE_DEFAULT, "Smart Reply: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }

}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PREResponseSuggestions-downloadAssets", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
