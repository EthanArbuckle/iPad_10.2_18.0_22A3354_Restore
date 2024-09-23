@implementation _PSBehaviorRuleRankingUtilities

+ (id)getTrialCompiledMLModelPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("TrialRuleImportancePredictor.mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getTrialCompiledMLModelPathForContactRanker
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("TrialContactRankerModel.mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getTrialCompiledAdaptableMLModelPath
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("TrialAdaptableRuleImportancePredictor.mlmodelc"));
}

+ (id)getAdaptedCompiledMLModelPath
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("AdaptedRuleImportancePredictor.mlmodelc"));
}

+ (id)getDeployedCompiledMLModelPath
{
  return (id)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PeopleSuggester.framework/"), "stringByAppendingString:", CFSTR("RuleImportancePredictor.mlmodelc"));
}

+ (id)getDeployedCompiledMLModelPathForContactRanker
{
  return (id)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/PeopleSuggester.framework/"), "stringByAppendingString:", CFSTR("ContactRankerModel.mlmodelc"));
}

+ (id)getDeployedAdaptableCompiledMLModelPath
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("AdaptableRuleImportancePredictor.mlmodelc"));
}

+ (id)getIntermediateAdaptableCompiledMLModel
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("IntermediateAdaptableModel.mlmodelc"));
}

+ (id)getAdaptedModelRecipeVersionFilePath
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("adaptedModelRecipeVersion.txt"));
}

+ (id)getArchivedDefaultAdaptableModelPath
{
  return (id)objc_msgSend(CFSTR("/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"), "stringByAppendingString:", CFSTR("AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"));
}

+ (id)getZippedDefaultAdaptableModelPath
{
  return (id)objc_msgSend(CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), "stringByAppendingString:", CFSTR("AdaptableRuleImportancePredictor.mlmodelc.zip"));
}

+ (id)loadAdaptableModelConfig:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "loadAdaptableModelConfig is invoked with config file path: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Loaded adaptable model config from:%@", buf, 0xCu);
    }

    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities loadAdaptableModelConfig:].cold.1();

  }
  return v6;
}

+ (id)loadMLModelConfigurationWithConfigDict:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[6];
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v4 = (void *)getMLModelConfigurationClass_softClass_0;
    v35 = getMLModelConfigurationClass_softClass_0;
    if (!getMLModelConfigurationClass_softClass_0)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __getMLModelConfigurationClass_block_invoke_0;
      v31[3] = &unk_1E43FEA00;
      v31[4] = &v32;
      __getMLModelConfigurationClass_block_invoke_0((uint64_t)v31);
      v4 = (void *)v33[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v32, 8);
    v30 = objc_alloc_init(v5);
    objc_msgSend(v30, "setComputeUnits:", 0);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numClasses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numTrees"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxDepth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("learningRate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minChildWeight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    objc_msgSend(getMLParameterKeyClass(), "numClasses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v28;
    objc_msgSend(getMLParameterKeyClass(), "numTrees");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v17;
    objc_msgSend(getMLParameterKeyClass(), "maxDepth");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v19;
    objc_msgSend(getMLParameterKeyClass(), "learningRate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v21;
    objc_msgSend(getMLParameterKeyClass(), "minChildWeight");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v23;
    objc_msgSend(getMLParameterKeyClass(), "objective");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v24;
    v37[5] = CFSTR("binary:logistic");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setParameters:", v25);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)loadMLModel:(id)a3 modelConfig:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id MLModelClass_0;
  id *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "loadMLModel is invoked with model path: %@", buf, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v8, "fileExistsAtPath:", v5))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v5);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Trying to load model with compiled model path: %@", buf, 0xCu);
    }

    MLModelClass_0 = getMLModelClass_0();
    if (v6)
    {
      v20 = 0;
      v12 = (id *)&v20;
      objc_msgSend(MLModelClass_0, "modelWithContentsOfURL:configuration:error:", v9, v6, &v20);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
      v12 = (id *)&v19;
      objc_msgSend(MLModelClass_0, "modelWithContentsOfURL:error:", v9, &v19);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    v15 = *v12;
    v16 = v15;
    if (!v14 || v15)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:].cold.1();

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "features");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v8);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v4;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v28)
    {
      v26 = *(_QWORD *)v34;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = v3;
          v15 = v3;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v19), "features");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v12);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v21);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
            }
            while (v17);
          }

          v22 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v12);

          ++v11;
          v3 = v14;
        }
        while (v11 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v28);
    }

  }
  v23 = (void *)objc_msgSend(v27, "copy");

  return v23;
}

+ (id)reformatFeaturesInFeatureDictArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v37;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v7);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v4;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v10)
    {
      v11 = v10;
      v26 = *(_QWORD *)v33;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v15 = v3;
          v16 = v3;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v29;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v29 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v20), "objectForKeyedSubscript:", v13);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v21);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            }
            while (v18);
          }

          v22 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v13);

          ++v12;
          v3 = v15;
        }
        while (v12 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v11);
    }

  }
  v23 = (void *)objc_msgSend(v27, "copy");

  return v23;
}

+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12);
      v14 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
      v27 = 0;
      v15 = (void *)objc_msgSend(v14, "initWithDictionary:error:", v13, &v27);
      v16 = v27;
      if (v16)
        break;
      v26 = 0;
      objc_msgSend(v5, "predictionFromFeatures:error:", v15, &v26);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v26;
      if (v18)
      {
        v23 = v18;
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          +[_PSBehaviorRuleRankingUtilities predictWithMLModel:featureDictArray:].cold.1();

LABEL_18:
        v22 = 0;
        goto LABEL_19;
      }
      -[NSObject featureValueForName:](v17, "featureValueForName:", CFSTR("classProbability"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "count") == 2)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E442AF58);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v23 = v16;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities predictWithMLModel:featureDictArray:].cold.2();
    goto LABEL_18;
  }
LABEL_12:

  v22 = (void *)objc_msgSend(v7, "copy");
LABEL_19:

  return v22;
}

+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)getMLArrayBatchProviderClass()), "initWithDictionary:error:", v6, &v22);
  v9 = v22;
  if (v9)
  {
    v10 = v9;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:].cold.2();
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v21 = 0;
  objc_msgSend(v5, "predictionsFromBatch:error:", v8, &v21);
  v11 = objc_claimAutoreleasedReturnValue();
  v10 = v21;
  if (v10)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities batchPredictWithMLModel:featureArrayDict:].cold.1();

    goto LABEL_8;
  }
  v20 = v5;
  if (-[NSObject count](v11, "count") >= 1)
  {
    v15 = 0;
    do
    {
      -[NSObject featuresAtIndex:](v11, "featuresAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "featureValueForName:", CFSTR("classProbability"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dictionaryValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count") == 2)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E442AF58);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

      }
      ++v15;
    }
    while (v15 < -[NSObject count](v11, "count"));
  }
  v13 = (void *)objc_msgSend(v7, "copy");
  v5 = v20;
LABEL_9:

  return v13;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id obj;
  id obja;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint8_t v48;
  _BYTE v49[15];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  v8 = a5;
  v40 = v7;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = v8;
  v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v45)
  {
    obj = v10;
    v44 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v53 != v44)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        v14 = objc_alloc((Class)getMLMultiArrayClass_0());
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v17 = (void *)objc_msgSend(v14, "initWithShape:dataType:error:", v16, 65568, &v51);
        v18 = v51;

        if (v18)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.3();
          goto LABEL_22;
        }
        if (objc_msgSend(v9, "count"))
        {
          v19 = 0;
          do
          {
            objc_msgSend(v12, "features");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v22, "floatValue");
            objc_msgSend(v23, "numberWithFloat:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:atIndexedSubscript:", v24, v19);

            ++v19;
          }
          while (v19 < objc_msgSend(v9, "count"));
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("input"));
        v25 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
        v50 = 0;
        v26 = objc_msgSend(v25, "initWithDictionary:error:", v13, &v50);
        v27 = v50;
        if (v27)
        {
          v18 = v27;
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.2(&v48, v49, v32);

LABEL_22:
          v29 = v39;
          v10 = obj;

          v31 = 0;
          v28 = obj;
          goto LABEL_23;
        }
        objc_msgSend(v46, "addObject:", v26);

      }
      v10 = obj;
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v45)
        continue;
      break;
    }
  }

  v28 = (void *)objc_msgSend(objc_alloc((Class)getMLArrayBatchProviderClass()), "initWithFeatureProviderArray:", v46);
  v47 = 0;
  v29 = v39;
  objc_msgSend(v39, "predictionsFromBatch:error:", v28, &v47);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;
  if (v18)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.1();

    v31 = 0;
  }
  else
  {
    obja = v10;
    if (objc_msgSend(v13, "count") >= 1)
    {
      v34 = 0;
      do
      {
        objc_msgSend(v13, "featuresAtIndex:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "featureValueForName:", CFSTR("classProbability"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dictionaryValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "count") == 2)
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", &unk_1E442AF58);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v38);

        }
        ++v34;
      }
      while (v34 < objc_msgSend(v13, "count"));
    }
    v31 = (void *)objc_msgSend(v41, "copy");
    v10 = obja;
  }
