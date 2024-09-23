@implementation _PSPersonalizationEvaluation

- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PSPersonalizationEvaluation *v12;
  _PSPersonalizationEvaluation *v13;
  os_log_t v14;
  void *v15;
  uint64_t v16;
  NSUserDefaults *psAdaptationDefaults;
  uint64_t v18;
  id shouldContinue;
  NSObject *v20;
  uint8_t v22[16];
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_PSPersonalizationEvaluation;
  v12 = -[_PSPersonalizationEvaluation init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_knowledgeStore, a4);
    v14 = os_log_create("com.apple.PeopleSuggester.personalization", "general");
    v15 = (void *)personalizationLog;
    personalizationLog = (uint64_t)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PeopleSuggester.personalization"));
    psAdaptationDefaults = v13->_psAdaptationDefaults;
    v13->_psAdaptationDefaults = (NSUserDefaults *)v16;

    v18 = MEMORY[0x1A1AFCBF8](v11);
    shouldContinue = v13->_shouldContinue;
    v13->_shouldContinue = (id)v18;

    v13->_evaluateIsInvokedOnce = 0;
    v20 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_INFO, "Init successfully", v22, 2u);
    }
  }

  return v13;
}

- (void)setLastDayOfAdaptation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_PSPersonalizationEvaluation psAdaptationDefaults](self, "psAdaptationDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("LastAdaptationDate"));

}

- (void)setParametersFromRecipe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char isKindOfClass;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;

  -[_PSPersonalizationEvaluation setEvaluationIterationCount:](self, "setEvaluationIterationCount:", &unk_1E442AFA0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("evaluationIterationCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("evaluationIterationCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setEvaluationIterationCount:](self, "setEvaluationIterationCount:", v6);

  }
  -[_PSPersonalizationEvaluation setTestSplitPercent:](self, "setTestSplitPercent:", &unk_1E442AFB8);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("testSplitPercent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testSplitPercent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setTestSplitPercent:](self, "setTestSplitPercent:", v10);

  }
  -[_PSPersonalizationEvaluation setTopN:](self, "setTopN:", &unk_1E442AFA0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("topN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("topN"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setTopN:](self, "setTopN:", v14);

  }
  -[_PSPersonalizationEvaluation setBatchSize:](self, "setBatchSize:", &unk_1E442AFD0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("batchSize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("batchSize"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setBatchSize:](self, "setBatchSize:", v18);

  }
  -[_PSPersonalizationEvaluation setEpoc:](self, "setEpoc:", &unk_1E442AFE8);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", CFSTR("epoc"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("epoc"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setEpoc:](self, "setEpoc:", v22);

  }
  -[_PSPersonalizationEvaluation setSwapOK:](self, "setSwapOK:", &unk_1E442B000);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKey:", CFSTR("swapOK"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("swapOK"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setSwapOK:](self, "setSwapOK:", v26);

  }
  -[_PSPersonalizationEvaluation setAccuracyGainThresholdForSwap:](self, "setAccuracyGainThresholdForSwap:", &unk_1E442AFA0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKey:", CFSTR("accuracyGainThresholdForSwap"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("accuracyGainThresholdForSwap"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setAccuracyGainThresholdForSwap:](self, "setAccuracyGainThresholdForSwap:", v30);

  }
  -[_PSPersonalizationEvaluation setEngagementRateGainThresholdForSwap:](self, "setEngagementRateGainThresholdForSwap:", &unk_1E442AFA0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "valueForKey:", CFSTR("engagementRateGainThresholdForSwap"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("engagementRateGainThresholdForSwap"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setEngagementRateGainThresholdForSwap:](self, "setEngagementRateGainThresholdForSwap:", v34);

  }
  -[_PSPersonalizationEvaluation setMinimumTestDataSizeForSwap:](self, "setMinimumTestDataSizeForSwap:", &unk_1E442B018);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "valueForKey:", CFSTR("minimumTestDataSizeForSwap"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("minimumTestDataSizeForSwap"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setMinimumTestDataSizeForSwap:](self, "setMinimumTestDataSizeForSwap:", v38);

  }
  -[_PSPersonalizationEvaluation setRecipeID:](self, "setRecipeID:", &unk_1E442B000);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "valueForKey:", CFSTR("recipeID"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("recipeID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setRecipeID:](self, "setRecipeID:", v42);

  }
  -[_PSPersonalizationEvaluation setMinSampleCountForAdaptation:](self, "setMinSampleCountForAdaptation:", &unk_1E442B030);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "valueForKey:", CFSTR("minSampleCountForAdaptation"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("minSampleCountForAdaptation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setMinSampleCountForAdaptation:](self, "setMinSampleCountForAdaptation:", v46);

  }
  -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", 0);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "valueForKey:", CFSTR("adaptationStrategy"));
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("adaptationStrategy"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_27;
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("adaptationStrategy"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", (int)objc_msgSend(v53, "intValue"));

  }
LABEL_27:
  -[_PSPersonalizationEvaluation setNumClasses:](self, "setNumClasses:", &unk_1E442AFE8);
  -[_PSPersonalizationEvaluation setNumTrees:](self, "setNumTrees:", &unk_1E442B018);
  -[_PSPersonalizationEvaluation setMaxDepth:](self, "setMaxDepth:", &unk_1E442B048);
  -[_PSPersonalizationEvaluation setLearningRate:](self, "setLearningRate:", &unk_1E442D008);
  -[_PSPersonalizationEvaluation setMinChildWeight:](self, "setMinChildWeight:", &unk_1E442AFE8);
  -[_PSPersonalizationEvaluation recipe](self, "recipe");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "valueForKey:", CFSTR("adaptationParameters"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "valueForKey:", CFSTR("numClasses"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("numClasses"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSPersonalizationEvaluation setNumClasses:](self, "setNumClasses:", v61);

    }
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "valueForKey:", CFSTR("numTrees"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("numTrees"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSPersonalizationEvaluation setNumTrees:](self, "setNumTrees:", v67);

    }
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "valueForKey:", CFSTR("maxDepth"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("maxDepth"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSPersonalizationEvaluation setMaxDepth:](self, "setMaxDepth:", v73);

    }
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "valueForKey:", CFSTR("learningRate"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("learningRate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSPersonalizationEvaluation setLearningRate:](self, "setLearningRate:", v79);

    }
    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "valueForKey:", CFSTR("minChildWeight"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v85 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("adaptationParameters"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("minChildWeight"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSPersonalizationEvaluation setMinChildWeight:](self, "setMinChildWeight:", v84);

    }
  }
}

- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSPersonalizationEvaluation setParametersFromRecipe](self, "setParametersFromRecipe");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation setResults:](self, "setResults:", v5);

  -[_PSPersonalizationEvaluation loadDefaultModel](self, "loadDefaultModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Default ML Model loaded successfully", (uint8_t *)&v12, 2u);
    }
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("com.apple.PeopleSuggester.Config.SelectedFeatures.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "dodML is loading defaultSelectedFeaturesConfigPath from path: %@", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation setSelectedFeaturesConfig:](self, "setSelectedFeaturesConfig:", v10);

  }
  return v6 != 0;
}

- (id)runAdaptationAndEvaluation
{
  void *v3;
  void *v4;
  void *v5;

  -[_PSPersonalizationEvaluation setAdaptableModelDeployPath:](self, "setAdaptableModelDeployPath:", CFSTR("/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"));
  -[_PSPersonalizationEvaluation adaptableModelDeployPath](self, "adaptableModelDeployPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation adaptableModelDeployPath](self, "adaptableModelDeployPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:](self, "runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)evaluateWithModel:(id)a3
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  __int128 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  float v62;
  void *v63;
  void *v64;
  scoredRule *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  double v70;
  scoredRule *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  unint64_t i;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  __int128 v93;
  void *v94;
  uint64_t v95;
  id v96;
  void *v97;
  const __CFString *v98;
  void *context;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  const __CFString *v106;
  int v107;
  id v108;
  void *v109;
  int v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  _BYTE buf[24];
  void *v120;
  uint64_t *v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  v3 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "Arrived in NEW evaluateWithModel method", buf, 2u);
  }
  objc_msgSend(v96, "CDQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  v6 = (void *)personalizationLog;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation evaluateWithModel:].cold.1();
    v34 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      objc_msgSend(v96, "CDQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);

    }
    v11 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      objc_msgSend(v96, "CDModelDataStreamIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Candidate model stream id: %@", buf, 0xCu);

    }
    if ((objc_msgSend(v96, "isDefaultModel") & 1) != 0 || (objc_msgSend(v96, "isPersonalizableModel") & 1) == 0)
    {
      objc_msgSend(v96, "modelURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v28, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        objc_msgSend(v96, "modelURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v32;
        _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_INFO, "DEFAULT Loading adapted model from %@", buf, 0xCu);

      }
      v26 = CFSTR("classicMLModel");
    }
    else
    {
      v14 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v96, "modelConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "parameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "modelTag");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "EVALUATE Candidate model config: %@ model tag: %@", buf, 0x16u);

      }
      objc_msgSend(v96, "modelURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "modelConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v20, v21);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        objc_msgSend(v96, "modelURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);

      }
      v26 = CFSTR("adaptableMLModel");
    }
    v98 = v26;
    if ((objc_msgSend(v96, "isDefaultModel") & 1) != 0)
    {
      v33 = CFSTR("bothMatched");
    }
    else
    {
      v35 = objc_msgSend(v96, "isPersonalizableModel");
      v33 = CFSTR("personAndAppMatched");
      if (v35)
        v33 = CFSTR("predictedClass");
    }
    v106 = v33;
    v36 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v106;
      _os_log_impl(&dword_1A07F4000, v36, OS_LOG_TYPE_INFO, "Using prediction label name: %@", buf, 0xCu);
    }
    v94 = (void *)MEMORY[0x1A1AFCA24]();
    objc_msgSend(v96, "CDQuery");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation processDataWithQuery:balanceNeed:](self, "processDataWithQuery:balanceNeed:", v37, 0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      v40 = objc_msgSend(v100, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl(&dword_1A07F4000, v39, OS_LOG_TYPE_INFO, "Amount of data for evaluation: %ld", buf, 0xCu);

    }
    if (objc_msgSend(v100, "count"))
    {
      v42 = 0;
      v95 = 0;
      v107 = 0;
      v111 = 0;
      v104 = 0;
      v105 = 0;
      v102 = 0;
      *(_QWORD *)&v41 = 138412290;
      v93 = v41;
      while (1)
      {
        context = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v100, "objectAtIndexedSubscript:", v102);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPersonalizationEvaluation createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:](self, "createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:", v109, v98);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = (void *)objc_msgSend(objc_alloc((Class)getMLArrayBatchProviderClass_0()), "initWithFeatureProviderArray:", v101);
        v113 = v42;
        objc_msgSend(v97, "predictionsFromBatch:error:", v112, &v113);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v113;

        if (v103)
        {
          v44 = personalizationLog;
          if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v93;
            *(_QWORD *)&buf[4] = v103;
            _os_log_error_impl(&dword_1A07F4000, v44, OS_LOG_TYPE_ERROR, "ML model load to predict with error：%@", buf, 0xCu);
          }
        }
        v45 = (void *)personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          v46 = v45;
          v47 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v47;
          _os_log_impl(&dword_1A07F4000, v46, OS_LOG_TYPE_INFO, "Amount of predictions, %ld", buf, 0xCu);

        }
        if (objc_msgSend(v43, "count", v93) >= 1)
          break;
