@implementation PSGCustomResponseHarvester

- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3
{
  return -[PSGCustomResponseHarvester initWithActivityManager:modelConfigPath:modelVocabPath:modelFilePath:storeDirectory:](self, "initWithActivityManager:modelConfigPath:modelVocabPath:modelFilePath:storeDirectory:", a3, 0, 0, 0, 0);
}

- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3 modelConfigPath:(id)a4 modelVocabPath:(id)a5 modelFilePath:(id)a6 storeDirectory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PSGCustomResponseHarvester *v17;
  PSGCustomResponseHarvester *v18;
  uint64_t v19;
  PETEventTracker2 *pet2tracker;
  uint64_t v21;
  NSFileManager *fManager;
  uint64_t v23;
  NSString *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *preferredLanguage;
  NSString *storeDirectory;
  PSGCustomResponseHarvester *v32;
  NSObject *v33;
  uint64_t v34;
  NSString *checkpointFullPath;
  NSDate *latestProcessedDate;
  uint64_t v37;
  NSMutableDictionary *modelExistsForLanguage;
  id v40;
  id v41;
  id v42;
  uint8_t buf[16];
  objc_super v44;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v42 = a7;
  v44.receiver = self;
  v44.super_class = (Class)PSGCustomResponseHarvester;
  v17 = -[PSGCustomResponseHarvester init](&v44, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_16:
    v32 = v18;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v17->_xpcActivityManager, a3);
  objc_msgSend(MEMORY[0x24BE799E8], "sharedInstance");
  v19 = objc_claimAutoreleasedReturnValue();
  pet2tracker = v18->_pet2tracker;
  v18->_pet2tracker = (PETEventTracker2 *)v19;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = objc_claimAutoreleasedReturnValue();
  fManager = v18->_fManager;
  v18->_fManager = (NSFileManager *)v21;

  objc_msgSend(MEMORY[0x24BE71AD8], "suggestionsDirectory");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (NSString *)v23;
    v40 = v16;
    v41 = v15;
    v25 = v14;
    v26 = v13;
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(MEMORY[0x24BE71AD0], "languageForLocaleIdentifier:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      preferredLanguage = v18->_preferredLanguage;
      v18->_preferredLanguage = (NSString *)v29;

    }
    v13 = v26;
    if (v18->_preferredLanguage)
    {
      objc_storeStrong((id *)&v18->_modelConfigPath, a4);
      objc_storeStrong((id *)&v18->_modelVocabPath, a5);
      objc_storeStrong((id *)&v18->_modelFilePath, a6);
      objc_storeStrong((id *)&v18->_storeDirectory, a7);
      v14 = v25;
      if (-[NSString length](v18->_storeDirectory, "length"))
        storeDirectory = v18->_storeDirectory;
      else
        storeDirectory = v24;
      -[NSString stringByAppendingPathComponent:](storeDirectory, "stringByAppendingPathComponent:", CFSTR("custom-response-ckpt"));
      v34 = objc_claimAutoreleasedReturnValue();
      checkpointFullPath = v18->_checkpointFullPath;
      v18->_checkpointFullPath = (NSString *)v34;
      v15 = v41;

      v18->_customResponsesStep = 0;
      latestProcessedDate = v18->_latestProcessedDate;
      v18->_latestProcessedDate = 0;

      v18->_batchSize = 0;
      -[PSGCustomResponseHarvester loadCustomResponsesCheckpoint](v18, "loadCustomResponsesCheckpoint");
      v37 = objc_opt_new();
      modelExistsForLanguage = v18->_modelExistsForLanguage;
      v18->_modelExistsForLanguage = (NSMutableDictionary *)v37;

      v16 = v40;
      goto LABEL_16;
    }
    psg_default_log_handle();
    v33 = objc_claimAutoreleasedReturnValue();
    v14 = v25;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22F6A5000, v33, OS_LOG_TYPE_DEBUG, "SGCustomResponseHarvester: No preferred language is set.", buf, 2u);
    }

    v32 = 0;
    v16 = v40;
    v15 = v41;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_22F6A5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGDManagerForCTS: Unable to create directory for custom responses checkpoint.", buf, 2u);
    }
    v32 = 0;
  }
