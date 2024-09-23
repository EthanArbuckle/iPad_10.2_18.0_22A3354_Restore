@implementation _PSRuleRankingMLModel

- (_PSRuleRankingMLModel)initWithMLModel:(id)a3 scoreThreshold:(double)a4 isAdaptedModel:(BOOL)a5 psConfigForAdaptableModel:(id)a6 isAdaptedMLModelOK:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  _PSRuleRankingMLModel *v14;
  _PSRuleRankingMLModel *v15;
  void *v16;
  void *v17;
  void *v18;
  _PSBehaviorRuleFeatureExtraction *v19;
  void *v20;
  _PSBehaviorRuleFeatureExtraction *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v7 = a7;
  v9 = a5;
  v12 = a3;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_PSRuleRankingMLModel;
  v14 = -[_PSRuleRankingMLModel init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    -[_PSRuleRankingMLModel setMlModel:](v14, "setMlModel:", v12);
    -[MLModel modelDescription](v15->_mlModel, "modelDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSRuleRankingMLModel setMetadata:](v15, "setMetadata:", v18);

    v19 = [_PSBehaviorRuleFeatureExtraction alloc];
    -[_PSRuleRankingMLModel metadata](v15, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_PSBehaviorRuleFeatureExtraction initWithMetadata:](v19, "initWithMetadata:", v20);
    -[_PSRuleRankingMLModel setFeaExtHandle:](v15, "setFeaExtHandle:", v21);

    -[_PSRuleRankingMLModel feaExtHandle](v15, "feaExtHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "precalculateConstantFeatures");

    -[_PSRuleRankingMLModel setIsAdaptedModel:](v15, "setIsAdaptedModel:", v9);
    -[_PSRuleRankingMLModel setPsConfigForAdaptableModel:](v15, "setPsConfigForAdaptableModel:", v13);
    -[_PSRuleRankingMLModel setIsAdaptedMLModelOK:](v15, "setIsAdaptedMLModelOK:", v7);
    -[_PSRuleRankingMLModel getAdaptedModelVersion](v15, "getAdaptedModelVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSRuleRankingMLModel setAdaptedModelRecipeVersion:](v15, "setAdaptedModelRecipeVersion:", v23);

    -[_PSRuleRankingMLModel setScoreThreshold:](v15, "setScoreThreshold:", a4);
  }

  return v15;
}

- (_PSRuleRankingMLModel)initWithAdaptableModelConfig:(id)a3 isAdaptedMLModelOK:(BOOL)a4 scoreThreshold:(double)a5
{
  _BOOL8 v6;
  id v8;
  _PSRuleRankingMLModel *v9;
  _PSRuleRankingMLModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PSBehaviorRuleFeatureExtraction *v18;
  void *v19;
  _PSBehaviorRuleFeatureExtraction *v20;
  void *v21;
  objc_super v23;

  v6 = a4;
  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_PSRuleRankingMLModel;
  v9 = -[_PSRuleRankingMLModel init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    -[_PSRuleRankingMLModel setMlModel:](v9, "setMlModel:", 0);
    -[_PSRuleRankingMLModel setPsConfigForAdaptableModel:](v10, "setPsConfigForAdaptableModel:", v8);
    -[_PSRuleRankingMLModel setIsAdaptedMLModelOK:](v10, "setIsAdaptedMLModelOK:", v6);
    +[_PSBehaviorRuleRankingUtilities loadMLModelConfigurationWithConfigDict:](_PSBehaviorRuleRankingUtilities, "loadMLModelConfigurationWithConfigDict:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSRuleRankingMLModel setAdaptableModelConfiguration:](v10, "setAdaptableModelConfiguration:", v11);

    -[_PSRuleRankingMLModel loadDefaultRuleMinerMLModel](v10, "loadDefaultRuleMinerMLModel");
    -[_PSRuleRankingMLModel getAdaptedModelVersion](v10, "getAdaptedModelVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSRuleRankingMLModel setAdaptedModelRecipeVersion:](v10, "setAdaptedModelRecipeVersion:", v12);

    -[_PSRuleRankingMLModel setScoreThreshold:](v10, "setScoreThreshold:", a5);
    -[_PSRuleRankingMLModel setScores:](v10, "setScores:", 0);
    -[_PSRuleRankingMLModel setMetadata:](v10, "setMetadata:", 0);
    -[_PSRuleRankingMLModel setFeaExtHandle:](v10, "setFeaExtHandle:", 0);
    -[_PSRuleRankingMLModel mlModel](v10, "mlModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_PSRuleRankingMLModel mlModel](v10, "mlModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "modelDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSRuleRankingMLModel setMetadata:](v10, "setMetadata:", v17);

      v18 = [_PSBehaviorRuleFeatureExtraction alloc];
      -[_PSRuleRankingMLModel metadata](v10, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[_PSBehaviorRuleFeatureExtraction initWithMetadata:](v18, "initWithMetadata:", v19);
      -[_PSRuleRankingMLModel setFeaExtHandle:](v10, "setFeaExtHandle:", v20);

      -[_PSRuleRankingMLModel feaExtHandle](v10, "feaExtHandle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "precalculateConstantFeatures");

    }
  }

  return v10;
}

- (id)getAdaptedModelVersion
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[_PSBehaviorRuleRankingUtilities getAdaptedModelRecipeVersionFilePath](_PSBehaviorRuleRankingUtilities, "getAdaptedModelRecipeVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v3, "fileExistsAtPath:", v2))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v2, 4, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, "Adapted ML model Recipe ID: %@", buf, 0xCu);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)loadDefaultRuleMinerMLModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[_PSRuleRankingMLModel setIsAdaptedModel:](self, "setIsAdaptedModel:", 0);
  -[_PSRuleRankingMLModel mlModel](self, "mlModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[_PSRuleRankingMLModel isAdaptedMLModelOK](self, "isAdaptedMLModelOK"))
    {
      -[_PSRuleRankingMLModel adaptableModelConfiguration](self, "adaptableModelConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        +[_PSBehaviorRuleRankingUtilities getAdaptedCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getAdaptedCompiledMLModelPath");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSRuleRankingMLModel adaptableModelConfiguration](self, "adaptableModelConfiguration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v5, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSRuleRankingMLModel setMlModel:](self, "setMlModel:", v7);

        -[_PSRuleRankingMLModel mlModel](self, "mlModel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v20 = 138412290;
            v21 = v5;
            _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "ML Model: Adapted model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
          }

          -[_PSRuleRankingMLModel setIsAdaptedModel:](self, "setIsAdaptedModel:", 1);
        }

      }
    }
    -[_PSRuleRankingMLModel mlModel](self, "mlModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledMLModelPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSRuleRankingMLModel setMlModel:](self, "setMlModel:", v12);

      -[_PSRuleRankingMLModel mlModel](self, "mlModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = v11;
          _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_INFO, "ML Model: Trial model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
        }

      }
    }
    -[_PSRuleRankingMLModel mlModel](self, "mlModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedCompiledMLModelPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSRuleRankingMLModel setMlModel:](self, "setMlModel:", v17);

      -[_PSRuleRankingMLModel mlModel](self, "mlModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = v16;
          _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "ML Model: Deployed default model is loaded to be used in suggestions from path: %@", (uint8_t *)&v20, 0xCu);
        }

      }
    }
  }
}

- (BOOL)isAdaptedModelCreated
{
  void *v2;
  id v3;
  char v4;
  BOOL v5;
  char v7;

  +[_PSBehaviorRuleRankingUtilities getAdaptedCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getAdaptedCompiledMLModelPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v7);
  if (v7)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)giveModelDescription
{
  return -[MLModel modelDescription](self->_mlModel, "modelDescription");
}

- (id)scoresOnRules:(id)a3 contextItems:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  _PSRuleRankingMLModel *v16;
  void *v17;
  _PSFeaturizedBehaviorRule *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  MLModel *mlModel;
  void *v24;
  void *v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", " enableTelemetry=YES ", buf, 2u);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          v13 = v8;
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSRuleRankingMLModel feaExtHandle](self, "feaExtHandle");
          v16 = self;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "extractFeaturesGivenRule:contextItems:features:", v14, v28, v15);

          self = v16;
          v18 = -[_PSFeaturizedBehaviorRule initWithRule:score:features:]([_PSFeaturizedBehaviorRule alloc], "initWithRule:score:features:", v14, v15, -1.0);
          v8 = v13;
          objc_msgSend(v13, "addObject:", v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester Extracted featuresList count: %@", buf, 0xCu);

    }
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", " enableTelemetry=YES ", buf, 2u);
    }

    if (-[_PSRuleRankingMLModel isAdaptedModel](self, "isAdaptedModel"))
    {
      mlModel = self->_mlModel;
      -[_PSRuleRankingMLModel psConfigForAdaptableModel](self, "psConfigForAdaptableModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:](_PSBehaviorRuleRankingUtilities, "batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:", mlModel, v24, v8);
    }
    else
    {
      +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeaturizedBehaviorRuleArray:](_PSBehaviorRuleRankingUtilities, "reformatFeaturesInFeaturizedBehaviorRuleArray:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:](_PSBehaviorRuleRankingUtilities, "batchPredictWithMLModel:featureArrayDict:", self->_mlModel, v24);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSRuleRankingMLModel setScores:](self, "setScores:", v25);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)rankRules:(id)a3 contextItems:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  _PSFeaturizedBehaviorRule *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  MLModel *mlModel;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  __objc2_class **v29;
  NSObject *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  id obj;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v59 = a4;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", " enableTelemetry=YES ", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSRuleRankingMLModel feaExtHandle](self, "feaExtHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "extractFeaturesGivenRule:contextItems:features:", v13, v59, v14);

        v16 = -[_PSFeaturizedBehaviorRule initWithRule:score:features:]([_PSFeaturizedBehaviorRule alloc], "initWithRule:score:features:", v13, v14, -1.0);
        objc_msgSend(v8, "addObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v10);
  }

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningFeatureExtraction", (const char *)&unk_1A0908603, buf, 2u);
  }

  +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v75 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester Extracted featuresList count: %@", buf, 0xCu);

  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", " enableTelemetry=YES ", buf, 2u);
  }

  if (-[_PSRuleRankingMLModel isAdaptedModel](self, "isAdaptedModel"))
  {
    mlModel = self->_mlModel;
    -[_PSRuleRankingMLModel psConfigForAdaptableModel](self, "psConfigForAdaptableModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:](_PSBehaviorRuleRankingUtilities, "batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:", mlModel, v22, v8);
  }
  else
  {
    +[_PSBehaviorRuleRankingUtilities reformatFeaturesInFeaturizedBehaviorRuleArray:](_PSBehaviorRuleRankingUtilities, "reformatFeaturesInFeaturizedBehaviorRuleArray:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:](_PSBehaviorRuleRankingUtilities, "batchPredictWithMLModel:featureArrayDict:", self->_mlModel, v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSRuleRankingMLModel setScores:](self, "setScores:", v23);
  if (objc_msgSend(v23, "count"))
  {
    v24 = 0;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setScore:", v27);

      ++v24;
    }
    while (v24 < objc_msgSend(v23, "count"));
  }
  v57 = v23;
  v29 = off_1E43FD000;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsMiningMLModelPrediction", (const char *)&unk_1A0908603, buf, 2u);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v32 = v8;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v65 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_msgSend(v37, "score");
        if (v38 != -1.0)
        {
          objc_msgSend(v37, "score");
          v40 = v39;
          -[_PSRuleRankingMLModel scoreThreshold](self, "scoreThreshold");
          if (v40 >= v41)
            objc_msgSend(v31, "addObject:", v37);
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v34);
  }

  v56 = v31;
  objc_msgSend(v31, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v44 = v42;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v61 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
        objc_msgSend(v49, "rule");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v50);

        -[__objc2_class generalChannel](v29[8], "generalChannel");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v49, "score");
          v53 = v52;
          v29 = off_1E43FD000;
          objc_msgSend(v53, "numberWithDouble:");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v75 = v54;
          _os_log_impl(&dword_1A07F4000, v51, OS_LOG_TYPE_INFO, "_PSRuleRankingMLModel - People Suggester ML rule score: %@", buf, 0xCu);

        }
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v46);
  }

  return v43;
}

- (double)scoreThreshold
{
  return self->_scoreThreshold;
}

- (void)setScoreThreshold:(double)a3
{
  self->_scoreThreshold = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMlModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isAdaptedModel
{
  return self->_isAdaptedModel;
}

- (void)setIsAdaptedModel:(BOOL)a3
{
  self->_isAdaptedModel = a3;
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, a3);
}

- (BOOL)isAdaptedMLModelOK
{
  return self->_isAdaptedMLModelOK;
}

- (void)setIsAdaptedMLModelOK:(BOOL)a3
{
  self->_isAdaptedMLModelOK = a3;
}

- (NSString)adaptedModelRecipeVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdaptedModelRecipeVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_PSBehaviorRuleFeatureExtraction)feaExtHandle
{
  return (_PSBehaviorRuleFeatureExtraction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFeaExtHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feaExtHandle, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeVersion, 0);
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_scores, 0);
}

@end