LABEL_48:
        v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v43, "count") >= 1)
        {
          v55 = 0;
          do
          {
            objc_msgSend(v109, "objectAtIndexedSubscript:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "featuresAtIndex:", v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "featureValueForName:", CFSTR("classProbability"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "dictionaryValue");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "objectForKeyedSubscript:", &unk_1E442AFE8);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "floatValue");
            v62 = v61;

            -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("recipientAndBundleIDAsInteger"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = [scoredRule alloc];
            objc_msgSend(v112, "featuresAtIndex:", v55);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "featureValueForName:", CFSTR("predictedClass"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "int64Value");
            objc_msgSend(v56, "objectAtIndexedSubscript:", (int)objc_msgSend(v64, "intValue"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v70 = v62 * 100.0;
            v71 = -[scoredRule initWithLabel:score:recipientUniqueID:](v65, "initWithLabel:score:recipientUniqueID:", v68, v69, v70);

            objc_msgSend(v108, "addObject:", v71);
            ++v55;
          }
          while (v55 < objc_msgSend(v43, "count"));
        }
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 0, sel_compare_);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "sortedArrayUsingDescriptors:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        if (objc_msgSend(v74, "count"))
        {
          v76 = 0;
          for (i = 0; i < objc_msgSend(v74, "count"); ++i)
          {
            -[_PSPersonalizationEvaluation topN](self, "topN");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = v76 < objc_msgSend(v78, "integerValue");

            if (!v79)
              break;
            objc_msgSend(v74, "objectAtIndexedSubscript:", i);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v80, "ruleLabel") == 1)
            {

              ++v95;
              break;
            }
            objc_msgSend(v80, "recipientUniqueID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v75, "containsObject:", v81);

            if ((v82 & 1) == 0)
            {
              objc_msgSend(v80, "recipientUniqueID");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "addObject:", v83);

              ++v76;
            }

          }
        }

        objc_autoreleasePoolPop(context);
        v84 = v103;
        v42 = v103;
        if (++v102 >= (unint64_t)objc_msgSend(v100, "count"))
          goto LABEL_63;
      }
      v48 = 0;
      while (1)
      {
        objc_msgSend(v43, "featuresAtIndex:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "featureValueForName:", v106);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "int64Value");

        objc_msgSend(v112, "featuresAtIndex:", v48);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "featureValueForName:", CFSTR("predictedClass"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "int64Value");

        if (v51 == v54)
        {
          ++v107;
          if (v51 == 1)
          {
            LODWORD(v104) = v104 + 1;
            ++v111;
LABEL_46:
            ++HIDWORD(v105);
            goto LABEL_47;
          }
          if (!v51)
            break;
        }
        ++v111;
        if (v54 == 1)
          goto LABEL_46;
        if (!v54)
          goto LABEL_44;
LABEL_47:
        if (++v48 >= objc_msgSend(v43, "count"))
          goto LABEL_48;
      }
      ++HIDWORD(v104);
      ++v111;
LABEL_44:
      LODWORD(v105) = v105 + 1;
      goto LABEL_47;
    }
    v104 = 0;
    v105 = 0;
    v111 = 0;
    v107 = 0;
    v95 = 0;
    v84 = 0;
LABEL_63:
    getODCurareReportFillerModelEvaluationClass();
    v85 = (void *)objc_opt_new();
    objc_msgSend(v85, "setMetricName:", CFSTR("engagement rate new"));
    objc_msgSend(v85, "setMetricValue:", (double)v95 * 100.0 / (double)(unint64_t)objc_msgSend(v100, "count"));
    objc_msgSend(v85, "setNumberOfPositiveSamples:", v95);
    objc_msgSend(v85, "setNumberOfSamples:", objc_msgSend(v100, "count"));
    getODCurareReportFillerModelEvaluationClass();
    v86 = (void *)objc_opt_new();
    objc_msgSend(v86, "setMetricName:", CFSTR("binary accuracy"));
    objc_msgSend(v86, "setMetricValue:", (double)v107 * 100.0 / (double)v111);
    objc_msgSend(v86, "setNumberOfPositiveSamples:", v107);
    objc_msgSend(v86, "setNumberOfSamples:", v111);
    getODCurareReportFillerModelEvaluationClass();
    v87 = (void *)objc_opt_new();
    objc_msgSend(v87, "setMetricName:", CFSTR("binary accuracy class 1"));
    objc_msgSend(v87, "setMetricValue:", (double)(int)v104 * 100.0 / (double)SHIDWORD(v105));
    objc_msgSend(v87, "setNumberOfPositiveSamples:", v104);
    objc_msgSend(v87, "setNumberOfSamples:", HIDWORD(v105));
    getODCurareReportFillerModelEvaluationClass();
    v88 = (void *)objc_opt_new();
    objc_msgSend(v88, "setMetricName:", CFSTR("binary accuracy class 0"));
    objc_msgSend(v88, "setMetricValue:", (double)SHIDWORD(v104) * 100.0 / (double)(int)v105);
    objc_msgSend(v88, "setNumberOfPositiveSamples:", HIDWORD(v104));
    objc_msgSend(v88, "setNumberOfSamples:", v105);
    -[_PSPersonalizationEvaluation _getDataStatistics:forData:](self, "_getDataStatistics:forData:", v98, v100);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0;
    v115 = &v114;
    v116 = 0x2050000000;
    v90 = (void *)getODCurareReportFillerModelEvaluationSummaryClass_softClass;
    v117 = getODCurareReportFillerModelEvaluationSummaryClass_softClass;
    if (!getODCurareReportFillerModelEvaluationSummaryClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getODCurareReportFillerModelEvaluationSummaryClass_block_invoke;
      v120 = &unk_1E43FEA00;
      v121 = &v114;
      __getODCurareReportFillerModelEvaluationSummaryClass_block_invoke((uint64_t)buf);
      v90 = (void *)v115[3];
    }
    v91 = objc_retainAutorelease(v90);
    _Block_object_dispose(&v114, 8);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v34, "addModelEvaluationResults:", v85);
    objc_msgSend(v34, "addModelEvaluationResults:", v86);
    objc_msgSend(v34, "addModelEvaluationResults:", v87);
    objc_msgSend(v34, "addModelEvaluationResults:", v88);
    if (!-[_PSPersonalizationEvaluation evaluateIsInvokedOnce](self, "evaluateIsInvokedOnce"))
    {
      objc_msgSend(v34, "setDataUsedToEvaluateModel:", v89);
      -[_PSPersonalizationEvaluation setEvaluateIsInvokedOnce:](self, "setEvaluateIsInvokedOnce:", 1);
    }

    objc_autoreleasePoolPop(v94);
  }

  return v34;
}

- (void)adaptMLModel:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a3;
  -[_PSPersonalizationEvaluation createMLArrayBatchProviderWithMLModelType:withDataArray:](self, "createMLArrayBatchProviderWithMLModelType:withDataArray:", a4, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation adaptMLModel:withTrainingData:modelConfiguration:](self, "adaptMLModel:withTrainingData:modelConfiguration:", v11, v12, v10);

}

- (id)createMLArrayBatchProviderWithMLModelType:(id)a3 withDataArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[_PSPersonalizationEvaluation createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:](self, "createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), v6, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(objc_alloc((Class)getMLArrayBatchProviderClass_0()), "initWithFeatureProviderArray:", v8);
  return v15;
}