LABEL_17:

  return v32;
}

- (id)_customResponseParametersWithExperiment:(id)a3
{
  id v4;
  NSString *v5;
  NSString *modelConfigPath;
  NSString *v7;
  NSString *modelVocabPath;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  NSString *preferredLanguage;
  NSString *v15;
  id v16;
  NSObject *v18;
  NSString *modelFilePath;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *v32;
  int v33;
  NSObject *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isMLModelEnabled") & 1) != 0)
  {
    objc_msgSend(v4, "inferenceModelConfigPath");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    modelConfigPath = self->_modelConfigPath;
    self->_modelConfigPath = v5;

    if (-[NSString length](self->_modelConfigPath, "length")
      && -[NSFileManager isReadableFileAtPath:](self->_fManager, "isReadableFileAtPath:", self->_modelConfigPath))
    {
      objc_msgSend(v4, "vocabFilePath");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      modelVocabPath = self->_modelVocabPath;
      self->_modelVocabPath = v7;

      objc_msgSend(MEMORY[0x24BE28670], "configWithLanguage:mode:plistPath:vocabPath:", self->_preferredLanguage, 1, self->_modelConfigPath, self->_modelVocabPath);
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject customResponsesParameters](v9, "customResponsesParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isCustomResponsesEnabled") & 1) != 0)
      {
        -[NSObject predictionParams](v9, "predictionParams");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modelTypeName");
        v12 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("quickResponsesBinaryLogisticMultiLabel")))
        {
          objc_msgSend(v4, "inferenceModelFilePath");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel")))
        {
          objc_msgSend(v4, "espressoBinFilePath");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
          modelFilePath = self->_modelFilePath;
          self->_modelFilePath = v13;

          if (-[NSString length](self->_modelFilePath, "length")
            && -[NSFileManager isReadableFileAtPath:](self->_fManager, "isReadableFileAtPath:", self->_modelFilePath))
          {
            v16 = v10;
LABEL_25:

            goto LABEL_12;
          }
          v20 = self->_modelFilePath;
          self->_modelFilePath = 0;

          psg_default_log_handle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          objc_msgSend(v4, "treatmentName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "experimentIdentifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "experimentId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "experimentIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "treatmentId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138413058;
          v34 = v12;
          v35 = 2112;
          v36 = v21;
          v37 = 2112;
          v38 = v23;
          v39 = 2112;
          v40 = v25;
          v26 = "[CRH] Model file invalid for ModelType: %@ and Experiment (Name: %@, Exp: %@ Trt: %@).";
          goto LABEL_27;
        }
        v32 = self->_modelFilePath;
        self->_modelFilePath = 0;

        psg_default_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v4, "treatmentName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "experimentIdentifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "experimentId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "experimentIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "treatmentId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138413058;
          v34 = v12;
          v35 = 2112;
          v36 = v21;
          v37 = 2112;
          v38 = v23;
          v39 = 2112;
          v40 = v25;
          v26 = "[CRH] Unexpected model type %@, and experiment (Name: %@, Exp: %@ Trt: %@).";
LABEL_27:
          _os_log_fault_impl(&dword_22F6A5000, v18, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v33, 0x2Au);

        }
      }
      else
      {
        psg_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:
          v16 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v4, "treatmentName");
        v18 = objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v18;
        _os_log_debug_impl(&dword_22F6A5000, v12, OS_LOG_TYPE_DEBUG, "[CRH] Custom responses not enabled in this treatment (name: %@).", (uint8_t *)&v33, 0xCu);
      }