LABEL_23:

  return v31;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BYTE *v41;
  id v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  uint8_t v49;
  _BYTE v50[7];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v7 = a4;
  v8 = a5;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v10)
  {
    v11 = v10;
    v46 = *(_QWORD *)v54;
    v41 = v50;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v54 != v46)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy", v41);
        v15 = objc_alloc((Class)getMLMultiArrayClass_0());
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        v18 = (void *)objc_msgSend(v15, "initWithShape:dataType:error:", v17, 65568, &v52);
        v19 = v52;

        if (v19)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.3();
          goto LABEL_22;
        }
        if (objc_msgSend(v9, "count"))
        {
          v20 = 0;
          do
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v22, "floatValue");
            objc_msgSend(v23, "numberWithFloat:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:atIndexedSubscript:", v24, v20);

            ++v20;
          }
          while (v20 < objc_msgSend(v9, "count"));
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("input"));
        v25 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_1());
        v51 = 0;
        v26 = objc_msgSend(v25, "initWithDictionary:error:", v14, &v51);
        v27 = v51;
        if (v27)
        {
          v19 = v27;
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.2(&v49, v41, v34);

LABEL_22:
          v33 = v42;
          v30 = v43;
          v28 = obj;

          v32 = 0;
          v29 = obj;
          goto LABEL_23;
        }
        objc_msgSend(v47, "addObject:", v26);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v11)
        continue;
      break;
    }
  }
  v28 = obj;

  v29 = (void *)objc_msgSend(objc_alloc((Class)getMLArrayBatchProviderClass()), "initWithFeatureProviderArray:", v47);
  v48 = 0;
  v30 = v43;
  objc_msgSend(v43, "predictionsFromBatch:error:", v29, &v48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v48;
  if (v19)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:].cold.1();

    v32 = 0;
    v33 = v42;
  }
  else
  {
    if (objc_msgSend(v14, "count") >= 1)
    {
      v36 = 0;
      do
      {
        objc_msgSend(v14, "featuresAtIndex:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "featureValueForName:", CFSTR("classProbability"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "dictionaryValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "count") == 2)
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", &unk_1E442AF58);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v40);

        }
        ++v36;
      }
      while (v36 < objc_msgSend(v14, "count"));
    }
    v32 = (void *)objc_msgSend(v44, "copy");
    v33 = v42;
    v28 = obj;
  }
LABEL_23:

  return v32;
}

+ (BOOL)removeFolderAtPath:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  id v11;
  char v12;

  v3 = a3;
  v12 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v12))
    v5 = v12 == 0;
  else
    v5 = 1;
  if (v5 || (v11 = 0, objc_msgSend(v4, "removeItemAtPath:error:", v3, &v11), (v6 = v11) == 0))
  {
    v9 = 1;
  }
  else
  {
    v7 = v6;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_PSInteractionPredictor removeMlmodelcFolderAtPath:].cold.1();

    v9 = 0;
  }

  return v9;
}

+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v12 = 0;
  v8 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v6, &v12);
  v9 = v12;
  if ((v8 & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_ERROR, "Failed to copy file with path:%@ to path:%@, with error：%@", buf, 0x20u);
    }

  }
  return v8;
}

+ (id)compileMLModelAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(getMLModelClass_0(), "compileModelAtURL:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities compileMLModelAtPath:].cold.1();

  }
  return v5;
}

+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  NSURL *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99E98];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initFileURLWithPath:", v10);

  v12 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v8);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = _PSUnarchiverZip((const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), v12);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v16;
    _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "_PSUnarchiverZip returned %@", (uint8_t *)&v28, 0xCu);

  }
  if ((v14 & 1) != 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v8, "stringByAppendingString:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initFileURLWithPath:", v18);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:].cold.1(v18, v20, v21, v22, v23, v24, v25, v26);
    v19 = 0;
  }

  return v19;
}