- (void)setParametersForHyperparmeters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "numTrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation setNumTrees:](self, "setNumTrees:", v5);

  objc_msgSend(v4, "learningRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation setLearningRate:](self, "setLearningRate:", v6);

  objc_msgSend(v4, "minChildWeight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation setMinChildWeight:](self, "setMinChildWeight:", v7);

  v8 = objc_msgSend(v4, "adaptationStrategy");
  -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", v8);
}

- (void)setParametersFromRecipeForCandidateModel:(id)a3
{
  id v4;

  objc_msgSend(a3, "modelConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation setAdaptableModelConfiguration:](self, "setAdaptableModelConfiguration:", v4);

}

- (id)hyperparametersForCandidateModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  -[_PSPersonalizationEvaluation modelTagToHyperparameters](self, "modelTagToHyperparameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getODCurareReportFillerModelHyperparametersClass_softClass;
  v20 = getODCurareReportFillerModelHyperparametersClass_softClass;
  if (!getODCurareReportFillerModelHyperparametersClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getODCurareReportFillerModelHyperparametersClass_block_invoke;
    v16[3] = &unk_1E43FEA00;
    v16[4] = &v17;
    __getODCurareReportFillerModelHyperparametersClass_block_invoke((uint64_t)v16);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setVersionNumber:", 1);
  objc_msgSend(v10, "addHyperparameterIndices:", 0);
  objc_msgSend(v7, "numTrees");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v10, "addHyperparameterValues:");

  objc_msgSend(v10, "addHyperparameterIndices:", 1);
  objc_msgSend(v7, "learningRate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v10, "addHyperparameterValues:");

  objc_msgSend(v10, "addHyperparameterIndices:", 2);
  objc_msgSend(v7, "minChildWeight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v10, "addHyperparameterValues:");

  objc_msgSend(v10, "addHyperparameterIndices:", 3);
  *(float *)&v14 = (float)objc_msgSend(v7, "adaptationStrategy");
  objc_msgSend(v10, "addHyperparameterValues:", v14);

  return v10;
}

- (id)personalizeModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE buf[24];
  void *v54;
  uint64_t *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!(*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  v5 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "Arrived in NEW personalize method", buf, 2u);
  }
  -[_PSPersonalizationEvaluation setParametersFromRecipeForCandidateModel:](self, "setParametersFromRecipeForCandidateModel:", v4);
  objc_msgSend(v4, "CDQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  v8 = (void *)personalizationLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation personalizeModel:].cold.1();
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v4, "CDQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);

  }
  v13 = objc_msgSend(v4, "isDefaultModel");
  v14 = personalizationLog;
  v15 = os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_INFO, "Candidate model was default, not ok!!", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v15)
  {
    v18 = v14;
    -[_PSPersonalizationEvaluation numTrees](self, "numTrees");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation maxDepth](self, "maxDepth");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "Personalizing with numTrees: %@, maxDepth: %@", buf, 0x16u);

  }
  v21 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    objc_msgSend(v4, "modelURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v24;
    _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);

  }
  v25 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(v4, "CDQuery");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation processDataWithQuery:balanceNeed:](self, "processDataWithQuery:balanceNeed:", v26, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v29 = v28;
    v30 = objc_msgSend(v27, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v30;
    _os_log_impl(&dword_1A07F4000, v29, OS_LOG_TYPE_INFO, "Amount of sharing sessions used for personalization: %ld", buf, 0xCu);

  }
  -[_PSPersonalizationEvaluation adaptableModelDeployPath](self, "adaptableModelDeployPath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:](self, "loadAdaptableModelUnderDirectory:", v31);

  v33 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v34 = v33;
    objc_msgSend(v4, "modelConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "parameters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelTag");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    _os_log_impl(&dword_1A07F4000, v34, OS_LOG_TYPE_INFO, "PERSONALIZE Candidate model config: %@ model tag: %@", buf, 0x16u);

  }
  -[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelConfiguration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation updateMLModelWithURL:withMLModelType:withDataArray:modelConfiguration:](self, "updateMLModelWithURL:withMLModelType:withDataArray:modelConfiguration:", v38, CFSTR("adaptableMLModel"), v27, v39);

  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v40 = (void *)getODCurareReportFillerModelInformationClass_softClass;
  v52 = getODCurareReportFillerModelInformationClass_softClass;
  if (!getODCurareReportFillerModelInformationClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getODCurareReportFillerModelInformationClass_block_invoke;
    v54 = &unk_1E43FEA00;
    v55 = &v49;
    __getODCurareReportFillerModelInformationClass_block_invoke((uint64_t)buf);
    v40 = (void *)v50[3];
  }
  v41 = objc_retainAutorelease(v40);
  _Block_object_dispose(&v49, 8);
  v42 = (void *)objc_opt_new();
  objc_msgSend(v42, "setIsDefaultModel:", 0);
  -[_PSPersonalizationEvaluation _getDataStatistics:forData:](self, "_getDataStatistics:forData:", CFSTR("adaptableMLModel"), v27);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setDataUsedToPersonalizeModel:", v43);

  -[_PSPersonalizationEvaluation hyperparametersForCandidateModel:](self, "hyperparametersForCandidateModel:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setModelHyperparameters:", v44);

  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v45 = (void *)getODCurareModelInformationClass_softClass;
  v52 = getODCurareModelInformationClass_softClass;
  if (!getODCurareModelInformationClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getODCurareModelInformationClass_block_invoke;
    v54 = &unk_1E43FEA00;
    v55 = &v49;
    __getODCurareModelInformationClass_block_invoke((uint64_t)buf);
    v45 = (void *)v50[3];
  }
  v46 = objc_retainAutorelease(v45);
  _Block_object_dispose(&v49, 8);
  v47 = [v46 alloc];
  -[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v47, "initWithModelInformation:modelURL:", v42, v48);

  NSLog(CFSTR("personalizeModel return: ODCurareModelInformation: %@"), v16);
  objc_autoreleasePoolPop(v25);
LABEL_13:

  return v16;
}

- (void)generateCandidateModels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  ModelHyperparameters *v63;
  int64_t v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id obj;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint8_t v143[128];
  uint8_t buf[4];
  uint64_t v145;
  __int16 v146;
  void *v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  void *v152;
  void *v153;
  void *v154;
  _QWORD v155[4];

  v155[1] = *MEMORY[0x1E0C80C00];
  if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
    v3 = (void *)objc_opt_new();
    -[_PSPersonalizationEvaluation setModelTagToHyperparameters:](self, "setModelTagToHyperparameters:", v3);

    v4 = (void *)objc_opt_new();
    -[_PSPersonalizationEvaluation setModelTagToCandidateModel:](self, "setModelTagToCandidateModel:", v4);

    -[_PSPersonalizationEvaluation numTrees](self, "numTrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("numTrees"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numTrees"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[_PSPersonalizationEvaluation recipe](self, "recipe");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("numTrees"));
        v14 = objc_claimAutoreleasedReturnValue();

        v15 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v145 = v14;
          _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "Setting numTrees to: %@", buf, 0xCu);
        }
        v6 = (void *)v14;
      }
    }
    else
    {

    }
    -[_PSPersonalizationEvaluation learningRate](self, "learningRate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("learningRate"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("learningRate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();

      if ((v22 & 1) != 0)
      {
        -[_PSPersonalizationEvaluation recipe](self, "recipe");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("learningRate"));
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v145 = v24;
          _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Setting learningRate to: %@", buf, 0xCu);
        }
        v102 = (void *)v24;
      }
    }
    else
    {

    }
    -[_PSPersonalizationEvaluation minChildWeight](self, "minChildWeight");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("minChildWeight"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("minChildWeight"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) != 0)
      {
        -[_PSPersonalizationEvaluation recipe](self, "recipe");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("minChildWeight"));
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v145 = v34;
          _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "Setting minChildWeight to: %@", buf, 0xCu);
        }
        v106 = (void *)v34;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSPersonalizationEvaluation adaptationStrategy](self, "adaptationStrategy"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("adaptationStrategy"));
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("adaptationStrategy"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v42 = objc_opt_isKindOfClass();

      if ((v42 & 1) != 0)
      {
        -[_PSPersonalizationEvaluation recipe](self, "recipe");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("adaptationStrategy"));
        v44 = objc_claimAutoreleasedReturnValue();

        v45 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v145 = v44;
          _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_INFO, "Setting adaptationStrategy to: %@", buf, 0xCu);
        }
        v111 = (void *)v44;
      }
    }
    else
    {

    }
    v46 = (void *)MEMORY[0x1E0C99E98];
    +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedAdaptableCompiledMLModelPath");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "URLWithString:", v47);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = (void *)MEMORY[0x1E0C99E98];
    +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedCompiledMLModelPath");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "URLWithString:", v49);
    v99 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D15AF8], "behavioralRuleFeaturesStream");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "name");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    obj = v6;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
    if (v103)
    {
      v51 = 0;
      v101 = *(_QWORD *)v140;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v140 != v101)
          {
            v53 = v52;
            objc_enumerationMutation(obj);
            v52 = v53;
          }
          v104 = v52;
          v116 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * v52);
          v135 = 0u;
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v105 = v102;
          v108 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
          if (v108)
          {
            v107 = *(_QWORD *)v136;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v136 != v107)
                {
                  v55 = v54;
                  objc_enumerationMutation(v105);
                  v54 = v55;
                }
                v109 = v54;
                v119 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * v54);
                v131 = 0u;
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v110 = v106;
                v113 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v131, v149, 16);
                if (v113)
                {
                  v112 = *(_QWORD *)v132;
                  do
                  {
                    for (i = 0; i != v113; ++i)
                    {
                      if (*(_QWORD *)v132 != v112)
                        objc_enumerationMutation(v110);
                      v121 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i);
                      v127 = 0u;
                      v128 = 0u;
                      v129 = 0u;
                      v130 = 0u;
                      v115 = v111;
                      v57 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v127, v148, 16);
                      if (v57)
                      {
                        v58 = v57;
                        v114 = i;
                        v120 = *(_QWORD *)v128;
                        do
                        {
                          v59 = 0;
                          v60 = v51;
                          do
                          {
                            if (*(_QWORD *)v128 != v120)
                              objc_enumerationMutation(v115);
                            v61 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v59);
                            v62 = (void *)MEMORY[0x1A1AFCA24]();
                            -[_PSPersonalizationEvaluation setParametersFromRecipe](self, "setParametersFromRecipe");
                            v63 = -[ModelHyperparameters initWithNumTrees:learningRate:minChildWeight:adaptationStrategy:]([ModelHyperparameters alloc], "initWithNumTrees:learningRate:minChildWeight:adaptationStrategy:", v116, v119, v121, v61);
                            -[_PSPersonalizationEvaluation setParametersForHyperparmeters:](self, "setParametersForHyperparmeters:", v63);
                            v64 = -[_PSPersonalizationEvaluation adaptationStrategy](self, "adaptationStrategy");
                            -[_PSPersonalizationEvaluation numTrees](self, "numTrees");
                            v65 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_PSPersonalizationEvaluation updateAdaptableModelConfigWithUpdateType:numTrees:](self, "updateAdaptableModelConfigWithUpdateType:numTrees:", v64, v65);

                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model_%d"), v60 + v59);
                            v66 = (void *)objc_claimAutoreleasedReturnValue();
                            v67 = (void *)personalizationLog;
                            if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                            {
                              v68 = v67;
                              -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
                              v69 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v69, "parameters");
                              v70 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412546;
                              v145 = (uint64_t)v70;
                              v146 = 2112;
                              v147 = v66;
                              _os_log_impl(&dword_1A07F4000, v68, OS_LOG_TYPE_INFO, "Candidate model config: %@ model tag: %@", buf, 0x16u);

                            }
                            v71 = objc_alloc((Class)getODCurareCandidateModelClass());
                            -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
                            v72 = (void *)objc_claimAutoreleasedReturnValue();
                            v73 = (void *)objc_msgSend(v71, "initWithModelURL:withCoreDuetStreamIdentifier:andMetadata:", v118, v117, v72);

                            objc_msgSend(v73, "setModelTag:", v66);
                            objc_msgSend(v73, "setIsDefaultModel:", 0);
                            objc_msgSend(v73, "setIsPersonalizableModel:", 1);
                            -[_PSPersonalizationEvaluation modelTagToCandidateModel](self, "modelTagToCandidateModel");
                            v74 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, v66);

                            -[_PSPersonalizationEvaluation modelTagToHyperparameters](self, "modelTagToHyperparameters");
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v75, "setObject:forKeyedSubscript:", v63, v66);

                            -[_PSPersonalizationEvaluation setParametersFromRecipe](self, "setParametersFromRecipe");
                            objc_autoreleasePoolPop(v62);
                            ++v59;
                          }
                          while (v58 != v59);
                          v58 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v127, v148, 16);
                          v51 = (v60 + v59);
                        }
                        while (v58);
                        v51 = (v60 + v59);
                        i = v114;
                      }

                    }
                    v113 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v131, v149, 16);
                  }
                  while (v113);
                }

                v54 = v109 + 1;
              }
              while (v109 + 1 != v108);
              v108 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v135, v150, 16);
            }
            while (v108);
          }

          v52 = v104 + 1;
        }
        while (v104 + 1 != v103);
        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
      }
      while (v103);
    }

    v76 = (void *)v99;
    v77 = (void *)objc_msgSend(objc_alloc((Class)getODCurareCandidateModelClass()), "initWithModelURL:withCoreDuetStreamIdentifier:andMetadata:", v99, v117, 0);
    objc_msgSend(v77, "setModelTag:", CFSTR("default_model"));
    objc_msgSend(v77, "setIsDefaultModel:", 1);
    objc_msgSend(v77, "setIsPersonalizableModel:", 0);
    -[_PSPersonalizationEvaluation modelTagToCandidateModel](self, "modelTagToCandidateModel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, CFSTR("default_model"));

    -[_PSPersonalizationEvaluation recipe](self, "recipe");
    v79 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("shadowEvaluationModels"));
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v81 = (void *)v80;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("shadowEvaluationModels"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v84 = objc_opt_isKindOfClass();

      if ((v84 & 1) == 0)
      {
LABEL_68:

        return;
      }
      v122 = v77;
      -[_PSPersonalizationEvaluation recipe](self, "recipe");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("shadowEvaluationModels"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v79 = v86;
      v87 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
      if (v87)
      {
        v88 = v87;
        v89 = *(_QWORD *)v124;
        do
        {
          for (j = 0; j != v88; ++j)
          {
            if (*(_QWORD *)v124 != v89)
              objc_enumerationMutation(v79);
            v91 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * j);
            v92 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v79, "objectForKeyedSubscript:", v91);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "stringByAddingPercentEncodingWithAllowedCharacters:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "URLWithString:", v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            v97 = (void *)objc_msgSend(objc_alloc((Class)getODCurareCandidateModelClass()), "initWithModelURL:withCoreDuetStreamIdentifier:andMetadata:", v96, v117, 0);
            objc_msgSend(v97, "setModelTag:", v91);
            objc_msgSend(v97, "setIsDefaultModel:", 0);
            objc_msgSend(v97, "setIsPersonalizableModel:", 0);
            -[_PSPersonalizationEvaluation modelTagToCandidateModel](self, "modelTagToCandidateModel");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, v91);

          }
          v88 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v123, v143, 16);
        }
        while (v88);
      }

      v76 = (void *)v99;
      v77 = v122;
    }

    goto LABEL_68;
  }
}