LABEL_23:

      goto LABEL_24;
    }
    v15 = self->_modelConfigPath;
    self->_modelConfigPath = 0;

    psg_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "treatmentName");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "experimentIdentifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "experimentId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "experimentIdentifiers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "treatmentId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      v34 = v27;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v31;
      _os_log_fault_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_FAULT, "[CRH] Config file invalid while ML is enabled. Name: %@, Exp: %@; Trt: %@",
        (uint8_t *)&v33,
        0x20u);

    }
  }
  else
  {
    psg_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      preferredLanguage = self->_preferredLanguage;
      v33 = 138412290;
      v34 = preferredLanguage;
      _os_log_debug_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_DEBUG, "[CRH] ML is not enabled for custom response harvesting (preferred language: %@).", (uint8_t *)&v33, 0xCu);
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)_customResponseParametersWithConfigPath:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  NSString *modelFilePath;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  objc_msgSend(MEMORY[0x24BE28670], "configWithLanguage:mode:plistPath:vocabPath:", self->_preferredLanguage, 1, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customResponsesParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isCustomResponsesEnabled") & 1) == 0)
  {
    psg_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_debug_impl(&dword_22F6A5000, v8, OS_LOG_TYPE_DEBUG, "[CRH] Custom responses not enabled in this config: %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_11;
  }
  if (!-[NSString length](self->_modelFilePath, "length")
    || !-[NSFileManager isReadableFileAtPath:](self->_fManager, "isReadableFileAtPath:", self->_modelFilePath))
  {
    psg_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      modelFilePath = self->_modelFilePath;
      v13 = 138412290;
      v14 = modelFilePath;
      _os_log_fault_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_FAULT, "[CRH] Model file path invalid: %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = self->_modelFilePath;
    self->_modelFilePath = 0;

LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = v6;
LABEL_12:

  return v7;
}

- (id)_getCustomResponseParameters
{
  void *v3;
  void *v4;
  void *v5;

  if (-[NSString length](self->_modelConfigPath, "length")
    && -[NSFileManager isReadableFileAtPath:](self->_fManager, "isReadableFileAtPath:", self->_modelConfigPath))
  {
    -[PSGCustomResponseHarvester _customResponseParametersWithConfigPath:](self, "_customResponseParametersWithConfigPath:", self->_modelConfigPath);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", self->_preferredLanguage, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSGCustomResponseHarvester _customResponseParametersWithExperiment:](self, "_customResponseParametersWithExperiment:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)harvestWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SGXPCActivityManagerProtocol *xpcActivityManager;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSDate *v33;
  NSDate *latestProcessedDate;
  unint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  void *context;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  int ptr;
  _QWORD v48[9];

  v4 = a3;
  -[PSGCustomResponseHarvester _getCustomResponseParameters](self, "_getCustomResponseParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    xpcActivityManager = self->_xpcActivityManager;
    goto LABEL_6;
  }
  -[PSGCustomResponseHarvester modelForLanguage:](self, "modelForLanguage:", self->_preferredLanguage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  xpcActivityManager = self->_xpcActivityManager;
  if (!v6)
  {
LABEL_6:
    v8 = v4;
    v9 = 5;
    goto LABEL_7;
  }
  if (-[SGXPCActivityManagerProtocol shouldDefer:](xpcActivityManager, "shouldDefer:", v4))
  {
    xpcActivityManager = self->_xpcActivityManager;
    v8 = v4;
    v9 = 3;
LABEL_7:
    -[SGXPCActivityManagerProtocol setState:state:](xpcActivityManager, "setState:state:", v8, v9);
    goto LABEL_8;
  }
  v48[7] = 0;
  v48[5] = CFSTR("com.apple.suggestd.custom-response-harvest");
  v48[6] = mach_absolute_time();
  v10 = (void *)MEMORY[0x2348A15A8]();
  if (-[NSString length](self->_storeDirectory, "length"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28698]), "initInDirectory:inMemory:withMigration:", self->_storeDirectory, 0, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE28698], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_customResponsesStep >= 2u
    && !-[PSGCustomResponseHarvester activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:](self, "activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:", v41, v4, v5)|| (self->_customResponsesStep = 1, -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint"), -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4)))
  {
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3);
    PRERecordMeasurementState();
    v11 = 1;
    goto LABEL_55;
  }
  v44 = v5;
  v38 = v10;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __50__PSGCustomResponseHarvester_harvestWithActivity___block_invoke;
  v48[3] = &unk_24FCB4978;
  v48[4] = self;
  v39 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348A1710](v48);
  v12 = 0;
  v45 = v4;
LABEL_17:
  if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4) & 1) == 0)
  {
    ((void (**)(_QWORD, void *))v39)[2](v39, v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v12 = 0;
      goto LABEL_44;
    }
    context = (void *)MEMORY[0x2348A15A8]();
    while (1)
    {
      if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4) & 1) != 0
        || (objc_msgSend(v13, "isDoneIterating") & 1) != 0)
      {
LABEL_42:
        objc_msgSend(v13, "latestProcessedDate");
        v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = v33;

        -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint");
        objc_autoreleasePoolPop(context);
        v12 = v13;
        goto LABEL_17;
      }
      v14 = (void *)MEMORY[0x2348A15A8]();
      pre_signpost_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      ptr = 7;
      v16 = os_signpost_id_make_with_pointer(v15, &ptr);

      pre_signpost_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F6A5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SGCustomResponses-NextMessagePair", "Start", buf, 2u);
      }

      v19 = (void *)MEMORY[0x2348A15A8]();
      v20 = v13;
      objc_msgSend(v13, "nextMessagePair");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v19);
      pre_signpost_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22F6A5000, v23, OS_SIGNPOST_INTERVAL_END, v16, "SGCustomResponses-NextMessagePair", "Completed", buf, 2u);
      }

      if (v21)
        break;
      v32 = 4;
