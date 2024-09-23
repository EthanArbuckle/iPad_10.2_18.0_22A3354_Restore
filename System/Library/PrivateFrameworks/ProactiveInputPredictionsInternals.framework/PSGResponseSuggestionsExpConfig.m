@implementation PSGResponseSuggestionsExpConfig

- (PSGResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withLanguage:(id)a4 withTrialClient:(id)a5 shouldDownloadAssets:(BOOL)a6
{
  NSString *v11;
  id v12;
  id v13;
  PSGResponseSuggestionsExpConfig *v14;
  NSObject *v15;
  NSString **p_namespaceName;
  uint64_t v17;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  uint64_t v19;
  TRIExperimentIdentifiers *experimentIdentifiers;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  PSGResponseSuggestionsExpConfig *v28;
  void *v29;
  uint64_t v30;
  NSString *treatmentName;
  void *v32;
  uint64_t v33;
  NSString *inferenceModelDescription;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString *inferenceModelFilePath;
  uint64_t v50;
  NSString *inferenceModelConfigPath;
  uint64_t v52;
  NSString *espressoBinFilePath;
  uint64_t v54;
  NSString *vocabFilePath;
  void *v56;
  NSString *v57;
  void *v58;
  char v59;
  NSString *v60;
  void *v61;
  char v62;
  NSObject *v63;
  NSString *v64;
  void *v65;
  char v66;
  NSString *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  _BOOL4 isMLModelEnabled;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSString *namespaceName;
  uint64_t v77;
  NSString *v79;
  NSObject *v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  NSString *v87;
  NSString *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  _QWORD v94[4];
  PSGResponseSuggestionsExpConfig *v95;
  _QWORD v96[4];
  NSString *v97;
  objc_super v98;
  uint8_t buf[4];
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
  NSString *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  _BOOL4 v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x24BDAC8D0];
  v11 = (NSString *)a3;
  v12 = a4;
  v13 = a5;
  v98.receiver = self;
  v98.super_class = (Class)PSGResponseSuggestionsExpConfig;
  v14 = -[PSGResponseSuggestionsExpConfig init](&v98, sel_init);
  if (v14)
  {
    if (!v11)
      goto LABEL_30;
    psg_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v100 = v11;
      _os_log_impl(&dword_22F6A5000, v15, OS_LOG_TYPE_DEFAULT, "ZKW Experiment config -- setting up config for namespace %@", buf, 0xCu);
    }

    objc_msgSend(v13, "refresh");
    p_namespaceName = &v14->_namespaceName;
    objc_storeStrong((id *)&v14->_namespaceName, a3);
    objc_storeStrong((id *)&v14->_language, a4);
    objc_msgSend(v13, "rolloutIdentifiersWithNamespaceName:", v14->_namespaceName);
    v17 = objc_claimAutoreleasedReturnValue();
    rolloutIdentifiers = v14->_rolloutIdentifiers;
    v14->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v17;

    objc_msgSend(v13, "experimentIdentifiersWithNamespaceName:", v14->_namespaceName);
    v19 = objc_claimAutoreleasedReturnValue();
    experimentIdentifiers = v14->_experimentIdentifiers;
    v14->_experimentIdentifiers = (TRIExperimentIdentifiers *)v19;

    -[TRIExperimentIdentifiers treatmentId](v14->_experimentIdentifiers, "treatmentId");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v21, "length"))
    {
      -[TRIRolloutIdentifiers rolloutId](v14->_rolloutIdentifiers, "rolloutId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v23)
        goto LABEL_8;
      psg_default_log_handle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v21, OS_LOG_TYPE_DEFAULT, "ZKW using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_8:
    -[TRIExperimentIdentifiers treatmentId](v14->_experimentIdentifiers, "treatmentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "length"))
    {
      -[TRIExperimentIdentifiers experimentId](v14->_experimentIdentifiers, "experimentId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (!v26)
      {
        psg_default_log_handle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v79 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v100 = v79;
          _os_log_fault_impl(&dword_22F6A5000, v27, OS_LOG_TYPE_FAULT, "ZKW: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v13, "levelForFactor:withNamespaceName:", CFSTR("treatmentName"), v14->_namespaceName);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = objc_claimAutoreleasedReturnValue();
    treatmentName = v14->_treatmentName;
    v14->_treatmentName = (NSString *)v30;

    objc_msgSend(v13, "levelForFactor:withNamespaceName:", CFSTR("modelDescription"), v14->_namespaceName);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringValue");
    v33 = objc_claimAutoreleasedReturnValue();
    inferenceModelDescription = v14->_inferenceModelDescription;
    v14->_inferenceModelDescription = (NSString *)v33;

    objc_msgSend(v13, "levelForFactor:withNamespaceName:", CFSTR("mlModelEnabled"), v14->_namespaceName);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_isMLModelEnabled = objc_msgSend(v35, "BOOLeanValue");

    if (-[NSString length](v14->_treatmentName, "length"))
    {
      if (v14->_isMLModelEnabled)
      {
        if (!-[NSString length](v14->_inferenceModelDescription, "length"))
        {
          psg_default_log_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_22F6A5000, v36, OS_LOG_TYPE_FAULT, "ZKW: model description expected but not found", buf, 2u);
          }

        }
        objc_msgSend(v13, "levelForFactor:withNamespaceName:", CFSTR("modelAssets"), *p_namespaceName);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "directoryValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v38, "hasPath") & 1) != 0 || (objc_msgSend(v38, "isOnDemand") & 1) != 0)
        {
          if ((objc_msgSend(v38, "hasPath") & 1) != 0 || a6)
          {
            if ((objc_msgSend(v38, "hasPath") & 1) != 0)
            {
              objc_msgSend(v38, "path");
              v39 = objc_claimAutoreleasedReturnValue();
              v93 = 0;
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "fileExistsAtPath:isDirectory:", v39, &v93);

              if (v43 && v93)
              {
                -[NSString stringByAppendingString:](v14->_treatmentName, "stringByAppendingString:", CFSTR(".model.chunk"));
                v44 = objc_claimAutoreleasedReturnValue();
                -[NSString stringByAppendingString:](v14->_treatmentName, "stringByAppendingString:", CFSTR(".config.plist"));
                v45 = objc_claimAutoreleasedReturnValue();
                -[NSString stringByAppendingString:](v14->_treatmentName, "stringByAppendingString:", CFSTR(".espresso.bin"));
                v46 = objc_claimAutoreleasedReturnValue();
                -[NSString stringByAppendingString:](v14->_treatmentName, "stringByAppendingString:", CFSTR(".vocab.trie"));
                v47 = objc_claimAutoreleasedReturnValue();
                -[NSObject stringByAppendingPathComponent:](v39, "stringByAppendingPathComponent:", v44);
                v48 = objc_claimAutoreleasedReturnValue();
                inferenceModelFilePath = v14->_inferenceModelFilePath;
                v14->_inferenceModelFilePath = (NSString *)v48;

                v90 = (void *)v45;
                -[NSObject stringByAppendingPathComponent:](v39, "stringByAppendingPathComponent:", v45);
                v50 = objc_claimAutoreleasedReturnValue();
                inferenceModelConfigPath = v14->_inferenceModelConfigPath;
                v14->_inferenceModelConfigPath = (NSString *)v50;

                v92 = (void *)v46;
                -[NSObject stringByAppendingPathComponent:](v39, "stringByAppendingPathComponent:", v46);
                v52 = objc_claimAutoreleasedReturnValue();
                espressoBinFilePath = v14->_espressoBinFilePath;
                v14->_espressoBinFilePath = (NSString *)v52;

                v91 = (void *)v47;
                -[NSObject stringByAppendingPathComponent:](v39, "stringByAppendingPathComponent:", v47);
                v54 = objc_claimAutoreleasedReturnValue();
                vocabFilePath = v14->_vocabFilePath;
                v14->_vocabFilePath = (NSString *)v54;

                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v46) = objc_msgSend(v56, "isReadableFileAtPath:", v14->_inferenceModelFilePath);

                if ((v46 & 1) == 0)
                {
                  v57 = v14->_inferenceModelFilePath;
                  v14->_inferenceModelFilePath = 0;

                }
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v58, "isReadableFileAtPath:", v14->_inferenceModelConfigPath);

                if ((v59 & 1) == 0)
                {
                  v60 = v14->_inferenceModelConfigPath;
                  v14->_inferenceModelConfigPath = 0;

                }
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v61, "isReadableFileAtPath:", v14->_espressoBinFilePath);

                v63 = v44;
                if ((v62 & 1) == 0)
                {
                  v64 = v14->_espressoBinFilePath;
                  v14->_espressoBinFilePath = 0;

                }
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "isReadableFileAtPath:", v14->_vocabFilePath);

                if ((v66 & 1) == 0)
                {
                  v67 = v14->_vocabFilePath;
                  v14->_vocabFilePath = 0;

                }
                if (v14->_inferenceModelConfigPath && (v14->_inferenceModelFilePath || v14->_espressoBinFilePath))
                {
                  psg_default_log_handle();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    v85 = v14->_treatmentName;
                    v86 = v14->_inferenceModelDescription;
                    v87 = v14->_inferenceModelConfigPath;
                    v88 = v14->_espressoBinFilePath;
                    v89 = v14->_vocabFilePath;
                    v84 = v14->_inferenceModelFilePath;
                    -[TRIExperimentIdentifiers experimentId](v14->_experimentIdentifiers, "experimentId");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRIExperimentIdentifiers treatmentId](v14->_experimentIdentifiers, "treatmentId");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    isMLModelEnabled = v14->_isMLModelEnabled;
                    *(_DWORD *)buf = 138414338;
                    v100 = v85;
                    v101 = 2112;
                    v102 = v86;
                    v103 = 2112;
                    v104 = v84;
                    v105 = 2112;
                    v106 = v87;
                    v107 = 2112;
                    v108 = v88;
                    v109 = 2112;
                    v110 = v89;
                    v111 = 2112;
                    v112 = v69;
                    v113 = 2112;
                    v114 = v70;
                    v115 = 1024;
                    v116 = isMLModelEnabled;
                    _os_log_impl(&dword_22F6A5000, v68, OS_LOG_TYPE_DEFAULT, "ZKW reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelFilePath: %@ inferenceModelConfigPath: %@ espresso.bin: %@ vocab: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x58u);

                  }
                  v28 = v14;
                  v72 = v90;
                }
                else
                {
                  psg_default_log_handle();
                  v80 = objc_claimAutoreleasedReturnValue();
                  v72 = v90;
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
                  {
                    v81 = v14->_inferenceModelFilePath;
                    v82 = v14->_inferenceModelConfigPath;
                    v83 = v14->_espressoBinFilePath;
                    *(_DWORD *)buf = 138412802;
                    v100 = v81;
                    v101 = 2112;
                    v102 = v82;
                    v103 = 2112;
                    v104 = v83;
                    _os_log_fault_impl(&dword_22F6A5000, v80, OS_LOG_TYPE_FAULT, "ZKW: some required file factor not readable with config path %@, inference path %@, and espresso bin path %@", buf, 0x20u);
                  }

                  v28 = 0;
                }

              }
              else
              {
                psg_default_log_handle();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_22F6A5000, v63, OS_LOG_TYPE_FAULT, "ZKW: directory factor download completed, but directory path not found", buf, 2u);
                }
                v28 = 0;
              }

              goto LABEL_62;
            }
            psg_default_log_handle();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22F6A5000, v73, OS_LOG_TYPE_DEFAULT, "ZKW: assets directory factor is being queued for download", buf, 2u);
            }

            if (initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1)
              dispatch_once(&initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_1669);
            v117[0] = CFSTR("modelAssets");
            v74 = (void *)MEMORY[0x24BDBCE30];
            v39 = (id)initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
            objc_msgSend(v74, "arrayWithObjects:count:", v117, 1);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            namespaceName = v14->_namespaceName;
            v77 = MEMORY[0x24BDAC760];
            v96[0] = MEMORY[0x24BDAC760];
            v96[1] = 3221225472;
            v96[2] = __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_2;
            v96[3] = &unk_24FCB4D30;
            v97 = v11;
            v94[0] = v77;
            v94[1] = 3221225472;
            v94[2] = __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_21;
            v94[3] = &unk_24FCB4D58;
            v95 = v14;
            objc_msgSend(v13, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v75, namespaceName, v39, 0, v96, v94);

          }
          else
          {
            psg_default_log_handle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v11;
              _os_log_impl(&dword_22F6A5000, v39, OS_LOG_TYPE_DEFAULT, "ZKW: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
            }
          }
        }
        else
        {
          psg_default_log_handle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_22F6A5000, v39, OS_LOG_TYPE_FAULT, "ZKW: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
          }
        }
        v28 = 0;
