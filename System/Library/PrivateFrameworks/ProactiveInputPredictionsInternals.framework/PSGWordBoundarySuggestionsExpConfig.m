@implementation PSGWordBoundarySuggestionsExpConfig

- (PSGWordBoundarySuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5
{
  NSString *v9;
  id v10;
  PSGWordBoundarySuggestionsExpConfig *v11;
  NSObject *v12;
  NSString **p_namespaceName;
  uint64_t v14;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  uint64_t v16;
  TRIExperimentIdentifiers *experimentIdentifiers;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  PSGWordBoundarySuggestionsExpConfig *v25;
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
  NSObject *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSString *inferenceModelConfigPath;
  uint64_t v45;
  NSString *espressoBinFilePath;
  void *v47;
  char v48;
  NSString *v49;
  void *v50;
  char v51;
  NSString *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  _BOOL4 isMLModelEnabled;
  NSObject *v57;
  void *v58;
  void *v59;
  NSString *namespaceName;
  uint64_t v61;
  NSObject *v63;
  NSString *v64;
  NSString *v65;
  NSString *v66;
  NSString *v67;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  char v71;
  _QWORD v72[4];
  PSGWordBoundarySuggestionsExpConfig *v73;
  _QWORD v74[4];
  NSString *v75;
  objc_super v76;
  uint8_t buf[4];
  NSString *v78;
  __int16 v79;
  NSString *v80;
  __int16 v81;
  NSString *v82;
  __int16 v83;
  NSString *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  _BOOL4 v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v9 = (NSString *)a3;
  v10 = a4;
  v76.receiver = self;
  v76.super_class = (Class)PSGWordBoundarySuggestionsExpConfig;
  v11 = -[PSGWordBoundarySuggestionsExpConfig init](&v76, sel_init);
  if (v11)
  {
    if (!v9)
      goto LABEL_30;
    psg_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v9;
      _os_log_impl(&dword_22F6A5000, v12, OS_LOG_TYPE_DEFAULT, "WordBoundary config -- setting up config for namespace %@", buf, 0xCu);
    }

    objc_msgSend(v10, "refresh");
    p_namespaceName = &v11->_namespaceName;
    objc_storeStrong((id *)&v11->_namespaceName, a3);
    objc_msgSend(v10, "rolloutIdentifiersWithNamespaceName:", v11->_namespaceName);
    v14 = objc_claimAutoreleasedReturnValue();
    rolloutIdentifiers = v11->_rolloutIdentifiers;
    v11->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v14;

    objc_msgSend(v10, "experimentIdentifiersWithNamespaceName:", v11->_namespaceName);
    v16 = objc_claimAutoreleasedReturnValue();
    experimentIdentifiers = v11->_experimentIdentifiers;
    v11->_experimentIdentifiers = (TRIExperimentIdentifiers *)v16;

    -[TRIExperimentIdentifiers treatmentId](v11->_experimentIdentifiers, "treatmentId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v18, "length"))
    {
      -[TRIRolloutIdentifiers rolloutId](v11->_rolloutIdentifiers, "rolloutId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
        goto LABEL_8;
      psg_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v18, OS_LOG_TYPE_DEFAULT, "WordBoundary using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_8:
    -[TRIExperimentIdentifiers treatmentId](v11->_experimentIdentifiers, "treatmentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      -[TRIExperimentIdentifiers experimentId](v11->_experimentIdentifiers, "experimentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (!v23)
      {
        psg_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          v64 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v78 = v64;
          _os_log_fault_impl(&dword_22F6A5000, v24, OS_LOG_TYPE_FAULT, "WordBoundary: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("treatmentName"), v11->_namespaceName);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringValue");
    v27 = objc_claimAutoreleasedReturnValue();
    treatmentName = v11->_treatmentName;
    v11->_treatmentName = (NSString *)v27;

    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("modelDescription"), v11->_namespaceName);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = objc_claimAutoreleasedReturnValue();
    inferenceModelDescription = v11->_inferenceModelDescription;
    v11->_inferenceModelDescription = (NSString *)v30;

    objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("mlModelEnabled"), v11->_namespaceName);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_isMLModelEnabled = objc_msgSend(v32, "BOOLeanValue");

    if (-[NSString length](v11->_treatmentName, "length"))
    {
      if (v11->_isMLModelEnabled)
      {
        if (!-[NSString length](v11->_inferenceModelDescription, "length"))
        {
          psg_default_log_handle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_22F6A5000, v33, OS_LOG_TYPE_FAULT, "WordBoundary: model description expected but not found", buf, 2u);
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
              v71 = 0;
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "fileExistsAtPath:isDirectory:", v36, &v71);

              if (v40 && v71)
              {
                -[NSString stringByAppendingString:](v11->_treatmentName, "stringByAppendingString:", CFSTR(".config.plist"));
                v41 = objc_claimAutoreleasedReturnValue();
                -[NSString stringByAppendingString:](v11->_treatmentName, "stringByAppendingString:", CFSTR(".espresso.bin"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v41);
                v43 = objc_claimAutoreleasedReturnValue();
                inferenceModelConfigPath = v11->_inferenceModelConfigPath;
                v11->_inferenceModelConfigPath = (NSString *)v43;

                -[NSObject stringByAppendingPathComponent:](v36, "stringByAppendingPathComponent:", v42);
                v45 = objc_claimAutoreleasedReturnValue();
                espressoBinFilePath = v11->_espressoBinFilePath;
                v11->_espressoBinFilePath = (NSString *)v45;

                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "isReadableFileAtPath:", v11->_inferenceModelConfigPath);

                if ((v48 & 1) == 0)
                {
                  v49 = v11->_inferenceModelConfigPath;
                  v11->_inferenceModelConfigPath = 0;

                }
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "isReadableFileAtPath:", v11->_espressoBinFilePath);

                if ((v51 & 1) == 0)
                {
                  v52 = v11->_espressoBinFilePath;
                  v11->_espressoBinFilePath = 0;

                }
                if (v11->_inferenceModelConfigPath && v11->_espressoBinFilePath)
                {
                  psg_default_log_handle();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    v69 = v11->_inferenceModelDescription;
                    v70 = v11->_espressoBinFilePath;
                    v67 = v11->_treatmentName;
                    v68 = v11->_inferenceModelConfigPath;
                    -[TRIExperimentIdentifiers experimentId](v11->_experimentIdentifiers, "experimentId");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRIExperimentIdentifiers treatmentId](v11->_experimentIdentifiers, "treatmentId");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    isMLModelEnabled = v11->_isMLModelEnabled;
                    *(_DWORD *)buf = 138413826;
                    v78 = v67;
                    v79 = 2112;
                    v80 = v69;
                    v81 = 2112;
                    v82 = v68;
                    v83 = 2112;
                    v84 = v70;
                    v85 = 2112;
                    v86 = v54;
                    v87 = 2112;
                    v88 = v55;
                    v89 = 1024;
                    v90 = isMLModelEnabled;
                    _os_log_impl(&dword_22F6A5000, v53, OS_LOG_TYPE_DEFAULT, "WordBoundary reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelConfigPath: %@ espresso.bin: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x44u);

                  }
                  v25 = v11;
                }
                else
                {
                  psg_default_log_handle();
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
                  {
                    v65 = v11->_inferenceModelConfigPath;
                    v66 = v11->_espressoBinFilePath;
                    *(_DWORD *)buf = 138412546;
                    v78 = v65;
                    v79 = 2112;
                    v80 = v66;
                    _os_log_fault_impl(&dword_22F6A5000, v63, OS_LOG_TYPE_FAULT, "WordBoundary: some required file factor not readable with config path %@ and espresso bin path %@", buf, 0x16u);
                  }

                  v25 = 0;
                }

              }
              else
              {
                psg_default_log_handle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_22F6A5000, v41, OS_LOG_TYPE_FAULT, "WordBoundary: directory factor download completed, but directory path not found", buf, 2u);
                }
                v25 = 0;
              }

              goto LABEL_57;
            }
            psg_default_log_handle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22F6A5000, v57, OS_LOG_TYPE_DEFAULT, "WordBoundary: assets directory factor is being queued for download", buf, 2u);
            }

            if (initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1)
              dispatch_once(&initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_192);
            v91[0] = CFSTR("modelAssets");
            v58 = (void *)MEMORY[0x24BDBCE30];
            v36 = (id)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
            objc_msgSend(v58, "arrayWithObjects:count:", v91, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            namespaceName = v11->_namespaceName;
            v61 = MEMORY[0x24BDAC760];
            v74[0] = MEMORY[0x24BDAC760];
            v74[1] = 3221225472;
            v74[2] = __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2;
            v74[3] = &unk_24FCB4D30;
            v75 = v9;
            v72[0] = v61;
            v72[1] = 3221225472;
            v72[2] = __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_17;
            v72[3] = &unk_24FCB4D58;
            v73 = v11;
            objc_msgSend(v10, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v59, namespaceName, v36, 0, v74, v72);

          }
          else
          {
            psg_default_log_handle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v9;
              _os_log_impl(&dword_22F6A5000, v36, OS_LOG_TYPE_DEFAULT, "WordBoundary: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
            }
          }
        }
        else
        {
          psg_default_log_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_22F6A5000, v36, OS_LOG_TYPE_FAULT, "WordBoundary: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
          }
        }
        v25 = 0;