LABEL_39:

      objc_autoreleasePoolPop(v14);
      v13 = v20;
      if (v32 == 5)
        goto LABEL_42;
    }
    v24 = (void *)MEMORY[0x24BE71AD0];
    objc_msgSend(v21, "prompt");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "detectLanguageFromText:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(MEMORY[0x24BE71AD0], "languageForLocaleIdentifier:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        if (-[PSGCustomResponseHarvester isSupportedLanguage:](self, "isSupportedLanguage:", v27))
        {
          v42 = objc_msgSend(v44, "filterBatchSize");
          v28 = objc_msgSend(v44, "maxStoredMessages");
          objc_msgSend(v21, "reply");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "prompt");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "sentAt");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v28) = objc_msgSend(v41, "addingMessageExceedsBatchLimit:tableLimit:message:language:prompt:recipientHandle:sentAt:", v42, v28, v43, v27, v29, v30, v31);

          if ((v28 & 1) != 0)
          {
            self->_customResponsesStep = 2;
            -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint");
            if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v45) & 1) != 0)
            {
              v32 = 5;
            }
            else
            {
              -[PSGCustomResponseHarvester activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:](self, "activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:", v41, v45, v44);
              v32 = 0;
            }
            goto LABEL_38;
          }
        }
      }
    }
    else
    {
      v27 = 0;
    }
    v32 = 4;
LABEL_38:

    v4 = v45;
    goto LABEL_39;
  }
LABEL_44:
  if ((-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4) & 1) != 0)
    goto LABEL_53;
  v35 = 1;
  do
  {
    if (v35 != 1)
      break;
    v36 = (void *)MEMORY[0x2348A15A8]();
    self->_customResponsesStep = 2;
    -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint");
    v37 = -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4);
    v35 = (v37 & 1) != 0
        ? 0
        : -[PSGCustomResponseHarvester activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:](self, "activityStateAfterFilterWithStore:forActivity:andCustomResponseParameters:", v41, v4, v44);
    objc_autoreleasePoolPop(v36);
  }
  while (!v37);
  if (!v35)
  {
LABEL_53:
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3);
    PRERecordMeasurementState();
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  v10 = v38;
  v5 = v44;
LABEL_55:

  objc_autoreleasePoolPop(v10);
  if (!v11)
  {
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 5);
    PRERecordMeasurementState();
  }
  PRERecordMeasurementState();
LABEL_8:

}