- (id)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:(id)a3 adaptableModelDeployPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 buf;
  Class (*v47)(uint64_t);
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_PSPersonalizationEvaluation performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:](self, "performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:", v6))
  {
    if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Curare evaluation and dignostics framework will be used", (uint8_t *)&buf, 2u);
      }
      v41 = 0;
      v42 = &v41;
      v43 = 0x2050000000;
      v10 = (void *)getODCurareDataCachePruningPolicyObjectClass_softClass;
      v44 = getODCurareDataCachePruningPolicyObjectClass_softClass;
      if (!getODCurareDataCachePruningPolicyObjectClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v47 = __getODCurareDataCachePruningPolicyObjectClass_block_invoke;
        v48 = &unk_1E43FEA00;
        v49 = &v41;
        __getODCurareDataCachePruningPolicyObjectClass_block_invoke((uint64_t)&buf);
        v10 = (void *)v42[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v41, 8);
      v12 = (void *)objc_msgSend([v11 alloc], "initWithMaximumNumberOfDays:maximumNumberOfEvents:", 28, 28);
      v41 = 0;
      v42 = &v41;
      v43 = 0x2050000000;
      v13 = (void *)getODCurareEvaluationAndReportingModuleClass_softClass;
      v44 = getODCurareEvaluationAndReportingModuleClass_softClass;
      if (!getODCurareEvaluationAndReportingModuleClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v47 = __getODCurareEvaluationAndReportingModuleClass_block_invoke;
        v48 = &unk_1E43FEA00;
        v49 = &v41;
        __getODCurareEvaluationAndReportingModuleClass_block_invoke((uint64_t)&buf);
        v13 = (void *)v42[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v41, 8);
      v15 = [v14 alloc];
      objc_msgSend(v8, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v17 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:error:", v16, self, self, self, v12, &v40);
      v18 = v40;
      -[_PSPersonalizationEvaluation setCurareEvaluationAndReporting:](self, "setCurareEvaluationAndReporting:", v17);

      if (v18)
      {
        v19 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Failed to create ODCurareEvaluationAndReporting instance with error %@", (uint8_t *)&buf, 0xCu);
        }
        objc_msgSend(v18, "localizedDescription");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[_PSPersonalizationEvaluation generateCandidateModels](self, "generateCandidateModels");
        -[_PSPersonalizationEvaluation modelTagToCandidateModel](self, "modelTagToCandidateModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
        {
          v41 = 0;
          v42 = &v41;
          v43 = 0x2050000000;
          v23 = (void *)getODCurareModelSelectionParameterClass_softClass;
          v44 = getODCurareModelSelectionParameterClass_softClass;
          if (!getODCurareModelSelectionParameterClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v47 = __getODCurareModelSelectionParameterClass_block_invoke;
            v48 = &unk_1E43FEA00;
            v49 = &v41;
            __getODCurareModelSelectionParameterClass_block_invoke((uint64_t)&buf);
            v23 = (void *)v42[3];
          }
          v24 = objc_retainAutorelease(v23);
          _Block_object_dispose(&v41, 8);
          v25 = (void *)objc_msgSend([v24 alloc], "initWithMetricName:percentageIncrease:", CFSTR("engagement rate new"), 0.05);
          v45 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0;
          v42 = &v41;
          v43 = 0x2050000000;
          v27 = (void *)getODCurareModelSelectionPolicyClass_softClass;
          v44 = getODCurareModelSelectionPolicyClass_softClass;
          if (!getODCurareModelSelectionPolicyClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v47 = __getODCurareModelSelectionPolicyClass_block_invoke;
            v48 = &unk_1E43FEA00;
            v49 = &v41;
            __getODCurareModelSelectionPolicyClass_block_invoke((uint64_t)&buf);
            v27 = (void *)v42[3];
          }
          v28 = objc_retainAutorelease(v27);
          _Block_object_dispose(&v41, 8);
          v37 = (void *)objc_msgSend([v28 alloc], "initWithModelSelectionParameters:minimumNumberOfEvaluations:minimumNumberOfSamples:", v26, &unk_1E442B060, 0);
          v41 = 0;
          v42 = &v41;
          v43 = 0x2050000000;
          v29 = (void *)getODCurarePersonalizationPolicyClass_softClass;
          v44 = getODCurarePersonalizationPolicyClass_softClass;
          if (!getODCurarePersonalizationPolicyClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v47 = __getODCurarePersonalizationPolicyClass_block_invoke;
            v48 = &unk_1E43FEA00;
            v49 = &v41;
            __getODCurarePersonalizationPolicyClass_block_invoke((uint64_t)&buf);
            v29 = (void *)v42[3];
          }
          v30 = objc_retainAutorelease(v29);
          _Block_object_dispose(&v41, 8);
          v31 = (void *)objc_msgSend([v30 alloc], "initWithModelSelectionParameters:minimumNumberOfSamplesForPersonalization:minimumNumberOfSamplesForPersonalizationSelection:", v26, &unk_1E442AFA0, &unk_1E442B060);
          -[_PSPersonalizationEvaluation curareEvaluationAndReporting](self, "curareEvaluationAndReporting");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v32, "trainAndEvaluateModelsWithCandidateModels:personalizationPolicy:selectionPolicy:error:", v22, v31, v37, &v39);
          v18 = v39;

          if (v18)
          {
            if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
              -[_PSPersonalizationEvaluation runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:].cold.2();
            objc_msgSend(v18, "localizedDescription");
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
          {
            -[_PSPersonalizationEvaluation curareEvaluationAndReporting](self, "curareEvaluationAndReporting");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0;
            objc_msgSend(v33, "getSelectedModel:", &v38);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v38;

            v35 = personalizationLog;
            if (v18)
            {
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
                -[_PSPersonalizationEvaluation runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:].cold.1();
              objc_msgSend(v18, "localizedDescription");
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v34;
                _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "Model: %@", (uint8_t *)&buf, 0xCu);
              }
              v20 = &stru_1E4402490;
            }

          }
          else
          {
            v18 = 0;
            v20 = CFSTR("Asked to stop");
          }

        }
        else
        {
          v18 = 0;
          v20 = CFSTR("Asked to stop");
        }

      }
    }
    else
    {
      v20 = CFSTR("Asked to stop");
    }
  }
  else
  {
    v20 = CFSTR("Prereqs are not satisfied");
  }

  return v20;
}

- (id)loadDefaultModel
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledMLModelPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v2;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "dodML is trying to load trialCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
  }
  +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v2;
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, "Trial model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
    }
    v7 = v5;
  }
  else
  {
    +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedCompiledMLModelPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "dodML is trying to load deployedCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
    }
    +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v8, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v10 = personalizationLog;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Deployed default model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
      }
      v11 = v7;
    }
    else if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
    {
      -[_PSPersonalizationEvaluation loadDefaultModel].cold.1();
    }

  }
  return v7;
}

- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:](_PSBehaviorRuleRankingUtilities, "removeFolderAtPath:", v10))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v25 = 0;
    v14 = objc_msgSend(v13, "copyItemAtPath:toPath:error:", v9, v10, &v25);
    v15 = v25;
    if (v15 || (v14 & 1) == 0)
    {
      v22 = personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v9;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v15;
        _os_log_error_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_ERROR, "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@", buf, 0x20u);
      }
      v20 = 0;
    }
    else
    {
      objc_msgSend(v10, "stringByAppendingString:", CFSTR("/"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "stringByAppendingString:", CFSTR("/"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      v20 = objc_msgSend(v13, "moveItemAtPath:toPath:error:", v17, v19, &v24);
      v15 = v24;
      if (v15)
        v20 = 0;
      if ((v20 & 1) == 0)
      {
        v21 = personalizationLog;
        if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v27 = v17;
          v28 = 2112;
          v29 = v19;
          v30 = 2112;
          v31 = v15;
          _os_log_error_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_ERROR, "While cloning adaptable model, renaming file with path:%@ to path:%@ failed with error：%@", buf, 0x20u);
        }
      }

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:].cold.1();
    v20 = 0;
  }

  return v20;
}

- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4
{
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[7];
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v6 = (void *)getMLModelConfigurationClass_softClass_1;
  v41 = getMLModelConfigurationClass_softClass_1;
  if (!getMLModelConfigurationClass_softClass_1)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __getMLModelConfigurationClass_block_invoke_1;
    v37[3] = &unk_1E43FEA00;
    v37[4] = &v38;
    __getMLModelConfigurationClass_block_invoke_1((uint64_t)v37);
    v6 = (void *)v39[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v38, 8);
  v8 = objc_alloc_init(v7);
  -[_PSPersonalizationEvaluation setAdaptableModelConfiguration:](self, "setAdaptableModelConfiguration:", v8);

  -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setComputeUnits:", 0);

  objc_msgSend(getMLParameterKeyClass_0(), "numClasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v44[0] = v35;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation numClasses](self, "numClasses");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", objc_msgSend(v34, "intValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v33;
    objc_msgSend(getMLParameterKeyClass_0(), "numTrees");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v36, "intValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v31;
    objc_msgSend(getMLParameterKeyClass_0(), "maxDepth");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v30;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation maxDepth](self, "maxDepth");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v29, "intValue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v28;
    objc_msgSend(getMLParameterKeyClass_0(), "learningRate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v12;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation learningRate](self, "learningRate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v13, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v15;
    objc_msgSend(getMLParameterKeyClass_0(), "minChildWeight");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v16;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation minChildWeight](self, "minChildWeight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v17, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v19;
    objc_msgSend(getMLParameterKeyClass_0(), "objective");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[5] = v20;
    v45[5] = CFSTR("binary:logistic");
    objc_msgSend(getMLParameterKeyClass_0(), "updateType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v21;
    v45[6] = CFSTR("treeRefresh");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setParameters:", v22);

  }
  else
  {
    v42[0] = v35;
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation numClasses](self, "numClasses");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInt:", objc_msgSend(v34, "intValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v33;
    objc_msgSend(getMLParameterKeyClass_0(), "numTrees");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v36, "intValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v31;
    objc_msgSend(getMLParameterKeyClass_0(), "maxDepth");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v30;
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation maxDepth](self, "maxDepth");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithInt:", objc_msgSend(v29, "intValue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v28;
    objc_msgSend(getMLParameterKeyClass_0(), "learningRate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v12;
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation learningRate](self, "learningRate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v26, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v15;
    objc_msgSend(getMLParameterKeyClass_0(), "minChildWeight");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v16;
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSPersonalizationEvaluation minChildWeight](self, "minChildWeight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v27, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v19;
    objc_msgSend(getMLParameterKeyClass_0(), "objective");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v20;
    v43[5] = CFSTR("binary:logistic");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setParameters:", v21);
  }

}

- (id)loadAdaptableModelUnderDirectory:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v5 = -[_PSPersonalizationEvaluation adaptationStrategy](self, "adaptationStrategy");
  -[_PSPersonalizationEvaluation numTrees](self, "numTrees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation updateAdaptableModelConfigWithUpdateType:numTrees:](self, "updateAdaptableModelConfigWithUpdateType:numTrees:", v5, v6);

  +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:](_PSBehaviorRuleRankingUtilities, "loadDeployedAdaptableModelUnderDirectory:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  +[_PSBehaviorRuleRankingUtilities getIntermediateAdaptableCompiledMLModel](_PSBehaviorRuleRankingUtilities, "getIntermediateAdaptableCompiledMLModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledAdaptableMLModelPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fileExistsAtPath:", v9))
  {
    if (-[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:](self, "cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:", v9, v8, CFSTR("TrialAdaptableRuleImportancePredictor.xgboost"), CFSTR("IntermediateAdaptableModel.xgboost")))
    {
      goto LABEL_3;
    }
LABEL_12:
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:].cold.2();
    goto LABEL_17;
  }
  +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getDeployedAdaptableCompiledMLModelPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "fileExistsAtPath:", v20) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:].cold.3();

    goto LABEL_17;
  }
  v21 = -[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:](self, "cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:", v20, v8, CFSTR("AdaptableRuleImportancePredictor.xgboost"), CFSTR("IntermediateAdaptableModel.xgboost"));

  if (!v21)
    goto LABEL_12;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v8);
  -[_PSPersonalizationEvaluation setIntermediateCompiledModelURL:](self, "setIntermediateCompiledModelURL:", v10);

  -[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_17:
    v19 = 0;
    goto LABEL_22;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v12 = (void *)getMLModelClass_softClass_6;
  v32 = getMLModelClass_softClass_6;
  if (!getMLModelClass_softClass_6)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getMLModelClass_block_invoke_6;
    v27 = &unk_1E43FEA00;
    v28 = &v29;
    __getMLModelClass_block_invoke_6((uint64_t)buf);
    v12 = (void *)v30[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v29, 8);
  -[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v13, "modelWithContentsOfURL:configuration:error:", v14, v15, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;

  v18 = personalizationLog;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
      -[_PSPersonalizationEvaluation loadAdaptableModelUnderDirectory:].cold.1(v18, self, (uint64_t)v17);
    v19 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "Cloning adaptable ML model to intermediate model and loading it was successful", buf, 2u);
    }
    v19 = v16;
  }

LABEL_22:
  return v19;
}

- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4
{
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t m;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t n;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  unint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  id v133;
  id v135;
  unint64_t v136;
  uint64_t v137;
  void *context;
  _BOOL4 v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  id obj;
  unsigned int v145;
  void *v146;
  uint64_t v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  unint64_t v152;
  void *v153;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  id v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  uint8_t v195[128];
  uint8_t buf[4];
  void *v197;
  uint64_t v198;

  v139 = a4;
  v198 = *MEMORY[0x1E0C80C00];
  v135 = a3;
  v4 = 0x1E0C99000uLL;
  v141 = (void *)objc_opt_new();
  v140 = (void *)objc_opt_new();
  v5 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "In processDataWithQuery", buf, 2u);
  }
  v6 = 0;
  v7 = 0;
  v8 = 10;
  while (1)
  {
    v136 = v8;
    context = (void *)MEMORY[0x1A1AFCA24]();
    objc_msgSend(v135, "setLimit:", 10);
    v137 = v6;
    objc_msgSend(v135, "setOffset:", v6);
    -[_PSPersonalizationEvaluation knowledgeStore](self, "knowledgeStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = 0;
    objc_msgSend(v9, "executeQuery:error:", v135, &v187);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v187;

    v12 = (void *)personalizationLog;
    if (v11)
      break;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = v12;
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v197 = v15;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);

    }
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    obj = v10;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v184;
      v142 = *(_QWORD *)v184;
      do
      {
        v19 = 0;
        v143 = v17;
        do
        {
          if (*(_QWORD *)v184 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v19);
          if (v20)
          {
            v146 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v19);
            v147 = v19;
            objc_msgSend(v20, "metadata");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D159B0], "featureDict");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v153 = v23;
            if (v23)
            {
              v24 = (void *)personalizationLog;
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                v25 = (void *)MEMORY[0x1E0CB37E8];
                v26 = v24;
                objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v197 = v27;
                _os_log_impl(&dword_1A07F4000, v26, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);

              }
              if (objc_msgSend(v23, "count", v135))
              {
                v7 = (v7 + 1);
                v28 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  v29 = (void *)MEMORY[0x1E0CB37E8];
                  v30 = v28;
                  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v197 = v32;
                  _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);

                }
              }
              v33 = (void *)personalizationLog;
              if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
              {
                v34 = (void *)MEMORY[0x1E0CB37E8];
                v35 = v33;
                objc_msgSend(v34, "numberWithInt:", v7);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v197 = v36;
                _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);

              }
              v145 = v7;
              if ((_DWORD)v7 == 1 && objc_msgSend(v153, "count"))
              {
                -[_PSPersonalizationEvaluation selectedFeaturesConfig](self, "selectedFeaturesConfig");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                -[_PSPersonalizationEvaluation setFeatureNameDict:](self, "setFeatureNameDict:", v39);

                v181 = 0u;
                v182 = 0u;
                v179 = 0u;
                v180 = 0u;
                v40 = v38;
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
                if (v41)
                {
                  v42 = 0;
                  v43 = *(_QWORD *)v180;
                  do
                  {
                    v44 = 0;
                    v45 = v42;
                    do
                    {
                      if (*(_QWORD *)v180 != v43)
                        objc_enumerationMutation(v40);
                      v46 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * v44);
                      -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45 + v44);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "setValue:forKey:", v48, v46);

                      ++v44;
                    }
                    while (v41 != v44);
                    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
                    v42 = (v45 + v44);
                  }
                  while (v41);
                  v41 = (v45 + v44);
                }

                -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setValue:forKey:", v50, CFSTR("personAndAppMatched"));

                -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v41 + 1));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setValue:forKey:", v52, CFSTR("recipientAndBundleIDAsInteger"));

                -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v41 + 2));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setValue:forKey:", v54, CFSTR("predictedClass"));

                v55 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  v56 = v55;
                  -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v197 = v57;
                  _os_log_impl(&dword_1A07F4000, v56, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);

                }
              }
              v149 = objc_alloc_init(*(Class *)(v4 + 3560));
              if (v139)
              {
                v148 = objc_alloc_init(*(Class *)(v4 + 3560));
                if (objc_msgSend(v153, "count"))
                {
                  v151 = 0;
                  while (1)
                  {
                    v58 = objc_alloc_init(*(Class *)(v4 + 3560));
                    v175 = 0u;
                    v176 = 0u;
                    v177 = 0u;
                    v178 = 0u;
                    -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
                    if (v60)
                    {
                      v61 = v60;
                      v62 = *(_QWORD *)v176;
                      do
                      {
                        for (i = 0; i != v61; ++i)
                        {
                          if (*(_QWORD *)v176 != v62)
                            objc_enumerationMutation(v59);
                          if ((objc_msgSend(*(id *)(*((_QWORD *)&v175 + 1) + 8 * i), "isEqualToString:", CFSTR("predictedClass")) & 1) == 0)
                          {
                            v64 = (void *)objc_opt_new();
                            objc_msgSend(v58, "addObject:", v64);

                          }
                        }
                        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
                      }
                      while (v61);
                    }

                    v173 = 0u;
                    v174 = 0u;
                    v171 = 0u;
                    v172 = 0u;
                    -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v171, v192, 16);
                    if (!v66)
                      break;
                    v67 = v66;
                    v68 = 0;
                    v69 = *(_QWORD *)v172;
                    v150 = v65;
                    do
                    {
                      for (j = 0; j != v67; ++j)
                      {
                        if (*(_QWORD *)v172 != v69)
                          objc_enumerationMutation(v150);
                        v71 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
                        if ((objc_msgSend(v71, "isEqualToString:", CFSTR("predictedClass")) & 1) == 0)
                        {
                          -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v72, "objectForKeyedSubscript:", v71);
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          v74 = objc_msgSend(v73, "intValue");
                          v75 = objc_msgSend(v58, "count");

                          if (v75 > v74)
                          {
                            objc_msgSend(v153, "objectAtIndexedSubscript:", v151);
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v76, "objectForKeyedSubscript:", v71);
                            v77 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                            v78 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v78, "objectForKeyedSubscript:", v71);
                            v79 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v58, "setObject:atIndexedSubscript:", v77, (int)objc_msgSend(v79, "intValue"));

                          }
                        }
                        if (objc_msgSend(v71, "isEqualToString:", CFSTR("personAndAppMatched")))
                        {
                          objc_msgSend(v153, "objectAtIndexedSubscript:", v151);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v80, "objectForKeyedSubscript:", v71);
                          v81 = (void *)objc_claimAutoreleasedReturnValue();

                          v68 |= objc_msgSend(v81, "intValue") == 1;
                        }
                      }
                      v67 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v171, v192, 16);
                    }
                    while (v67);

                    v4 = 0x1E0C99000;
                    if ((v68 & 1) == 0)
                      goto LABEL_61;
                    v82 = (void *)objc_msgSend(v58, "copy");
                    v83 = v149;