LABEL_57:

        goto LABEL_58;
      }
      psg_default_log_handle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v38, OS_LOG_TYPE_DEFAULT, "WordBoundary using default values since the ML model is not enabled.", buf, 2u);
      }

      -[PSGWordBoundarySuggestionsExpConfig _fillDefaultValuesForFactors](v11, "_fillDefaultValuesForFactors");
LABEL_31:
      v25 = v11;
      goto LABEL_58;
    }
    psg_default_log_handle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v37, OS_LOG_TYPE_DEFAULT, "WordBoundary: treatment name required but not found", buf, 2u);
    }

LABEL_30:
    -[PSGWordBoundarySuggestionsExpConfig _setDefaultValuesForFactors](v11, "_setDefaultValuesForFactors");
    goto LABEL_31;
  }
LABEL_13:
  v25 = 0;
LABEL_58:

  return v25;
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
  NSString *inferenceModelConfigPath;
  NSString *v11;
  NSString *espressoBinFilePath;
  id v13;

  v13 = (id)objc_opt_new();
  self->_isMLModelEnabled = objc_msgSend(v13, "isMLModelEnabled");
  objc_msgSend(v13, "treatmentName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  objc_msgSend(v13, "rolloutIdentifiers");
  v5 = (TRIRolloutIdentifiers *)objc_claimAutoreleasedReturnValue();
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v5;

  objc_msgSend(v13, "experimentIdentifiers");
  v7 = (TRIExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v7;

  objc_msgSend(v13, "inferenceModelConfigPath");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v9;

  objc_msgSend(v13, "espressoBinFilePath");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v11;

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
  NSString *inferenceModelConfigPath;
  NSString *v14;
  NSString *espressoBinFilePath;
  id v16;

  v16 = (id)objc_opt_new();
  if (-[NSString length](self->_treatmentName, "length"))
  {
    v3 = self->_treatmentName;
  }
  else
  {
    objc_msgSend(v16, "treatmentName");
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
    objc_msgSend(v16, "rolloutIdentifiers");
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
    objc_msgSend(v16, "experimentIdentifiers");
    v9 = (TRIExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v9;

  isMLModelEnabled = self->_isMLModelEnabled;
  if (!self->_isMLModelEnabled)
    isMLModelEnabled = objc_msgSend(v16, "isMLModelEnabled");
  self->_isMLModelEnabled = isMLModelEnabled != 0;
  if (-[NSString length](self->_inferenceModelConfigPath, "length"))
  {
    v12 = self->_inferenceModelConfigPath;
  }
  else
  {
    objc_msgSend(v16, "inferenceModelConfigPath");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v12;

  if (-[NSString length](self->_espressoBinFilePath, "length"))
  {
    v14 = self->_espressoBinFilePath;
  }
  else
  {
    objc_msgSend(v16, "espressoBinFilePath");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v14;

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

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
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
    _os_log_impl(&dword_22F6A5000, v4, OS_LOG_TYPE_DEFAULT, "WordBoundary: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }

}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_17(uint64_t a1, int a2, void *a3)
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
      _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "WordBoundary: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);

    }
  }
  else if (v7)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v12 = 67109378;
    *(_DWORD *)v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = v11;
    _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "WordBoundary: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }

}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGWordBoundarySuggestions-downloadAssets", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