- (void)loadCustomResponsesCheckpoint
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSDate *latestProcessedDate;
  NSDate *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[NSFileManager fileExistsAtPath:](self->_fManager, "fileExistsAtPath:", self->_checkpointFullPath))
  {
    -[NSFileManager contentsAtPath:](self->_fManager, "contentsAtPath:", self->_checkpointFullPath);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, &v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      if ((v5 || !v4) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_fault_impl(&dword_22F6A5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error deserializing CustomResponses checkpoint: %@", buf, 0xCu);
      }
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_customResponsesStep = objc_msgSend(v9, "unsignedIntegerValue");

      if (v8 == 0.0)
      {
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v8);
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = v11;
      }

      if ((unint64_t)objc_msgSend(v4, "count") < 3 || self->_customResponsesStep < 3u)
      {
        self->_batchSize = 0;
      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_batchSize = objc_msgSend(v12, "integerValue");

      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_22F6A5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Unable to read CustomResponses data", buf, 2u);
    }

  }
}

- (void)writeCheckpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  -[NSDate timeIntervalSinceReferenceDate](self->_latestProcessedDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_customResponsesStep);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_batchSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v8 || !v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_fault_impl(&dword_22F6A5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error serializing CustomResponses checkpoint: %@", buf, 0xCu);
    }
  }
  else
  {
    -[NSFileManager createFileAtPath:contents:attributes:](self->_fManager, "createFileAtPath:contents:attributes:", self->_checkpointFullPath, v7, 0);
  }

}

- (BOOL)isSupportedLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_modelExistsForLanguage, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE28670], "configWithLanguage:mode:plistPath:vocabPath:", v4, 1, self->_modelConfigPath, self->_modelVocabPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modelExistsForLanguage, "setObject:forKeyedSubscript:", v5, v4);

  }
  v7 = objc_msgSend(v5, "BOOLValue");

  return v7;
}