LABEL_62:
                    objc_msgSend(v83, "addObject:", v82);

                    if (objc_msgSend(v153, "count") <= (unint64_t)++v151)
                      goto LABEL_63;
                  }

LABEL_61:
                  v82 = (void *)objc_msgSend(v58, "copy");
                  v83 = v148;
                  goto LABEL_62;
                }
LABEL_63:
                v84 = objc_alloc_init(*(Class *)(v4 + 3560));
                v167 = 0u;
                v168 = 0u;
                v169 = 0u;
                v170 = 0u;
                v85 = v149;
                v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v167, v191, 16);
                if (v86)
                {
                  v87 = v86;
                  v88 = *(_QWORD *)v168;
                  do
                  {
                    for (k = 0; k != v87; ++k)
                    {
                      if (*(_QWORD *)v168 != v88)
                        objc_enumerationMutation(v85);
                      v90 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * k), "copy");
                      objc_msgSend(v84, "addObject:", v90);

                    }
                    v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v167, v191, 16);
                  }
                  while (v87);
                }

                objc_msgSend(v148, "shuffle");
                v91 = objc_msgSend(v85, "count");
                v92 = (void *)personalizationLog;
                if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
                {
                  v93 = (void *)MEMORY[0x1E0CB37E8];
                  v94 = v92;
                  objc_msgSend(v93, "numberWithUnsignedLong:", v91);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v197 = v95;
                  _os_log_impl(&dword_1A07F4000, v94, OS_LOG_TYPE_INFO, "posCount: %@", buf, 0xCu);

                }
                v165 = 0u;
                v166 = 0u;
                v163 = 0u;
                v164 = 0u;
                v96 = v148;
                v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v163, v190, 16);
                if (v97)
                {
                  v98 = v97;
                  v99 = 0;
                  v100 = *(_QWORD *)v164;
LABEL_74:
                  v101 = 0;
                  if (v91 >= v99)
                    v102 = v91 - v99;
                  else
                    v102 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v164 != v100)
                      objc_enumerationMutation(v96);
                    if (v102 == v101)
                      break;
                    v103 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * v101), "copy");
                    objc_msgSend(v84, "addObject:", v103);

                    if (v98 == ++v101)
                    {
                      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v163, v190, 16);
                      v99 += v101;
                      if (v98)
                        goto LABEL_74;
                      break;
                    }
                  }
                }

                objc_msgSend(v141, "addObject:", v84);
                v104 = v149;
              }
              else
              {
                if (objc_msgSend(v153, "count"))
                {
                  v152 = 0;
                  do
                  {
                    v105 = objc_alloc_init(*(Class *)(v4 + 3560));
                    v159 = 0u;
                    v160 = 0u;
                    v161 = 0u;
                    v162 = 0u;
                    -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v159, v189, 16);
                    if (v107)
                    {
                      v108 = v107;
                      v109 = *(_QWORD *)v160;
                      do
                      {
                        for (m = 0; m != v108; ++m)
                        {
                          if (*(_QWORD *)v160 != v109)
                            objc_enumerationMutation(v106);
                          if ((objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * m), "isEqualToString:", CFSTR("predictedClass")) & 1) == 0)
                          {
                            v111 = (void *)objc_opt_new();
                            objc_msgSend(v105, "addObject:", v111);

                          }
                        }
                        v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v159, v189, 16);
                      }
                      while (v108);
                    }

                    v157 = 0u;
                    v158 = 0u;
                    v155 = 0u;
                    v156 = 0u;
                    -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v155, v188, 16);
                    if (v113)
                    {
                      v114 = v113;
                      v115 = *(_QWORD *)v156;
                      do
                      {
                        for (n = 0; n != v114; ++n)
                        {
                          if (*(_QWORD *)v156 != v115)
                            objc_enumerationMutation(v112);
                          v117 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * n);
                          if ((objc_msgSend(v117, "isEqualToString:", CFSTR("predictedClass")) & 1) == 0)
                          {
                            -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                            v118 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v118, "objectForKeyedSubscript:", v117);
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            v120 = objc_msgSend(v119, "intValue");
                            v121 = objc_msgSend(v105, "count");

                            if (v121 > v120)
                            {
                              objc_msgSend(v153, "objectAtIndexedSubscript:", v152);
                              v122 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v122, "objectForKeyedSubscript:", v117);
                              v123 = (void *)objc_claimAutoreleasedReturnValue();
                              -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
                              v124 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v124, "objectForKeyedSubscript:", v117);
                              v125 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v105, "setObject:atIndexedSubscript:", v123, (int)objc_msgSend(v125, "intValue"));

                            }
                          }
                        }
                        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v155, v188, 16);
                      }
                      while (v114);
                    }

                    v126 = (void *)objc_msgSend(v105, "copy");
                    objc_msgSend(v149, "addObject:", v126);

                    ++v152;
                    v4 = 0x1E0C99000;
                  }
                  while (objc_msgSend(v153, "count") > v152);
                }
                v104 = v149;
                objc_msgSend(v141, "addObject:", v149);
              }

              objc_msgSend(v146, "startDate");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "addObject:", v127);

              v7 = v145;
              v18 = v142;
              v17 = v143;
            }

            v19 = v147;
          }
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
    v6 = v137 + 10;
    v8 = v136 + 10;
    if (v136 >= 0x5B)
    {
      v128 = (void *)personalizationLog;
      if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
      {
        v129 = (void *)MEMORY[0x1E0CB37E8];
        v130 = v128;
        objc_msgSend(v129, "numberWithInt:", v7);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v197 = v131;
        _os_log_impl(&dword_1A07F4000, v130, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);

      }
      v132 = v141;
      v133 = v141;
      goto LABEL_117;
    }
  }
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
    -[_PSPersonalizationEvaluation processDataWithQuery:balanceNeed:].cold.1();

  objc_autoreleasePoolPop(context);
  v133 = 0;
  v132 = v141;
LABEL_117:

  return v133;
}

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4
{
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  float v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  __int128 v52;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *context;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[128];
  void *v86;
  _BYTE v87[128];
  uint8_t v88[128];
  __int128 buf;
  Class (*v90)(uint64_t);
  void *v91;
  uint64_t *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v6;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v56)
  {
    v60 = 0;
    v55 = *(_QWORD *)v78;
    *(_QWORD *)&v7 = 138412290;
    v52 = v7;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v78 != v55)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v58 = v8;
        v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1A1AFCA24]();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");
        -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("personAndAppMatched"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v63, "intValue"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0;
        v82 = &v81;
        v83 = 0x2050000000;
        v13 = (void *)getMLFeatureValueClass_softClass_0;
        v84 = getMLFeatureValueClass_softClass_0;
        if (!getMLFeatureValueClass_softClass_0)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v90 = __getMLFeatureValueClass_block_invoke_0;
          v91 = &unk_1E43FEA00;
          v92 = &v81;
          __getMLFeatureValueClass_block_invoke_0((uint64_t)&buf);
          v13 = (void *)v82[3];
        }
        v14 = objc_retainAutorelease(v13);
        _Block_object_dispose(&v81, 8);
        objc_msgSend(v62, "floatValue");
        objc_msgSend(v14, "featureValueWithInt64:", (int)v15);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "isEqualToString:", CFSTR("classicMLModel")))
        {
          -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("predictedClass"));
          v64 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setObject:atIndexedSubscript:", v61, (int)objc_msgSend(v64, "intValue"));
          v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v76 = 0u;
          v74 = 0u;
          v75 = 0u;
          v73 = 0u;
          -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v74 != v20)
                  objc_enumerationMutation(v18);
                v22 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
                -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict", v52);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v24, "intValue"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setValue:forKey:", v25, v22);

              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
            }
            while (v19);
          }

          v26 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_2());
          v27 = (void *)objc_msgSend(v17, "copy");
          v72 = v60;
          v65 = (void *)objc_msgSend(v26, "initWithDictionary:error:", v27, &v72);
          v28 = v72;

          if (!v28)
          {
            objc_msgSend(v53, "addObject:", v65);
            goto LABEL_34;
          }
          v29 = personalizationLog;
          if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
          {
LABEL_24:
            LODWORD(buf) = v52;
            *(_QWORD *)((char *)&buf + 4) = v28;
            _os_log_error_impl(&dword_1A07F4000, v29, OS_LOG_TYPE_ERROR, "Error getting sample point into MLDictionaryFeatureProvider format with error:%@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          if (!objc_msgSend(v57, "isEqualToString:", CFSTR("adaptableMLModel")))
            goto LABEL_35;
          -[_PSPersonalizationEvaluation selectedFeaturesConfig](self, "selectedFeaturesConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
          v64 = (id)objc_claimAutoreleasedReturnValue();

          v17 = (id)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          v81 = 0;
          v82 = &v81;
          v83 = 0x2050000000;
          v31 = (void *)getMLMultiArrayClass_softClass_2;
          v84 = getMLMultiArrayClass_softClass_2;
          if (!getMLMultiArrayClass_softClass_2)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v90 = __getMLMultiArrayClass_block_invoke_2;
            v91 = &unk_1E43FEA00;
            v92 = &v81;
            __getMLMultiArrayClass_block_invoke_2((uint64_t)&buf);
            v31 = (void *)v82[3];
          }
          v32 = objc_retainAutorelease(v31);
          _Block_object_dispose(&v81, 8);
          v33 = [v32 alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v60;
          v65 = (void *)objc_msgSend(v33, "initWithShape:dataType:error:", v35, 65568, &v71);
          v28 = v71;

          if (!v28)
          {
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v64 = v64;
            v36 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
            if (v36)
            {
              v37 = 0;
              v38 = *(_QWORD *)v68;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v68 != v38)
                    objc_enumerationMutation(v64);
                  v40 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
                  -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict", v52);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "objectForKeyedSubscript:", v40);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v42, "intValue"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v43, "floatValue");
                  objc_msgSend(v44, "numberWithFloat:");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "setObject:atIndexedSubscript:", v45, v37 + j);

                }
                v36 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
                v37 += j;
              }
              while (v36);
            }

            objc_msgSend(v17, "setObject:forKeyedSubscript:", v65, CFSTR("input"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v61, CFSTR("predictedClass"));
            -[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("recipientAndBundleIDAsInteger"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v47, "intValue"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v48, CFSTR("recipientAndBundleIDAsInteger"));

            v49 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_2());
            v66 = 0;
            v50 = (void *)objc_msgSend(v49, "initWithDictionary:error:", v17, &v66);
            v28 = v66;
            objc_msgSend(v53, "addObject:", v50);

            goto LABEL_34;
          }
          v29 = personalizationLog;
          if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
        }