+ (BOOL)copyZippedAdaptableModel:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;

  v3 = a3;
  if (!v3)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities copyZippedAdaptableModel:].cold.1();
    goto LABEL_10;
  }
  +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledAdaptableMLModelPath");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:](_PSBehaviorRuleRankingUtilities, "removeFolderAtPath:", v4))
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:](_PSBehaviorRuleRankingUtilities, "unzipFileWithPath:toFileName:toFolderPath:", v3, CFSTR("TrialAdaptableRuleImportancePredictor.mlmodelc"), CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;
  if (!v5)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities copyZippedAdaptableModel:].cold.2();

  }
LABEL_11:

  return v6;
}

+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;
  uint8_t buf[15];
  char v36;

  v3 = a3;
  v36 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedAdaptableCompiledMLModelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v36))
    v6 = v36 == 0;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v7) & 1) == 0)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:].cold.3((uint64_t)v7, v8, v12, v13, v14, v15, v16, v17);
      v9 = 0;
      v10 = 0;
      goto LABEL_23;
    }
    +[_PSBehaviorRuleRankingUtilities getZippedDefaultAdaptableModelPath](_PSBehaviorRuleRankingUtilities, "getZippedDefaultAdaptableModelPath");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v8) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"), 1, 0, 0);
      v34 = 0;
      v18 = objc_msgSend(v4, "copyItemAtPath:toPath:error:", v7, v8, &v34);
      v9 = v34;
      if ((v18 & 1) == 0)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:].cold.2((uint64_t)v9, v19, v27, v28, v29, v30, v31, v32);
        goto LABEL_21;
      }
    }
    +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:toFileName:toFolderPath:](_PSBehaviorRuleRankingUtilities, "unzipFileWithPath:toFileName:toFolderPath:", v8, CFSTR("AdaptableRuleImportancePredictor.mlmodelc"), CFSTR("/var/tmp/com.apple.siri-distributed-evaluation/"));
    v19 = objc_claimAutoreleasedReturnValue();
    v10 = v19 != 0;
    if (v19)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:].cold.1((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);

LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Deployed adaptable ML model already exist, no need to unzip", buf, 2u);
  }
LABEL_24:

  return v10;
}

+ (void)loadAdaptableModelConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Failed to load adaptable model config with path:%@, with error：%@");
  OUTLINED_FUNCTION_1();
}

+ (void)loadMLModel:modelConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "ML model load: failed to load ml model with path:%@, with error：%@");
  OUTLINED_FUNCTION_1();
}

+ (void)predictWithMLModel:featureDictArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "predictWithMLModel - predictionFromFeatures failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)predictWithMLModel:featureDictArray:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "predictWithMLModel - feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)batchPredictWithMLModel:featureArrayDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "batchPredictWithMLModel - predictionsFromBatch failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)batchPredictWithMLModel:featureArrayDict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "batchPredictWithMLModel - feature extraction MLArrayBatchProvider:initWithDictionary failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "_PSRuleRankingMLModel - People Suggester ML model, predictionsFromBatch failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)batchPredictWithAdaptedMLModel:(uint8_t *)a1 psConfigForAdaptableModel:(_BYTE *)a2 featurizedRules:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_1A07F4000, a3, (uint64_t)a3, "_PSRuleRankingMLModel - People Suggester feature extraction MLDictionaryFeatureProvider:initWithDictionary failure", a1);
}

+ (void)batchPredictWithAdaptedMLModel:psConfigForAdaptableModel:featurizedRules:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "batchPredictWithAdaptedMLModel - MLMultiArray creation failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)compileMLModelAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Failed to compile ml model with path:%@, with error：%@");
  OUTLINED_FUNCTION_1();
}

+ (void)unzipFileWithPath:(uint64_t)a3 toFileName:(uint64_t)a4 toFolderPath:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a1, a3, "Unable to decompress adaptable compiled model with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)copyZippedAdaptableModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Zipped Adaptable ML model copy attempted with null path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)copyZippedAdaptableModel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Zipped Adaptable ML model copy failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Unzipping the adaptable ML model at path: %@ failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Adaptable ML file extension change failed with error：%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)loadDeployedAdaptableModelUnderDirectory:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Deployed archieved adaptable ML model cannot be found under path %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