- (id)modelForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSString *preferredLanguage;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE28688], "modelForLanguage:mode:chunkPath:plistPath:vocabPath:", v4, 1, self->_modelFilePath, self->_modelConfigPath, self->_modelVocabPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_8:
    v9 = v7;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "isEqualToString:", self->_preferredLanguage))
  {
    -[PSGCustomResponseHarvester modelForLanguage:](self, "modelForLanguage:", self->_preferredLanguage);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    preferredLanguage = self->_preferredLanguage;
    v12 = 138412290;
    v13 = preferredLanguage;
    _os_log_fault_impl(&dword_22F6A5000, v8, OS_LOG_TYPE_FAULT, "Model missing for preferred language %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (unint64_t)activityStateAfterFilterWithStore:(id)a3 forActivity:(id)a4 andCustomResponseParameters:(id)a5
{
  unint64_t v5;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  os_signpost_id_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  char v68;
  void *v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  uint8_t buf[4];
  int ptr;
  _QWORD v81[5];
  id v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = __104__PSGCustomResponseHarvester_activityStateAfterFilterWithStore_forActivity_andCustomResponseParameters___block_invoke;
  v81[3] = &unk_24FCB49A0;
  v81[4] = self;
  v12 = v10;
  v82 = v12;
  v83 = &v84;
  v70 = (void *)MEMORY[0x2348A1710](v81);
  v13 = 0;
  while (self->_customResponsesStep >= 2u)
  {
    v14 = (void *)MEMORY[0x2348A15A8]();
    switch(self->_customResponsesStep)
    {
      case 2:
        pre_signpost_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        ptr = 7;
        v16 = os_signpost_id_make_with_pointer(v15, &ptr);

        pre_signpost_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SGCustomResponses-DesignateFilteringBatch", "Start", buf, 2u);
        }

        v19 = objc_msgSend(v9, "designateFilteringBatch:", objc_msgSend(v11, "filterBatchSize"));
        if (v19)
          v13 = 3;
        else
          v13 = 0;
        self->_batchSize = v19;
        pre_signpost_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v20))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v22 = v21;
        v23 = v16;
        v24 = "SGCustomResponses-DesignateFilteringBatch";
        break;
      case 3:
        pre_signpost_handle();
        v25 = objc_claimAutoreleasedReturnValue();
        v78 = 7;
        v26 = os_signpost_id_make_with_pointer(v25, &v78);

        pre_signpost_handle();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SGCustomResponses-RecordKnownCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v9, "recordKnownCustomResponsesInBatchWithEmbedder:compatibilityVersion:", v70, objc_msgSend(v11, "compatibilityVersion"));
        if (*((_BYTE *)v85 + 24))
          v13 = 3;
        else
          v13 = 4;
        pre_signpost_handle();
        v29 = objc_claimAutoreleasedReturnValue();
        v21 = v29;
        if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v29))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v22 = v21;
        v23 = v26;
        v24 = "SGCustomResponses-RecordKnownCustomResponses";
        break;
      case 4:
        pre_signpost_handle();
        v30 = objc_claimAutoreleasedReturnValue();
        v77 = 7;
        v31 = os_signpost_id_make_with_pointer(v30, &v77);

        pre_signpost_handle();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SGCustomResponses-PruningAllCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v11, "minDecayedCountForPruning");
        v34 = objc_msgSend(v9, "countCustomResponsesAfterPruningWithMinimumCountThreshold:");
        if (v34 >= objc_msgSend(v11, "maxStoredCustomResponses"))
          v13 = 7;
        else
          v13 = 5;
        pre_signpost_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        v21 = v35;
        if (v31 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v22 = v21;
        v23 = v31;
        v24 = "SGCustomResponses-PruningAllCustomResponses";
        break;
      case 5:
        pre_signpost_handle();
        v36 = objc_claimAutoreleasedReturnValue();
        v76 = 7;
        v37 = os_signpost_id_make_with_pointer(v36, &v76);

        pre_signpost_handle();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "SGCustomResponses-FilterBatch", "Start", buf, 2u);
        }

        objc_msgSend(v9, "filterBatchWithMinimumDistinctRecipients:minimumReplyOccurences:", objc_msgSend(v11, "minimumDistinctRecipients"), objc_msgSend(v11, "minimumReplyOccurences"));
        pre_signpost_handle();
        v40 = objc_claimAutoreleasedReturnValue();
        v21 = v40;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v21, OS_SIGNPOST_INTERVAL_END, v37, "SGCustomResponses-FilterBatch", "Completed", buf, 2u);
        }
        v13 = 6;
        goto LABEL_76;
      case 6:
        pre_signpost_handle();
        v41 = objc_claimAutoreleasedReturnValue();
        v75 = 7;
        v42 = os_signpost_id_make_with_pointer(v41, &v75);

        pre_signpost_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "SGCustomResponses-RecordAllRemainingMessagesAsCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v9, "recordMessagesInBatchAsCustomResponsesWithEmbedder:compatibilityVersion:", v70, objc_msgSend(v11, "compatibilityVersion"));
        if (*((_BYTE *)v85 + 24))
          v13 = 6;
        else
          v13 = 7;
        pre_signpost_handle();
        v45 = objc_claimAutoreleasedReturnValue();
        v21 = v45;
        if (v42 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v45))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v22 = v21;
        v23 = v42;
        v24 = "SGCustomResponses-RecordAllRemainingMessagesAsCustomResponses";
        break;
      case 7:
        pre_signpost_handle();
        v46 = objc_claimAutoreleasedReturnValue();
        v74 = 7;
        v47 = os_signpost_id_make_with_pointer(v46, &v74);

        pre_signpost_handle();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "SGCustomResponses-DecayAllCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v11, "timeDecayFactor");
        objc_msgSend(v9, "decayAllCustomResponsesWithDecayFactor:filteringBatchSize:", self->_batchSize);
        pre_signpost_handle();
        v50 = objc_claimAutoreleasedReturnValue();
        v21 = v50;
        if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v21, OS_SIGNPOST_INTERVAL_END, v47, "SGCustomResponses-DecayAllCustomResponses", "Completed", buf, 2u);
        }
        v13 = 8;
        goto LABEL_76;
      case 8:
        pre_signpost_handle();
        v51 = objc_claimAutoreleasedReturnValue();
        v73 = 7;
        v52 = os_signpost_id_make_with_pointer(v51, &v73);

        pre_signpost_handle();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SGCustomResponses-TruncateCustomResponsesTable", "Start", buf, 2u);
        }

        v55 = objc_msgSend(v9, "countCustomResponsesAfterTruncatingTable:", objc_msgSend(v11, "maxStoredCustomResponses"));
        v21 = objc_opt_new();
        -[NSObject setCustomResponsesAfterPruning:](v21, "setCustomResponsesAfterPruning:", v55);
        -[PETEventTracker2 trackScalarForMessage:](self->_pet2tracker, "trackScalarForMessage:", v21);
        pre_signpost_handle();
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v57, OS_SIGNPOST_INTERVAL_END, v52, "SGCustomResponses-TruncateCustomResponsesTable", "Completed", buf, 2u);
        }

        v13 = 9;
        goto LABEL_76;
      case 9:
        pre_signpost_handle();
        v58 = objc_claimAutoreleasedReturnValue();
        v72 = 7;
        v59 = os_signpost_id_make_with_pointer(v58, &v72);

        pre_signpost_handle();
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "SGCustomResponses-PrunePerRecipientTable", "Start", buf, 2u);
        }

        objc_msgSend(v9, "prunePerRecipientTableWithMaxRows:", objc_msgSend(v11, "maxRowsInPerRecipientTable"));
        pre_signpost_handle();
        v62 = objc_claimAutoreleasedReturnValue();
        v21 = v62;
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v21, OS_SIGNPOST_INTERVAL_END, v59, "SGCustomResponses-PrunePerRecipientTable", "Completed", buf, 2u);
        }
        v13 = 10;
        goto LABEL_76;
      case 0xA:
        pre_signpost_handle();
        v63 = objc_claimAutoreleasedReturnValue();
        v71 = 7;
        v64 = os_signpost_id_make_with_pointer(v63, &v71);

        pre_signpost_handle();
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v65;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "SGCustomResponses-CalculateUsageSpreads", "Start", buf, 2u);
        }

        objc_msgSend(v9, "calculateUsageSpreads");
        pre_signpost_handle();
        v67 = objc_claimAutoreleasedReturnValue();
        v21 = v67;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22F6A5000, v21, OS_SIGNPOST_INTERVAL_END, v64, "SGCustomResponses-CalculateUsageSpreads", "Completed", buf, 2u);
        }
        v13 = 0;
        goto LABEL_76;
      default:
        goto LABEL_77;
    }
    _os_signpost_emit_with_name_impl(&dword_22F6A5000, v22, OS_SIGNPOST_INTERVAL_END, v23, v24, "Completed", buf, 2u);