LABEL_34:

        v60 = v28;
LABEL_35:

        objc_autoreleasePoolPop(context);
        v8 = v58 + 1;
      }
      while (v58 + 1 != v56);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      if (!v56)
        goto LABEL_39;
    }
  }
  v60 = 0;
LABEL_39:

  return v53;
}

- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  id obj;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  uint64_t *v44;
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  dispatch_semaphore_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  __int128 v60;
  Class (*v61)(uint64_t);
  void *v62;
  uint64_t *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v10, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "AdaptMLModel config: %@, amount of data: %ld", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__12;
  v58 = __Block_byref_object_dispose__12;
  v59 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__12;
  v50 = __Block_byref_object_dispose__12;
  v51 = dispatch_semaphore_create(0);
  v14 = v9;
  v15 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v60) = 0;
    _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "Training data prepped for model adaptation", (uint8_t *)&v60, 2u);
  }
  v16 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke;
  v45[3] = &unk_1E4400F30;
  v45[4] = self;
  v45[5] = &v46;
  v17 = (void *)MEMORY[0x1A1AFCBF8](v45);
  v41[0] = v16;
  v41[1] = 3221225472;
  v41[2] = __81___PSPersonalizationEvaluation_adaptMLModel_withTrainingData_modelConfiguration___block_invoke_255;
  v41[3] = &unk_1E4400F58;
  v18 = v8;
  v42 = v18;
  v43 = buf;
  v44 = &v46;
  v19 = (void *)MEMORY[0x1A1AFCBF8](v41);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2050000000;
  v20 = (void *)getMLUpdateProgressHandlersClass_softClass_0;
  v55 = getMLUpdateProgressHandlersClass_softClass_0;
  if (!getMLUpdateProgressHandlersClass_softClass_0)
  {
    *(_QWORD *)&v60 = v16;
    *((_QWORD *)&v60 + 1) = 3221225472;
    v61 = __getMLUpdateProgressHandlersClass_block_invoke_0;
    v62 = &unk_1E43FEA00;
    v63 = &v52;
    __getMLUpdateProgressHandlersClass_block_invoke_0((uint64_t)&v60);
    v20 = (void *)v53[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v52, 8);
  v22 = (void *)objc_msgSend([v21 alloc], "initForEvents:progressHandler:completionHandler:", 3, v17, v19);
  if (!v14
    || (objc_msgSend(v14, "array"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "count") == 0,
        v23,
        v24))
  {
    v38 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v60) = 0;
      _os_log_impl(&dword_1A07F4000, v38, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL is not initiated due to lack of training data", (uint8_t *)&v60, 2u);
    }
    goto LABEL_24;
  }
  v25 = (id)personalizationLog;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = v10;
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 138412290;
    *(_QWORD *)((char *)&v60 + 4) = v29;
    _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Update task will be initiated with %@ number of samples", (uint8_t *)&v60, 0xCu);

    v10 = v26;
  }

  v30 = (id)personalizationLog;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "parameters");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 138412290;
    *(_QWORD *)((char *)&v60 + 4) = v31;
    _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_INFO, "Config: %@", (uint8_t *)&v60, 0xCu);

  }
  v52 = 0;
  v53 = &v52;
  v54 = 0x2050000000;
  v32 = (void *)getMLUpdateTaskClass_softClass_0;
  v55 = getMLUpdateTaskClass_softClass_0;
  if (!getMLUpdateTaskClass_softClass_0)
  {
    *(_QWORD *)&v60 = v16;
    *((_QWORD *)&v60 + 1) = 3221225472;
    v61 = __getMLUpdateTaskClass_block_invoke_0;
    v62 = &unk_1E43FEA00;
    v63 = &v52;
    __getMLUpdateTaskClass_block_invoke_0((uint64_t)&v60);
    v32 = (void *)v53[3];
  }
  v33 = objc_retainAutorelease(v32);
  _Block_object_dispose(&v52, 8);
  v34 = (id *)(*(_QWORD *)&buf[8] + 40);
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  objc_msgSend(v33, "updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:", v18, v14, v10, v22, &obj);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v34, obj);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    objc_msgSend(v35, "resume");
    v39 = personalizationLog;
    if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v60) = 0;
      _os_log_impl(&dword_1A07F4000, v39, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", (uint8_t *)&v60, 2u);
    }

LABEL_24:
    dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_25;
  }
  v36 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    LODWORD(v60) = 138412290;
    *(_QWORD *)((char *)&v60 + 4) = v37;
    _os_log_impl(&dword_1A07F4000, v36, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", (uint8_t *)&v60, 0xCu);
  }

LABEL_25:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(buf, 8);
}