LABEL_62:

        goto LABEL_63;
      }
      psg_default_log_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v41, OS_LOG_TYPE_DEFAULT, "ZKW using default values since the ML model is not enabled.", buf, 2u);
      }

      -[PSGResponseSuggestionsExpConfig _fillDefaultValuesForFactors](v14, "_fillDefaultValuesForFactors");
LABEL_31:
      v28 = v14;
      goto LABEL_63;
    }
    psg_default_log_handle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v40, OS_LOG_TYPE_DEFAULT, "ZKW: treatment name required but not found", buf, 2u);
    }

LABEL_30:
    -[PSGResponseSuggestionsExpConfig _setDefaultValuesForFactors](v14, "_setDefaultValuesForFactors");
    goto LABEL_31;
  }
LABEL_13:
  v28 = 0;
LABEL_63:

  return v28;
}

- (void)_setDefaultValuesForFactors
{
  NSString *v3;
  NSString *treatmentName;
  TRIRolloutIdentifiers *v5;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  TRIExperimentIdentifiers *v7;
  TRIExperimentIdentifiers *experimentIdentifiers;
  NSString *v9;
  NSString *inferenceModelFilePath;
  NSString *v11;
  NSString *inferenceModelConfigPath;
  NSString *v13;
  NSString *espressoBinFilePath;
  NSString *v15;
  NSString *vocabFilePath;
  id v17;

  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "treatmentName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  objc_msgSend(v17, "rolloutIdentifiers");
  v5 = (TRIRolloutIdentifiers *)objc_claimAutoreleasedReturnValue();
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v5;

  objc_msgSend(v17, "experimentIdentifiers");
  v7 = (TRIExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v7;

  self->_isMLModelEnabled = objc_msgSend(v17, "isMLModelEnabled");
  objc_msgSend(v17, "inferenceModelFilePath");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = v9;

  objc_msgSend(v17, "inferenceModelConfigPath");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v11;

  objc_msgSend(v17, "espressoBinFilePath");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v13;

  objc_msgSend(v17, "vocabFilePath");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = v15;

}

- (void)_fillDefaultValuesForFactors
{
  NSString *v3;
  NSString *treatmentName;
  void *v5;
  TRIRolloutIdentifiers *v6;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  void *v8;
  TRIExperimentIdentifiers *v9;
  TRIExperimentIdentifiers *experimentIdentifiers;
  int isMLModelEnabled;
  NSString *v12;
  NSString *inferenceModelFilePath;
  NSString *v14;
  NSString *inferenceModelConfigPath;
  NSString *v16;
  NSString *espressoBinFilePath;
  NSString *v18;
  NSString *vocabFilePath;
  id v20;

  v20 = (id)objc_opt_new();
  if (-[NSString length](self->_treatmentName, "length"))
  {
    v3 = self->_treatmentName;
  }
  else
  {
    objc_msgSend(v20, "treatmentName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  -[TRIRolloutIdentifiers rolloutId](self->_rolloutIdentifiers, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = self->_rolloutIdentifiers;
  }
  else
  {
    objc_msgSend(v20, "rolloutIdentifiers");
    v6 = (TRIRolloutIdentifiers *)objc_claimAutoreleasedReturnValue();
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v6;

  -[TRIExperimentIdentifiers treatmentId](self->_experimentIdentifiers, "treatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = self->_experimentIdentifiers;
  }
  else
  {
    objc_msgSend(v20, "experimentIdentifiers");
    v9 = (TRIExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v9;

  isMLModelEnabled = self->_isMLModelEnabled;
  if (!self->_isMLModelEnabled)
    isMLModelEnabled = objc_msgSend(v20, "isMLModelEnabled");
  self->_isMLModelEnabled = isMLModelEnabled != 0;
  if (-[NSString length](self->_inferenceModelFilePath, "length"))
  {
    v12 = self->_inferenceModelFilePath;
  }
  else
  {
    objc_msgSend(v20, "inferenceModelFilePath");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = v12;

  if (-[NSString length](self->_inferenceModelConfigPath, "length"))
  {
    v14 = self->_inferenceModelConfigPath;
  }
  else
  {
    objc_msgSend(v20, "inferenceModelConfigPath");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v14;

  if (-[NSString length](self->_espressoBinFilePath, "length"))
  {
    v16 = self->_espressoBinFilePath;
  }
  else
  {
    objc_msgSend(v20, "espressoBinFilePath");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v16;

  if (-[NSString length](self->_vocabFilePath, "length"))
  {
    v18 = self->_vocabFilePath;
  }
  else
  {
    objc_msgSend(v20, "vocabFilePath");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = v18;

}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (NSString)inferenceModelDescription
{
  return self->_inferenceModelDescription;
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

- (BOOL)isMLModelDownloading
{
  return self->_isMLModelDownloading;
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

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_vocabFilePath, 0);
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_inferenceModelFilePath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  psg_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v5;
    _os_log_impl(&dword_22F6A5000, v4, OS_LOG_TYPE_DEFAULT, "ZKW: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }

}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_21(uint64_t a1, int a2, void *a3)
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

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  psg_default_log_handle();
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
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v12 = 138412802;
      *(_QWORD *)v13 = v9;
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = a2;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "ZKW: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);

    }
  }
  else if (v7)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v12 = 67109378;
    *(_DWORD *)v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = v11;
    _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "ZKW: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }

}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGResponseSuggestions-downloadAssets", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