LABEL_76:

LABEL_77:
    self->_customResponsesStep = v13;
    -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint");
    if (*((_BYTE *)v85 + 24)
      || (-[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v12) & 1) != 0)
    {
      v5 = 0;
      v68 = 0;
    }
    else if (v13 || self->_batchSize)
    {
      v68 = 1;
    }
    else
    {
      v68 = 0;
      v5 = 2;
    }
    objc_autoreleasePoolPop(v14);
    if ((v68 & 1) == 0)
      goto LABEL_87;
  }
  v5 = 1;
LABEL_87:

  _Block_object_dispose(&v84, 8);
  return v5;
}

- (BOOL)deferAfterWriteCheckpointForActivity:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  -[PSGCustomResponseHarvester writeCheckpoint](self, "writeCheckpoint");
  v5 = -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4);
  if (v5)
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3);

  return v5;
}

- (void)setPet2TrackerForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_pet2tracker, a3);
}

- (void)setCustomResponsesStepForTesting:(int)a3
{
  self->_customResponsesStep = a3;
}

- (int)getCustomResponsesStepForTesting
{
  return self->_customResponsesStep;
}

- (void)setCustomResponsesLatestProcessedDateForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_latestProcessedDate, a3);
}

- (id)getCustomResponsesLatestProcessedDateForTesting
{
  return self->_latestProcessedDate;
}