- (id)_getDataStatistics:(id)a3 forData:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  unint64_t v15;
  void *v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  _PSFeatureStatistics *v38;
  void *v39;
  _PSFeatureStatistics *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  id v91;
  void *v92;
  void *v93;
  id obj;
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[8];
  uint64_t v107;
  Class (*v108)(uint64_t);
  void *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v96 = a4;
  v6 = personalizationLog;
  if (os_log_type_enabled((os_log_t)personalizationLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, "Arrived in NEW _getDataStatistics method", buf, 2u);
  }
  v97 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_PSPersonalizationEvaluation selectedFeaturesConfig](self, "selectedFeaturesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v103 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v97, "setValue:forKey:", v14, v13, v91);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v96, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v96, "objectAtIndexedSubscript:", v15, v91);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 0;

      if (!v17)
      {
        v18 = 0;
        do
        {
          if (objc_msgSend(v9, "count"))
          {
            v19 = 0;
            do
            {
              objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEqual:", CFSTR("confidence")) & 1) == 0)
                objc_msgSend(v20, "isEqual:", CFSTR("support"));
              objc_msgSend(v97, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectAtIndexedSubscript:", v15);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndexedSubscript:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectAtIndexedSubscript:", v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v24);

              ++v19;
            }
            while (v19 < objc_msgSend(v9, "count"));
          }
          objc_msgSend(v96, "objectAtIndexedSubscript:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          ++v18;
        }
        while (v18 < v26);
      }
      ++v15;
    }
    while (v15 < objc_msgSend(v96, "count"));
  }
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v27 = (void *)getODCurareReportFillerDataSetClass_softClass;
  v114 = getODCurareReportFillerDataSetClass_softClass;
  if (!getODCurareReportFillerDataSetClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v107 = 3221225472;
    v108 = __getODCurareReportFillerDataSetClass_block_invoke;
    v109 = &unk_1E43FEA00;
    v110 = &v111;
    __getODCurareReportFillerDataSetClass_block_invoke((uint64_t)buf);
    v27 = (void *)v112[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v111, 8);
  v95 = (id)objc_opt_new();
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v29 = (void *)getODCurareReportFillerDataSetSizeClass_softClass;
  v114 = getODCurareReportFillerDataSetSizeClass_softClass;
  if (!getODCurareReportFillerDataSetSizeClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v107 = 3221225472;
    v108 = __getODCurareReportFillerDataSetSizeClass_block_invoke;
    v109 = &unk_1E43FEA00;
    v110 = &v111;
    __getODCurareReportFillerDataSetSizeClass_block_invoke((uint64_t)buf);
    v29 = (void *)v112[3];
  }
  v30 = objc_retainAutorelease(v29);
  _Block_object_dispose(&v111, 8);
  v93 = (void *)objc_opt_new();
  objc_msgSend(v93, "setNumberOfUserSessions:", objc_msgSend(v96, "count"));
  objc_msgSend(v93, "setNumberOfUserSamples:", 0);
  if (objc_msgSend(v96, "count"))
  {
    v31 = 0;
    do
    {
      objc_msgSend(v96, "objectAtIndexedSubscript:", v31, v91);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setNumberOfUserSamples:", objc_msgSend(v93, "numberOfUserSamples") + objc_msgSend(v32, "count"));

      ++v31;
    }
    while (v31 < objc_msgSend(v96, "count"));
  }
  objc_msgSend(v95, "setSize:", v93, v91);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v9;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v99 != v34)
          objc_enumerationMutation(obj);
        v36 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
        v37 = (void *)MEMORY[0x1A1AFCA24]();
        v38 = [_PSFeatureStatistics alloc];
        objc_msgSend(v97, "objectForKeyedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[_PSFeatureStatistics initWithList:](v38, "initWithList:", v39);

        v111 = 0;
        v112 = &v111;
        v113 = 0x2050000000;
        v41 = (void *)getODCurareReportFillerDataSetStatsClass_softClass;
        v114 = getODCurareReportFillerDataSetStatsClass_softClass;
        if (!getODCurareReportFillerDataSetStatsClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          v107 = 3221225472;
          v108 = __getODCurareReportFillerDataSetStatsClass_block_invoke;
          v109 = &unk_1E43FEA00;
          v110 = &v111;
          __getODCurareReportFillerDataSetStatsClass_block_invoke((uint64_t)buf);
          v41 = (void *)v112[3];
        }
        v42 = objc_retainAutorelease(v41);
        _Block_object_dispose(&v111, 8);
        v43 = (void *)objc_opt_new();
        objc_msgSend(v43, "setFeatureName:", v36);
        v44 = (void *)MEMORY[0x1E0CB37E8];
        -[_PSFeatureStatistics min](v40, "min");
        objc_msgSend(v44, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFeatureValueMin:", v46);

        v47 = (void *)MEMORY[0x1E0CB37E8];
        -[_PSFeatureStatistics max](v40, "max");
        objc_msgSend(v47, "numberWithDouble:");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringValue");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFeatureValueMax:", v49);

        v50 = (void *)MEMORY[0x1E0CB37E8];
        -[_PSFeatureStatistics avg](v40, "avg");
        objc_msgSend(v50, "numberWithDouble:");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringValue");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFeatureValueMean:", v52);

        v53 = (void *)MEMORY[0x1E0CB37E8];
        -[_PSFeatureStatistics stdev](v40, "stdev");
        objc_msgSend(v53, "numberWithDouble:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringValue");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFeatureValueStd:", v55);

        -[_PSFeatureStatistics percentiles](v40, "percentiles");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("10%"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringValue");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v53) = v58 == 0;

        if ((_DWORD)v53)
        {
          objc_msgSend(v43, "setFeatureValuePercentile10:", CFSTR("nil"));
        }
        else
        {
          -[_PSFeatureStatistics percentiles](v40, "percentiles");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("10%"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringValue");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFeatureValuePercentile10:", v61);

        }
        -[_PSFeatureStatistics percentiles](v40, "percentiles");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("25%"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringValue");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v64 == 0;

        if (v65)
        {
          objc_msgSend(v43, "setFeatureValuePercentile25:", CFSTR("nil"));
        }
        else
        {
          -[_PSFeatureStatistics percentiles](v40, "percentiles");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("25%"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringValue");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFeatureValuePercentile25:", v68);

        }
        -[_PSFeatureStatistics percentiles](v40, "percentiles");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("50%"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "stringValue");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v71 == 0;

        if (v72)
        {
          objc_msgSend(v43, "setFeatureValuePercentile50:", CFSTR("nil"));
        }
        else
        {
          -[_PSFeatureStatistics percentiles](v40, "percentiles");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("50%"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "stringValue");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFeatureValuePercentile50:", v75);

        }
        -[_PSFeatureStatistics percentiles](v40, "percentiles");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("75%"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringValue");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78 == 0;

        if (v79)
        {
          objc_msgSend(v43, "setFeatureValuePercentile75:", CFSTR("nil"));
        }
        else
        {
          -[_PSFeatureStatistics percentiles](v40, "percentiles");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("75%"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "stringValue");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFeatureValuePercentile75:", v82);

        }
        -[_PSFeatureStatistics percentiles](v40, "percentiles");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("90%"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "stringValue");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v85 == 0;

        if (v86)
        {
          objc_msgSend(v43, "setFeatureValuePercentile90:", CFSTR("nil"));
        }
        else
        {
          -[_PSFeatureStatistics percentiles](v40, "percentiles");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("90%"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "stringValue");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFeatureValuePercentile90:", v89);

        }
        objc_msgSend(v95, "addStats:", v43);

        objc_autoreleasePoolPop(v37);
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    }
    while (v33);
  }

  return v95;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (NSString)adaptableModelDeployPath
{
  return self->_adaptableModelDeployPath;
}

- (void)setAdaptableModelDeployPath:(id)a3
{
  objc_storeStrong((id *)&self->_adaptableModelDeployPath, a3);
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (NSMutableDictionary)modelTagToHyperparameters
{
  return self->_modelTagToHyperparameters;
}

- (void)setModelTagToHyperparameters:(id)a3
{
  objc_storeStrong((id *)&self->_modelTagToHyperparameters, a3);
}

- (NSMutableDictionary)modelTagToCandidateModel
{
  return self->_modelTagToCandidateModel;
}

- (void)setModelTagToCandidateModel:(id)a3
{
  objc_storeStrong((id *)&self->_modelTagToCandidateModel, a3);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
  objc_storeStrong((id *)&self->_featureNameDict, a3);
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, a3);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, a3);
}

- (NSURL)intermediateCompiledModelURL
{
  return self->_intermediateCompiledModelURL;
}

- (void)setIntermediateCompiledModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateCompiledModelURL, a3);
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
  objc_storeStrong((id *)&self->_batchSize, a3);
}

- (NSNumber)topN
{
  return self->_topN;
}

- (void)setTopN:(id)a3
{
  objc_storeStrong((id *)&self->_topN, a3);
}

- (NSNumber)epoc
{
  return self->_epoc;
}

- (void)setEpoc:(id)a3
{
  objc_storeStrong((id *)&self->_epoc, a3);
}

- (NSNumber)evaluationIterationCount
{
  return self->_evaluationIterationCount;
}

- (void)setEvaluationIterationCount:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationIterationCount, a3);
}

- (NSNumber)testSplitPercent
{
  return self->_testSplitPercent;
}

- (void)setTestSplitPercent:(id)a3
{
  objc_storeStrong((id *)&self->_testSplitPercent, a3);
}

- (NSNumber)swapOK
{
  return self->_swapOK;
}

- (void)setSwapOK:(id)a3
{
  objc_storeStrong((id *)&self->_swapOK, a3);
}

- (NSNumber)accuracyGainThresholdForSwap
{
  return self->_accuracyGainThresholdForSwap;
}

- (void)setAccuracyGainThresholdForSwap:(id)a3
{
  objc_storeStrong((id *)&self->_accuracyGainThresholdForSwap, a3);
}

- (NSNumber)engagementRateGainThresholdForSwap
{
  return self->_engagementRateGainThresholdForSwap;
}

- (void)setEngagementRateGainThresholdForSwap:(id)a3
{
  objc_storeStrong((id *)&self->_engagementRateGainThresholdForSwap, a3);
}

- (NSNumber)minimumTestDataSizeForSwap
{
  return self->_minimumTestDataSizeForSwap;
}

- (void)setMinimumTestDataSizeForSwap:(id)a3
{
  objc_storeStrong((id *)&self->_minimumTestDataSizeForSwap, a3);
}

- (NSNumber)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(id)a3
{
  objc_storeStrong((id *)&self->_numClasses, a3);
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
  objc_storeStrong((id *)&self->_numTrees, a3);
}

- (NSNumber)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(id)a3
{
  objc_storeStrong((id *)&self->_maxDepth, a3);
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
  objc_storeStrong((id *)&self->_learningRate, a3);
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
  objc_storeStrong((id *)&self->_minChildWeight, a3);
}

- (NSNumber)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
  objc_storeStrong((id *)&self->_recipeID, a3);
}

- (NSNumber)minSampleCountForAdaptation
{
  return self->_minSampleCountForAdaptation;
}

- (void)setMinSampleCountForAdaptation:(id)a3
{
  objc_storeStrong((id *)&self->_minSampleCountForAdaptation, a3);
}

- (NSUserDefaults)psAdaptationDefaults
{
  return self->_psAdaptationDefaults;
}

- (void)setPsAdaptationDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_psAdaptationDefaults, a3);
}

- (ODCurareEvaluationAndReportingModule)curareEvaluationAndReporting
{
  return self->_curareEvaluationAndReporting;
}

- (void)setCurareEvaluationAndReporting:(id)a3
{
  objc_storeStrong((id *)&self->_curareEvaluationAndReporting, a3);
}

- (BOOL)evaluateIsInvokedOnce
{
  return self->_evaluateIsInvokedOnce;
}

- (void)setEvaluateIsInvokedOnce:(BOOL)a3
{
  self->_evaluateIsInvokedOnce = a3;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
}

- (void)setShouldContinue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinue, 0);
  objc_storeStrong((id *)&self->_curareEvaluationAndReporting, 0);
  objc_storeStrong((id *)&self->_psAdaptationDefaults, 0);
  objc_storeStrong((id *)&self->_minSampleCountForAdaptation, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_minChildWeight, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_maxDepth, 0);
  objc_storeStrong((id *)&self->_numTrees, 0);
  objc_storeStrong((id *)&self->_numClasses, 0);
  objc_storeStrong((id *)&self->_minimumTestDataSizeForSwap, 0);
  objc_storeStrong((id *)&self->_engagementRateGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_accuracyGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_swapOK, 0);
  objc_storeStrong((id *)&self->_testSplitPercent, 0);
  objc_storeStrong((id *)&self->_evaluationIterationCount, 0);
  objc_storeStrong((id *)&self->_epoc, 0);
  objc_storeStrong((id *)&self->_topN, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_intermediateCompiledModelURL, 0);
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_modelTagToCandidateModel, 0);
  objc_storeStrong((id *)&self->_modelTagToHyperparameters, 0);
  objc_storeStrong((id *)&self->_adaptableModelDeployPath, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (void)evaluateWithModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Candidate model in evaluateWithModel had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)personalizeModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Candidate model in personalize had a nil coreDuet query!! Not ok!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Failed to get selected model with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:adaptableModelDeployPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Failed to run task with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadDefaultModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "No model is loaded for adaptation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "While cloning adaptable model, removing existing file failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)loadAdaptableModelUnderDirectory:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "intermediateCompiledModelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_ERROR, "Adaptable ML model at path %@ load failed with error：%@", v8, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)loadAdaptableModelUnderDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Adaptable ML model cloning to intermediate ML model is unsuccessful", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)loadAdaptableModelUnderDirectory:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Deployed adaptable ML model cannot be found, therefore adaptation is halted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)processDataWithQuery:balanceNeed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "knowledgeStore executeQuery failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