- (NSMutableDictionary)modelExistsForLanguage
{
  return self->_modelExistsForLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelExistsForLanguage, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_modelVocabPath, 0);
  objc_storeStrong((id *)&self->_modelConfigPath, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong((id *)&self->_latestProcessedDate, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_checkpointFullPath, 0);
  objc_storeStrong((id *)&self->_fManager, 0);
  objc_storeStrong((id *)&self->_pet2tracker, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
}

id __104__PSGCustomResponseHarvester_activityStateAfterFilterWithStore_forActivity_andCustomResponseParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "shouldDefer:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "modelForLanguage:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featuresOf:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predict:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customResponsesParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "useNonNegativeClassesOnly") & 1) != 0)
    {
      objc_msgSend(v8, "config");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predictionParams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasNegativeClass");

      if (v15)
      {
        v16 = 0.0;
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          v17 = 1;
          do
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v16 = v16 + v19;

            ++v17;
          }
          while (objc_msgSend(v10, "count") > v17);
        }
        objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (id)objc_msgSend(v20, "mutableCopy");

        if (objc_msgSend(v7, "count"))
        {
          v21 = 0;
          do
          {
            v22 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            objc_msgSend(v22, "numberWithDouble:", v24 / v16);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:atIndexedSubscript:", v25, v21);

            ++v21;
          }
          while (objc_msgSend(v7, "count") > v21);
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    v7 = v10;
LABEL_14:

    goto LABEL_15;
  }
  v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_15:

  return v7;
}

id __50__PSGCustomResponseHarvester_harvestWithActivity___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;

  v3 = (objc_class *)MEMORY[0x24BE28660];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v7 = objc_msgSend(v4, "knowledgeStoreQueryLimit");
  v8 = objc_msgSend(v4, "maxReplyLength");
  objc_msgSend(v4, "maxReplyGapSecs");
  v10 = v9;

  return (id)objc_msgSend(v5, "initWithStartDate:maxBatchSize:maxReplyLength:maxReplyGap:", v6, v7, v8, v10);
}

+ (void)clearCustomResponsesCheckpointForTesting
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71AD8], "suggestionsDirectoryFile:", CFSTR("custom-response-ckpt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

+ (void)runHarvestSkipMessageCollection:(BOOL)a3 clearCheckpoint:(BOOL)a4 reportMetrics:(BOOL)a5 modelConfigPath:(id)a6 modelVocabPath:(id)a7 modelFilePath:(id)a8 storeDirectory:(id)a9 evalFraction:(id)a10
{
  _BOOL4 v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  PSGCustomResponseHarvester *v21;
  PSGCustomResponseHarvester *v22;
  double v23;
  void *v24;
  id v25;

  v13 = a4;
  v14 = a3;
  v25 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  if (v13)
  {
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("custom-response-ckpt"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemAtPath:error:", v20, 0);

    }
    else
    {
      +[PSGCustomResponseHarvester clearCustomResponsesCheckpointForTesting](PSGCustomResponseHarvester, "clearCustomResponsesCheckpointForTesting");
    }
  }
  v21 = -[PSGCustomResponseHarvester initWithActivityManager:modelConfigPath:modelVocabPath:modelFilePath:storeDirectory:]([PSGCustomResponseHarvester alloc], "initWithActivityManager:modelConfigPath:modelVocabPath:modelFilePath:storeDirectory:", 0, v25, v15, v16, v17);
  v22 = v21;
  if (!a5)
    -[PSGCustomResponseHarvester setPet2TrackerForTesting:](v21, "setPet2TrackerForTesting:", 0);
  if (v14)
    -[PSGCustomResponseHarvester setCustomResponsesStepForTesting:](v22, "setCustomResponsesStepForTesting:", 2);
  -[PSGCustomResponseHarvester harvestWithActivity:](v22, "harvestWithActivity:", 0);
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    if (v23 > 0.0)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28698]), "initInDirectory:inMemory:withMigration:", v17, 0, 1);
      objc_msgSend(v24, "resetCustomResponsesForEval:", v18);

    }
  }
  -[PSGCustomResponseHarvester harvestWithActivity:](v22, "harvestWithActivity:", 0);

}

@end
