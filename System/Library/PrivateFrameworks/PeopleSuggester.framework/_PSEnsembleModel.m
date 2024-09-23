@implementation _PSEnsembleModel

- (_PSEnsembleModel)init
{
  _PSEnsembleModel *v2;
  _PSEnsembleModel *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_PSEnsembleModel;
  v2 = -[_PSEnsembleModel init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_lock._os_unfair_lock_opaque = 0;
    v2->_populateCacheLock._os_unfair_lock_opaque = 0;
    -[_PSEnsembleModel interactionStore](v2, "interactionStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel knowledgeStore](v3, "knowledgeStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel initializeEnsembleModelsWithInteractionStore:knowledgeStore:](v3, "initializeEnsembleModelsWithInteractionStore:knowledgeStore:", v4, v5);

    -[_PSEnsembleModel loadDefaultPSConfig](v3, "loadDefaultPSConfig");
    -[_PSEnsembleModel loadDefaultAdaptableModelConfig](v3, "loadDefaultAdaptableModelConfig");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.coreduetd.queue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants mobileCoreDuetBundleId](_PSConstants, "mobileCoreDuetBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      if (init__pasOnceToken6 != -1)
        dispatch_once(&init__pasOnceToken6, &__block_literal_global_4);
    }
  }
  return v3;
}

- (BOOL)supportsDirectAutocompleteModelInit
{
  return 1;
}

+ (id)feedbackDictionary
{
  if (feedbackDictionary__pasOnceToken7 != -1)
    dispatch_once(&feedbackDictionary__pasOnceToken7, &__block_literal_global_273);
  return (id)feedbackDictionary__pasExprOnceResult;
}

+ (void)saveFeedback:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2048;
    v25 = a5;
    _os_log_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_INFO, "Received feedback in coreduetd %@,%@,%ld", buf, 0x20u);
  }

  +[_PSEnsembleModel feedbackDictionary](_PSEnsembleModel, "feedbackDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81___PSEnsembleModel_saveFeedback_forSessionId_feedbackActionType_isFallbackFetch___block_invoke;
  v15[3] = &unk_1E43FEDE8;
  v16 = v10;
  v17 = v9;
  v18 = a5;
  v19 = a6;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v12, "runWithLockAcquired:", v15);

}

+ (void)forgetSession:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[_PSEnsembleModel feedbackDictionary](_PSEnsembleModel, "feedbackDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34___PSEnsembleModel_forgetSession___block_invoke;
  v6[3] = &unk_1E43FEE10;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v6);

}

- (void)loadDefaultPSConfig
{
  id v3;

  +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel loadPSConfig:](self, "loadPSConfig:", v3);

}

- (BOOL)loadPSConfigPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v6)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSEnsembleModel loadPSConfigPath:].cold.1();

  }
  v9 = -[_PSEnsembleModel loadPSConfig:](self, "loadPSConfig:", v6);
  if (v9)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Trial: loaded psConfig from:%@", buf, 0xCu);
    }

  }
  return v9;
}

- (BOOL)loadPSConfig:(id)a3
{
  id v5;
  NSDictionary *psConfig;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *messageDirections;
  NSNumber *messageMechanism;
  NSArray *allOtherInteractionCacheDirections;
  NSArray *allOtherInteractionCacheMechanism;
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

  v5 = a3;
  objc_storeStrong((id *)&self->_psConfig, a3);
  psConfig = self->_psConfig;
  if (psConfig)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxCandidatesFromShareSheetCache"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_1E442A718;
    -[_PSEnsembleModel setMaxCandidatesFromShareSheetCache:](self, "setMaxCandidatesFromShareSheetCache:", v12);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxCandidatesFromMessageCache"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E442A718;
    -[_PSEnsembleModel setMaxCandidatesFromMessageCache:](self, "setMaxCandidatesFromMessageCache:", v15);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("useSyntheticSharingInteractions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setUseSyntheticSharingInteractions:](self, "setUseSyntheticSharingInteractions:", objc_msgSend(v16, "BOOLValue"));

    if (-[_PSEnsembleModel useSyntheticSharingInteractions](self, "useSyntheticSharingInteractions"))
      v17 = &unk_1E442C700;
    else
      v17 = &unk_1E442C718;
    objc_storeStrong((id *)&self->_shareSheetMechanisms, v17);
    messageDirections = self->_messageDirections;
    self->_messageDirections = (NSArray *)&unk_1E442C730;

    messageMechanism = self->_messageMechanism;
    self->_messageMechanism = (NSNumber *)&unk_1E442A7C0;

    allOtherInteractionCacheDirections = self->_allOtherInteractionCacheDirections;
    self->_allOtherInteractionCacheDirections = (NSArray *)&unk_1E442C748;

    allOtherInteractionCacheMechanism = self->_allOtherInteractionCacheMechanism;
    self->_allOtherInteractionCacheMechanism = (NSArray *)&unk_1E442C760;

    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel knnModel](self, "knnModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[_PSEnsembleModel knnModel](self, "knnModel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "updateModelProperties:", self->_psConfig);

    }
    -[_PSEnsembleModel heuristics](self, "heuristics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[_PSEnsembleModel heuristics](self, "heuristics");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateModelProperties:", self->_psConfig);

    }
  }

  return psConfig != 0;
}

- (void)loadDefaultAdaptableModelConfig
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("com.apple.PeopleSuggester.Config.Default.AdaptableModel"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[_PSBehaviorRuleRankingUtilities loadAdaptableModelConfig:](_PSBehaviorRuleRankingUtilities, "loadAdaptableModelConfig:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel setPsConfigForAdaptableModel:](self, "setPsConfigForAdaptableModel:", v5);

}

- (void)updateTrialID:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        +[_PSLogging generalChannel](_PSLogging, "generalChannel", v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "reasonType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "reason");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          v22 = v14;
          v23 = 2112;
          v24 = v15;
          _os_log_debug_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_DEBUG, "Suggestion ReasonType:%@, Reason:%@", buf, 0x16u);

        }
        -[_PSEnsembleModel trialID](self, "trialID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v10, "setTrialID:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }

}

- (void)registerWithTrial
{
  void *v3;
  id v4;
  TRIClient *v5;
  TRIClient *trialClient;
  NSObject *v7;
  TRIClient *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v3 = (void *)getTRIClientClass_softClass;
  v20 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getTRIClientClass_block_invoke;
    v15 = &unk_1E43FEA00;
    v16 = &v17;
    __getTRIClientClass_block_invoke((uint64_t)buf);
    v3 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v4, "clientWithIdentifier:", 210);
  v5 = (TRIClient *)objc_claimAutoreleasedReturnValue();
  trialClient = self->_trialClient;
  self->_trialClient = v5;

  if (self->_trialClient)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Trial: get trial client", buf, 2u);
    }

    -[_PSEnsembleModel updateFactorLevels](self, "updateFactorLevels");
    objc_initWeak((id *)buf, self);
    v8 = self->_trialClient;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37___PSEnsembleModel_registerWithTrial__block_invoke;
    v10[3] = &unk_1E43FEE38;
    objc_copyWeak(&v11, (id *)buf);
    v9 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v8, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"), v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)copyRemoteRuleMinerMLModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;

  if (a3)
  {
    +[_PSBehaviorRuleRankingUtilities compileMLModelAtPath:](_PSBehaviorRuleRankingUtilities, "compileMLModelAtPath:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledMLModelPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v4);
      if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:](_PSBehaviorRuleRankingUtilities, "removeFolderAtPath:", v4))
      {
        v6 = +[_PSBehaviorRuleRankingUtilities copyFileFromURL:toURL:](_PSBehaviorRuleRankingUtilities, "copyFileFromURL:toURL:", v3, v5);
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSEnsembleModel copyRemoteRuleMinerMLModel:].cold.1();

    return 0;
  }
  return v6;
}

- (void)discardAdaptedModel
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Discarding adapted model failed at path:%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)discardTrialModels
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A07F4000, v0, v1, "Discarding trial model failed at path:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)getLatestTrialMLModelVersion
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath](_PSBehaviorRuleRankingUtilities, "getTrialCompiledMLModelPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v3))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v3);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v5 = (void *)getMLModelClass_softClass_0;
    v19 = getMLModelClass_softClass_0;
    if (!getMLModelClass_softClass_0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getMLModelClass_block_invoke_0;
      v15[3] = &unk_1E43FEA00;
      v15[4] = &v16;
      __getMLModelClass_block_invoke_0((uint64_t)v15);
      v5 = (void *)v17[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v16, 8);
    v14 = 0;
    objc_msgSend(v6, "modelWithContentsOfURL:error:", v4, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v8)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_PSEnsembleModel getLatestTrialMLModelVersion].cold.1();
      v10 = &stru_1E4402490;
    }
    else
    {
      objc_msgSend(v7, "modelDescription");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject metadata](v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MLModelCreatorDefinedKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mlModelVersion"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = &stru_1E4402490;
  }

  return v10;
}

- (void)updateFactorLevels
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Trial: failed to load trial config, fallback to default config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (BOOL)coreMLModelNeedsDurableFeatures
{
  void *v3;
  void *v4;
  char v5;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("coreMLModelNeedsDurableFeatures"), CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("coreMLModelNeedsDurableFeatures"), CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLeanValue");

  return v5;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  os_unfair_lock_s *p_lock;
  _DKKnowledgeQuerying *knowledgeStore;
  _DKKnowledgeQuerying *v5;
  _DKKnowledgeQuerying *v6;
  _DKKnowledgeQuerying *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knowledgeStore = self->_knowledgeStore;
  if (!knowledgeStore)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v5 = (_DKKnowledgeQuerying *)objc_claimAutoreleasedReturnValue();
    v6 = self->_knowledgeStore;
    self->_knowledgeStore = v5;

    knowledgeStore = self->_knowledgeStore;
  }
  v7 = knowledgeStore;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)allowConcurrentReads
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSConstants mobileCoreDuetBundleId](_PSConstants, "mobileCoreDuetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  +[_PSConstants macKnowledgeAgentBundleId](_PSConstants, "macKnowledgeAgentBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v6, "containsObject:", v3);

  return (char)v2;
}

- (_CDInteractionStore)interactionStore
{
  os_unfair_lock_s *p_lock;
  _CDInteractionStore *interactionStore;
  void *v5;
  void *v6;
  _CDInteractionStore *v7;
  _CDInteractionStore *v8;
  _CDInteractionStore *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    v5 = (void *)MEMORY[0x1E0D158E0];
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
    v7 = (_CDInteractionStore *)objc_claimAutoreleasedReturnValue();
    v8 = self->_interactionStore;
    self->_interactionStore = v7;

    -[_CDInteractionStore setReadConcurrently:](self->_interactionStore, "setReadConcurrently:", -[_PSEnsembleModel allowConcurrentReads](self, "allowConcurrentReads"));
    interactionStore = self->_interactionStore;
  }
  v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSUserDefaults)peopleSuggesterDefaults
{
  os_unfair_lock_s *p_lock;
  NSUserDefaults *peopleSuggesterDefaults;
  NSUserDefaults *v5;
  NSUserDefaults *v6;
  NSUserDefaults *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  peopleSuggesterDefaults = self->_peopleSuggesterDefaults;
  if (!peopleSuggesterDefaults)
  {
    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PeopleSuggester"));
    v6 = self->_peopleSuggesterDefaults;
    self->_peopleSuggesterDefaults = v5;

    peopleSuggesterDefaults = self->_peopleSuggesterDefaults;
  }
  v7 = peopleSuggesterDefaults;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_lock;
  void *v4;
  objc_class *v5;
  CNContactStore *v6;
  CNContactStore *contactStore;
  CNContactStore *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_contactStore && getuid())
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v4 = (void *)getCNContactStoreClass_softClass_0;
    v14 = getCNContactStoreClass_softClass_0;
    if (!getCNContactStoreClass_softClass_0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCNContactStoreClass_block_invoke_0;
      v10[3] = &unk_1E43FEA00;
      v10[4] = &v11;
      __getCNContactStoreClass_block_invoke_0((uint64_t)v10);
      v4 = (void *)v12[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v11, 8);
    v6 = (CNContactStore *)objc_alloc_init(v5);
    contactStore = self->_contactStore;
    self->_contactStore = v6;

  }
  v8 = self->_contactStore;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (NSArray)defaultContactKeysToFetch
{
  os_unfair_lock_s *p_lock;
  NSArray *defaultContactKeysToFetch;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  defaultContactKeysToFetch = self->_defaultContactKeysToFetch;
  if (!defaultContactKeysToFetch)
  {
    _PSDefaultContactKeysToFetch();
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_defaultContactKeysToFetch;
    self->_defaultContactKeysToFetch = v5;

    defaultContactKeysToFetch = self->_defaultContactKeysToFetch;
  }
  v7 = defaultContactKeysToFetch;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)fetchShareSheetSupportedBundleIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel setAllowNonSupportedBundleIDs:](self, "setAllowNonSupportedBundleIDs:", objc_msgSend(v3, "BOOLForKey:", CFSTR("_PSAllowNonSupportedBundleIDs")));

  _PSShareSheetSuggestionBundleIDs(-[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)populateCaches
{
  id v3;

  -[_PSEnsembleModel fetchShareSheetSupportedBundleIDs](self, "fetchShareSheetSupportedBundleIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel populateCachesWithSupportedBundleIDs:](self, "populateCachesWithSupportedBundleIDs:", v3);

}

- (void)populateCachesWithSupportedBundleIDs:(id)a3
{
  NSObject *v4;
  _PSContactResolver *v5;
  void *v6;
  _PSContactResolver *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  NSNumber *v16;
  id v17;
  uint64_t v18;
  NSArray *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  _PSInteractionAndContactMonitor *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  _BOOL4 v45;
  _PSRuleMiningModel *v46;
  void *v47;
  void *v48;
  _PSRuleMiningModel *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _PSKNNModel *v59;
  void *v60;
  void *v61;
  void *v62;
  _PSKNNModel *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  _PSSharingContactRankerModel *v68;
  void *v69;
  void *v70;
  _PSSharingContactRankerModel *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  _PSKNNModel *v77;
  void *v78;
  void *v79;
  void *v80;
  _PSKNNModel *v81;
  void *v82;
  void *v83;
  void *v84;
  _PSFTZKWOrchestrator *v85;
  void *v86;
  _PSFTZKWOrchestrator *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  _PSKNNModel *v91;
  void *v92;
  void *v93;
  void *v94;
  _PSKNNModel *v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  _PSHeuristics *v100;
  void *v101;
  void *v102;
  void *v103;
  _PSHeuristics *v104;
  void *v105;
  void *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  _BOOL4 v113;
  void *v114;
  objc_class *v115;
  id v116;
  _PSCoreMLScoringModel *v117;
  id v118;
  NSArray *v119;
  NSArray *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSArray *v131;
  id v132;
  _CDInteractionCache *v133;
  _CDInteractionCache *allOtherInteractionCache;
  _PSFeatureCache *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  _PSFeatureCache *v141;
  _PSFeatureCache *featureCache;
  NSObject *v143;
  NSArray *v144;
  void *v145;
  void *v146;
  id v147;
  NSArray *v148;
  NSNumber *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  NSArray *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  _QWORD v160[4];
  NSArray *v161;
  NSArray *v162;
  id v163;
  id v164;
  id v165;
  _QWORD v166[5];
  _QWORD block[5];
  _QWORD v168[4];
  NSArray *v169;
  NSArray *v170;
  id v171;
  _QWORD v172[4];
  NSArray *v173;
  NSNumber *v174;
  id v175;
  uint8_t buf[8];
  uint64_t v177;
  Class (*v178)(uint64_t);
  void *v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  _QWORD v185[5];

  v185[3] = *MEMORY[0x1E0C80C00];
  v158 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_populateCachesWithSupportedBundleIDs", " enableTelemetry=YES ", buf, 2u);
  }

  -[_PSEnsembleModel interactionStore](self, "interactionStore");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel contactStore](self, "contactStore");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel knowledgeStore](self, "knowledgeStore");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [_PSContactResolver alloc];
  -[_PSEnsembleModel defaultContactKeysToFetch](self, "defaultContactKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PSContactResolver initWithContactStore:keysToFetch:](v5, "initWithContactStore:keysToFetch:", v156, v6);
  -[_PSEnsembleModel setContactResolver:](self, "setContactResolver:", v7);

  os_unfair_lock_lock(&self->_populateCacheLock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v158);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel cachedSupportedBundleIDs](self, "cachedSupportedBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (-[_PSEnsembleModel cachedSupportedBundleIDs](self, "cachedSupportedBundleIDs"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v8, "isSubsetOfSet:", v10),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    -[_PSEnsembleModel setMessageInteractionCache:](self, "setMessageInteractionCache:", 0);
    -[_PSEnsembleModel setShareInteractionCache:](self, "setShareInteractionCache:", 0);
  }
  else
  {
    v12 = (void *)objc_msgSend(v8, "copy");
    -[_PSEnsembleModel setCachedSupportedBundleIDs:](self, "setCachedSupportedBundleIDs:", v12);

  }
  v155 = (void *)objc_msgSend(v8, "mutableCopy");
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "removeObject:", v13);

  v14 = self->_shareSheetMechanisms;
  v15 = self->_messageDirections;
  v16 = self->_messageMechanism;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = MEMORY[0x1E0C809B0];
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke;
  v172[3] = &unk_1E43FEE60;
  v19 = v15;
  v173 = v19;
  v149 = v16;
  v174 = v149;
  v20 = v8;
  v175 = v20;
  v151 = (void *)MEMORY[0x1A1AFCBF8](v172);
  v168[0] = v18;
  v168[1] = 3221225472;
  v168[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_2;
  v168[3] = &unk_1E43FEE60;
  v154 = v19;
  v169 = v154;
  v148 = v14;
  v170 = v148;
  v147 = v20;
  v171 = v147;
  v150 = (void *)MEMORY[0x1A1AFCBF8](v168);
  -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v21 == 0;

  if ((_DWORD)v14)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -14515200.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("(startDate >= %@)"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v154);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), v149);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v155);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionCacheFromStore:size:queryPredicate:filterBlock:](_PSInteractionStoreUtils, "interactionCacheFromStore:size:queryPredicate:filterBlock:", v159, 350, v153, v151);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setMessageInteractionCache:](self, "setMessageInteractionCache:", v28);

  }
  else
  {
    v153 = 0;
  }
  -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (v30)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    v32 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -14515200.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "predicateWithFormat:", CFSTR("(startDate >= %@)"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v34);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), v148);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v35);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v154);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v36);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(targetBundleId IN %@)"), v147);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v37);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v31);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionCacheFromStore:size:queryPredicate:filterBlock:](_PSInteractionStoreUtils, "interactionCacheFromStore:size:queryPredicate:filterBlock:", v159, 350, v152, v150);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setShareInteractionCache:](self, "setShareInteractionCache:", v38);

    v17 = v31;
  }
  else
  {
    v152 = 0;
  }
  -[_PSEnsembleModel contactMonitor](self, "contactMonitor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (v40)
  {
    v41 = -[_PSInteractionAndContactMonitor initWithInteractionStore:contactStore:]([_PSInteractionAndContactMonitor alloc], "initWithInteractionStore:contactStore:", v159, v156);
    -[_PSEnsembleModel setContactMonitor:](self, "setContactMonitor:", v41);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_queue_create("com.apple.PeopleSuggester.ContactMonitor", v42);

    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_3;
    block[3] = &unk_1E43FEB68;
    block[4] = self;
    dispatch_async(v43, block);

  }
  -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v45)
  {
    v46 = [_PSRuleMiningModel alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[_PSRuleMiningModel initWithKnowledgeStore:contactresolver:withConfig:](v46, "initWithKnowledgeStore:contactresolver:withConfig:", v157, v47, v48);
    -[_PSEnsembleModel setRuleMiningModel:](self, "setRuleMiningModel:", v49);

    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfigForAdaptableModel](self, "psConfigForAdaptableModel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "updateAdaptableModelProperties:", v51);

    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "loadMLModel");

  }
  -[_PSEnsembleModel knnModel](self, "knnModel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
    goto LABEL_19;
  v54 = (void *)MEMORY[0x1E0C99E60];
  -[_PSEnsembleModel knnModel](self, "knnModel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "filterBundleIds");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v158);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v54) = objc_msgSend(v57, "isEqualToSet:", v58);

  if ((v54 & 1) == 0)
  {
LABEL_19:
    v59 = [_PSKNNModel alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[_PSKNNModel initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:](v59, "initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:", 100, v159, v158, v157, v60, v61, v62);
    -[_PSEnsembleModel setKnnModel:](self, "setKnnModel:", v63);

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "updateModelProperties:", v65);

  }
  -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66 == 0;

  if (v67)
  {
    v68 = [_PSSharingContactRankerModel alloc];
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[_PSSharingContactRankerModel initWithInteractionStore:messageInteractionCache:shareInteractionCache:](v68, "initWithInteractionStore:messageInteractionCache:shareInteractionCache:", v159, v69, v70);
    -[_PSEnsembleModel setSharingContactRankerModel:](self, "setSharingContactRankerModel:", v71);

    -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "updateModelProperties:", v73);

    -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "loadMLModel");

  }
  -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75 == 0;

  if (v76)
  {
    v77 = [_PSKNNModel alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[_PSKNNModel initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:](v77, "initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:", 500, v159, v158, v157, v78, v79, v80);
    -[_PSEnsembleModel setKnnZkwModel:](self, "setKnnZkwModel:", v81);

    -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "updateModelProperties:", v83);

    -[_PSEnsembleModel zkwFTOrchestrator](self, "zkwFTOrchestrator");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {

    }
    else if (getuid())
    {
      v85 = [_PSFTZKWOrchestrator alloc];
      -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[_PSFTZKWOrchestrator initWithKNNModel:interactionStore:](v85, "initWithKNNModel:interactionStore:", v86, v159);
      -[_PSEnsembleModel setZkwFTOrchestrator:](self, "setZkwFTOrchestrator:", v87);

      v166[0] = v18;
      v166[1] = 3221225472;
      v166[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_4;
      v166[3] = &unk_1E43FEE88;
      v166[4] = self;
      +[_PSFTZKWTrialWrapper runWithData:](_PSFTZKWTrialWrapper, "runWithData:", v166);
      -[_PSEnsembleModel zkwFTOrchestrator](self, "zkwFTOrchestrator");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "populateCaches");

    }
  }
  -[_PSEnsembleModel knnSiriNLContactRankerModel](self, "knnSiriNLContactRankerModel");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89 == 0;

  if (v90)
  {
    v91 = [_PSKNNModel alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = -[_PSKNNModel initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:](v91, "initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:", 2000, v159, v158, v157, v92, v93, v94);
    -[_PSEnsembleModel setKnnSiriNLContactRankerModel:](self, "setKnnSiriNLContactRankerModel:", v95);

    -[_PSEnsembleModel knnSiriNLContactRankerModel](self, "knnSiriNLContactRankerModel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "updateModelProperties:", v97);

  }
  -[_PSEnsembleModel heuristics](self, "heuristics");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98 == 0;

  if (v99)
  {
    v100 = [_PSHeuristics alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel cachedSupportedBundleIDs](self, "cachedSupportedBundleIDs");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = -[_PSHeuristics initWithKnowledgeStore:interactionStore:contactResolver:shareSheetSupportedBundleIds:messageInteractionCache:](v100, "initWithKnowledgeStore:interactionStore:contactResolver:shareSheetSupportedBundleIds:messageInteractionCache:", v157, v159, v101, v102, v103);
    -[_PSEnsembleModel setHeuristics:](self, "setHeuristics:", v104);

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "updateModelProperties:", v106);

  }
  -[_PSEnsembleModel topicStore](self, "topicStore");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107 == 0;

  if (v108)
  {
    v181 = 0;
    v182 = &v181;
    v183 = 0x2050000000;
    v109 = (void *)getPPTopicStoreClass_softClass;
    v184 = getPPTopicStoreClass_softClass;
    if (!getPPTopicStoreClass_softClass)
    {
      *(_QWORD *)buf = v18;
      v177 = 3221225472;
      v178 = __getPPTopicStoreClass_block_invoke;
      v179 = &unk_1E43FEA00;
      v180 = &v181;
      __getPPTopicStoreClass_block_invoke((uint64_t)buf);
      v109 = (void *)v182[3];
    }
    v110 = objc_retainAutorelease(v109);
    _Block_object_dispose(&v181, 8);
    objc_msgSend(v110, "defaultStore");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setTopicStore:](self, "setTopicStore:", v111);

  }
  -[_PSEnsembleModel portraitContactStore](self, "portraitContactStore");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v112 == 0;

  if (v113)
  {
    v181 = 0;
    v182 = &v181;
    v183 = 0x2050000000;
    v114 = (void *)getPPContactStoreClass_softClass;
    v184 = getPPContactStoreClass_softClass;
    if (!getPPContactStoreClass_softClass)
    {
      *(_QWORD *)buf = v18;
      v177 = 3221225472;
      v178 = __getPPContactStoreClass_block_invoke;
      v179 = &unk_1E43FEA00;
      v180 = &v181;
      __getPPContactStoreClass_block_invoke((uint64_t)buf);
      v114 = (void *)v182[3];
    }
    v115 = objc_retainAutorelease(v114);
    _Block_object_dispose(&v181, 8);
    v116 = objc_alloc_init(v115);
    -[_PSEnsembleModel setPortraitContactStore:](self, "setPortraitContactStore:", v116);

  }
  -[_PSEnsembleModel coreMLScoringModel](self, "coreMLScoringModel");
  v117 = (_PSCoreMLScoringModel *)objc_claimAutoreleasedReturnValue();
  if (v117)
    goto LABEL_42;
  if (_os_feature_enabled_impl())
  {
    v117 = objc_alloc_init(_PSCoreMLScoringModel);
    -[_PSEnsembleModel setCoreMLScoringModel:](self, "setCoreMLScoringModel:", v117);
LABEL_42:

  }
  if (_os_feature_enabled_impl() && !self->_featureCache)
  {
    v119 = self->_allOtherInteractionCacheMechanism;
    v120 = self->_allOtherInteractionCacheDirections;
    v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -14515200.0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate <= %@)"), v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v122);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%@ <= startDate)"), v146);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v123);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v120);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v124);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), v119);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v125);

    v126 = (void *)MEMORY[0x1E0CB3880];
    +[_PSConstants contactsAutocompleteBundleId](_PSConstants, "contactsAutocompleteBundleId");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "predicateWithFormat:", CFSTR("(bundleId != %@)"), v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "addObject:", v128);

    if (v152)
    {
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v152);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addObject:", v129);

    }
    if (v153)
    {
      objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v153);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addObject:", v130);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v118);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v160[0] = v18;
    v160[1] = 3221225472;
    v160[2] = __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_5;
    v160[3] = &unk_1E43FEEB0;
    v164 = v151;
    v165 = v150;
    v131 = v120;
    v161 = v131;
    v144 = v119;
    v162 = v144;
    v132 = v121;
    v163 = v132;
    +[_PSInteractionStoreUtils interactionCacheFromStore:size:queryPredicate:filterBlock:](_PSInteractionStoreUtils, "interactionCacheFromStore:size:queryPredicate:filterBlock:", v159, 100, v145, v160);
    v133 = (_CDInteractionCache *)objc_claimAutoreleasedReturnValue();
    allOtherInteractionCache = self->_allOtherInteractionCache;
    self->_allOtherInteractionCache = v133;

    v135 = [_PSFeatureCache alloc];
    -[_PSEnsembleModel candidatesForShareSheetRanking](self, "candidatesForShareSheetRanking");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v185[0] = v137;
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v185[1] = v138;
    -[_PSEnsembleModel allOtherInteractionCache](self, "allOtherInteractionCache");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v185[2] = v139;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 3);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = -[_PSFeatureCache initWithPredictionContext:candidates:caches:store:](v135, "initWithPredictionContext:candidates:caches:store:", 0, v136, v140, self->_interactionStore);
    featureCache = self->_featureCache;
    self->_featureCache = v141;

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v143))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v143, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_populateCachesWithSupportedBundleIDs", (const char *)&unk_1A0908603, buf, 2u);
    }

  }
  else
  {
    v118 = v17;
  }
  os_unfair_lock_unlock(&self->_populateCacheLock);

}

- (void)intializeKNNContactRankerModelWithInteractionStore:(id)a3 knowledgeStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _PSKNNModel *v9;
  void *v10;
  void *v11;
  void *v12;
  _PSKNNModel *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[_PSEnsembleModel fetchShareSheetSupportedBundleIDs](self, "fetchShareSheetSupportedBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [_PSKNNModel alloc];
    -[_PSEnsembleModel contactResolver](self, "contactResolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_PSKNNModel initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:](v9, "initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:", 500, v16, v8, v6, v10, v11, v12);
    -[_PSEnsembleModel setKnnNameOrContactRankerModel:](self, "setKnnNameOrContactRankerModel:", v13);

    -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateModelProperties:", v15);

  }
}

- (void)refreshCaches
{
  void *v3;
  id v4;

  -[_PSEnsembleModel zkwFTOrchestrator](self, "zkwFTOrchestrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PSEnsembleModel zkwFTOrchestrator](self, "zkwFTOrchestrator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "populateCaches");

  }
}

- (void)freeCachesIfNotCoreDuetDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSConstants mobileCoreDuetBundleId](_PSConstants, "mobileCoreDuetBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {

  }
  else
  {
    +[_PSConstants macKnowledgeAgentBundleId](_PSConstants, "macKnowledgeAgentBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[_PSEnsembleModel freeCaches](self, "freeCaches");
      goto LABEL_8;
    }
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "Not freeing caches because we're coreduetd or knowledge-agent", v9, 2u);
  }

LABEL_8:
}

- (void)freeCaches
{
  os_unfair_lock_s *p_populateCacheLock;
  NSObject *v4;
  _PSFeatureCache *featureCache;
  uint8_t v6[16];

  p_populateCacheLock = &self->_populateCacheLock;
  os_unfair_lock_lock(&self->_populateCacheLock);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "Freeing caches now to save memory", v6, 2u);
  }

  -[_PSEnsembleModel setMessageInteractionCache:](self, "setMessageInteractionCache:", 0);
  -[_PSEnsembleModel setShareInteractionCache:](self, "setShareInteractionCache:", 0);
  -[_PSEnsembleModel setAllOtherInteractionCache:](self, "setAllOtherInteractionCache:", 0);
  -[_PSEnsembleModel setContactMonitor:](self, "setContactMonitor:", 0);
  -[_PSEnsembleModel setRuleMiningModel:](self, "setRuleMiningModel:", 0);
  -[_PSEnsembleModel setKnnModel:](self, "setKnnModel:", 0);
  -[_PSEnsembleModel setSharingContactRankerModel:](self, "setSharingContactRankerModel:", 0);
  -[_PSEnsembleModel setKnnZkwModel:](self, "setKnnZkwModel:", 0);
  -[_PSEnsembleModel setZkwFTOrchestrator:](self, "setZkwFTOrchestrator:", 0);
  -[_PSEnsembleModel setKnnNameOrContactRankerModel:](self, "setKnnNameOrContactRankerModel:", 0);
  -[_PSEnsembleModel setKnnSiriNLContactRankerModel:](self, "setKnnSiriNLContactRankerModel:", 0);
  -[_PSEnsembleModel setHeuristics:](self, "setHeuristics:", 0);
  -[_PSEnsembleModel setCoreMLScoringModel:](self, "setCoreMLScoringModel:", 0);
  featureCache = self->_featureCache;
  self->_featureCache = 0;

  os_unfair_lock_unlock(p_populateCacheLock);
}

- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
  +[_PSConstants psDefaultsDomain](_PSConstants, "psDefaultsDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

  objc_msgSend(v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_DEFAULT, "Suggesting interactions from seeded handles: %@", buf, 0xCu);
    }

    objc_msgSend(v6, "setSuggestionPath:", CFSTR("suggestionPathDemoMode"));
    -[_PSEnsembleModel heuristics](self, "heuristics");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject seedSuggestionsForChatGuidsAndTransports:](v15, "seedSuggestionsForChatGuidsAndTransports:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "showPotentialFamilyMembers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleID");
      v24 = a4;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isSharePlayAvailable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_DEFAULT, "Prediction Context - Family: %@, Bundle Id: %@, Attachments: %@, SharePlay: %@", buf, 0x2Au);

      a4 = v24;
    }

    if (objc_msgSend(v6, "showPotentialFamilyMembers"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "iCloud Family Suggestions Active", buf, 2u);
      }

      -[_PSEnsembleModel familyPredictionsWithMaxSuggestions:predictionContext:](self, "familyPredictionsWithMaxSuggestions:predictionContext:", a4, v6);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:](self, "predictWithPredictionContext:maxSuggestions:contactKeysToFetch:", v6, a4, 0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v22;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v26 = v16;
      _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_DEFAULT, "Final ShareSheet suggestions: %{private}@", buf, 0xCu);
    }
  }

  return v16;
}

- (id)familyPredictionsWithMaxSuggestions:(unint64_t)a3 predictionContext:(id)a4
{
  id v5;
  _PSFamilyRecommender *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a4;
  v6 = objc_alloc_init(_PSFamilyRecommender);
  -[_PSFamilyRecommender familyRecommendationSuggestionsForShareSheetWithPredictionContext:](v6, "familyRecommendationSuggestionsForShareSheetWithPredictionContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 >= a3)
    v9 = a3;
  else
    v9 = v8;
  objc_msgSend(v7, "subarrayWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setPeopleAnalysisFromAssetsWithPredictionContext:(id)a3 identifiersOfPeopleInPhotos:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Saving people IDs to prediction context", buf, 2u);
  }

  objc_msgSend(v5, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
        objc_msgSend(v6, "allObjects", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPeopleInPhoto:", v16);

        objc_msgSend(v15, "peopleInPhoto");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v15, "peopleInPhoto");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v18);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPeopleInPhotoIdentifiers:", v19);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_INFO, "Finished saving people IDs to prediction context", buf, 2u);
  }

}

- (void)setPhotoAnalysisFromAssetsWithPredictionContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "Fetching scene descriptors and save person IDs", buf, 2u);
  }

  objc_msgSend(v3, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "photoLocalIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "photoLocalIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSPhotoUtils assetsWithIdentifiers:](_PSPhotoUtils, "assetsWithIdentifiers:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          +[_PSPhotoUtils sceneAnalysisFromAssets:](_PSPhotoUtils, "sceneAnalysisFromAssets:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPhotoSceneDescriptors:", v16);

          objc_msgSend(v11, "photoSceneDescriptors");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v11, "photoSceneDescriptors");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObjectsFromArray:", v18);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(v21, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScenesInPhotoIdentifiers:", v19);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_INFO, "Finished fetching scene descriptors and saving person IDs", buf, 2u);
  }

}

- (id)fetchSupportedBundleIDsWithPredictionContextFilters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  -[_PSEnsembleModel fetchShareSheetSupportedBundleIDs](self, "fetchShareSheetSupportedBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  if ((objc_msgSend(v4, "isSharePlayAvailable") & 1) == 0)
  {
    +[_PSConstants sharePlayBundleId](_PSConstants, "sharePlayBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

  }
  objc_msgSend(v4, "suggestionsFilteredByBundleIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v4, "suggestionsFilteredByBundleIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __72___PSEnsembleModel_fetchSupportedBundleIDsWithPredictionContextFilters___block_invoke;
    v18 = &unk_1E43FEED8;
    v6 = v6;
    v19 = v6;
    v12 = v10;
    v20 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);

    if (objc_msgSend(v12, "count", v15, v16, v17, v18))
    {
      v13 = v12;

      v6 = v13;
    }

  }
  return v6;
}

- (void)getPhotoBasedFeatures:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void (**v7)(void);

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  -[_PSEnsembleModel getPhotoBasedFeaturesAsync:withTimeout:](self, "getPhotoBasedFeaturesAsync:withTimeout:", v5);
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  v7[2]();
}

- (id)psr_getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  _PSEnsembleModel *v31;
  uint8_t *v32;
  double v33;
  os_signpost_id_t v34;
  _QWORD v35[4];
  NSObject *v36;
  uint8_t *v37;
  uint8_t v38[16];
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "_PSEnsembleModel_getPhotoBasedFeatures", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v6, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1;
  v43 = __Block_byref_object_dispose__1;
  v44 = 0;
  v14 = dispatch_semaphore_create(0);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v38 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v9, "_PSEnsembleModel_getPhotoBasedFeatures_personIDsOfPeopleInSharedPhotoAssets", " enableTelemetry=YES ", v38, 2u);
  }

  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke;
  v35[3] = &unk_1E43FEF00;
  v37 = buf;
  v18 = v14;
  v36 = v18;
  +[_PSPhotoSuggestions phPersonIdentifiersOfPeopleInSharedPhotoAttachments:forBundleID:withCompletion:](_PSPhotoSuggestions, "phPersonIdentifiersOfPeopleInSharedPhotoAttachments:forBundleID:withCompletion:", v13, v12, v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2;
  v26[3] = &unk_1E43FEF28;
  v33 = a4;
  v27 = v7;
  v28 = v18;
  v34 = v9;
  v29 = v19;
  v30 = v6;
  v31 = self;
  v32 = buf;
  v20 = v6;
  v21 = v19;
  v22 = v18;
  v23 = v7;
  v24 = (void *)MEMORY[0x1A1AFCBF8](v26);

  _Block_object_dispose(buf, 8);
  return v24;
}

- (id)getPhotoBasedFeaturesAsync:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _PSEnsembleModel *v26;
  id v27;
  uint8_t *v28;
  double v29;
  os_signpost_id_t v30;
  _QWORD block[4];
  id v32;
  id v33;
  uint8_t *v34;
  os_signpost_id_t v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  if ((objc_msgSend(v6, "isFallbackFetch") & 1) != 0)
  {
    v7 = &__block_literal_global_392;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_PSEnsembleModel_getPhotoBasedFeatures", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(v6, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = 0;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_393;
    block[3] = &unk_1E43FEF70;
    v34 = buf;
    v35 = v10;
    v32 = v14;
    v33 = v13;
    v16 = v13;
    v17 = v14;
    v18 = dispatch_block_create((dispatch_block_flags_t)0, block);
    if (getPhotoBasedFeaturesAsync_withTimeout___pasOnceToken63 != -1)
      dispatch_once(&getPhotoBasedFeaturesAsync_withTimeout___pasOnceToken63, &__block_literal_global_395);
    v19 = (id)getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult;
    dispatch_async(v19, v18);
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2;
    v23[3] = &unk_1E43FEFB8;
    v29 = a4;
    v24 = v8;
    v27 = v18;
    v28 = buf;
    v30 = v10;
    v25 = v6;
    v26 = self;
    v20 = v18;
    v21 = v8;
    v7 = (void *)MEMORY[0x1A1AFCBF8](v23);

    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (void)getCoreMLSuggestionProxiesWithPredictionContext:(id)a3 modelSuggestionProxiesDict:(id)a4 candidateToFeatureVectorDictGetter:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("coreMLSuggestionProxies"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = _os_feature_enabled_impl();

    if (v13)
    {
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetCoreMLSuggestions", " enableTelemetry=YES ", buf, 2u);
      }

      -[_PSEnsembleModel coreMLScoringModel](self, "coreMLScoringModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getSuggestionProxiesForCandidateToFeatureVectorDictGetter:predictionContext:messageInteractionCache:shareInteractionCache:", v10, v8, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("coreMLSuggestionProxies"));

      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)v20 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetCoreMLSuggestions", (const char *)&unk_1A0908603, v20, 2u);
      }

    }
  }

}

- (void)getHeuristicSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hyperRecentSuggestionProxies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.3();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleHyperRecencyHeuristic", " enableTelemetry=YES ", buf, 2u);
    }

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestionDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hyperRecentHeuristicSuggestionProxiesWithReferenceDate:predictionContextBundleId:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("hyperRecentSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v35 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleHyperRecencyHeuristic", (const char *)&unk_1A0908603, v35, 2u);
    }

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inPhoneCallSuggestionProxies"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.2();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleInPhoneCallHeuristic", " enableTelemetry=YES ", v34, 2u);
    }

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "inPhoneCallHeuristicSuggestionProxiesWithBundleIds:predictionContext:", v9, v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("inPhoneCallSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)v33 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleInPhoneCallHeuristic", (const char *)&unk_1A0908603, v33, 2u);
    }

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("returnDocumentToSenderSuggestionProxies"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReturnToSenderHeuristic", " enableTelemetry=YES ", v32, 2u);
    }

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "returnDocumentToSender:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("returnDocumentToSenderSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)v31 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReturnToSenderHeuristic", (const char *)&unk_1A0908603, v31, 2u);
    }

  }
}

- (void)getRuleMiningSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("miningSuggestionProxies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleMiningSuggestions", " enableTelemetry=YES ", buf, 2u);
    }

    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoSuggestedPeople");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v14, "suggestionProxiesWithPredictionContext:photoSuggestedPeople:supportedBundleIDs:", v8, v16, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("miningSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleMiningSuggestions", (const char *)&unk_1A0908603, v19, 2u);
    }

  }
}

- (void)getKnnSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint8_t v45[16];

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionProxies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.6();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suggestionProxiesWithPredictionContext:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("knnSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnSharesAllProxies"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.5();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:withOnlyTopShares:withFilterOutNonMatchingSourceBundleIDs:", v7, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("knnSuggestionBasedOnSharesAllProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnSharesTopProxies"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.4();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:withOnlyTopShares:withFilterOutNonMatchingSourceBundleIDs:", v7, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("knnSuggestionBasedOnSharesTopProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnSharesAllAndAppFilterOnProxies"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.3();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:withOnlyTopShares:withFilterOutNonMatchingSourceBundleIDs:", v7, 0, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("knnSuggestionBasedOnSharesAllAndAppFilterOnProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnSharesTopAndAppFilterOnProxies"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.2();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:withOnlyTopShares:withFilterOutNonMatchingSourceBundleIDs:", v7, 1, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("knnSuggestionBasedOnSharesTopAndAppFilterOnProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v38))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnInteractionsProxies"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v41))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", " enableTelemetry=YES ", v45, 2u);
    }

    -[_PSEnsembleModel knnModel](self, "knnModel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "suggestionProxiesBasedOnNonSharingInteractionsWithPredictionContext:", v7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v43, CFSTR("knnSuggestionBasedOnInteractionsProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleKnnSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

  }
}

- (void)getOtherSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 modelSuggestionProxiesDict:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t v45[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sharingContactRankerModelSuggestionProxies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v44 = v9;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.4();
    v13 = v8;

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleContactRankerModelSuggestions", " enableTelemetry=YES ", buf, 2u);
    }

    -[_PSEnsembleModel sharingContactRankerModel](self, "sharingContactRankerModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "behaviorRulesConsideringInTheContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("knnSuggestionBasedOnSharesAllProxies"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scores");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suggestionProxiesWithPredictionContext:supportedBundleIDs:behaviorRulesConsideringInTheContext:interactionModelSuggestions:ruleRankingMLModelScores:", v13, v44, v17, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("sharingContactRankerModelSuggestionProxies"));

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleContactRankerModelSuggestions", (const char *)&unk_1A0908603, v45, 2u);
    }

    v8 = v13;
    v9 = v44;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("backFillProxies"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    +[_PSHeuristics PSHeuristicsRecencyReasonToString:](_PSHeuristics, "PSHeuristicsRecencyReasonToString:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "interactions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v28, 100, 0, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("backFillProxies"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("messagesRecencyProxies"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    +[_PSHeuristics PSHeuristicsRecencyReasonToString:](_PSHeuristics, "PSHeuristicsRecencyReasonToString:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "interactions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v35, 0, 1, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v36, CFSTR("messagesRecencyProxies"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shareSheetRecencyProxies"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    +[_PSHeuristics PSHeuristicsRecencyReasonToString:](_PSHeuristics, "PSHeuristicsRecencyReasonToString:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:].cold.1();

    -[_PSEnsembleModel heuristics](self, "heuristics");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "interactions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "proxiesByRecencyUsingInteractions:startIndex:reason:allowNonSupportedBundleIDs:", v42, 0, 2, -[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, CFSTR("shareSheetRecencyProxies"));

  }
}

- (id)getModelProxiesArrayWithPredictionContext:(id)a3
{
  int v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = objc_msgSend(a3, "isFallbackFetch");
  -[_PSEnsembleModel psConfig](self, "psConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    v10 = CFSTR("fallbackModelProxiesArray");
  else
    v10 = CFSTR("modelProxiesArray");
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getModelSuggestionsProxyDictWithModelProxiesArray:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_PSEnsembleModel getModelSuggestionsProxyDictWithModelProxiesArray:].cold.1(v3, v4);

  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_401);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:forKeys:", v6, v3);

  return v7;
}

- (id)getMeContactIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[_PSEnsembleModel contactStore](self, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactIdentifierKey_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel getMeContactIdentifier].cold.2();

  }
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSEnsembleModel getMeContactIdentifier].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)predictWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactKeysToFetch:(id)a5
{
  id v6;
  AeroMLTracerSession *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
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
  uint64_t v30;
  dispatch_block_t v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  NSObject *v63;
  double v64;
  void *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _PSTrialClient *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  _BOOL4 v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  NSObject *v90;
  int64_t v91;
  void *v92;
  void *v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  objc_class *v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  double v143;
  double v144;
  NSObject *v145;
  NSObject *v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i;
  uint64_t v151;
  void *v152;
  BOOL v153;
  void *v154;
  NSObject *v155;
  NSObject *v156;
  id v157;
  void *v158;
  unint64_t v159;
  unint64_t v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t j;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  BOOL v173;
  NSObject *queue;
  void *v175;
  id v176;
  int v177;
  const __CFString *v178;
  uint64_t v179;
  id v180;
  id v181;
  void *v182;
  void *v183;
  NSObject *v184;
  void *v185;
  objc_class *v186;
  id v187;
  void *v188;
  void *v189;
  NSObject *v190;
  NSObject *v191;
  NSObject *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  __CFString *v197;
  void (**v198)(void);
  unsigned int v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  _BOOL4 v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  void (**v218)(void);
  void *v219;
  void *v220;
  id v221;
  void *v222;
  AeroMLTracerSession *v223;
  void *v224;
  void *v225;
  id v226;
  id v227;
  _PSTrialClient *v228;
  void (**v229)(void);
  id v231;
  void *v232;
  id obj;
  NSObject *obja;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  _QWORD v240[4];
  _PSTrialClient *v241;
  _PSEnsembleModel *v242;
  id v243;
  _QWORD v244[4];
  id v245;
  id v246;
  __CFString *v247;
  _QWORD v248[5];
  id v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  _QWORD v255[4];
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  _QWORD v261[4];
  id v262;
  id v263;
  _QWORD v264[5];
  _QWORD v265[4];
  id v266;
  id v267;
  _QWORD v268[4];
  _PSTrialClient *v269;
  _QWORD v270[4];
  id v271;
  _BYTE *v272;
  _QWORD block[4];
  id v274;
  _PSEnsembleModel *v275;
  _BYTE *v276;
  uint64_t v277;
  uint64_t *v278;
  uint64_t v279;
  uint64_t v280;
  _BYTE v281[128];
  _BYTE v282[128];
  char v283[16];
  _QWORD v284[8];
  _QWORD v285[8];
  const __CFString *v286;
  void *v287;
  _QWORD v288[2];
  _QWORD v289[4];
  _BYTE buf[24];
  uint64_t (*v291)(uint64_t, uint64_t);
  void (*v292)(uint64_t);
  id v293;
  _QWORD v294[5];
  _QWORD v295[8];

  v295[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v221 = a5;
  v7 = [AeroMLTracerSession alloc];
  v239 = v6;
  objc_msgSend(v6, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peopleSuggesterShareSheetProjectName](_PSConstants, "peopleSuggesterShareSheetProjectName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = -[AeroMLTracerSession initWithTraceId:projectName:](v7, "initWithTraceId:projectName:", v8, v9);

  objc_msgSend(v6, "currentSpanId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSession createSubSpanWithName:parentSpanId:](v223, "createSubSpanWithName:parentSpanId:", CFSTR("predictWithPredictionContext"), v10);
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v232, "start");
  -[_PSEnsembleModel deviceIdentifier](self, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "addDeviceIdentifier:", v11);

  objc_msgSend(v232, "createSubSpanWithName:", CFSTR("readTrialInfo"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "start");
  v228 = objc_alloc_init(_PSTrialClient);
  -[_PSTrialClient getTrialExperiment](v228, "getTrialExperiment");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel addTrialInfoToPredictionContext:withExperiment:](self, "addTrialInfoToPredictionContext:withExperiment:", v6, v222);
  v236 = -[_PSTrialClient shouldActivatePSR](v228, "shouldActivatePSR");
  v199 = -[_PSTrialClient dataCollectionTimeToWaitInSeconds](v228, "dataCollectionTimeToWaitInSeconds");
  v207 = -[_PSTrialClient shouldEnableDataCollection](v228, "shouldEnableDataCollection");
  -[_PSTrialClient maxComputationTime](v228, "maxComputationTime");
  v13 = v12;
  objc_msgSend(v225, "end");
  v14 = _os_feature_enabled_impl();
  objc_msgSend(v232, "createSubSpanWithName:", CFSTR("fetchSupportedBundleIDsWithPredictionContextFilters"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "start");
  -[_PSEnsembleModel fetchSupportedBundleIDsWithPredictionContextFilters:](self, "fetchSupportedBundleIDsWithPredictionContextFilters:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportedBundleIds:", v15);

  objc_msgSend(v224, "end");
  objc_msgSend(v6, "suggestionsFilteredByBundleIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "suggestionsFilteredByBundleIds");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "logDebugEventWithName:details:attributes:", CFSTR("ClientRequestBundleIdFilters"), v18, MEMORY[0x1E0C9AA70]);

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v236;
    _os_log_debug_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_DEBUG, "ShouldActiveRSR Overwrite from trial: %d", buf, 8u);
  }

  v294[0] = CFSTR("PSRFeatureFlag");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v295[0] = v20;
  v294[1] = CFSTR("shouldActivatePSRTrialOverwrite");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v236);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v295[1] = v21;
  v294[2] = CFSTR("isFallbackFetch");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v6, "isFallbackFetch"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v295[2] = v22;
  v294[3] = CFSTR("sourceBundleID");
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v295[3] = v25;
  v294[4] = CFSTR("attachments_count");
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "attachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v27, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v295[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v295, v294, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "addAttributes:", v29);

  if ((v14 & v236) == 1)
  {
    objc_msgSend(v6, "setIsPSRActive:", 1);
    objc_msgSend(v6, "setReasonType:", CFSTR("PS_Rewrite"));
    if (predictWithPredictionContext_maxSuggestions_contactKeysToFetch___pasOnceToken141 != -1)
      dispatch_once(&predictWithPredictionContext_maxSuggestions_contactKeysToFetch___pasOnceToken141, &__block_literal_global_431);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v291 = __Block_byref_object_copy__1;
    v292 = __Block_byref_object_dispose__1;
    v30 = MEMORY[0x1E0C809B0];
    v293 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2;
    block[3] = &unk_1E43FF020;
    block[1] = 3221225472;
    v276 = buf;
    obj = v232;
    v274 = obj;
    v275 = self;
    v31 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async((dispatch_queue_t)predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue, v31);
    v270[0] = v30;
    v270[1] = 3221225472;
    v270[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_3;
    v270[3] = &unk_1E43FF048;
    v271 = v31;
    v272 = buf;
    v32 = v31;
    v229 = (void (**)(void))MEMORY[0x1A1AFCBF8](v270);

    _Block_object_dispose(buf, 8);
    objc_msgSend(v6, "queryStartDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v215 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v215 = (id)objc_claimAutoreleasedReturnValue();
    }

    if ((objc_msgSend(v6, "isFallbackFetch") & 1) != 0
      || !-[_PSTrialClient shouldComputePhotoBasedFeatures](v228, "shouldComputePhotoBasedFeatures"))
    {
      v198 = (void (**)(void))&__block_literal_global_437;
    }
    else
    {
      -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleForKey:", CFSTR("_PSGetPhotoBasedFeaturesTimeout"));
      if (v58 == 0.0)
        v59 = v13;
      else
        v59 = v58;

      objc_msgSend(v215, "dateByAddingTimeInterval:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "timeIntervalSinceNow");
      v62 = v61;
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = fmax(v62, 0.0);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v64;
        _os_log_impl(&dword_1A07F4000, v63, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Remaining photo based features timeout is %f", buf, 0xCu);
      }

      objc_msgSend(obj, "createSubSpanWithName:", CFSTR("psr_getPhotoBasedFeaturesAsync"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "start");
      -[_PSEnsembleModel psr_getPhotoBasedFeaturesAsync:withTimeout:](self, "psr_getPhotoBasedFeaturesAsync:withTimeout:", v6, v64);
      v198 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "end");

    }
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "sessionID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v67;
      _os_log_impl(&dword_1A07F4000, v66, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Getting suggestions for ShareSheet session %@", buf, 0xCu);

    }
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v68))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v68, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_predictWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
    }

    v69 = objc_msgSend(v6, "isFallbackFetch");
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v70, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSTrialClientLoading", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("loadTrialInfoConfig"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "start");
    -[_PSTrialClient configWithAnchorDate:](v228, "configWithAnchorDate:", v215);
    v227 = (id)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel enrichConfig:withInformationFromPredictionContext:](self, "enrichConfig:withInformationFromPredictionContext:", v227, v6);
    objc_msgSend(v213, "end");
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSTrialClientLoading", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v72, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSInteractionsStatisticsQuery", " enableTelemetry=YES ", buf, 2u);
    }

    if (v69)
    {
      v289[0] = CFSTR("ConversationBundleId");
      v289[1] = CFSTR("timeSinceLastOutgoingInteraction");
      v289[2] = CFSTR("numberOfSharesWithConversation");
      v289[3] = CFSTR("numberOfOutgoingInteractionsWithConversation");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v289, 4);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setStatsToCompute:", v73);

      objc_msgSend(v227, "setFetchLimit:", 1000);
      objc_msgSend(v227, "setShouldSortAscending:", 1);
      v288[0] = CFSTR("numberOfSharesWithConversation");
      v288[1] = CFSTR("numberOfOutgoingInteractionsWithConversation");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v288, 2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setFeatureNamesToSortWith:", v74);

      objc_msgSend(v227, "setIsFallbackFetch:", 1);
    }
    v75 = predictWithPredictionContext_maxSuggestions_contactKeysToFetch__trialRankingModelPrefetchQueue;
    v268[0] = MEMORY[0x1E0C809B0];
    v268[1] = 3221225472;
    v268[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_444;
    v268[3] = &unk_1E43FEB68;
    v76 = v228;
    v269 = v76;
    dispatch_async(v75, v268);
    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("getInteractionsStatisticsForConfig"));
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "start");
    -[_PSEnsembleModel interactionStore](self, "interactionStore");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "getInteractionsStatisticsForConfig:", v227);
    v238 = (void *)objc_claimAutoreleasedReturnValue();

    if (v238)
    {
      objc_msgSend(v238, "queryStats");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "addAttributes:", v78);

    }
    objc_msgSend(v217, "end");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "timeIntervalSinceDate:", v215);
    v81 = v80 > v13;

    if (v81)
    {
      +[_PSConstants suggestionPathBestEffort](_PSConstants, "suggestionPathBestEffort");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "setSuggestionPath:", v82);

    }
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.4(v238, v83);

    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.3();

    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("logPipeline_interactionsStatisticsCandidate_sourcing"));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "start");
    -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setEnablePipelineCheckpointing:](self, "setEnablePipelineCheckpointing:", objc_msgSend(v85, "BOOLForKey:", CFSTR("enablePipelineCheckpointing")));

    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      v87 = -[_PSEnsembleModel enablePipelineCheckpointing](self, "enablePipelineCheckpointing");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v87;
      _os_log_impl(&dword_1A07F4000, v86, OS_LOG_TYPE_INFO, "_PSEnsemble: enablePipelineCheckpointing = %d", buf, 8u);
    }

    -[_PSTrialClient rankingModel](v76, "rankingModel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setupAeroMLPipelineLoggerWithModel:](self, "setupAeroMLPipelineLoggerWithModel:", v88);

    objc_msgSend(v239, "sessionID");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel logPipeline:withPipelineStage:andSessionID:andCandidateNames:](self, "logPipeline:withPipelineStage:andSessionID:andCandidateNames:", v238, CFSTR("candidate_sourcing"), v89, 0);

    objc_msgSend(v211, "end");
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v90, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSInteractionsStatisticsQuery", (const char *)&unk_1A0908603, buf, 2u);
    }

    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("pruneCandidatesForRanking"));
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "start");
    v91 = -[_PSEnsembleModel pruneCandidatesForRanking:](self, "pruneCandidatesForRanking:", v238);
    v286 = CFSTR("pruneCount");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = v92;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v287, &v286, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "addAttributes:", v93);

    objc_msgSend(v219, "end");
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.2(v238, v94);

    if (v69)
    {
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v95, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Skipped additional stats signals", buf, 2u);
      }

      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v96, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Skipped photo based signals", buf, 2u);
      }
    }
    else
    {
      -[_PSEnsembleModel addAdditionalStatsSignalsToCandidates:withTrialClient:](self, "addAdditionalStatsSignalsToCandidates:withTrialClient:", v238, v76);
      objc_msgSend(obj, "createSubSpanWithName:", CFSTR("logPipeline_interactionsStatisticsCandidates_with_additional_features"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "start");
      objc_msgSend(v239, "sessionID");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel logPipeline:withPipelineStage:andSessionID:andCandidateNames:](self, "logPipeline:withPipelineStage:andSessionID:andCandidateNames:", v238, CFSTR("candidates_with_additional_features"), v98, 0);

      objc_msgSend(v97, "end");
      v198[2]();
      objc_msgSend(v239, "peopleInPhotoIdentifiers");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "computePASSFeatureWithPeopleDetectedInPhoto:", v99);

      objc_msgSend(obj, "createSubSpanWithName:", CFSTR("logPipeline_interactionsStatisticsCandidates_with_photo_based_features"));
      v96 = objc_claimAutoreleasedReturnValue();
      -[NSObject start](v96, "start");
      objc_msgSend(v239, "sessionID");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel logPipeline:withPipelineStage:andSessionID:andCandidateNames:](self, "logPipeline:withPipelineStage:andSessionID:andCandidateNames:", v238, CFSTR("candidates_with_photo_based_features"), v100, 0);

      -[NSObject end](v96, "end");
    }

    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.1();

    if ((v69 & 1) != 0)
    {
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v102, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: skipped coreML model", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(obj, "createSubSpanWithName:", CFSTR("evaluateCandidates"));
      v102 = objc_claimAutoreleasedReturnValue();
      -[NSObject start](v102, "start");
      -[_PSTrialClient rankingModel](v76, "rankingModel");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel evaluateCandidates:psrMLModel:](self, "evaluateCandidates:psrMLModel:", v238, v103);

      -[NSObject end](v102, "end");
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v104, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Ran the features through the coreML model", buf, 2u);
      }

      objc_msgSend(obj, "createSubSpanWithName:", CFSTR("logPipeline_interactionsStatisticsCandidates_with_coreml_output"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "start");
      objc_msgSend(v239, "sessionID");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel logPipeline:withPipelineStage:andSessionID:andCandidateNames:](self, "logPipeline:withPipelineStage:andSessionID:andCandidateNames:", v238, CFSTR("candidates_with_coreml_output"), v106, 0);

      objc_msgSend(v105, "end");
    }

    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("finalSuggestionProxiesForInteractionStatistics"));
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "start");
    -[_PSEnsembleModel finalSuggestionProxiesForInteractionStatistics:config:trialClient:context:](self, "finalSuggestionProxiesForInteractionStatistics:config:trialClient:context:", v238, v227, v76, v239);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "end");
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v107))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v107, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A0908603, buf, 2u);
    }

    objc_msgSend(v239, "sessionID");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setTraceId:](self, "setTraceId:", v108);

    objc_msgSend(obj, "getSpanId");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel setCurrentSpanId:](self, "setCurrentSpanId:", v109);

    -[_PSEnsembleModel fetchSupportedBundleIDsWithPredictionContextFilters:](self, "fetchSupportedBundleIDsWithPredictionContextFilters:", v239);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel defaultContactKeysToFetch](self, "defaultContactKeysToFetch");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v229[2]();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:](self, "suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:", v206, v110, v111, v112, a4);
    v231 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(obj, "createSubSpanWithName:", CFSTR("logPipelineWithSuggestions"));
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "start");
    objc_msgSend(v239, "sessionID");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel logPipelineWithSuggestions:interactionsStatistics:pipelineStage:sessionID:](self, "logPipelineWithSuggestions:interactionsStatistics:pipelineStage:sessionID:", v231, v238, CFSTR("final_candidates_after_UI_resolution"), v113);

    objc_msgSend(v208, "end");
    -[_PSEnsembleModel addSuggestedRankFeature:interactionsStatistics:](self, "addSuggestedRankFeature:interactionsStatistics:", v231, v238);
    -[_PSEnsembleModel addSupportedBundleIDs:](self, "addSupportedBundleIDs:", v231);
    -[_PSEnsembleModel addUTIInfo:predictionContext:](self, "addUTIInfo:predictionContext:", v231, v239);
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v231;
      _os_log_impl(&dword_1A07F4000, v114, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: final suggestions %{private}@", buf, 0xCu);
    }

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v115))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v115, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v116))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_predictWithPredictionContext", (const char *)&unk_1A0908603, buf, 2u);
    }

    if (objc_msgSend(v231, "count"))
    {
      objc_msgSend(v231, "firstObject");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "utiList");
      v118 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v118 = &stru_1E4402490;
    }
    v284[0] = CFSTR("utiList");
    v197 = (__CFString *)v118;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v285[0] = v119;
    v284[1] = CFSTR("predictionContext_photoSuggestedPeople");
    v120 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v239, "photoSuggestedPeople");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v205, "count"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v285[1] = v204;
    v284[2] = CFSTR("predictionContext_scenesInPhotoIdentifiers");
    v121 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v239, "scenesInPhotoIdentifiers");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v203, "count"));
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v285[2] = v202;
    v284[3] = CFSTR("predictionContext_peopleInPhotoIdentifiers");
    v122 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v239, "peopleInPhotoIdentifiers");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v201, "count"));
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v285[3] = v200;
    v284[4] = CFSTR("predictionContext_suggestionPath");
    v123 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v239, "suggestionPath");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "stringWithFormat:", CFSTR("%@"), v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v285[4] = v125;
    v284[5] = CFSTR("messageInteractionCache_count");
    v126 = (void *)MEMORY[0x1E0CB3940];
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v127, "size"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v285[5] = v128;
    v284[6] = CFSTR("shareInteractionCache_count");
    v129 = (void *)MEMORY[0x1E0CB3940];
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v130, "size"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v285[6] = v131;
    v284[7] = CFSTR("allOtherInteractionCache_count");
    v132 = (void *)MEMORY[0x1E0CB3940];
    -[_PSEnsembleModel allOtherInteractionCache](self, "allOtherInteractionCache");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v133, "size"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v285[7] = v134;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v285, v284, 8);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "addAttributes:", v135);

    if (v207)
    {
      v265[0] = MEMORY[0x1E0C809B0];
      v265[1] = 3221225472;
      v265[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_493;
      v265[3] = &unk_1E43FF090;
      v266 = v227;
      v267 = v238;
      -[_PSEnsembleModel psrDataCollectionForContext:timeToWaitInSeconds:maxComputationTime:withConfigAndStatsBlock:](self, "psrDataCollectionForContext:timeToWaitInSeconds:maxComputationTime:withConfigAndStatsBlock:", v239, v199, v265, v13);

    }
    objc_msgSend(obj, "end");

  }
  else
  {
    objc_msgSend(v6, "setReasonType:", CFSTR("PS_Legacy"));
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetFetchSupportedBundleIDs", " enableTelemetry=YES ", buf, 2u);
    }

    -[_PSEnsembleModel fetchSupportedBundleIDsWithPredictionContextFilters:](self, "fetchSupportedBundleIDsWithPredictionContextFilters:", v6);
    v229 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel populateCachesWithSupportedBundleIDs:](self, "populateCachesWithSupportedBundleIDs:", v229);
    v264[0] = MEMORY[0x1E0C809B0];
    v264[1] = 3221225472;
    v264[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_498;
    v264[3] = &unk_1E43FEB68;
    v264[4] = self;
    v226 = (id)MEMORY[0x1A1AFCBF8](v264);
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetFetchSupportedBundleIDs", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "size");
      -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "size");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v41;
      _os_log_impl(&dword_1A07F4000, v37, OS_LOG_TYPE_DEFAULT, "Messages interaction count: %tu, Sharing interaction count: %tu", buf, 0x16u);

    }
    -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLForKey:", CFSTR("_PSReturnRecentNonSystemSuggestions"));

    if (v43)
    {
      -[_PSEnsembleModel heuristics](self, "heuristics");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "recentNonSystemSuggestionsForBundleIDs:numberOfSuggestion:", v229, a4);
      v231 = (id)objc_claimAutoreleasedReturnValue();

      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v231, "count"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_INFO, "Returning %@ recent non-system suggestions", buf, 0xCu);

      }
    }
    else
    {
      -[_PSEnsembleModel getModelProxiesArrayWithPredictionContext:](self, "getModelProxiesArrayWithPredictionContext:", v6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v47, "_pas_componentsJoinedByString:", CFSTR(","));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.7(v49, (uint64_t)v283, v48);
      }

      -[_PSEnsembleModel getModelSuggestionsProxyDictWithModelProxiesArray:](self, "getModelSuggestionsProxyDictWithModelProxiesArray:", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("coreMLSuggestionProxies"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51 == 0;

      if (!v52
        && -[_PSEnsembleModel coreMLModelNeedsDurableFeatures](self, "coreMLModelNeedsDurableFeatures")
        && !-[_PSFeatureCache isDurableFeaturesSetAdmissible](self->_featureCache, "isDurableFeaturesSetAdmissible"))
      {
        objc_msgSend(v50, "removeObjectForKey:", CFSTR("coreMLSuggestionProxies"));
      }
      v237 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", a4);
      -[_PSEnsembleModel candidatesForShareSheetRanking](self, "candidatesForShareSheetRanking");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_os_feature_enabled_impl()
        || (objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("coreMLSuggestionProxies")),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = v54 == 0,
            v54,
            v55))
      {
        v56 = 0;
      }
      else
      {
        -[_PSFeatureCache fetchFeaturesWithCandidates:context:](self->_featureCache, "fetchFeaturesWithCandidates:context:", v53, v239);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v261[0] = MEMORY[0x1E0C809B0];
      v261[1] = 3221225472;
      v261[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_502;
      v261[3] = &unk_1E43FF0E0;
      v210 = v53;
      v262 = v210;
      v212 = v56;
      v263 = v212;
      v220 = (void *)MEMORY[0x1A1AFCBF8](v261);

      if (v220)
        -[_PSEnsembleModel getCoreMLSuggestionProxiesWithPredictionContext:modelSuggestionProxiesDict:candidateToFeatureVectorDictGetter:](self, "getCoreMLSuggestionProxiesWithPredictionContext:modelSuggestionProxiesDict:candidateToFeatureVectorDictGetter:", v239, v50);
      +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = (objc_class *)objc_opt_class();
      NSStringFromClass(v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "objectForKeyedSubscript:", v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("enablePhotoBasedFeatures"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v140, "BOOLValue");

      if (v141)
      {
        -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "doubleForKey:", CFSTR("_PSGetPhotoBasedFeaturesTimeout"));
        if (v143 == 0.0)
          v144 = 0.275;
        else
          v144 = v143;

        -[_PSEnsembleModel getPhotoBasedFeaturesAsync:withTimeout:](self, "getPhotoBasedFeaturesAsync:withTimeout:", v239, v144);
        v218 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A07F4000, v145, OS_LOG_TYPE_INFO, "Photos-based features fetching is disabled", buf, 2u);
        }

        v218 = (void (**)(void))&__block_literal_global_510;
      }
      -[_PSEnsembleModel getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:](self, "getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:", v239, v229, v50);
      -[_PSEnsembleModel getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:](self, "getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:", v239, v229, v50);
      -[_PSEnsembleModel getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:](self, "getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:", v239, v229, v50);
      -[_PSEnsembleModel getMeContactIdentifier](self, "getMeContactIdentifier");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v218[2]();
      -[_PSEnsembleModel getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:](self, "getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:", v239, v229, v50);
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v146, OS_LOG_TYPE_INFO, "Prediction Context - Start to re-order", buf, 2u);
      }

      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v147))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v147, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", " enableTelemetry=YES ", buf, 2u);
      }

      v259 = 0u;
      v260 = 0u;
      v257 = 0u;
      v258 = 0u;
      obja = v47;
      v148 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v257, v282, 16);
      if (v148)
      {
        v149 = *(_QWORD *)v258;
        do
        {
          for (i = 0; i != v148; ++i)
          {
            if (*(_QWORD *)v258 != v149)
              objc_enumerationMutation(obja);
            v151 = *(_QWORD *)(*((_QWORD *)&v257 + 1) + 8 * i);
            objc_msgSend(v50, "objectForKeyedSubscript:", v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = v152 == 0;

            if (!v153)
            {
              objc_msgSend(v50, "objectForKeyedSubscript:", v151);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v237, "addObjectsFromArray:", v154);

            }
          }
          v148 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v257, v282, 16);
        }
        while (v148);
      }

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v155 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)&buf[4] = v50;
        _os_log_impl(&dword_1A07F4000, v155, OS_LOG_TYPE_DEFAULT, "modelSuggestionProxiesDict: %{private}@", buf, 0xCu);
      }

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v156 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        v255[0] = MEMORY[0x1E0C809B0];
        v255[1] = 3221225472;
        v255[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_511;
        v255[3] = &unk_1E43FF128;
        v256 = v50;
        __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_511((uint64_t)v255);
        v157 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v157;
        _os_log_impl(&dword_1A07F4000, v156, OS_LOG_TYPE_DEFAULT, "modelSuggestionProxiesDict - counts: %@", buf, 0xCu);

      }
      if (!v221)
      {
        -[_PSEnsembleModel defaultContactKeysToFetch](self, "defaultContactKeysToFetch");
        v221 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v237, "array");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:](self, "suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:", v158, v229, v221, v216, a4);
      v214 = (void *)objc_claimAutoreleasedReturnValue();

      v159 = objc_msgSend(v214, "count");
      if (v159 >= a4)
        v160 = a4;
      else
        v160 = v159;
      objc_msgSend(v214, "subarrayWithRange:", 0, v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSEnsembleModel addAdaptedModelUsageInfoToSuggestions:](self, "addAdaptedModelUsageInfoToSuggestions:", v161);
      -[_PSEnsembleModel addSupportedBundleIDs:](self, "addSupportedBundleIDs:", v161);
      v253 = 0u;
      v254 = 0u;
      v251 = 0u;
      v252 = 0u;
      v162 = v161;
      v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v251, v281, 16);
      if (v163)
      {
        v164 = *(_QWORD *)v252;
        do
        {
          for (j = 0; j != v163; ++j)
          {
            if (*(_QWORD *)v252 != v164)
              objc_enumerationMutation(v162);
            v166 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * j);
            v167 = (void *)objc_msgSend(v50, "copy");
            objc_msgSend(v166, "setModelSuggestionProxies:", v167);

            if (objc_msgSend(v239, "isFallbackFetch"))
            {
              v168 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v166, "reason");
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              v170 = (void *)objc_msgSend(v168, "initWithFormat:", CFSTR("%@\n%@"), v169, CFSTR("Fallback Suggestion"));
              objc_msgSend(v166, "setReason:", v170);

            }
          }
          v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v251, v281, 16);
        }
        while (v163);
      }

      -[_PSEnsembleModel addUTIInfo:predictionContext:](self, "addUTIInfo:predictionContext:", v162, v239);
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("coreMLSuggestionProxies"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (v171)
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("coreMLSuggestionProxies"));
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = objc_msgSend(v172, "count") == 0;

        if (!v173)
        {
          if (_os_feature_enabled_impl())
          {
            queue = self->_queue;
            v248[0] = MEMORY[0x1E0C809B0];
            v248[1] = 3221225472;
            v248[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_518;
            v248[3] = &unk_1E43FF150;
            v248[4] = self;
            v249 = v162;
            v250 = v50;
            dispatch_async(queue, v248);

          }
        }
      }
      v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v237, "count"));
      v176 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v177 = objc_msgSend(v239, "isFallbackFetch");
      if (v177)
        v178 = CFSTR("fallback");
      else
        v178 = CFSTR("ensemble");
      if (v177)
        v179 = 2;
      else
        v179 = 0;
      v244[0] = MEMORY[0x1E0C809B0];
      v244[1] = 3221225472;
      v244[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523;
      v244[3] = &unk_1E43FF178;
      v180 = v176;
      v245 = v180;
      v181 = v175;
      v246 = v181;
      v247 = (__CFString *)v178;
      objc_msgSend(v162, "enumerateObjectsUsingBlock:", v244);
      objc_msgSend(v239, "sessionID");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v182)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "UUIDString");
        v182 = (void *)objc_claimAutoreleasedReturnValue();

        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v184 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT))
          -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.6();

      }
      v277 = 0;
      v278 = &v277;
      v279 = 0x2050000000;
      v185 = (void *)getPSPeopleSuggestionsMetricsInferenceEventClass_softClass;
      v280 = getPSPeopleSuggestionsMetricsInferenceEventClass_softClass;
      if (!getPSPeopleSuggestionsMetricsInferenceEventClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke;
        v291 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E43FEA00;
        v292 = (void (*)(uint64_t))&v277;
        __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke((uint64_t)buf);
        v185 = (void *)v278[3];
      }
      v186 = objc_retainAutorelease(v185);
      _Block_object_dispose(&v277, 8);
      v187 = [v186 alloc];
      v188 = (void *)objc_msgSend(v181, "copy");
      v189 = (void *)objc_msgSend(v187, "initWithIdentifier:responseType:suggestions:", v182, v179, v188);

      if (v189)
      {
        objc_msgSend(getPSMetricsManagerClass(), "recordWithPeopleInference:", v189);
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v190 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_FAULT))
          -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.5();

      }
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v191 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v191))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v191, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleDedupingAndTrimming", (const char *)&unk_1A0908603, buf, 2u);
      }

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v192 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
      {
        v193 = objc_msgSend(v162, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v193;
        _os_log_impl(&dword_1A07F4000, v192, OS_LOG_TYPE_DEFAULT, "Returning %tu suggestions", buf, 0xCu);
      }

      v240[0] = MEMORY[0x1E0C809B0];
      v240[1] = 3221225472;
      v240[2] = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_528;
      v240[3] = &unk_1E43FF1A0;
      v241 = v228;
      v242 = self;
      v243 = v239;
      -[_PSEnsembleModel psrDataCollectionForContext:timeToWaitInSeconds:maxComputationTime:withConfigAndStatsBlock:](self, "psrDataCollectionForContext:timeToWaitInSeconds:maxComputationTime:withConfigAndStatsBlock:", v243, v199, v240, v13);
      objc_msgSend(v232, "end");
      v194 = v243;
      v231 = v162;

      v45 = obja;
    }

    v195 = v226;
    if (v226)
    {
      (*((void (**)(void))v226 + 2))();
      v195 = v226;
    }

  }
  return v231;
}

- (void)addSuggestedRankFeature:(id)a3 interactionsStatistics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "conversationIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(v12, "derivedIntentIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 + i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forFeature:andConversationId:", v14, CFSTR("suggestedRank"), v13);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = (v9 + i);
    }
    while (v8);
  }

}

- (void)addAdaptedModelUsageInfoToSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setIsAdaptedModelCreated:", objc_msgSend(v11, "isAdaptedModelCreated"));

          -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setIsAdaptedModelUsed:", objc_msgSend(v12, "isAdaptedModelUsed"));

          -[_PSEnsembleModel ruleMiningModel](self, "ruleMiningModel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extractAdaptedModelRecipeID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAdaptedModelRecipeID:", v14);

        }
        else
        {
          objc_msgSend(v9, "setIsAdaptedModelCreated:", 0);
          objc_msgSend(v9, "setIsAdaptedModelUsed:", 0);
          objc_msgSend(v9, "setAdaptedModelRecipeID:", 0);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (int)modelProxyToVirtualFeatureStoreFeature:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("knnSuggestionProxies")) & 1) != 0)
  {
    v4 = 691;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("inPhoneCallSuggestionProxies")) & 1) != 0)
  {
    v4 = 695;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("miningSuggestionProxies")) & 1) != 0)
  {
    v4 = 692;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hyperRecentSuggestionProxies")) & 1) != 0)
  {
    v4 = 698;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("backFillProxies")) & 1) != 0)
  {
    v4 = 702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photosGroupSuggestionProxies")) & 1) != 0)
  {
    v4 = 700;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photosGroupSuggestionProxiesAssetPresence")) & 1) != 0)
  {
    v4 = 701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photoSuggestionProxiesFilteredByAssetOrMomentPresence")) & 1) != 0)
  {
    v4 = 699;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("returnDocumentToSenderSuggestionProxies")) & 1) != 0)
  {
    v4 = 704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shareSheetRecencyProxies")) & 1) != 0)
  {
    v4 = 708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("messagesRecencyProxies")) & 1) != 0)
  {
    v4 = 709;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("coreMLSuggestionProxies")) & 1) != 0)
  {
    v4 = 703;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_PSEnsembleModel modelProxyToVirtualFeatureStoreFeature:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (void)addTrialInfoToPredictionContext:(id)a3 withExperiment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrialExperimentId:", v7);

  objc_msgSend(v5, "treatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrialTreatmentId:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_msgSend(v5, "deploymentId");

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%d"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrialDeploymentId:", v11);

}

- (void)addExtraInformationWithSuggestions:(id)a3 modelSuggestionProxiesDict:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _PSFeatureCache *featureCache;
  void *v12;
  void *v13;
  uint64_t v14;
  _PSFeatureCache *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[4];

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke;
  v18[3] = &unk_1E43FF1C8;
  v18[4] = self;
  v18[5] = v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_530;
  v17[3] = &unk_1E43FF218;
  v17[4] = self;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[_PSEnsembleModel trialID](self, "trialID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v10)
  {
    featureCache = self->_featureCache;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D020D0]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, v10, 0, 0);
    -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:](featureCache, "setFeatureValueForFeatureName:featureValue:candidate:bundleID:", 706, v12, CFSTR("self"), CFSTR("self"));

  }
  +[_PSConstants ensembleModel](_PSConstants, "ensembleModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    +[_PSConstants coreMLModel](_PSConstants, "coreMLModel");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v15 = self->_featureCache;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D020D0]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, v13, 0, 0);
  -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:](v15, "setFeatureValueForFeatureName:featureValue:candidate:bundleID:", 705, v16, CFSTR("self"), CFSTR("self"));

  _Block_object_dispose(v19, 8);
}

- (void)addUTIInfo:(id)a3 predictionContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v6, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "UTI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "UTI");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "UTI list passed in _PSSuggestion objects: %@", buf, 0xCu);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "setUtiList:", v17, (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (void)addSupportedBundleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSEnsembleModel fetchShareSheetSupportedBundleIDs](self, "fetchShareSheetSupportedBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Supported bundle IDs passed in _PSSuggestion objects: %@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setSupportedBundleIDs:", v6, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

+ (id)_suggestionInteractionPredicatesForFirstPartyMessages:(BOOL)a3 bundleID:(id)a4 interactionRecipients:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v6 = a3;
  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", CFSTR("bundleID"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  if (v10)
    v13 = v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v13, "arrayByAddingObject:", CFSTR("interactionRecipients"));
  v14 = objc_claimAutoreleasedReturnValue();

  v10 = (id)v14;
  if (v14)
  {
LABEL_4:
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[_PSEnsembleModel _suggestionInteractionPredicatesForFirstPartyMessages:bundleID:interactionRecipients:].cold.1(v10, v11);
    v12 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
LABEL_12:
  if (_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___pasOnceToken200 != -1)
    dispatch_once(&_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___pasOnceToken200, &__block_literal_global_539);
  v15 = &_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates;
  if (!v6)
    v15 = &_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates;
  v16 = (void *)*v15;
  v22[0] = CFSTR("bundleID");
  v22[1] = CFSTR("interactionRecipients");
  v23[0] = v7;
  v23[1] = v9;
  v17 = (void *)MEMORY[0x1E0C99D80];
  v10 = v16;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke_2;
  v20[3] = &unk_1E43FF260;
  v21 = v18;
  v11 = v18;
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v12;
}

- (id)suggestionsFromSuggestionProxies:(id)a3 supportedBundleIDs:(id)a4 contactKeysToFetch:(id)a5 meContactIdentifier:(id)a6 maxSuggestions:(unint64_t)a7
{
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  AeroMLTracerSession *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  _BOOL4 v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  _PSSuggestionProxy *v63;
  void *v64;
  void *v65;
  int v66;
  _PSSuggestionProxy *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _PSSuggestionProxy *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _PSSuggestionTemplate *v84;
  void *v85;
  void *v86;
  void *v87;
  _PSSuggestionTemplate *v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  int v104;
  void *v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  _BOOL4 v115;
  void *v116;
  void *v117;
  NSObject *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  _BOOL4 v143;
  void *v144;
  void *v145;
  _BOOL4 v146;
  void *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  char v152;
  char v153;
  void *v154;
  char v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  char v161;
  void *v162;
  void *v163;
  BOOL v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t k;
  void *v175;
  void *v176;
  void *v177;
  BOOL v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  BOOL v193;
  BOOL v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  _PSSuggestionTemplate *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  _PSSuggestionTemplate *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  id v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t m;
  uint64_t v232;
  void *v233;
  _BOOL4 v234;
  void *v235;
  void *v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t n;
  uint64_t v241;
  void *v242;
  _BOOL4 v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t ii;
  uint64_t v248;
  void *v249;
  _BOOL4 v250;
  void *v251;
  id CNContactClass;
  void *v253;
  void *v254;
  id v255;
  unint64_t v256;
  unint64_t v257;
  NSObject *v258;
  NSObject *v259;
  id v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t jj;
  void *v264;
  void *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  uint64_t v269;
  void *v270;
  int v271;
  void *v272;
  void *v273;
  int v274;
  NSObject *v275;
  uint64_t v276;
  id v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  void *v282;
  id v283;
  void *v284;
  void *v285;
  int v286;
  void *v287;
  void *v288;
  int v289;
  NSObject *v290;
  NSObject *v291;
  id v292;
  uint64_t nn;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  char v298;
  void *v299;
  char v300;
  _BOOL4 v301;
  void *v302;
  uint64_t v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  char v308;
  void *v309;
  _BOOL4 v310;
  void *v311;
  void *v312;
  char v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  int v320;
  void *v321;
  uint64_t v322;
  id v323;
  void *v324;
  void *v325;
  uint64_t v326;
  void *v327;
  void *v328;
  int v329;
  void *v330;
  void *v331;
  uint64_t v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  _BOOL4 v344;
  void *v345;
  void *v346;
  char v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  BOOL v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  id v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t i1;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  char v373;
  void *v374;
  void *v375;
  char v376;
  void *v377;
  _BOOL4 v378;
  id v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t kk;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t mm;
  void *v387;
  void *v388;
  void *v389;
  NSObject *v390;
  uint64_t v391;
  void *v392;
  NSObject *v393;
  void *v394;
  uint64_t v395;
  void *v396;
  void *v397;
  uint64_t v398;
  void *v399;
  void *v400;
  uint64_t v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  unint64_t v418;
  void *v419;
  id v420;
  id v421;
  AeroMLTracerSession *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  id v429;
  void *v430;
  id v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  unint64_t v437;
  void *v438;
  uint64_t v439;
  id v440;
  void *v441;
  void *v442;
  id v443;
  uint64_t v444;
  void *v445;
  id obj;
  uint64_t v447;
  void *v448;
  void *v449;
  void *v450;
  id v451;
  void *v452;
  void *v453;
  void *v454;
  id v455;
  id v456;
  id v457;
  id v458;
  id v459;
  int v460;
  id v461;
  void *v462;
  void *v463;
  id v464;
  int v465;
  id v466;
  void *v467;
  os_log_t oslog;
  os_log_t osloga;
  os_log_t oslogb;
  os_log_t oslogc;
  void *v472;
  uint64_t v473;
  void *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  id v482;
  uint64_t v483;
  _PSSuggestionProxy *v484;
  uint64_t v485;
  void *v486;
  void *v487;
  unsigned int context;
  void *contexta;
  id contextb;
  void *v491;
  id v492;
  int v493;
  char v494;
  id v495;
  id v496;
  id v497;
  id v498;
  id v499;
  NSObject *v500;
  int v501;
  uint64_t v502;
  id v503;
  id v504;
  id v505;
  uint64_t v506;
  id v507;
  NSObject *v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  id v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  id v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  id v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  _QWORD v568[5];
  id v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  uint8_t v574;
  char v575[15];
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  uint64_t v592;
  uint64_t *v593;
  uint64_t v594;
  uint64_t v595;
  _QWORD v596[9];
  _QWORD v597[9];
  _BYTE v598[128];
  void *v599;
  void *v600;
  void *v601;
  void *v602;
  _BYTE v603[128];
  _BYTE v604[128];
  _BYTE v605[128];
  _BYTE v606[128];
  _BYTE v607[128];
  _BYTE v608[128];
  _BYTE v609[128];
  _BYTE v610[128];
  _BYTE v611[128];
  _BYTE v612[128];
  _BYTE v613[128];
  _BYTE v614[128];
  _BYTE v615[128];
  void *v616;
  _BYTE v617[128];
  _BYTE v618[128];
  _BYTE v619[128];
  _BYTE v620[128];
  _BYTE v621[128];
  _BYTE buf[24];
  os_log_t v623;
  uint64_t *v624;
  uint64_t v625;

  v7 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5, a6, a7);
  v418 = v8;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)v7;
  v625 = *MEMORY[0x1E0C80C00];
  v17 = v16;
  v421 = v14;
  v455 = v12;
  v431 = v10;
  v18 = [AeroMLTracerSession alloc];
  v462 = v15;
  objc_msgSend(v15, "traceId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peopleSuggesterShareSheetProjectName](_PSConstants, "peopleSuggesterShareSheetProjectName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v422 = -[AeroMLTracerSession initWithTraceId:projectName:](v18, "initWithTraceId:projectName:", v19, v20);

  objc_msgSend(v15, "currentSpanId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSession createSubSpanWithName:parentSpanId:](v422, "createSubSpanWithName:parentSpanId:", CFSTR("suggestionsFromSuggestionProxies"), v21);
  v428 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v428, "start");
  objc_msgSend(v428, "createSubSpanWithName:", CFSTR("cachedMessagesInteractions"));
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v425, "start");
  objc_msgSend(v15, "messageInteractionCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "interactions");
  v432 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v425, "end");
  objc_msgSend(v428, "createSubSpanWithName:", CFSTR("cachedShares"));
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v424, "start");
  objc_msgSend(v15, "shareInteractionCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "interactions");
  v433 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v424, "end");
  +[_PSConstants messagesBundleIds](_PSConstants, "messagesBundleIds");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mailBundleIds](_PSConstants, "mailBundleIds");
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareplayBundleIds](_PSConstants, "shareplayBundleIds");
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants systemBundleIds](_PSConstants, "systemBundleIds");
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v421);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  _PSShareSheetExtensionBundleIDToAppBundleIDMapping(objc_msgSend(v15, "allowNonSupportedBundleIDs"));
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v440 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v428, "createSubSpanWithName:", CFSTR("buildSuggestionTemplates"));
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v423, "start");
  v591 = 0u;
  v590 = 0u;
  v589 = 0u;
  v588 = 0u;
  obj = v17;
  v447 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v588, v621, 16);
  if (v447)
  {
    v444 = *(_QWORD *)v589;
    do
    {
      v464 = 0;
      v24 = obj;
      do
      {
        if (*(_QWORD *)v589 != v444)
          objc_enumerationMutation(v24);
        v484 = (_PSSuggestionProxy *)*(id *)(*((_QWORD *)&v588 + 1) + 8 * (_QWORD)v464);
        v453 = (void *)MEMORY[0x1A1AFCA24]();
        -[_PSSuggestionProxy interactionRecipients](v484, "interactionRecipients");
        v25 = objc_claimAutoreleasedReturnValue();
        -[_PSSuggestionProxy contactID](v484, "contactID");
        v476 = objc_claimAutoreleasedReturnValue();
        if (!(v25 | v476))
        {
          -[_PSSuggestionProxy handles](v484, "handles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (v27)
          {
            v486 = 0;
            goto LABEL_226;
          }
        }
        -[_PSSuggestionProxy bundleID](v484, "bundleID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          -[_PSSuggestionProxy bundleID](v484, "bundleID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v442, "containsObject:", v29);

          if (!v30)
          {
            v486 = (void *)v25;
            goto LABEL_226;
          }
        }
        if (!v476)
          goto LABEL_55;
        -[_PSSuggestionProxy handle](v484, "handle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (!v32)
          goto LABEL_55;
        v505 = v442;
        +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v505, "removeObject:", v33);

        if (!-[_PSSuggestionProxy useGroupsWhenFindingRecipient](v484, "useGroupsWhenFindingRecipient"))
        {
          v587 = 0u;
          v586 = 0u;
          v585 = 0u;
          v584 = 0u;
          v34 = v433;
          v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v584, v620, 16);
          if (!v35)
            goto LABEL_27;
          v36 = *(_QWORD *)v585;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(_QWORD *)v585 != v36)
                objc_enumerationMutation(v34);
              v38 = *(void **)(*((_QWORD *)&v584 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v38, "recipients");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v39, "count") <= 1)
              {
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personId == %@"), v476);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "filteredArrayUsingPredicate:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v41, "count") == 1)
                {
                  v35 = v38;

                  goto LABEL_27;
                }

              }
            }
            v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v584, v620, 16);
          }
          while (v35);
LABEL_27:

          v583 = 0u;
          v582 = 0u;
          v581 = 0u;
          v580 = 0u;
          v42 = v432;
          v43 = (id)objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v580, v619, 16);
          if (v43)
          {
            v44 = *(_QWORD *)v581;
            do
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(_QWORD *)v581 != v44)
                  objc_enumerationMutation(v42);
                v46 = *(void **)(*((_QWORD *)&v580 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v46, "recipients");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v47, "count") <= 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personId == %@"), v476);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "filteredArrayUsingPredicate:", v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v49, "count") == 1)
                  {
                    v43 = v46;

                    goto LABEL_39;
                  }

                }
              }
              v43 = (id)objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v580, v619, 16);
            }
            while (v43);
          }
LABEL_39:

          if (v35)
          {
            objc_msgSend(v43, "startDate");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "startDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "timeIntervalSinceDate:", v51);
            v53 = v52 > 0.0;

            if (!v53 || (v54 = v43, v35, (v35 = v54) != 0))
            {

LABEL_44:
              objc_msgSend(v35, "bundleId");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v56, "isEqualToString:", v57))
              {

LABEL_47:
                -[_PSSuggestionProxy reason](v484, "reason");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSSuggestionProxy reasonType](v484, "reasonType");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                +[_PSPhotoSuggestions suggestionTemplateForPhotoContactIdWithMessages:cdInteraction:reason:reasonType:](_PSPhotoSuggestions, "suggestionTemplateForPhotoContactIdWithMessages:cdInteraction:reason:reasonType:", v476, v35, v61, v62);
                v63 = (_PSSuggestionProxy *)objc_claimAutoreleasedReturnValue();

                if (v63)
                  objc_msgSend(v440, "addObject:", v63);
              }
              else
              {
                objc_msgSend(v35, "targetBundleId");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v58, "isEqualToString:", v59);

                if (v60)
                  goto LABEL_47;
                objc_msgSend(v35, "targetBundleId");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v64, "isEqualToString:", v65);

                v67 = [_PSSuggestionProxy alloc];
                if (v66)
                {
                  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = (void *)MEMORY[0x1E0D158B8];
                  objc_msgSend(v35, "recipients");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "generateConversationIdFromInteractionRecipients:", v70);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy contactID](v484, "contactID");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy handle](v484, "handle");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy reason](v484, "reason");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy reasonType](v484, "reasonType");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:](v67, "initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:", v68, v71, v72, v73, v74, v75);

                }
                else
                {
                  objc_msgSend(v35, "bundleId");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "derivedIntentIdentifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy reason](v484, "reason");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_PSSuggestionProxy reasonType](v484, "reasonType");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v76 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v67, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v77, v78, v476, v79, v80);

                }
                v63 = v76;

                v484 = v63;
              }

              goto LABEL_54;
            }
          }
          objc_msgSend(v462, "interactionStore");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSInteractionStoreUtils mostRecentInteractionWithRecipientMatchingContactIdentifier:bundleIds:store:singleRecipient:](_PSInteractionStoreUtils, "mostRecentInteractionWithRecipientMatchingContactIdentifier:bundleIds:store:singleRecipient:", v476, v505, v55, 1);
          v35 = (id)objc_claimAutoreleasedReturnValue();

          if (v35)
            goto LABEL_44;
        }
LABEL_54:

LABEL_55:
        -[_PSSuggestionProxy bundleID](v484, "bundleID");
        v491 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggestionProxy interactionRecipients](v484, "interactionRecipients");
        v486 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v441, "containsObject:", v491) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D158B8], "recipientIdentifiersFromMobileMailConversationId:", v486);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v81;
          v83 = v81;
          if (v81)
          {
            if (objc_msgSend(v81, "count"))
            {
              v84 = [_PSSuggestionTemplate alloc];
              -[_PSSuggestionProxy reason](v484, "reason");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSSuggestionProxy reasonType](v484, "reasonType");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSSuggestionProxy modelScore](v484, "modelScore");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:modelScore:](v84, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:modelScore:", v491, v486, 0, 0, 0, v82, 0, 0, 0, v85, v86, v87);

              objc_msgSend(v440, "addObject:", v88);
            }
            v83 = v82;
          }
          goto LABEL_225;
        }
        -[_PSSuggestionProxy reason](v484, "reason");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants inCallHeuristicReason](_PSConstants, "inCallHeuristicReason");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v89, "isEqualToString:", v90) & 1) != 0)
        {
          v91 = 1;
        }
        else
        {
          -[_PSSuggestionProxy reason](v484, "reason");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants inCallCollaborationHeuristicReason](_PSConstants, "inCallCollaborationHeuristicReason");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v92, "isEqualToString:", v93);

        }
        context = objc_msgSend(v467, "containsObject:", v491);
        v493 = objc_msgSend(v435, "containsObject:", v491);
        if (v91)
        {
          if (v476)
          {
            -[_PSSuggestionProxy handle](v484, "handle");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v434 = v94;
            if (v94)
            {

LABEL_70:
              +[_PSHeuristics templateForPhoneCallHeuristicFromSuggestionProxy:](_PSHeuristics, "templateForPhoneCallHeuristicFromSuggestionProxy:", v484);
              v96 = objc_claimAutoreleasedReturnValue();
              v83 = (void *)v96;
              if (v96)
              {
                objc_msgSend(v440, "addObject:", v96);
                v83 = (void *)v96;
              }
              goto LABEL_225;
            }
            v434 = 0;
          }
          -[_PSSuggestionProxy handles](v484, "handles");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          if (v476)
          {

            if (v95)
              goto LABEL_70;
          }
          else if (v95)
          {
            goto LABEL_70;
          }
        }
        v579 = 0u;
        v578 = 0u;
        v577 = 0u;
        v576 = 0u;
        v497 = v433;
        v97 = objc_msgSend(v497, "countByEnumeratingWithState:objects:count:", &v576, v618, 16);
        if (!v97)
          goto LABEL_89;
        v98 = *(_QWORD *)v577;
        v501 = v493 ^ 1;
LABEL_75:
        v99 = 0;
        while (1)
        {
          if (*(_QWORD *)v577 != v98)
            objc_enumerationMutation(v497);
          v100 = *(void **)(*((_QWORD *)&v576 + 1) + 8 * v99);
          objc_msgSend(v100, "domainIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "isEqual:", v486);

          objc_msgSend(v100, "derivedIntentIdentifier");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "isEqual:", v486);

          objc_msgSend(v100, "targetBundleId");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v105, "isEqual:", v491) & 1) != 0)
          {
            v106 = 1;
          }
          else
          {
            objc_msgSend(v100, "targetBundleId");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v463, "objectForKeyedSubscript:", v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = objc_msgSend(v108, "isEqual:", v491);

          }
          if ((context & v102 & 1) != 0 || ((context ^ 1) & v106 & v104 & 1) != 0)
            break;
          if (((v501 | v102 | v104) & 1) != 0)
          {
            if ((((v501 | v102) ^ 1 | v493) & 1) != 0)
              break;
          }
          else
          {
            v109 = (void *)MEMORY[0x1E0D158B8];
            objc_msgSend(v100, "recipients");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "generateConversationIdFromInteractionRecipients:", v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v109) = objc_msgSend(v111, "isEqual:", v486);

            if ((v109 & 1) != 0)
              break;
          }
          if (v97 == ++v99)
          {
            v97 = objc_msgSend(v497, "countByEnumeratingWithState:objects:count:", &v576, v618, 16);
            if (!v97)
            {
LABEL_89:
              v449 = 0;
              v451 = 0;
              v112 = 0;
              v494 = 0;
              goto LABEL_102;
            }
            goto LABEL_75;
          }
        }
        v451 = v100;

        if (!v451)
        {
          v449 = 0;
          v451 = 0;
          v112 = 0;
          v494 = 0;
          goto LABEL_103;
        }
        objc_msgSend(v451, "recipients");
        v497 = (id)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v497, "count") < 2)
        {
          v449 = 0;
          v112 = 0;
        }
        else
        {
          objc_msgSend(v451, "contentURL");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          if (v113)
          {
            objc_msgSend(v451, "groupName");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = v114 == 0;

            if (!v115)
            {
              v449 = 0;
              v112 = 0;
              v494 = 1;
              goto LABEL_103;
            }
          }
          else
          {

          }
          objc_msgSend(v451, "recipients");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "_pas_mappedArrayWithTransform:", &__block_literal_global_562);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v451, "setRecipients:", v117);

          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v118 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
            -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:].cold.2(&v574, v575, v118);

          v112 = 1;
          v497 = (id)objc_opt_new();
          v449 = v497;
        }
        v494 = 1;
LABEL_102:

LABEL_103:
        v573 = 0u;
        v572 = 0u;
        v571 = 0u;
        v570 = 0u;
        v498 = v432;
        v506 = objc_msgSend(v498, "countByEnumeratingWithState:objects:count:", &v570, v617, 16);
        if (!v506)
          goto LABEL_155;
        v502 = *(_QWORD *)v571;
        while (2)
        {
          v119 = 0;
LABEL_106:
          if (*(_QWORD *)v571 != v502)
            objc_enumerationMutation(v498);
          v120 = *(void **)(*((_QWORD *)&v570 + 1) + 8 * v119);
          if ((v112 & 1) != 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v570 + 1) + 8 * v119), "contentURL");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v121)
            {
              objc_msgSend(v120, "groupName");
              v472 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v472)
              {
                v472 = 0;
                goto LABEL_136;
              }
            }
            objc_msgSend(v120, "bundleId");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v467, "containsObject:", v122)
              && (objc_msgSend(v120, "domainIdentifier"), (v123 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              objc_msgSend(v120, "domainIdentifier");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v449, "containsObject:", v124) & 1) != 0)
              {

                if (!v121)
                  goto LABEL_115;
LABEL_118:
                v112 = 1;
                goto LABEL_119;
              }
              objc_msgSend(v120, "recipients");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              if (v125)
              {
                objc_msgSend(v120, "recipients");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = objc_msgSend(v126, "count");
                objc_msgSend(v451, "recipients");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                v129 = v127 == objc_msgSend(v128, "count");

              }
              else
              {
                v129 = 0;
              }

              if (v121)
              {

                if (v129)
                {
LABEL_126:
                  v130 = (void *)MEMORY[0x1A1AFCA24]();
                  objc_msgSend(v120, "recipients");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v131, "_pas_mappedArrayWithTransform:", &__block_literal_global_562);
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v120, "setRecipients:", v132);

                  v133 = (void *)MEMORY[0x1E0C99E60];
                  objc_msgSend(v120, "recipients");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "valueForKey:", CFSTR("identifier"));
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "setWithArray:", v135);
                  v136 = (void *)objc_claimAutoreleasedReturnValue();

                  v137 = (void *)MEMORY[0x1E0C99E60];
                  objc_msgSend(v451, "recipients");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "valueForKey:", CFSTR("identifier"));
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v137, "setWithArray:", v139);
                  v140 = (void *)objc_claimAutoreleasedReturnValue();

                  v141 = objc_msgSend(v136, "isEqualToSet:", v140);
                  if (v141)
                  {
                    objc_msgSend(v451, "contentURL");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    v143 = v142 == 0;

                    if (v143)
                    {
                      objc_msgSend(v120, "contentURL");
                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v451, "setContentURL:", v144);

                    }
                    objc_msgSend(v451, "groupName");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    v146 = v145 == 0;

                    if (v146)
                    {
                      objc_msgSend(v120, "groupName");
                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v451, "setGroupName:", v147);

                    }
                    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
                    v148 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v120, "groupName");
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v120, "contentURL");
                      v157 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138740227;
                      *(_QWORD *)&buf[4] = v156;
                      *(_WORD *)&buf[12] = 2117;
                      *(_QWORD *)&buf[14] = v157;
                      _os_log_debug_impl(&dword_1A07F4000, v148, OS_LOG_TYPE_DEBUG, "Resolved group name or display image, group name: %{sensitive}@, display name: %{sensitive}@", buf, 0x16u);

                    }
                  }

                  objc_autoreleasePoolPop(v130);
                  objc_msgSend(v120, "domainIdentifier");
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v449, "addObject:", v121);
                  v112 = v141 ^ 1;
                  goto LABEL_119;
                }
              }
              else
              {

                if (v129)
                  goto LABEL_126;
              }
LABEL_136:
              v112 = 1;
            }
            else
            {

              if (v121)
                goto LABEL_118;
LABEL_115:
              v112 = 1;
              v121 = v472;
LABEL_119:

            }
          }
          else
          {
            v112 = 0;
          }
          if (context)
          {
            objc_msgSend(v120, "domainIdentifier");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v149)
              goto LABEL_153;
            objc_msgSend(v120, "bundleId");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v150, "isEqual:", v491))
            {
              objc_msgSend(v120, "domainIdentifier");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              v152 = objc_msgSend(v151, "isEqual:", v486);

              if ((v152 & 1) != 0)
                goto LABEL_156;
LABEL_153:
              if (v506 == ++v119)
              {
                v506 = objc_msgSend(v498, "countByEnumeratingWithState:objects:count:", &v570, v617, 16);
                if (!v506)
                {
LABEL_155:

                  v158 = 0;
                  v159 = v451;
                  goto LABEL_165;
                }
                continue;
              }
              goto LABEL_106;
            }
LABEL_149:

            goto LABEL_153;
          }
          break;
        }
        objc_msgSend(v120, "derivedIntentIdentifier");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v149)
          goto LABEL_153;
        objc_msgSend(v120, "bundleId");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = objc_msgSend(v150, "isEqual:", v491);
        if ((v153 & 1) != 0)
          goto LABEL_146;
        objc_msgSend(v463, "objectForKeyedSubscript:", v491);
        oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (!oslog)
        {
          oslog = 0;
          goto LABEL_149;
        }
        objc_msgSend(v120, "bundleId");
        v456 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v463, "objectForKeyedSubscript:", v491);
        v459 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v456, "isEqual:", v459))
        {
LABEL_146:
          objc_msgSend(v120, "derivedIntentIdentifier");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = objc_msgSend(v154, "isEqual:", v486);

          if ((v153 & 1) != 0)
          {

            goto LABEL_152;
          }
        }
        else
        {
          v155 = 0;
        }

LABEL_152:
        if ((v155 & 1) == 0)
          goto LABEL_153;
LABEL_156:
        v160 = v120;

        v158 = v160;
        v161 = v494 ^ 1;
        if (!v160)
          v161 = 1;
        if ((v161 & 1) != 0)
        {
          v159 = v451;
          if (v160)
            v159 = v160;
        }
        else
        {
          objc_msgSend(v160, "startDate");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v451, "startDate");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = objc_msgSend(v162, "compare:", v163) == -1;

          if (!v164)
          {
            v443 = v160;
            v438 = v443;
            goto LABEL_168;
          }
          v159 = v451;
          v158 = v160;
        }
LABEL_165:
        v438 = v158;
        v443 = v159;
        if (v443)
        {
LABEL_168:
          v436 = (void *)MEMORY[0x1A1AFCA24]();
          v170 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v503 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v499 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v482 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v507 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v495 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          if (context)
          {
            v567 = 0u;
            v566 = 0u;
            v565 = 0u;
            v564 = 0u;
            objc_msgSend(v443, "recipients");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v564, v615, 16);
            if (!v172)
              goto LABEL_185;
            v173 = *(_QWORD *)v565;
            while (1)
            {
              for (k = 0; k != v172; ++k)
              {
                if (*(_QWORD *)v565 != v173)
                  objc_enumerationMutation(v171);
                v175 = *(void **)(*((_QWORD *)&v564 + 1) + 8 * k);
                objc_msgSend(v175, "personId");
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                if (v176)
                {
                  objc_msgSend(v175, "identifier");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  v178 = v177 == 0;

                  if (!v178)
                  {
                    objc_msgSend(v175, "personId");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v170, "addObject:", v179);

                    objc_msgSend(v175, "identifier");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v175, "personId");
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v507, "setObject:forKeyedSubscript:", v180, v181);

                  }
                }
                objc_msgSend(v175, "identifier");
                v182 = (void *)objc_claimAutoreleasedReturnValue();

                if (v182)
                {
                  if (objc_msgSend(v175, "type") == 2)
                  {
                    objc_msgSend(v175, "identifier");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v503, "addObject:", v183);
                  }
                  else
                  {
                    if (objc_msgSend(v175, "type") != 1)
                      continue;
                    objc_msgSend(v175, "identifier");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v499, "addObject:", v183);
                  }

                }
              }
              v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v564, v615, 16);
              if (!v172)
              {
LABEL_185:

                goto LABEL_215;
              }
            }
          }
          contexta = (void *)MEMORY[0x1A1AFCA24]();
          v563 = 0u;
          v562 = 0u;
          v561 = 0u;
          v560 = 0u;
          objc_msgSend(v443, "recipients");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v560, v614, 16);
          if (!v185)
          {
LABEL_214:

            objc_autoreleasePoolPop(contexta);
LABEL_215:
            objc_msgSend(v443, "contentURL");
            v197 = (void *)objc_claimAutoreleasedReturnValue();

            if (v197)
            {
              v592 = 0;
              v593 = &v592;
              v594 = 0x2050000000;
              v198 = (void *)getINImageClass_softClass_0;
              v595 = getINImageClass_softClass_0;
              if (!getINImageClass_softClass_0)
              {
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __getINImageClass_block_invoke_0;
                v623 = (os_log_t)&unk_1E43FEA00;
                v624 = &v592;
                __getINImageClass_block_invoke_0((uint64_t)buf);
                v198 = (void *)v593[3];
              }
              v199 = objc_retainAutorelease(v198);
              _Block_object_dispose(&v592, 8);
              objc_msgSend(v443, "contentURL");
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v199, "imageWithURL:", v200);
              v201 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v201 = 0;
            }
            v202 = [_PSSuggestionTemplate alloc];
            objc_msgSend(v463, "objectForKeyedSubscript:", v491);
            v203 = objc_claimAutoreleasedReturnValue();
            v204 = (void *)v203;
            if (v203)
              v205 = (void *)v203;
            else
              v205 = v491;
            objc_msgSend(v443, "groupName");
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSSuggestionProxy reason](v484, "reason");
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSSuggestionProxy reasonType](v484, "reasonType");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSSuggestionProxy modelScore](v484, "modelScore");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            v210 = -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:](v202, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:handleToDisplayNameMapping:reason:reasonType:modelScore:", v205, v486, v201, v206, v170, v503, v499, v482, v507, v495, v207, v208, v209);

            objc_msgSend(v440, "addObject:", v210);
            objc_autoreleasePoolPop(v436);
            goto LABEL_224;
          }
          v186 = *(_QWORD *)v561;
          while (2)
          {
            v187 = 0;
LABEL_189:
            if (*(_QWORD *)v561 != v186)
              objc_enumerationMutation(v184);
            v188 = *(void **)(*((_QWORD *)&v560 + 1) + 8 * v187);
            objc_msgSend(v188, "personId");
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "identifier");
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "displayName");
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v192 = objc_msgSend(v191, "length");

            if (v189)
            {
              objc_msgSend(v170, "addObject:", v189);
              if (v190)
              {
                objc_msgSend(v507, "setObject:forKeyedSubscript:", v190, v189);
                goto LABEL_195;
              }
LABEL_212:

              if (v185 == ++v187)
              {
                v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v560, v614, 16);
                if (!v185)
                  goto LABEL_214;
                continue;
              }
              goto LABEL_189;
            }
            break;
          }
          if (v190)
          {
LABEL_195:
            if (objc_msgSend(v188, "type") == 2)
            {
              objc_msgSend(v503, "addObject:", v190);
              v193 = v189 != 0;
              if (v192 < 1)
                v193 = 1;
              if (v193)
                goto LABEL_212;
            }
            else if (objc_msgSend(v188, "type") == 1)
            {
              objc_msgSend(v499, "addObject:", v190);
              v194 = v189 != 0;
              if (v192 < 1)
                v194 = 1;
              if (v194)
                goto LABEL_212;
            }
            else
            {
              if (v189)
                goto LABEL_212;
              if (v192 < 1)
                goto LABEL_212;
              objc_msgSend(v188, "displayName");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v482, "addObject:", v195);

              if (objc_msgSend(v188, "type"))
                goto LABEL_212;
            }
            objc_msgSend(v188, "displayName");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v495, "setObject:forKeyedSubscript:", v196, v190);
          }
          else
          {
            if (v192 < 1)
              goto LABEL_212;
            objc_msgSend(v188, "displayName");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v482, "addObject:", v196);
          }

          goto LABEL_212;
        }
        +[_PSEnsembleModel _suggestionInteractionPredicatesForFirstPartyMessages:bundleID:interactionRecipients:](_PSEnsembleModel, "_suggestionInteractionPredicatesForFirstPartyMessages:bundleID:interactionRecipients:", context, v491, v486);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v616 = v166;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v616, 1);
        v167 = (void *)objc_claimAutoreleasedReturnValue();

        v568[0] = MEMORY[0x1E0C809B0];
        v568[1] = 3221225472;
        v568[2] = __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_569;
        v568[3] = &unk_1E43FF2A8;
        v568[4] = v462;
        v168 = v167;
        v569 = v168;
        objc_msgSend(v165, "_pas_leftFoldWithInitialObject:accumulate:", 0, v568);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        if (v169)
        {
          v443 = v169;

          goto LABEL_168;
        }

        v443 = 0;
LABEL_224:

        v83 = v451;
LABEL_225:

LABEL_226:
        objc_autoreleasePoolPop(v453);

        v24 = obj;
        v464 = (char *)v464 + 1;
      }
      while (v464 != (id)v447);
      v211 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v588, v621, 16);
      v447 = v211;
    }
    while (v211);
  }

  objc_msgSend(v423, "end");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v440, "count"))
  {
    v213 = 0;
    v214 = 0;
    v215 = v418 + 2;
    do
    {
      v216 = objc_msgSend(v440, "count");
      if (v216 + v213 >= v215)
        v217 = v418 + 2;
      else
        v217 = v216 + v213;
      objc_msgSend(v440, "subarrayWithRange:", v214, v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "addObject:", v218);

      v214 += v215;
      v213 += -2 - v418;
    }
    while (v214 < objc_msgSend(v440, "count"));
  }
  v429 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  v504 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v508 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v500 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v428, "createSubSpanWithName:", CFSTR("goThroughSuggestionTemplates"));
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v487, "start");
  v559 = 0u;
  v558 = 0u;
  v557 = 0u;
  v556 = 0u;
  v420 = v212;
  v417 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v556, v613, 16);
  if (v417)
  {
    v415 = 0;
    v416 = 0;
    v485 = 0;
    v483 = 0;
    v437 = 0;
    v439 = 0;
    v419 = 0;
    v219 = *(_QWORD *)v557;
    v412 = *(_QWORD *)v557;
    while (1)
    {
      v220 = 0;
      do
      {
        if (*(_QWORD *)v557 != v219)
        {
          v221 = v220;
          objc_enumerationMutation(v420);
          v220 = v221;
        }
        v413 = v220;
        v222 = *(void **)(*((_QWORD *)&v556 + 1) + 8 * v220);
        v414 = (void *)MEMORY[0x1A1AFCA24]();
        v496 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        contextb = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v223 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v224 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v492 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v555 = 0u;
        v554 = 0u;
        v553 = 0u;
        v552 = 0u;
        v457 = v222;
        v473 = objc_msgSend(v457, "countByEnumeratingWithState:objects:count:", &v552, v612, 16);
        if (v473)
        {
          osloga = *(os_log_t *)v553;
          do
          {
            v225 = 0;
            do
            {
              if (*(os_log_t *)v553 != osloga)
              {
                v226 = v225;
                objc_enumerationMutation(v457);
                v225 = v226;
              }
              v477 = v225;
              v227 = *(void **)(*((_QWORD *)&v552 + 1) + 8 * v225);
              v548 = 0u;
              v549 = 0u;
              v550 = 0u;
              v551 = 0u;
              objc_msgSend(v227, "recipientContactIDs");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v548, v611, 16);
              if (v229)
              {
                v230 = *(_QWORD *)v549;
                do
                {
                  for (m = 0; m != v229; ++m)
                  {
                    if (*(_QWORD *)v549 != v230)
                      objc_enumerationMutation(v228);
                    v232 = *(_QWORD *)(*((_QWORD *)&v548 + 1) + 8 * m);
                    objc_msgSend(v504, "objectForKeyedSubscript:", v232);
                    v233 = (void *)objc_claimAutoreleasedReturnValue();
                    v234 = v233 == 0;

                    if (v234)
                    {
                      objc_msgSend(v496, "addObject:", v232);
                      objc_msgSend(v227, "contactIdToHandleMapping");
                      v235 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v235, "objectForKeyedSubscript:", v232);
                      v236 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v236)
                      {
                        objc_msgSend(v492, "setObject:forKeyedSubscript:", v236, v232);
                        objc_msgSend(contextb, "addObject:", v236);
                      }

                    }
                  }
                  v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v548, v611, 16);
                }
                while (v229);
              }

              v547 = 0u;
              v546 = 0u;
              v545 = 0u;
              v544 = 0u;
              objc_msgSend(v227, "recipientEmailAddresses");
              v237 = (void *)objc_claimAutoreleasedReturnValue();
              v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v544, v610, 16);
              if (v238)
              {
                v239 = *(_QWORD *)v545;
                do
                {
                  for (n = 0; n != v238; ++n)
                  {
                    if (*(_QWORD *)v545 != v239)
                      objc_enumerationMutation(v237);
                    v241 = *(_QWORD *)(*((_QWORD *)&v544 + 1) + 8 * n);
                    -[NSObject objectForKeyedSubscript:](v508, "objectForKeyedSubscript:", v241);
                    v242 = (void *)objc_claimAutoreleasedReturnValue();
                    v243 = v242 == 0;

                    if (v243)
                      objc_msgSend(v223, "addObject:", v241);
                  }
                  v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v544, v610, 16);
                }
                while (v238);
              }

              v543 = 0u;
              v542 = 0u;
              v541 = 0u;
              v540 = 0u;
              objc_msgSend(v227, "recipientPhoneNumbers");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v540, v609, 16);
              if (v245)
              {
                v246 = *(_QWORD *)v541;
                do
                {
                  for (ii = 0; ii != v245; ++ii)
                  {
                    if (*(_QWORD *)v541 != v246)
                      objc_enumerationMutation(v244);
                    v248 = *(_QWORD *)(*((_QWORD *)&v540 + 1) + 8 * ii);
                    -[NSObject objectForKeyedSubscript:](v500, "objectForKeyedSubscript:", v248);
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    v250 = v249 == 0;

                    if (v250)
                      objc_msgSend(v224, "addObject:", v248);
                  }
                  v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v540, v609, 16);
                }
                while (v245);
              }

              v225 = v477 + 1;
            }
            while (v477 + 1 != v473);
            v473 = objc_msgSend(v457, "countByEnumeratingWithState:objects:count:", &v552, v612, 16);
          }
          while (v473);
        }

        if (objc_msgSend(v496, "count"))
        {
          v465 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
          objc_msgSend(v462, "contactStore");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          CNContactClass = getCNContactClass();
          objc_msgSend(v496, "allObjects");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNContactClass, "predicateForContactsWithIdentifiers:", v253);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          v539 = v419;
          objc_msgSend(v251, "unifiedContactsMatchingPredicate:keysToFetch:error:", v254, v455, &v539);
          v478 = (void *)objc_claimAutoreleasedReturnValue();
          v255 = v539;

          v460 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
          objc_msgSend(v478, "valueForKey:", CFSTR("identifier"));
          v474 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v496, "setByAddingObjectsFromArray:", v474);
          oslogb = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (v255
            || (v256 = objc_msgSend(v478, "count"), v256 < objc_msgSend(v496, "count"))
            || (v257 = -[NSObject count](oslogb, "count"), v257 > objc_msgSend(v496, "count")))
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v258 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v255;
              _os_log_error_impl(&dword_1A07F4000, v258, OS_LOG_TYPE_ERROR, "Problem encountred when fetching contacts by identifiers. Fewer contacts were returned, different identifiers were returned or an error occured: %@", buf, 0xCu);
            }

            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v259 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138740483;
              *(_QWORD *)&buf[4] = v478;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v496;
              *(_WORD *)&buf[22] = 2112;
              v623 = oslogb;
              _os_log_impl(&dword_1A07F4000, v259, OS_LOG_TYPE_INFO, "contacts: %{sensitive}@ templateContactIDs: %@ mergedContactIdentifiers: %@", buf, 0x20u);
            }

            v538 = 0u;
            v537 = 0u;
            v535 = 0u;
            v536 = 0u;
            v260 = contextb;
            v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v535, v608, 16);
            if (v261)
            {
              v262 = *(_QWORD *)v536;
              do
              {
                for (jj = 0; jj != v261; ++jj)
                {
                  if (*(_QWORD *)v536 != v262)
                    objc_enumerationMutation(v260);
                  v264 = *(void **)(*((_QWORD *)&v535 + 1) + 8 * jj);
                  if (objc_msgSend(v264, "containsString:", CFSTR("@")))
                    v265 = v223;
                  else
                    v265 = v224;
                  objc_msgSend(v265, "addObject:", v264);
                }
                v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v535, v608, 16);
              }
              while (v261);
            }
          }
          else
          {
            v533 = 0u;
            v534 = 0u;
            v531 = 0u;
            v532 = 0u;
            v379 = contextb;
            v380 = objc_msgSend(v379, "countByEnumeratingWithState:objects:count:", &v531, v607, 16);
            if (v380)
            {
              v381 = *(_QWORD *)v532;
              do
              {
                for (kk = 0; kk != v380; ++kk)
                {
                  if (*(_QWORD *)v532 != v381)
                    objc_enumerationMutation(v379);
                  v383 = *(_QWORD *)(*((_QWORD *)&v531 + 1) + 8 * kk);
                  objc_msgSend(v223, "removeObject:", v383);
                  objc_msgSend(v224, "removeObject:", v383);
                }
                v380 = objc_msgSend(v379, "countByEnumeratingWithState:objects:count:", &v531, v607, 16);
              }
              while (v380);
            }

            v529 = 0u;
            v530 = 0u;
            v527 = 0u;
            v528 = 0u;
            v260 = v478;
            v384 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v527, v606, 16);
            if (v384)
            {
              v385 = *(_QWORD *)v528;
              do
              {
                for (mm = 0; mm != v384; ++mm)
                {
                  if (*(_QWORD *)v528 != v385)
                    objc_enumerationMutation(v260);
                  v387 = *(void **)(*((_QWORD *)&v527 + 1) + 8 * mm);
                  objc_msgSend(v387, "identifier");
                  v388 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v388)
                  {
                    objc_msgSend(v504, "setObject:forKeyedSubscript:", v387, v388);
                    objc_msgSend(v492, "objectForKeyedSubscript:", v388);
                    v389 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v389, "containsString:", CFSTR("@")))
                      v390 = v508;
                    else
                      v390 = v500;
                    -[NSObject setObject:forKeyedSubscript:](v390, "setObject:forKeyedSubscript:", v387, v389);

                  }
                }
                v384 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v527, v606, 16);
              }
              while (v384);
            }
          }

          v416 = (v416 - v465 + v460);
          v415 = (v415 + 1);
        }
        else
        {
          v255 = v419;
        }
        v525 = 0u;
        v526 = 0u;
        v523 = 0u;
        v524 = 0u;
        v466 = v223;
        v266 = objc_msgSend(v466, "countByEnumeratingWithState:objects:count:", &v523, v605, 16);
        if (v266)
        {
          v479 = *(_QWORD *)v524;
          do
          {
            v267 = 0;
            v268 = v255;
            do
            {
              if (*(_QWORD *)v524 != v479)
                objc_enumerationMutation(v466);
              v269 = *(_QWORD *)(*((_QWORD *)&v523 + 1) + 8 * v267);
              objc_msgSend(getCNContactClass(), "predicateForContactsMatchingEmailAddress:", v269);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              v271 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
              objc_msgSend(v462, "contactStore");
              v272 = (void *)objc_claimAutoreleasedReturnValue();
              v522 = v268;
              objc_msgSend(v272, "unifiedContactsMatchingPredicate:keysToFetch:error:", v270, v455, &v522);
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              v255 = v522;

              v274 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
              if (v255)
              {
                +[_PSLogging generalChannel](_PSLogging, "generalChannel");
                v275 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v255;
                  _os_log_error_impl(&dword_1A07F4000, v275, OS_LOG_TYPE_ERROR, "Error fetching contacts by email: %@", buf, 0xCu);
                }
              }
              else
              {
                if (!objc_msgSend(v273, "count"))
                  goto LABEL_308;
                objc_msgSend(v273, "firstObject");
                v275 = objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v508, "setObject:forKeyedSubscript:", v275, v269);
              }

LABEL_308:
              v485 = (v274 - v271 + v485);
              ++v267;
              v268 = v255;
            }
            while (v266 != v267);
            v439 = (v439 + v266);
            v266 = objc_msgSend(v466, "countByEnumeratingWithState:objects:count:", &v523, v605, 16);
          }
          while (v266);
        }

        v520 = 0u;
        v521 = 0u;
        v518 = 0u;
        v519 = 0u;
        v461 = v224;
        v276 = objc_msgSend(v461, "countByEnumeratingWithState:objects:count:", &v518, v604, 16);
        if (!v276)
        {
          v277 = v255;
          goto LABEL_327;
        }
        v480 = *(_QWORD *)v519;
        v277 = v255;
        do
        {
          v278 = 0;
          v279 = v276;
          v437 = (v437 + v276);
          v280 = v277;
          do
          {
            if (*(_QWORD *)v519 != v480)
              objc_enumerationMutation(v461);
            v281 = *(_QWORD *)(*((_QWORD *)&v518 + 1) + 8 * v278);
            v592 = 0;
            v593 = &v592;
            v594 = 0x2050000000;
            v282 = (void *)getCNPhoneNumberClass_softClass;
            v595 = getCNPhoneNumberClass_softClass;
            if (!getCNPhoneNumberClass_softClass)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getCNPhoneNumberClass_block_invoke;
              v623 = (os_log_t)&unk_1E43FEA00;
              v624 = &v592;
              __getCNPhoneNumberClass_block_invoke((uint64_t)buf);
              v282 = (void *)v593[3];
            }
            v283 = objc_retainAutorelease(v282);
            _Block_object_dispose(&v592, 8);
            objc_msgSend(v283, "phoneNumberWithStringValue:", v281);
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(getCNContactClass(), "predicateForContactsMatchingPhoneNumber:", v284);
            v285 = (void *)objc_claimAutoreleasedReturnValue();
            v286 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
            objc_msgSend(v462, "contactStore");
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            v517 = v280;
            objc_msgSend(v287, "unifiedContactsMatchingPredicate:keysToFetch:error:", v285, v455, &v517);
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            v277 = v517;

            v289 = objc_msgSend(v487, "getMonotonicTimeInMilliseconds");
            if (v277)
            {
              +[_PSLogging generalChannel](_PSLogging, "generalChannel");
              v290 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v277;
                _os_log_error_impl(&dword_1A07F4000, v290, OS_LOG_TYPE_ERROR, "Error fetching contacts by phone number: %@", buf, 0xCu);
              }
            }
            else
            {
              if (!objc_msgSend(v288, "count"))
                goto LABEL_323;
              objc_msgSend(v288, "firstObject");
              v290 = objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v500, "setObject:forKeyedSubscript:", v290, v281);
            }

LABEL_323:
            v483 = (v289 - v286 + v483);
            ++v278;
            v280 = v277;
          }
          while (v279 != v278);
          v276 = objc_msgSend(v461, "countByEnumeratingWithState:objects:count:", &v518, v604, 16);
        }
        while (v276);
LABEL_327:
        v419 = v277;

        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v291 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v291, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v504;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v500;
          *(_WORD *)&buf[22] = 2112;
          v623 = v508;
          _os_log_debug_impl(&dword_1A07F4000, v291, OS_LOG_TYPE_DEBUG, "Change templates to suggestions, contactIDMapping: %@, phoneMapping: %@, emailMapping: %@", buf, 0x20u);
        }

        v515 = 0u;
        v516 = 0u;
        v513 = 0u;
        v514 = 0u;
        v292 = v457;
        v481 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v513, v603, 16);
        if (v481)
        {
          v475 = *(_QWORD *)v514;
          do
          {
            for (nn = 0; nn != v481; ++nn)
            {
              if (*(_QWORD *)v514 != v475)
                objc_enumerationMutation(v292);
              v294 = *(void **)(*((_QWORD *)&v513 + 1) + 8 * nn);
              objc_msgSend(v462, "contactStore");
              v295 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v294, "suggestionWithContactIDMapping:phoneMapping:emailMapping:contactStore:contactKeysToFetch:", v504, v500, v508, v295, v455);
              v296 = (void *)objc_claimAutoreleasedReturnValue();

              v297 = v296;
              if (!v296)
                goto LABEL_414;
              v298 = objc_msgSend(v462, "areRecipientsBlockedForSuggestion:", v296);
              v297 = v296;
              if ((v298 & 1) != 0)
                goto LABEL_414;
              objc_msgSend(v296, "conversationIdentifier");
              v299 = (void *)objc_claimAutoreleasedReturnValue();
              v300 = objc_msgSend(v462, "excludeSuggestionWithConversationId:", v299);

              v297 = v296;
              if ((v300 & 1) != 0)
                goto LABEL_414;
              v301 = v431 != 0;
              objc_msgSend(v296, "recipients");
              v302 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v302, "count") != 1)
                v301 = 0;

              v297 = v296;
              if (v301)
              {
                objc_msgSend(v296, "recipients");
                v303 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v303, "firstObject");
                v304 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v304, "contact");
                v305 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v305, "identifier");
                v306 = (void *)objc_claimAutoreleasedReturnValue();

                LOBYTE(v303) = objc_msgSend(v306, "isEqualToString:", v431);
                v297 = v296;
                if ((v303 & 1) != 0)
                  goto LABEL_414;
              }
              objc_msgSend(v297, "bundleID");
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              v308 = objc_msgSend(v430, "containsObject:", v307);

              if ((v308 & 1) != 0)
              {
                objc_msgSend(v296, "recipients");
                v309 = (void *)objc_claimAutoreleasedReturnValue();
                v310 = objc_msgSend(v309, "count") == 1;

                if (v310)
                {
                  objc_msgSend(v296, "conversationIdentifier");
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v311)
                  {
                    objc_msgSend(v296, "conversationIdentifier");
                    v312 = (void *)objc_claimAutoreleasedReturnValue();
                    v313 = objc_msgSend(v445, "containsObject:", v312);

                    if ((v313 & 1) == 0)
                    {
                      objc_msgSend(v296, "conversationIdentifier");
                      v314 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v445, "addObject:", v314);

                      objc_msgSend(v296, "recipients");
                      v315 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v315, "firstObject");
                      v316 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v316, "contact");
                      v317 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v317, "identifier");
                      v318 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v296, "bundleID");
                      v319 = (void *)objc_claimAutoreleasedReturnValue();
                      v320 = objc_msgSend(v435, "containsObject:", v319);

                      if (v320)
                      {
                        objc_msgSend(v296, "bundleID");
                        v321 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v318, "stringByAppendingString:", v321);
                        v322 = objc_claimAutoreleasedReturnValue();

                        v318 = (void *)v322;
                      }
                      if (objc_msgSend(v296, "isReturnToSender"))
                      {
                        v323 = objc_alloc(MEMORY[0x1E0CB3940]);
                        objc_msgSend(v296, "bundleID");
                        v324 = (void *)objc_claimAutoreleasedReturnValue();
                        +[_PSConstants returnToSenderReason](_PSConstants, "returnToSenderReason");
                        v325 = (void *)objc_claimAutoreleasedReturnValue();
                        v326 = objc_msgSend(v323, "initWithFormat:", CFSTR("%@_%@_%@"), v318, v324, v325);

                        v318 = (void *)v326;
                      }
                      objc_msgSend(v296, "bundleID");
                      v327 = (void *)objc_claimAutoreleasedReturnValue();
                      +[_PSConstants collaborationSuggestionBundleId](_PSConstants, "collaborationSuggestionBundleId");
                      v328 = (void *)objc_claimAutoreleasedReturnValue();
                      v329 = objc_msgSend(v327, "isEqualToString:", v328);

                      if (v329)
                      {
                        objc_msgSend(v296, "conversationIdentifier");
                        v330 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v296, "bundleID");
                        v331 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v330, "stringByAppendingString:", v331);
                        v332 = objc_claimAutoreleasedReturnValue();

                        v318 = (void *)v332;
                      }
                      if (v318 && (objc_msgSend(v426, "containsObject:", v318) & 1) == 0)
                      {
                        objc_msgSend(v426, "addObject:", v318);
                        objc_msgSend(v429, "addObject:", v296);
                      }

                    }
                  }
                  goto LABEL_411;
                }
                objc_msgSend(v296, "recipients");
                v343 = (void *)objc_claimAutoreleasedReturnValue();
                v344 = (unint64_t)objc_msgSend(v343, "count") > 1;

                if (!v344)
                  goto LABEL_411;
                objc_msgSend(v296, "conversationIdentifier");
                v345 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v345)
                  goto LABEL_411;
                objc_msgSend(v296, "conversationIdentifier");
                v346 = (void *)objc_claimAutoreleasedReturnValue();
                v347 = objc_msgSend(v445, "containsObject:", v346);

                if ((v347 & 1) != 0)
                  goto LABEL_411;
                objc_msgSend(v296, "conversationIdentifier");
                v348 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v445, "addObject:", v348);

                objc_msgSend(v296, "bundleID");
                v349 = (void *)objc_claimAutoreleasedReturnValue();
                +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
                v350 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v349, "isEqualToString:", v350) & 1) != 0)
                {
                  objc_msgSend(v296, "conversationIdentifier");
                  v351 = (void *)objc_claimAutoreleasedReturnValue();
                  v352 = v351 == 0;

                  if (!v352)
                  {
                    objc_msgSend(v296, "conversationIdentifier");
                    v353 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v353, "componentsSeparatedByString:", CFSTR(";"));
                    v354 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v354, "lastObject");
                    v355 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v355 && (objc_msgSend(v426, "containsObject:", v355) & 1) == 0)
                    {
                      objc_msgSend(v296, "recipients");
                      v356 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v356, "valueForKey:", CFSTR("handle"));
                      v357 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v357, "sortedArrayUsingSelector:", sel_compare_);
                      v358 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_msgSend(v427, "containsObject:", v358) & 1) == 0)
                      {
                        objc_msgSend(v426, "addObject:", v355);
                        objc_msgSend(v427, "addObject:", v358);
                        objc_msgSend(v429, "addObject:", v296);
                      }

                    }
                    goto LABEL_411;
                  }
                }
                else
                {

                }
                objc_msgSend(v429, "addObject:", v296);
                goto LABEL_411;
              }
              objc_msgSend(v296, "bundleID");
              oslogc = (os_log_t)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v296, "derivedIntentIdentifier");
              v333 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v333, "stringByAppendingString:", oslogc);
              v454 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v296, "groupName");
              v334 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v334, "stringByAppendingString:", v454);
              v452 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v296, "recipients");
              v450 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v448, "objectForKeyedSubscript:", oslogc);
              v458 = (id)objc_claimAutoreleasedReturnValue();
              if (!v458)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v458 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v448, "setObject:forKeyedSubscript:", v458, oslogc);
              }
              if (v452 && (objc_msgSend(v458, "containsObject:", v452) & 1) != 0)
              {

                goto LABEL_413;
              }
              if (!v454 || (objc_msgSend(v445, "containsObject:", v454) & 1) != 0)
                goto LABEL_410;
              objc_msgSend(v445, "addObject:", v454);
              if (v452)
                objc_msgSend(v458, "addObject:", v452);
              if (!objc_msgSend(v450, "count"))
              {
                objc_msgSend(v429, "addObject:", v296);
                goto LABEL_410;
              }
              if (objc_msgSend(v450, "count") == 1)
              {
                objc_msgSend(v296, "recipients");
                v335 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v335, "firstObject");
                v336 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v336, "contact");
                v337 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v337, "identifier");
                v338 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v336, "handle");
                v339 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v336, "displayName");
                v340 = (void *)objc_claimAutoreleasedReturnValue();
                v341 = v340;
                if (v340)
                {
                  objc_msgSend(v340, "stringByAppendingString:", oslogc);
                  v342 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v338)
                    goto LABEL_368;
LABEL_402:
                  if (v339)
                  {
                    v602 = v339;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v602, 1);
                    v372 = (void *)objc_claimAutoreleasedReturnValue();
                    v373 = objc_msgSend(v427, "containsObject:", v372);

                    if ((v373 & 1) == 0)
                    {
                      v601 = v339;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v601, 1);
                      v374 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v427, "addObject:", v374);

                      goto LABEL_408;
                    }
                  }
                  else if (v342)
                  {
                    v600 = v342;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v600, 1);
                    v375 = (void *)objc_claimAutoreleasedReturnValue();
                    v376 = objc_msgSend(v427, "containsObject:", v375);

                    if ((v376 & 1) == 0)
                    {
                      v599 = v342;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v599, 1);
                      v377 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v427, "addObject:", v377);

LABEL_408:
                      objc_msgSend(v429, "addObject:", v296);
                    }
                  }
                }
                else
                {
                  v342 = 0;
                  if (!v338)
                    goto LABEL_402;
LABEL_368:
                  if ((objc_msgSend(v426, "containsObject:", v338) & 1) == 0)
                  {
                    objc_msgSend(v426, "addObject:", v338);
                    goto LABEL_408;
                  }
                }

                goto LABEL_410;
              }
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v359 = (void *)objc_claimAutoreleasedReturnValue();
              v511 = 0u;
              v512 = 0u;
              v509 = 0u;
              v510 = 0u;
              v360 = v450;
              v361 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v509, v598, 16);
              if (!v361)
                goto LABEL_396;
              v362 = *(_QWORD *)v510;
              do
              {
                for (i1 = 0; i1 != v361; ++i1)
                {
                  if (*(_QWORD *)v510 != v362)
                    objc_enumerationMutation(v360);
                  v364 = *(void **)(*((_QWORD *)&v509 + 1) + 8 * i1);
                  objc_msgSend(v364, "contact");
                  v365 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v365)
                  {
                    objc_msgSend(v364, "contact");
                    v366 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v366, "identifier");
                    v367 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v359, "addObject:", v367);

                  }
                  else
                  {
                    objc_msgSend(v364, "handle");
                    v368 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v368)
                    {
                      objc_msgSend(v364, "handle");
                      v366 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v359, "addObject:", v366);
                    }
                    else
                    {
                      objc_msgSend(v364, "displayName");
                      v369 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v369)
                        continue;
                      objc_msgSend(v364, "displayName");
                      v366 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v366, "stringByAppendingString:", oslogc);
                      v370 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v359, "addObject:", v370);

                    }
                  }

                }
                v361 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v509, v598, 16);
              }
              while (v361);
LABEL_396:

              objc_msgSend(v359, "sortedArrayUsingSelector:", sel_compare_);
              v371 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v427, "containsObject:", v371) & 1) == 0)
              {
                objc_msgSend(v427, "addObject:", v371);
                objc_msgSend(v429, "addObject:", v296);
              }

LABEL_410:
LABEL_411:
              +[_PSLogging generalChannel](_PSLogging, "generalChannel");
              oslogc = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(oslogc, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138740227;
                *(_QWORD *)&buf[4] = v429;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v427;
                _os_log_debug_impl(&dword_1A07F4000, oslogc, OS_LOG_TYPE_DEBUG, "suggestions array: %{sensitive}@, addedRecipientInfo: %@", buf, 0x16u);
              }
LABEL_413:

              v297 = v296;
LABEL_414:

            }
            v481 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v513, v603, 16);
          }
          while (v481);
        }

        v378 = objc_msgSend(v429, "count") < v418;
        objc_autoreleasePoolPop(v414);
        if (!v378)
          goto LABEL_442;
        v219 = v412;
        v220 = v413 + 1;
      }
      while (v413 + 1 != v417);
      v391 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v556, v613, 16);
      v417 = v391;
      v392 = v420;
      v219 = v412;
      if (!v391)
        goto LABEL_443;
    }
  }
  v415 = 0;
  v416 = 0;
  v485 = 0;
  v483 = 0;
  v437 = 0;
  v439 = 0;
  v419 = 0;
LABEL_442:
  v392 = v420;
LABEL_443:

  objc_msgSend(v487, "end");
  objc_msgSend(v462, "updateTrialID:", v429);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v393 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v393, OS_LOG_TYPE_DEBUG))
    -[_PSEnsembleModel suggestionsFromSuggestionProxies:supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:].cold.1(v462, v393);

  v596[0] = CFSTR("suggestionProxiesCount");
  v394 = (void *)MEMORY[0x1E0CB3940];
  v395 = (uint64_t)obj;
  if (obj)
    v395 = objc_msgSend(obj, "count");
  objc_msgSend(v394, "stringWithFormat:", CFSTR("%ld"), v395);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v597[0] = v396;
  v596[1] = CFSTR("suggestionsCountAfterResolution");
  v397 = (void *)MEMORY[0x1E0CB3940];
  v398 = (uint64_t)v429;
  if (v429)
    v398 = objc_msgSend(v429, "count");
  objc_msgSend(v397, "stringWithFormat:", CFSTR("%ld"), v398);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v597[1] = v399;
  v596[2] = CFSTR("templateBatches_total");
  v400 = (void *)MEMORY[0x1E0CB3940];
  v401 = (uint64_t)v420;
  if (v420)
    v401 = objc_msgSend(v420, "count");
  objc_msgSend(v400, "stringWithFormat:", CFSTR("%ld"), v401);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v597[2] = v402;
  v596[3] = CFSTR("contactStoreIdQueryTimeSumInMillis");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v416);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v597[3] = v403;
  v596[4] = CFSTR("contactStoreIdQueryCount");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v415);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v597[4] = v404;
  v596[5] = CFSTR("contactStorePhoneQueryTimeSumInMillis");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v483);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v597[5] = v405;
  v596[6] = CFSTR("contactStorePhoneQueryCount");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v437);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v597[6] = v406;
  v596[7] = CFSTR("contactStoreEmailQueryTimeSumInMillis");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v485);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v597[7] = v407;
  v596[8] = CFSTR("contactStoreEmailQueryCount");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v439);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  v597[8] = v408;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v597, v596, 9);
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v428, "addAttributes:", v409);

  objc_msgSend(v428, "end");
  v410 = (void *)objc_msgSend(v429, "copy");

  return v410;
}

- (BOOL)areRecipientsBlockedForSuggestion:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "recipients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        +[_PSBlockedHandlesCache sharedBlockedHandlesCache](_PSBlockedHandlesCache, "sharedBlockedHandlesCache");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isHandleBlocked:", v9);

        if (v10)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "handle");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v18 = v11;
            v19 = 2113;
            v20 = v7;
            _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "handle %{private}@ is blocked; dropping recipient %{private}@",
              buf,
              0x16u);

          }
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

- (BOOL)excludeSuggestionWithConversationId:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "_appearsToBeBusinessID") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "_appearsToBeTemporaryID") & 1) != 0;

  return v4;
}

- (id)mergedSuggestionsWithFamilySuggestions:(id)a3 shareSheetSuggestions:(id)a4 maxSuggestions:(unint64_t)a5 supportedBundleIds:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v43 = v10;
    v41 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v40 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    v15 = a5;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v51;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v18), "recipients", v40);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "contact");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v12, "addObject:", v22);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v16);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = v41;
    v10 = v43;
    v45 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v47;
      v42 = v23;
LABEL_13:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v23);
        v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v24);
        if (objc_msgSend(v13, "count", v40) == v15)
          break;
        objc_msgSend(v25, "bundleID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v10, "containsObject:", v26);

        if (v27)
        {
          objc_msgSend(v25, "recipients");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (v29 > 1)
            goto LABEL_20;
          objc_msgSend(v25, "recipients");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "contact");
          v32 = v15;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v12, "containsObject:", v34);

          v10 = v43;
          v15 = v32;
          v23 = v42;

          if ((v35 & 1) == 0)
LABEL_20:
            objc_msgSend(v13, "addObject:", v25);
        }
        if (v45 == ++v24)
        {
          v45 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v45)
            goto LABEL_13;
          break;
        }
      }
    }

    v36 = (void *)objc_msgSend(v13, "copy");
    v11 = v40;
    v9 = v41;
  }
  else
  {
    v37 = objc_msgSend(v9, "count");
    if (v37 >= a5)
      v38 = a5;
    else
      v38 = v37;
    objc_msgSend(v9, "subarrayWithRange:", 0, v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

- (id)predictWithMapsPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5;
  _PSContactResolver *v6;
  void *v7;
  void *v8;
  _PSContactResolver *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _PSKNNModel *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  void *v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [_PSContactResolver alloc];
  -[_PSEnsembleModel contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _PSMapsContactKeysToFetch();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSContactResolver initWithContactStore:keysToFetch:](v6, "initWithContactStore:keysToFetch:", v7, v8);

  -[_PSEnsembleModel contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactIdentifierKey_0();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v10, "_ios_meContactWithKeysToFetch:error:", v12, &v62);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v62;

  if (v14)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_PSEnsembleModel predictWithMapsPredictionContext:maxSuggestions:].cold.1();

  }
  objc_msgSend(v13, "identifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
  v16 = objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel interactionStore](self, "interactionStore");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = -[_PSKNNModel initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:]([_PSKNNModel alloc], "initWithK:interactionStore:filterByBundleIds:knowledgeStore:contactResolver:messageInteractionCache:shareInteractionCache:", 500, v55, 0, v16, v9, 0, 0);
    -[_PSEnsembleModel setKnnMapsModel:](self, "setKnnMapsModel:", v18);

    -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel psConfig](self, "psConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateModelProperties:", v20);

  }
  os_unfair_lock_unlock(&self->_lock);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSMapsPeopleKnnSuggestions", (const char *)&unk_1A0908603, buf, 2u);
  }

  -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rankedMapsShareEtaSuggestions:maxSuggestions:", v5, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSMapsPeopleKnnSuggestions", (const char *)&unk_1A0908603, buf, 2u);
  }
  v52 = (void *)v16;

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134349315;
    v64 = v26;
    v65 = 2113;
    v66 = v23;
    _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_DEFAULT, "Maps ShareETA KNN suggestions: %{public}tu (%{private}@)", buf, 0x16u);
  }

  v27 = v23;
  v28 = v27;
  if (objc_msgSend(v27, "count") < a4)
  {
    -[_PSEnsembleModel knnMapsModel](self, "knnMapsModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a4 <= 0x64)
      v31 = 100;
    else
      v31 = a4;
    objc_msgSend(v29, "mapsShareEtaDefaultKnnSuggestions:maxSuggestions:", v5, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSEnsembleModel mapsSuggestionArrayWithArray:appendingUniqueElementsFromArray:contactResolver:meContactId:](self, "mapsSuggestionArrayWithArray:appendingUniqueElementsFromArray:contactResolver:meContactId:", v27, v32, v9, v56);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "seedContactIdentifiers");
  v33 = objc_claimAutoreleasedReturnValue();
  v54 = v5;
  v53 = v13;
  if (v33 && (v34 = (void *)v33, v35 = objc_msgSend(v28, "count"), v34, v35))
  {
    -[_PSEnsembleModel rerankMapsSuggestions:usingPredictionContext:contactResolver:](self, "rerankMapsSuggestions:usingPredictionContext:contactResolver:", v28, v5, v9);
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = v28;
  }
  v37 = v36;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
  v40 = MEMORY[0x1E0C809B0];
  if (v39)
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke;
    v60[3] = &unk_1E43FF2D0;
    v61 = v28;
    objc_msgSend(v37, "_pas_mappedArrayWithIndexedTransform:", v60);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_pas_componentsJoinedByString:", CFSTR(", "));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138543362;
    v64 = (uint64_t)v42;
    _os_log_impl(&dword_1A07F4000, v38, OS_LOG_TYPE_DEFAULT, "Maps ShareETA re-ranking: %{public}@", buf, 0xCu);

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v58[0] = v40;
    v58[1] = 3221225472;
    v58[2] = __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke_607;
    v58[3] = &unk_1E43FF2D0;
    v59 = v28;
    objc_msgSend(v37, "_pas_mappedArrayWithIndexedTransform:", v58);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_pas_componentsJoinedByString:", CFSTR(", "));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138477827;
    v64 = (uint64_t)v45;
    _os_log_impl(&dword_1A07F4000, v43, OS_LOG_TYPE_DEFAULT, "Maps ShareETA re-ranking private: %{private}@", buf, 0xCu);

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v64 = (uint64_t)v47;
    _os_log_impl(&dword_1A07F4000, v46, OS_LOG_TYPE_DEFAULT, "Total Maps ShareETA Suggestions count = %{public}@", buf, 0xCu);

  }
  v48 = objc_msgSend(v37, "count");
  if (v48 >= a4)
    v49 = a4;
  else
    v49 = v48;
  objc_msgSend(v37, "subarrayWithRange:", 0, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (id)rerankMapsSuggestions:(id)a3 usingPredictionContext:(id)a4 contactResolver:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _PSRecipient *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  uint64_t m;
  void *v50;
  _PSSuggestion *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _PSSuggestion *v70;
  void *v71;
  void *v72;
  _PSSuggestion *v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t ii;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t jj;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t kk;
  uint64_t v105;
  uint64_t v107;
  _PSEnsembleModel *v108;
  void *v109;
  id obj;
  id obja;
  void *v112;
  id v113;
  id v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  _PSSuggestion *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  id v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
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
  uint8_t buf[16];
  uint8_t v179;
  char v180[15];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  void *v189;
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_PSEnsembleModel contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = self;
  -[_PSEnsembleModel defaultContactKeysToFetch](self, "defaultContactKeysToFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ios_meContactWithKeysToFetch:error:", v12, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = (void *)objc_opt_new();
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v137 = v9;
  objc_msgSend(v9, "seedContactIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v181, v196, 16);
  v113 = v10;
  v114 = v8;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v182;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v182 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "contactWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = [_PSRecipient alloc];
          objc_msgSend(v18, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[_PSRecipient initWithIdentifier:handle:contact:](v19, "initWithIdentifier:handle:contact:", v20, 0, v18);

          if (v21)
          {
            objc_msgSend(v112, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqualToString:", v23);

            if ((v24 & 1) == 0)
              objc_msgSend(v122, "addObject:", v21);
            v10 = v113;
            v8 = v114;
          }
        }
        else
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[_PSEnsembleModel rerankMapsSuggestions:usingPredictionContext:contactResolver:].cold.1(&v179, v180, v21);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v181, v196, 16);
    }
    while (v15);
  }

  v25 = v122;
  if (objc_msgSend(v122, "count"))
  {
    v26 = objc_msgSend(v122, "count");
    objc_msgSend(v137, "seedContactIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v26 != v28)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v29, OS_LOG_TYPE_DEFAULT, "Dropped a few contact ids from seedContactIdentifiers since a recipient could not be generated", buf, 2u);
      }

    }
    v136 = (id)objc_opt_new();
    v115 = (void *)objc_opt_new();
    v109 = (void *)objc_opt_new();
    v135 = (void *)objc_opt_new();
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    obj = v8;
    v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v195, 16);
    if (v118)
    {
      v116 = *(_QWORD *)v175;
      do
      {
        for (j = 0; j != v118; ++j)
        {
          if (*(_QWORD *)v175 != v116)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * j);
          v170 = 0u;
          v171 = 0u;
          v172 = 0u;
          v173 = 0u;
          v132 = v31;
          objc_msgSend(v31, "recipients");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = (id)objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
          if (v123)
          {
            v33 = *(_QWORD *)v171;
            v129 = v32;
            v120 = *(_QWORD *)v171;
            do
            {
              v34 = 0;
              do
              {
                if (*(_QWORD *)v171 != v33)
                  objc_enumerationMutation(v32);
                v126 = v34;
                objc_msgSend(*(id *)(*((_QWORD *)&v170 + 1) + 8 * v34), "contact");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v166 = 0u;
                v167 = 0u;
                v168 = 0u;
                v169 = 0u;
                v36 = v25;
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v166, v193, 16);
                if (v37)
                {
                  v38 = v37;
                  v39 = *(_QWORD *)v167;
                  while (2)
                  {
                    for (k = 0; k != v38; ++k)
                    {
                      if (*(_QWORD *)v167 != v39)
                        objc_enumerationMutation(v36);
                      if (v35)
                      {
                        v41 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * k);
                        objc_msgSend(v41, "contact");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v42)
                        {
                          objc_msgSend(v35, "identifier");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v41, "contact");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v44, "identifier");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(v43, "isEqualToString:", v45);

                          if (v46)
                          {
                            objc_msgSend(v115, "addObject:", v132);

                            v25 = v122;
                            goto LABEL_44;
                          }
                        }
                      }
                    }
                    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v166, v193, 16);
                    if (v38)
                      continue;
                    break;
                  }
                }

                v34 = v126 + 1;
                v33 = v120;
                v25 = v122;
                v32 = v129;
              }
              while ((id)(v126 + 1) != v123);
              v123 = (id)objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v170, v194, 16);
            }
            while (v123);
          }

          objc_msgSend(v109, "addObject:", v132);
LABEL_44:
          ;
        }
        v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v174, v195, 16);
      }
      while (v118);
    }

    v47 = objc_msgSend(v25, "count");
    if (v47 != objc_msgSend(v115, "count"))
    {
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      obja = v25;
      v48 = v115;
      v121 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v162, v192, 16);
      if (v121)
      {
        v117 = *(_QWORD *)v163;
        do
        {
          for (m = 0; m != v121; ++m)
          {
            if (*(_QWORD *)v163 != v117)
              objc_enumerationMutation(obja);
            v50 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * m);
            v158 = 0u;
            v159 = 0u;
            v160 = 0u;
            v161 = 0u;
            v51 = v48;
            v124 = (id)-[_PSSuggestion countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v158, v191, 16);
            if (v124)
            {
              v52 = *(_QWORD *)v159;
              v130 = v51;
              v133 = m;
              v119 = *(_QWORD *)v159;
              do
              {
                v53 = 0;
                do
                {
                  if (*(_QWORD *)v159 != v52)
                    objc_enumerationMutation(v51);
                  v127 = v53;
                  v54 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v53);
                  v154 = 0u;
                  v155 = 0u;
                  v156 = 0u;
                  v157 = 0u;
                  objc_msgSend(v54, "recipients");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v154, v190, 16);
                  if (v56)
                  {
                    v57 = v56;
                    v58 = *(_QWORD *)v155;
                    while (2)
                    {
                      for (n = 0; n != v57; ++n)
                      {
                        if (*(_QWORD *)v155 != v58)
                          objc_enumerationMutation(v55);
                        v60 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * n);
                        objc_msgSend(v50, "contact");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "identifier");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "contact");
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "identifier");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        v65 = objc_msgSend(v62, "isEqualToString:", v64);

                        if (v65)
                        {

                          v48 = v115;
                          v73 = v130;
                          m = v133;
                          goto LABEL_69;
                        }
                      }
                      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v154, v190, 16);
                      if (v57)
                        continue;
                      break;
                    }
                  }

                  v53 = v127 + 1;
                  v51 = v130;
                  m = v133;
                  v52 = v119;
                }
                while ((id)(v127 + 1) != v124);
                v48 = v115;
                v124 = (id)-[_PSSuggestion countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v158, v191, 16);
              }
              while (v124);
            }

            -[_PSEnsembleModel contactResolver](v108, "contactResolver");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "contact");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "allEmailAndPhoneNumberHandlesForContact:", v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "firstObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setHandle:", v69);

            v70 = [_PSSuggestion alloc];
            objc_msgSend(v50, "handle");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v189, 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v107) = 0;
            v73 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](v70, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", v71, 0, 0, v72, 0, 0, CFSTR("Maps Seeded Contact"), 0, 0, v107);

            objc_msgSend(v135, "addObject:", v73);
LABEL_69:

          }
          v121 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v162, v192, 16);
        }
        while (v121);
      }

    }
    if (objc_msgSend(v115, "count"))
      objc_msgSend(v136, "addObjectsFromArray:", v115);
    v10 = v113;
    if ((unint64_t)objc_msgSend(v115, "count") > 1)
      v74 = 2;
    else
      v74 = objc_msgSend(v115, "count");
    v8 = v114;
    if (objc_msgSend(v135, "count"))
    {
      v148 = 0uLL;
      v149 = 0uLL;
      v146 = 0uLL;
      v147 = 0uLL;
      v125 = (id)objc_msgSend(v135, "copy");
      v131 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v146, v187, 16);
      if (v131)
      {
        v128 = *(_QWORD *)v147;
        do
        {
          v75 = 0;
          do
          {
            if (*(_QWORD *)v147 != v128)
              objc_enumerationMutation(v125);
            v134 = v75;
            v76 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v75);
            v142 = 0u;
            v143 = 0u;
            v144 = 0u;
            v145 = 0u;
            objc_msgSend(v76, "recipients");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v186, 16);
            if (v78)
            {
              v79 = v78;
              v80 = *(_QWORD *)v143;
              do
              {
                for (ii = 0; ii != v79; ++ii)
                {
                  if (*(_QWORD *)v143 != v80)
                    objc_enumerationMutation(v77);
                  v82 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * ii);
                  objc_msgSend(v137, "seedContactIdentifiers");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "contact");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "identifier");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v83, "containsObject:", v85);

                  if (v86)
                  {
                    objc_msgSend(v82, "contact");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "postalAddresses");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    v89 = objc_msgSend(v88, "count");

                    if (v89)
                    {
                      objc_msgSend(v137, "seedContactIdentifiers");
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v82, "contact");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v91, "identifier");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      v93 = objc_msgSend(v90, "indexOfObject:", v92);

                      if (v93 > objc_msgSend(v136, "count"))
                        v93 = objc_msgSend(v136, "count");
                      objc_msgSend(v136, "insertObject:atIndex:", v76, v93);
                      objc_msgSend(v135, "removeObject:", v76);
                    }
                  }
                }
                v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v186, 16);
              }
              while (v79);
            }

            v75 = v134 + 1;
          }
          while (v134 + 1 != v131);
          v131 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v146, v187, 16);
        }
        while (v131);
      }

      objc_msgSend(v136, "addObjectsFromArray:", v109);
      objc_msgSend(v136, "addObjectsFromArray:", v135);
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v94 = v109;
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v138, v185, 16);
      v10 = v113;
      v8 = v114;
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v139;
        do
        {
          for (jj = 0; jj != v96; ++jj)
          {
            if (*(_QWORD *)v139 != v97)
              objc_enumerationMutation(v94);
            v99 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * jj);
            if ((objc_msgSend(v136, "containsObject:", v99) & 1) == 0)
              objc_msgSend(v136, "addObject:", v99);
          }
          v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v138, v185, 16);
        }
        while (v96);
      }
    }
    else
    {
      v152 = 0uLL;
      v153 = 0uLL;
      v150 = 0uLL;
      v151 = 0uLL;
      v100 = v109;
      v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v150, v188, 16);
      if (v101)
      {
        v102 = v101;
        v103 = *(_QWORD *)v151;
        do
        {
          for (kk = 0; kk != v102; ++kk)
          {
            if (*(_QWORD *)v151 != v103)
              objc_enumerationMutation(v100);
            v105 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * kk);
            if (v74 > objc_msgSend(v136, "count"))
              v74 = objc_msgSend(v136, "count");
            objc_msgSend(v136, "insertObject:atIndex:", v105, v74++);
          }
          v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v150, v188, 16);
        }
        while (v102);
      }
    }

    v25 = v122;
  }
  else
  {
    v136 = v8;
  }

  return v136;
}

- (id)mapsSuggestionArrayWithArray:(id)a3 appendingUniqueElementsFromArray:(id)a4 contactResolver:(id)a5 meContactId:(id)a6
{
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = a5;
  v35 = a6;
  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    v34 = v11;
    do
    {
      v15 = 0;
      v37 = v13;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
        objc_msgSend(v16, "recipients");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 == 1)
        {
          v19 = v10;
          objc_msgSend(v16, "recipients");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "contact");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            objc_msgSend(v36, "allEmailAndPhoneNumberHandlesForContact:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handle");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "containsObject:", v25);

            if ((v26 & 1) == 0)
              goto LABEL_16;
LABEL_11:
            objc_msgSend(v23, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "isEqualToString:", v35) & 1) == 0)
            {
              objc_msgSend(v23, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v19, "containsObject:", v30);

              if ((v31 & 1) != 0)
              {
                v11 = v34;
                goto LABEL_16;
              }
              objc_msgSend(v33, "addObject:", v16);
              objc_msgSend(v23, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v29);
              v11 = v34;
            }

            goto LABEL_16;
          }
          objc_msgSend(v21, "handle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v27, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setIdentifier:", v28);

          objc_msgSend(v21, "setContact:", v23);
          if (v23)
            goto LABEL_11;
LABEL_16:

          v10 = v19;
          v13 = v37;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v13);
  }

  return v33;
}

- (id)suggestZKWSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  _PSKNNModelConfiguration *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _PSKNNModelConfiguration *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  _PSFTZKWSuggestionsTransformerFactory *v56;
  void *v57;
  _PSEnsembleModel *v58;
  _PSFTZKWSuggestionsTransformerFactory *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  char v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _PSFTZKWSuggestionsTransformerFactory *v87;
  _QWORD v88[5];
  void *v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  _QWORD v93[2];
  _QWORD v94[8];

  v94[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileSharePlayPeoplePickerBundleId](_PSConstants, "mobileSharePlayPeoplePickerBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v9);

  }
  objc_msgSend(v5, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSharePlayPeoplePickerBundleId](_PSConstants, "macSharePlayPeoplePickerBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v13);

  }
  objc_msgSend(v5, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants preferencesBundleId](_PSConstants, "preferencesBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v15))
  {

  }
  else
  {
    objc_msgSend(v5, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if (!v18)
      goto LABEL_9;
  }
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleID:", v19);

LABEL_9:
  objc_msgSend(v5, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants passwordsAppBundleId](_PSConstants, "passwordsAppBundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (v22)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v23);

  }
  objc_msgSend(v5, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariBundleId](_PSConstants, "macSafariBundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:", v25) & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v5, "bundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariTechnologyPreviewBundleId](_PSConstants, "macSafariTechnologyPreviewBundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqualToString:", v27) & 1) != 0)
  {

LABEL_14:
LABEL_15:
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v28);

    goto LABEL_16;
  }
  objc_msgSend(v5, "bundleID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariPlatformSupportBundleId](_PSConstants, "macSafariPlatformSupportBundleId");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v73, "isEqualToString:", v74);

  if ((v75 & 1) != 0)
    goto LABEL_15;
LABEL_16:
  v29 = +[_PSFTZKWConfig useBlendingLayer](_PSFTZKWConfig, "useBlendingLayer");
  objc_msgSend(v5, "bundleID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants findMyBundleId](_PSConstants, "findMyBundleId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqualToString:", v31);

  if (v32)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v33);

  }
  objc_msgSend(v5, "bundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "isEqualToString:", v35) & 1) != 0)
  {
    v36 = 0;
  }
  else
  {
    objc_msgSend(v5, "bundleID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqualToString:", v38);

    v36 = v39 ^ 1;
  }

  objc_msgSend(v5, "bundleID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "isEqualToString:", v41) & 1) != 0)
  {
    v42 = 1;
  }
  else
  {
    objc_msgSend(v5, "bundleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v43, "isEqualToString:", v44);

  }
  if (((_os_feature_enabled_impl() ^ 1 | v36) & 1) != 0)
  {
    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E442A7C0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = [_PSKNNModelConfiguration alloc];
      v90 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v5, "bundleID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setWithObject:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:](v46, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:", v47, &unk_1E442C778, &unk_1E442C790, v51, 0, 5, CFSTR("PastMessages"));

      -[_PSEnsembleModel _knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:](self, "_knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:", v5, v52, a4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v53 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v54, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __78___PSEnsembleModel_suggestZKWSuggestionsWithPredictionContext_maxSuggestions___block_invoke;
    v88[3] = &unk_1E43FEE88;
    v88[4] = self;
    +[_PSFTZKWTrialWrapper runIfUpdated:](_PSFTZKWTrialWrapper, "runIfUpdated:", v88);
    -[_PSFTZKWOrchestrator config](self->_zkwFTOrchestrator, "config");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setUseBlendingLayer:", v29);

    -[_PSFTZKWOrchestrator getSuggestionsWithPredictionContext:](self->_zkwFTOrchestrator, "getSuggestionsWithPredictionContext:", v5);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = [_PSFTZKWSuggestionsTransformerFactory alloc];
    -[_PSEnsembleModel interactionStore](self, "interactionStore");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = self;
    v59 = -[_PSFTZKWSuggestionsTransformerFactory initWithInteractionStore:](v56, "initWithInteractionStore:", v57);

    v83 = (void *)MEMORY[0x1E0C99DE8];
    -[_PSFTZKWSuggestionsTransformerFactory mapRecipientsToContactsWithUnmapped:](v59, "mapRecipientsToContactsWithUnmapped:", 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v82;
    -[_PSFTZKWSuggestionsTransformerFactory filterIDSReachable](v59, "filterIDSReachable");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v81;
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v80;
    +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFTZKWSuggestionsTransformerFactory formatWithBundleIdsForGroupMatching:](v59, "formatWithBundleIdsForGroupMatching:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v77;
    objc_msgSend(v5, "seedRecipients");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSFTZKWSuggestionsTransformerFactory deduplicateWithSeedRecipients:](v59, "deduplicateWithSeedRecipients:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v94[3] = v61;
    -[_PSFTZKWSuggestionsTransformerFactory deduplicateWithMaxSuggestions:](v59, "deduplicateWithMaxSuggestions:", a4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v94[4] = v62;
    -[_PSEnsembleModel zkwFTTrialData](v58, "zkwFTTrialData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "experimentIdentifiers");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel zkwFTTrialData](v58, "zkwFTTrialData");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "rolloutIdentifiers");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v59;
    -[_PSFTZKWSuggestionsTransformerFactory annotateWithTrialExperimentIdentifiers:rolloutIdentifiers:](v59, "annotateWithTrialExperimentIdentifiers:rolloutIdentifiers:", v64, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v94[5] = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "arrayWithArray:", v68);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v69, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTransformersTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:suggestions:](_PSFTZKWSuggestionsTransformerFactory, "getResultsFromTransformers:suggestions:", v84, v85);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v70, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTransformersTotalTime", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeTotalTime", (const char *)&unk_1A0908603, buf, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v92 = v53;
      _os_log_impl(&dword_1A07F4000, v72, OS_LOG_TYPE_DEFAULT, "Final ZKW suggestions post-transformers: %{sensitive}@", buf, 0xCu);
    }

  }
  return v53;
}

- (id)_knnZKWSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  -[_PSEnsembleModel knnZkwModel](self, "knnZkwModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rankedZkwSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_PSEnsembleModel _knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:].cold.2();

  -[_PSEnsembleModel updateTrialID:](self, "updateTrialID:", v11);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_PSEnsembleModel _knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:].cold.1(self, v13);

  v14 = (void *)objc_msgSend(v11, "copy");
  return v14;
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5 excludeBackfillSuggestions:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, _BYTE *);
  void *v25;
  _PSEnsembleModel *v26;
  id v27;
  unint64_t v28;
  _QWORD v29[5];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v6 = a6;
  v8 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v34 = *MEMORY[0x1E0C80C00];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke;
  v29[3] = &unk_1E43FEBF0;
  v29[4] = self;
  v11 = a3;
  v12 = (void *)MEMORY[0x1A1AFCBF8](v29);
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rankedGlobalSuggestionsWithPredictionContext:maxSuggestions:contactsOnly:interactions:contactIdIsInStoreBlock:", v11, a5, v8, 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = "NO";
    if (v6)
      v17 = "YES";
    *(_DWORD *)buf = 136315138;
    v31 = (uint64_t)v17;
    _os_log_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_INFO, "excludeBackfillSuggestions for rankedGlobalSuggestionsWithPredictionContext %s", buf, 0xCu);
  }

  if (objc_msgSend(v15, "count") < a5 && !v6)
  {
    -[_PSEnsembleModel contactMonitor](self, "contactMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = 3221225472;
    v24 = __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke_629;
    v25 = &unk_1E43FF2F8;
    v26 = self;
    v27 = v15;
    v28 = a5;
    objc_msgSend(v18, "enumerateContactStoreWithBlock:", &v22);

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v22, v23, v24, v25, v26);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218243;
    v31 = v20;
    v32 = 2113;
    v33 = v15;
    _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Returning %tu suggestions for rankedGlobalSuggestions, full suggestions: %{private}@", buf, 0x16u);
  }

  return v15;
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(unint64_t)a5
{
  return -[_PSEnsembleModel rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:](self, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:", a3, a4, a5, 0);
}

- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 interactionId:(id)a5
{
  id v7;
  _PSContactSuggester *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (objc_msgSend(MEMORY[0x1E0D15898], "isRunningOnInternalBuild"))
  {
    v8 = objc_alloc_init(_PSContactSuggester);
    -[_PSContactSuggester contactPriorsForContactIdentifiers:](v8, "contactPriorsForContactIdentifiers:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    if (v11 >= a4)
      v12 = a4;
    else
      v12 = v11;
    objc_msgSend(v10, "subarrayWithRange:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSSiriNLRankerUtilities knowledgeEventWithContactPriors:interactionId:](_PSSiriNLRankerUtilities, "knowledgeEventWithContactPriors:interactionId:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[_PSEnsembleModel knowledgeStore](self, "knowledgeStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "saveObjects:tracker:responseQueue:withCompletion:", v16, &__block_literal_global_637, 0, &__block_literal_global_639);

    }
  }

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedNameSuggestionsWithPredictionContext:forName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedAutocompleteSuggestionsWithPredictionContext:candidates:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messagesGroupResultsForPredictionContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedSiriMLCRHandles:context:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSEnsembleModel knnNameOrContactRankerModel](self, "knnNameOrContactRankerModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankedHandlesFromCandidateHandles:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appExtensionSuggestionsFromContext:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, unsigned __int8);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 buf;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke;
    v32[3] = &unk_1E43FF128;
    v33 = v3;
    __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke((uint64_t)v32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "appExtensionSuggestionsFromContext - appBundleIdsToShareExtensionBundleIdsMapping: %@", (uint8_t *)&buf, 0xCu);

  }
  +[_PSAppUsageUtilities sharesFromSourceToTargetBundleValues](_PSAppUsageUtilities, "sharesFromSourceToTargetBundleValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSAppUsageUtilities appUsageDurations](_PSAppUsageUtilities, "appUsageDurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appBundleIdsToShareExtensionBundleIdsMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSAppUsageUtilities mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:sourceBundleId:sharesFromSourceToTargetBundle:appUsageDurations:](_PSAppUsageUtilities, "mostUsedAppShareExtensionsWithAppBundleIdsToShareExtensionBundleIdsMapping:sourceBundleId:sharesFromSourceToTargetBundle:appUsageDurations:", v11, v12, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v7;
  v28 = 3221225472;
  v29 = __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_643;
  v30 = &unk_1E43FF3A0;
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v31 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v27);
  objc_msgSend(v3, "sessionID", v27, v28, v29, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v17 = (void *)getPSAppSuggestionsMetricsInferenceEventClass_softClass;
  v37 = getPSAppSuggestionsMetricsInferenceEventClass_softClass;
  if (!getPSAppSuggestionsMetricsInferenceEventClass_softClass)
  {
    *(_QWORD *)&buf = v7;
    *((_QWORD *)&buf + 1) = 3221225472;
    v39 = __getPSAppSuggestionsMetricsInferenceEventClass_block_invoke;
    v40 = &unk_1E43FEA00;
    v41 = &v34;
    __getPSAppSuggestionsMetricsInferenceEventClass_block_invoke((uint64_t)&buf);
    v17 = (void *)v35[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v34, 8);
  v19 = [v18 alloc];
  v20 = (void *)objc_msgSend(v14, "copy");
  v21 = (void *)objc_msgSend(v19, "initWithIdentifier:suggestions:", v15, v20);

  if (v21)
  {
    objc_msgSend(getPSMetricsManagerClass(), "recordWithAppInference:", v21);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[_PSEnsembleModel appExtensionSuggestionsFromContext:].cold.1();

  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&buf, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1A07F4000, v24, OS_LOG_TYPE_INFO, "appExtensionSuggestionsFromContext - final results: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  v25 = v13;
  return v25;
}

- (id)candidatesForShareSheetRanking
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _PSCandidate *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _PSCandidate *v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "Fetch candidates for Share Sheet", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_3;
  v77[3] = &unk_1E43FF3F0;
  v6 = v4;
  v78 = v6;
  v7 = v5;
  v79 = v7;
  v8 = MEMORY[0x1A1AFCBF8](v77);
  -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_PSEnsembleModel shareInteractionCache](self, "shareInteractionCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueConversationCandidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel maxCandidatesFromShareSheetCache](self, "maxCandidatesFromShareSheetCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v13, v14);

  }
  -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_PSEnsembleModel messageInteractionCache](self, "messageInteractionCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueConversationCandidates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSEnsembleModel maxCandidatesFromMessageCache](self, "maxCandidatesFromMessageCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v19, v20);

  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "addObjectsFromArray:", v6);
  objc_msgSend(v21, "addObjectsFromArray:", v7);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v83 = (uint64_t)v6;
    v84 = 2113;
    v85 = v7;
    _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Top candidates are: %{private}@, remaining candidates are: %{private}@", buf, 0x16u);
  }
  v61 = v7;
  v62 = v6;

  v23 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v24 = v21;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v74 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v29, "recipientsId");
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)v30;
          objc_msgSend(v29, "domainId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v29, "recipientsId");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v33);

          }
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v26);
  }
  v60 = (void *)v8;

  -[_PSEnsembleModel maxCandidatesFromMessageCache](self, "maxCandidatesFromMessageCache");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "integerValue");
  -[_PSEnsembleModel maxCandidatesFromShareSheetCache](self, "maxCandidatesFromShareSheetCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "integerValue");

  v38 = (void *)objc_opt_new();
  _PSShareSheetExtensionBundleIDToAppBundleIDMapping(-[_PSEnsembleModel allowNonSupportedBundleIDs](self, "allowNonSupportedBundleIDs"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v24;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v68)
  {
    v67 = v37 + v35;
    v66 = *(_QWORD *)v70;
LABEL_21:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v66)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v39);
      if (objc_msgSend(v38, "count") >= v67)
        break;
      objc_msgSend(v40, "domainId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        objc_msgSend(v40, "recipientsId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
          goto LABEL_29;
        objc_msgSend(v40, "recipientsId");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "domainId");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setDomainId:", v44);

        objc_msgSend(v41, "derivedIntentId");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setDerivedIntentId:", v45);

      }
LABEL_29:
      objc_msgSend(v40, "domainId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {

LABEL_32:
        v48 = [_PSCandidate alloc];
        objc_msgSend(v40, "domainId");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "derivedIntentId");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bundleId");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (uint64_t)v52;
        if (!v52)
        {
          objc_msgSend(v40, "bundleId");
          v53 = objc_claimAutoreleasedReturnValue();
          v63 = (void *)v53;
        }
        objc_msgSend(v40, "recipientsId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[_PSCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:](v48, "initWithDomainId:derivedIntentId:bundleId:recipientsId:", v49, v50, v53, v54);
        objc_msgSend(v38, "addObject:", v55);

        if (!v52)
        goto LABEL_37;
      }
      objc_msgSend(v40, "recipientsId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
        goto LABEL_32;
LABEL_37:
      if (v68 == ++v39)
      {
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v68)
          goto LABEL_21;
        break;
      }
    }
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 134217984;
    v83 = v57;
    _os_log_impl(&dword_1A07F4000, v56, OS_LOG_TYPE_DEFAULT, "Fetched %tu candidates", buf, 0xCu);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v83 = (uint64_t)v38;
    _os_log_impl(&dword_1A07F4000, v58, OS_LOG_TYPE_INFO, "Fetched candidates for Share Sheet ranking %{private}@", buf, 0xCu);
  }

  return v38;
}

- (id)computeEphemeralFeaturesWithPredictionContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  _PSFeatureCache *featureCache;
  _PSFeatureCache *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "Computing ephemeral features", (uint8_t *)&v14, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  featureCache = self->_featureCache;
  os_unfair_lock_unlock(&self->_lock);
  if (!featureCache)
    -[_PSEnsembleModel populateCaches](self, "populateCaches");
  -[_PSEnsembleModel getPhotoBasedFeatures:](self, "getPhotoBasedFeatures:", v4);
  os_unfair_lock_lock(&self->_lock);
  -[_PSFeatureCache setPredictionContextWithContext:](self->_featureCache, "setPredictionContextWithContext:", v4);
  v8 = self->_featureCache;
  -[_PSEnsembleModel candidatesForShareSheetRanking](self, "candidatesForShareSheetRanking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFeatureCache computeEphemeralFeaturesWithCandidates:context:](v8, "computeEphemeralFeaturesWithCandidates:context:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSFeaturePreprocessor encodeFeatureVectors:](_PSFeaturePreprocessor, "encodeFeatureVectors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138477827;
    v15 = v10;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Computed ephemeral features %{private}@", (uint8_t *)&v14, 0xCu);
  }

  return v11;
}

- (id)validateCoreMLModelWithRawInput:(id)a3 predictionContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _PSCoreMLScoringModel *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Validating CoreML model", buf, 2u);
  }

  +[_PSFeaturePreprocessor rawDataToCandidateFeatureDict:](_PSFeaturePreprocessor, "rawDataToCandidateFeatureDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsCoreMLValidationFetch:", 1);
  v9 = objc_alloc_init(_PSCoreMLScoringModel);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___PSEnsembleModel_validateCoreMLModelWithRawInput_predictionContext___block_invoke;
  v14[3] = &unk_1E43FF418;
  v10 = v8;
  v15 = v10;
  -[_PSCoreMLScoringModel scoreCandidates:predictionContext:](v9, "scoreCandidates:predictionContext:", v14, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v11;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "candidateToScore: %{private}@", buf, 0xCu);
  }

  return v5;
}

- (int64_t)pruneCandidatesForRanking:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "Pruning all candidates that the user never sent a message to.", buf, 2u);
  }

  objc_msgSend(v3, "conversationIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46___PSEnsembleModel_pruneCandidatesForRanking___block_invoke;
  v11[3] = &unk_1E43FF440;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeConversationIds:", v7);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "Finished pruning candidates. Candidates removed: %@", buf, 0xCu);
  }

  v9 = objc_msgSend(v7, "count");
  return v9;
}

- (void)addAdditionalStatsSignalsToCandidates:(id)a3 withTrialClient:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_addAdditionalNonStatsSignalsToCandidates", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(v5, "additionalFeaturesToCompute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computeFeaturesForRecipe:", v8);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "additionalFeaturesToCompute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: Finished computing additional features %@", (uint8_t *)&v12, 0xCu);

  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_addAdditionalNonStatsSignalsToCandidates", (const char *)&unk_1A0908603, (uint8_t *)&v12, 2u);
  }

}

- (void)setupAeroMLPipelineLoggerWithModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  if (-[_PSEnsembleModel enablePipelineCheckpointing](self, "enablePipelineCheckpointing")
    && (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0)
  {
    -[_PSEnsembleModel amlPipelineLogger](self, "amlPipelineLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        v7 = "_PSEnsemble: reusing AMLPipelineLogger object";
LABEL_8:
        _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v24, 2u);
      }
    }
    else
    {
      objc_msgSend(v4, "modelDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputDescriptionsByName");
      v6 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "modelDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E888]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v12 = (void *)getAMLFeaturesSpecificationClass_softClass;
      v32 = getAMLFeaturesSpecificationClass_softClass;
      if (!getAMLFeaturesSpecificationClass_softClass)
      {
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __getAMLFeaturesSpecificationClass_block_invoke;
        v27 = &unk_1E43FEA00;
        v28 = &v29;
        __getAMLFeaturesSpecificationClass_block_invoke((uint64_t)&v24);
        v12 = (void *)v30[3];
      }
      v13 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v29, 8);
      v14 = [v13 alloc];
      -[NSObject allValues](v6, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFeaturesDescription:", v15);

      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v17 = (void *)getAMLFeaturesConfigurationClass_softClass;
      v32 = getAMLFeaturesConfigurationClass_softClass;
      if (!getAMLFeaturesConfigurationClass_softClass)
      {
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __getAMLFeaturesConfigurationClass_block_invoke;
        v27 = &unk_1E43FEA00;
        v28 = &v29;
        __getAMLFeaturesConfigurationClass_block_invoke((uint64_t)&v24);
        v17 = (void *)v30[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v29, 8);
      v19 = (void *)objc_msgSend([v18 alloc], "initWithBundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:", CFSTR("com.apple.peoplesuggester.sharesheet"), CFSTR("peoplesuggester-sharesheet-rewrite"), v11, 3, v16);
      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v20 = (void *)getAMLPipelineLoggerClass_softClass;
      v32 = getAMLPipelineLoggerClass_softClass;
      if (!getAMLPipelineLoggerClass_softClass)
      {
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __getAMLPipelineLoggerClass_block_invoke;
        v27 = &unk_1E43FEA00;
        v28 = &v29;
        __getAMLPipelineLoggerClass_block_invoke((uint64_t)&v24);
        v20 = (void *)v30[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v29, 8);
      v22 = (void *)objc_msgSend([v21 alloc], "initWithFeaturesConfiguration:", v19);
      -[_PSEnsembleModel setAmlPipelineLogger:](self, "setAmlPipelineLogger:", v22);

      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_INFO, "_PSEnsemble: created AMLPipelineLogger object", (uint8_t *)&v24, 2u);
      }

    }
  }
  else
  {
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      v7 = "_PSEnsemble: pipeline checkpointing is disabled";
      goto LABEL_8;
    }
  }

}

- (void)logPipelineWithSuggestions:(id)a3 interactionsStatistics:(id)a4 pipelineStage:(id)a5 sessionID:(id)a6
{
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _PSEnsembleModel *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t i;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v26 = self;
  -[_PSEnsembleModel amlPipelineLogger](self, "amlPipelineLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v33 = (void *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v30;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v37, "groupName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v37, "groupName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "initWithString:", v12);
          }
          else
          {
            v12 = (void *)objc_opt_new();
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            objc_msgSend(v37, "recipients");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v39;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v39 != v16)
                    objc_enumerationMutation(v14);
                  v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                  v47 = 0;
                  v48 = &v47;
                  v49 = 0x2050000000;
                  v19 = (void *)getCNContactFormatterClass_softClass;
                  v50 = getCNContactFormatterClass_softClass;
                  if (!getCNContactFormatterClass_softClass)
                  {
                    v46[0] = MEMORY[0x1E0C809B0];
                    v46[1] = 3221225472;
                    v46[2] = __getCNContactFormatterClass_block_invoke;
                    v46[3] = &unk_1E43FEA00;
                    v46[4] = &v47;
                    __getCNContactFormatterClass_block_invoke((uint64_t)v46);
                    v19 = (void *)v48[3];
                  }
                  v20 = objc_retainAutorelease(v19);
                  _Block_object_dispose(&v47, 8);
                  objc_msgSend(v18, "contact");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "stringFromContact:style:", v21, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                    objc_msgSend(v12, "addObject:", v22);

                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
              }
              while (v15);
            }

            if (!objc_msgSend(v12, "count"))
              objc_msgSend(v12, "addObject:", CFSTR("unable_to_resolve"));
            _PASJoinStrings();
            v13 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v13;

          objc_msgSend(v37, "conversationIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, v24);
          }
          else
          {
            objc_msgSend(v37, "derivedIntentIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, v25);

          }
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v34);
    }

    -[_PSEnsembleModel logPipeline:withPipelineStage:andSessionID:andCandidateNames:](v26, "logPipeline:withPipelineStage:andSessionID:andCandidateNames:", v27, v28, v29, v33);
  }

}

- (void)logPipeline:(id)a3 withPipelineStage:(id)a4 andSessionID:(id)a5 andCandidateNames:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _PSInteractionsStatisticsFeatureProvider *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 buf;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_PSEnsembleModel amlPipelineLogger](self, "amlPipelineLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[_PSInteractionsStatisticsFeatureProvider initWithInteractionsStatistics:]([_PSInteractionsStatisticsFeatureProvider alloc], "initWithInteractionsStatistics:", v10);
    -[_PSInteractionsStatisticsFeatureProvider mlFeatures](v15, "mlFeatures");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v17 = (void *)objc_opt_new();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __81___PSEnsembleModel_logPipeline_withPipelineStage_andSessionID_andCandidateNames___block_invoke;
      v26[3] = &unk_1E43FF468;
      v27 = v13;
      v18 = v17;
      v28 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v26);
      v19 = v18;

      v16 = v19;
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v20 = (void *)getAMLFeaturesDonationMetadataClass_softClass;
    v32 = getAMLFeaturesDonationMetadataClass_softClass;
    if (!getAMLFeaturesDonationMetadataClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v34 = __getAMLFeaturesDonationMetadataClass_block_invoke;
      v35 = &unk_1E43FEA00;
      v36 = &v29;
      __getAMLFeaturesDonationMetadataClass_block_invoke((uint64_t)&buf);
      v20 = (void *)v30[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v29, 8);
    v22 = (void *)objc_msgSend([v21 alloc], "initWithSessionId:metadata:", v12, 0);
    -[_PSEnsembleModel amlPipelineLogger](self, "amlPipelineLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logPipelineAsync:features:metadata:async:", v11, v16, v22, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "_PSEnsemble: pipeline logged at %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
    v15 = (_PSInteractionsStatisticsFeatureProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A07F4000, &v15->super, OS_LOG_TYPE_INFO, "_PSEnsemble: pipeline checkpointing is disabled", (uint8_t *)&buf, 2u);
    }
  }

}

- (void)evaluateCandidates:(id)a3 psrMLModel:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_evaluateCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v5, "conversationIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke;
  v15 = &unk_1E43FEED8;
  v9 = v5;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost", v12, v13, v14, v15);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_evaluateCandidates", (const char *)&unk_1A0908603, buf, 2u);
  }

}

- (id)getSuggestionsFromInteractionsStatistics:(id)a3 withConfig:(id)a4 trialClient:(id)a5 andPredictionContext:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "featureNamesToSortWith");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v10;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: sorting candidates using %@", buf, 0xCu);

  }
  objc_msgSend(v7, "conversationIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke;
  v33[3] = &unk_1E43FF490;
  v13 = v8;
  v34 = v13;
  v14 = v7;
  v35 = v14;
  objc_msgSend(v11, "sortedArrayUsingComparator:", v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v15;
    _os_log_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: ranked candidates %@", buf, 0xCu);
  }

  v17 = (void *)objc_opt_new();
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_671;
  v29[3] = &unk_1E43FF4B8;
  v18 = v13;
  v30 = v18;
  v19 = v14;
  v31 = v19;
  v20 = v17;
  v32 = v20;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v29);
  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v37 = v20;
    _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: suggestions proxies found %{private}@", buf, 0xCu);
  }

  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_676;
    v27[3] = &unk_1E43FF4E0;
    v28 = v19;
    objc_msgSend(v20, "_pas_mappedArrayWithTransform:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v23;
    _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: <anonymised> suggestions proxies found %@", buf, 0xCu);

  }
  v24 = v32;
  v25 = v20;

  return v25;
}

+ (id)orderedSuggestionProxiesWithProxyOrder:(id)a3 suggestionProxies:(id)a4 suggestionsWithSharePlayAddedBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  void (**v29)(id, NSObject *);
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  _QWORD v41[6];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = (void (**)(id, NSObject *))a5;
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v42[0] = CFSTR("SuggestionProxyTypeInCall");
  v42[1] = CFSTR("SuggestionProxyTypeReturnToSender");
  v42[2] = CFSTR("SuggestionProxyTypePASS");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v41[0] = CFSTR("SuggestionProxyTypeHyperRecencyRewrite");
  v41[1] = CFSTR("SuggestionProxyTypeHyperRecencyIncomingRewrite");
  v41[2] = CFSTR("SuggestionProxyTypeFrequencyOfTopDomainURL");
  v41[3] = CFSTR("SuggestionProxyTypeFrequencyOfSharesFromCurrentApp");
  v41[4] = CFSTR("SuggestionProxyTypeFrequencyOfShares");
  v41[5] = CFSTR("SuggestionProxyTypeFromStats");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  v30 = (id)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v33;
    *(_QWORD *)&v17 = 138543618;
    v28 = v17;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v20);
        if (objc_msgSend(v14, "containsObject:", v21, v28))
        {
          +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            goto LABEL_17;
          *(_DWORD *)buf = v28;
          v37 = v21;
          v38 = 2114;
          v39 = v15;
          v23 = v22;
          v24 = "_PSEnsemble: found duplicate proxy key, skipping '%{public}@' in list %{public}@";
          goto LABEL_9;
        }
        objc_msgSend(v14, "addObject:", v21);
        if (objc_msgSend(v11, "containsObject:", v21))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v21);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v30, "addObjectsFromArray:", v22);
        }
        else if (objc_msgSend(v31, "containsObject:", v21))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v21);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v29[2](v29, v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObjectsFromArray:", v25);

          }
        }
        else
        {
          +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v28;
            v37 = v21;
            v38 = 2114;
            v39 = v15;
            v23 = v22;
            v24 = "_PSEnsemble: found unsupported proxy key '%{public}@' in list %{public}@";
LABEL_9:
            _os_log_fault_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0x16u);
          }
        }
LABEL_17:

        ++v20;
      }
      while (v18 != v20);
      v26 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      v18 = v26;
    }
    while (v26);
  }

  return v30;
}

- (id)finalSuggestionProxiesForInteractionStatistics:(id)a3 config:(id)a4 trialClient:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
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
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[9];
  _QWORD v51[11];

  v51[9] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  -[_PSEnsembleModel getSuggestionsFromInteractionsStatistics:withConfig:trialClient:andPredictionContext:](self, "getSuggestionsFromInteractionsStatistics:withConfig:trialClient:andPredictionContext:", v10, a4, v12, v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel heuristics](self, "heuristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel fetchSupportedBundleIDsWithPredictionContextFilters:](self, "fetchSupportedBundleIDsWithPredictionContextFilters:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inPhoneCallHeuristicSuggestionProxiesWithBundleIds:predictionContext:", v14, v11);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "returnDocumentToSender:", v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "peopleAwareSuggestionProxiesForInteractionStatistics:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hyperRecentHeuristicIncomingSuggestionProxiesForInteractionStatistics:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pastSharesWithCurrentAppAwareSuggestionProxiesForInteractionStatistics:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pastSharesAwareSuggestionProxiesForInteractionStatistics:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSEnsembleModel heuristics](self, "heuristics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pastSharesOfTopDomainURLAwareSuggestionProxiesForInteractionStatistics:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __94___PSEnsembleModel_finalSuggestionProxiesForInteractionStatistics_config_trialClient_context___block_invoke;
  v47[3] = &unk_1E43FF508;
  v48 = v11;
  v49 = v10;
  v42 = v10;
  v41 = v11;
  v27 = (void *)MEMORY[0x1A1AFCBF8](v47);
  objc_msgSend(v12, "suggestionProxyOrder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v46;
  if (!v46)
    v29 = (void *)MEMORY[0x1E0C9AA60];
  v50[0] = CFSTR("SuggestionProxyTypeInCall");
  v50[1] = CFSTR("SuggestionProxyTypeReturnToSender");
  v30 = v44;
  if (!v44)
    v30 = (void *)MEMORY[0x1E0C9AA60];
  v51[0] = v29;
  v51[1] = v30;
  if (v18)
    v31 = v18;
  else
    v31 = (void *)MEMORY[0x1E0C9AA60];
  v50[2] = CFSTR("SuggestionProxyTypeHyperRecencyRewrite");
  v50[3] = CFSTR("SuggestionProxyTypeHyperRecencyIncomingRewrite");
  if (v20)
    v32 = v20;
  else
    v32 = (void *)MEMORY[0x1E0C9AA60];
  v51[2] = v31;
  v51[3] = v32;
  v33 = v45;
  if (!v45)
    v33 = (void *)MEMORY[0x1E0C9AA60];
  v50[4] = CFSTR("SuggestionProxyTypePASS");
  v50[5] = CFSTR("SuggestionProxyTypeFrequencyOfTopDomainURL");
  if (v26)
    v34 = v26;
  else
    v34 = (void *)MEMORY[0x1E0C9AA60];
  v51[4] = v33;
  v51[5] = v34;
  if (v22)
    v35 = v22;
  else
    v35 = (void *)MEMORY[0x1E0C9AA60];
  v50[6] = CFSTR("SuggestionProxyTypeFrequencyOfSharesFromCurrentApp");
  v50[7] = CFSTR("SuggestionProxyTypeFrequencyOfShares");
  if (v24)
    v36 = v24;
  else
    v36 = (void *)MEMORY[0x1E0C9AA60];
  v51[6] = v35;
  v51[7] = v36;
  v50[8] = CFSTR("SuggestionProxyTypeFromStats");
  if (v43)
    v37 = v43;
  else
    v37 = (void *)MEMORY[0x1E0C9AA60];
  v51[8] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "orderedSuggestionProxiesWithProxyOrder:suggestionProxies:suggestionsWithSharePlayAddedBlock:", v28, v38, v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)deviceIdentifier
{
  return -[_PSFeatureCache deviceIdentifier](self->_featureCache, "deviceIdentifier");
}

- (id)trialIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;

  v3 = (void *)objc_opt_new();
  -[_PSEnsembleModel trialExperimentId](self, "trialExperimentId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("Missing");
  objc_msgSend(v3, "setTask:", v6);

  -[_PSEnsembleModel trialTreatmentId](self, "trialTreatmentId");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("Missing");
  objc_msgSend(v3, "setTreatment:", v9);

  -[_PSEnsembleModel trialDeploymentId](self, "trialDeploymentId");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("Missing");
  objc_msgSend(v3, "setDeployment:", v12);

  return v3;
}

- (void)sendDataToPETAsync:(id)a3 withConfig:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61___PSEnsembleModel_sendDataToPETAsync_withConfig_andContext___block_invoke;
  v15[3] = &unk_1E43FF530;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)getPETMessageFrom:(id)a3 withConfig:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _PSPETMessageBuilder *v12;
  void *v13;
  void *v14;
  void *v15;
  _PSPETMessageBuilder *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_sendDataToPET", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [_PSPETMessageBuilder alloc];
  -[_PSEnsembleModel deviceIdentifier](self, "deviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel trialIdentifier](self, "trialIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSEnsembleModel peopleSuggesterDefaults](self, "peopleSuggesterDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_PSPETMessageBuilder initWithInteractionsStatistics:andConfig:andContext:andDeviceIdentifier:andTrialIdentifier:andDefaults:](v12, "initWithInteractionsStatistics:andConfig:andContext:andDeviceIdentifier:andTrialIdentifier:andDefaults:", v10, v9, v8, v13, v14, v15);

  -[_PSPETMessageBuilder getPETMessage](v16, "getPETMessage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSEnsembleModel_sendDataToPET", (const char *)&unk_1A0908603, v20, 2u);
  }

  return v17;
}

- (void)enrichConfig:(id)a3 withInformationFromPredictionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBundleId:", v6);

  objc_msgSend(v5, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_687);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTopDomainURL:", v9);

  }
}

- (void)psrDataCollectionForContext:(id)a3 timeToWaitInSeconds:(int)a4 maxComputationTime:(double)a5 withConfigAndStatsBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  id v18;
  _PSEnsembleModel *v19;
  id v20;
  double v21;
  int v22;

  v10 = a3;
  v11 = a6;
  if (psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasOnceToken288 != -1)
    dispatch_once(&psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasOnceToken288, &__block_literal_global_688);
  v12 = (id)psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_2;
  v17[3] = &unk_1E43FF630;
  v13 = v11;
  v20 = v13;
  v14 = v10;
  v21 = a5;
  v18 = v14;
  v19 = self;
  v22 = a4;
  v15 = (void (**)(_QWORD))MEMORY[0x1A1AFCBF8](v17);
  v16 = v15;
  if (a4 < 1)
    v15[2](v15);
  else
    dispatch_async(v12, v15);

}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (PPTopicStore)topicStore
{
  return self->_topicStore;
}

- (void)setTopicStore:(id)a3
{
  objc_storeStrong((id *)&self->_topicStore, a3);
}

- (PPContactStore)portraitContactStore
{
  return self->_portraitContactStore;
}

- (void)setPortraitContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_portraitContactStore, a3);
}

- (_CDInteractionCache)messageInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMessageInteractionCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (_CDInteractionCache)shareInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 88, 1);
}

- (void)setShareInteractionCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (_CDInteractionCache)allOtherInteractionCache
{
  return (_CDInteractionCache *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAllOtherInteractionCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setPeopleSuggesterDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggesterDefaults, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setDefaultContactKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContactKeysToFetch, a3);
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
  objc_storeStrong((id *)&self->_trialID, a3);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentId, a3);
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentId, a3);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (NSArray)shareSheetMechanisms
{
  return self->_shareSheetMechanisms;
}

- (void)setShareSheetMechanisms:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetMechanisms, a3);
}

- (NSArray)messageDirections
{
  return self->_messageDirections;
}

- (void)setMessageDirections:(id)a3
{
  objc_storeStrong((id *)&self->_messageDirections, a3);
}

- (NSNumber)messageMechanism
{
  return self->_messageMechanism;
}

- (void)setMessageMechanism:(id)a3
{
  objc_storeStrong((id *)&self->_messageMechanism, a3);
}

- (NSArray)allOtherInteractionCacheMechanism
{
  return self->_allOtherInteractionCacheMechanism;
}

- (void)setAllOtherInteractionCacheMechanism:(id)a3
{
  objc_storeStrong((id *)&self->_allOtherInteractionCacheMechanism, a3);
}

- (NSArray)allOtherInteractionCacheDirections
{
  return self->_allOtherInteractionCacheDirections;
}

- (void)setAllOtherInteractionCacheDirections:(id)a3
{
  objc_storeStrong((id *)&self->_allOtherInteractionCacheDirections, a3);
}

- (NSNumber)maxCandidatesFromShareSheetCache
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMaxCandidatesFromShareSheetCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)maxCandidatesFromMessageCache
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMaxCandidatesFromMessageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (_PSCoreMLScoringModel)coreMLScoringModel
{
  return (_PSCoreMLScoringModel *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCoreMLScoringModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (_PSRuleMiningModel)ruleMiningModel
{
  return (_PSRuleMiningModel *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRuleMiningModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (_PSSharingContactRankerModel)sharingContactRankerModel
{
  return (_PSSharingContactRankerModel *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSharingContactRankerModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (_PSConfidenceModelForSharing)confidenceModelForSharing
{
  return (_PSConfidenceModelForSharing *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConfidenceModelForSharing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)PSConfidenceModelInUse
{
  return self->_PSConfidenceModelInUse;
}

- (void)setPSConfidenceModelInUse:(BOOL)a3
{
  self->_PSConfidenceModelInUse = a3;
}

- (BOOL)useSyntheticSharingInteractions
{
  return self->_useSyntheticSharingInteractions;
}

- (void)setUseSyntheticSharingInteractions:(BOOL)a3
{
  self->_useSyntheticSharingInteractions = a3;
}

- (_PSKNNModel)knnModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 248, 1);
}

- (void)setKnnModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (_PSKNNModel)knnMapsModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKnnMapsModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (_PSKNNModel)knnZkwModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 264, 1);
}

- (void)setKnnZkwModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (_PSKNNModel)knnNameOrContactRankerModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 272, 1);
}

- (void)setKnnNameOrContactRankerModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (_PSKNNModel)knnSiriNLContactRankerModel
{
  return (_PSKNNModel *)objc_getProperty(self, a2, 280, 1);
}

- (void)setKnnSiriNLContactRankerModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (_PSHeuristics)heuristics
{
  return (_PSHeuristics *)objc_getProperty(self, a2, 288, 1);
}

- (void)setHeuristics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (_PSInteractionAndContactMonitor)contactMonitor
{
  return self->_contactMonitor;
}

- (void)setContactMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_contactMonitor, a3);
}

- (NSSet)cachedSupportedBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCachedSupportedBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (_PSContactResolver)contactResolver
{
  return (_PSContactResolver *)objc_getProperty(self, a2, 312, 1);
}

- (void)setContactResolver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (_PSFTZKWOrchestrator)zkwFTOrchestrator
{
  return self->_zkwFTOrchestrator;
}

- (void)setZkwFTOrchestrator:(id)a3
{
  objc_storeStrong((id *)&self->_zkwFTOrchestrator, a3);
}

- (_PSFTZKWTrialData)zkwFTTrialData
{
  return self->_zkwFTTrialData;
}

- (void)setZkwFTTrialData:(id)a3
{
  objc_storeStrong((id *)&self->_zkwFTTrialData, a3);
}

- (BOOL)allowNonSupportedBundleIDs
{
  return self->_allowNonSupportedBundleIDs;
}

- (void)setAllowNonSupportedBundleIDs:(BOOL)a3
{
  self->_allowNonSupportedBundleIDs = a3;
}

- (NSDictionary)psConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPsConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSDictionary)psConfigForAdaptableModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPsConfigForAdaptableModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (TRIClient)trialClient
{
  return (TRIClient *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTrialClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTrialTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (AMLPipelineLogger)amlPipelineLogger
{
  return (AMLPipelineLogger *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAmlPipelineLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (BOOL)enablePipelineCheckpointing
{
  return self->_enablePipelineCheckpointing;
}

- (void)setEnablePipelineCheckpointing:(BOOL)a3
{
  self->_enablePipelineCheckpointing = a3;
}

- (NSString)traceId
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTraceId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)currentSpanId
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCurrentSpanId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpanId, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_amlPipelineLogger, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_psConfigForAdaptableModel, 0);
  objc_storeStrong((id *)&self->_psConfig, 0);
  objc_storeStrong((id *)&self->_zkwFTTrialData, 0);
  objc_storeStrong((id *)&self->_zkwFTOrchestrator, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_cachedSupportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_knnSiriNLContactRankerModel, 0);
  objc_storeStrong((id *)&self->_knnNameOrContactRankerModel, 0);
  objc_storeStrong((id *)&self->_knnZkwModel, 0);
  objc_storeStrong((id *)&self->_knnMapsModel, 0);
  objc_storeStrong((id *)&self->_knnModel, 0);
  objc_storeStrong((id *)&self->_confidenceModelForSharing, 0);
  objc_storeStrong((id *)&self->_sharingContactRankerModel, 0);
  objc_storeStrong((id *)&self->_ruleMiningModel, 0);
  objc_storeStrong((id *)&self->_coreMLScoringModel, 0);
  objc_storeStrong((id *)&self->_maxCandidatesFromMessageCache, 0);
  objc_storeStrong((id *)&self->_maxCandidatesFromShareSheetCache, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCacheDirections, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCacheMechanism, 0);
  objc_storeStrong((id *)&self->_messageMechanism, 0);
  objc_storeStrong((id *)&self->_messageDirections, 0);
  objc_storeStrong((id *)&self->_shareSheetMechanisms, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_defaultContactKeysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_peopleSuggesterDefaults, 0);
  objc_storeStrong((id *)&self->_allOtherInteractionCache, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_portraitContactStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureCache, 0);
}

- (void)loadPSConfigPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Trial: failed to load trial config with path:%@, with error：%@");
  OUTLINED_FUNCTION_1();
}

- (void)copyRemoteRuleMinerMLModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Remote ML model load attempted with null path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getLatestTrialMLModelVersion
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Failed to load trial model with compiled model path: %@ with error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction Heuristic - Return to Sender", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction Heuristic - In-Call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getHeuristicSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction Heuristic - Hyper-Recency", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getRuleMiningSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - Corebehavior", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN based on interactions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN based on top shares, filtering out nonMatchingSourceApps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN based on all shares, filtering out nonMatchingSourceApps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN based on top shares", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN based on all shares", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getKnnSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - kNN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Prediction - %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getOtherSuggestionProxies:supportedBundleIDs:modelSuggestionProxiesDict:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Prediction - ContactRankerModel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getModelSuggestionsProxyDictWithModelProxiesArray:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_pas_componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Model proxies array: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)getMeContactIdentifier
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Error fetching isMe from contacts: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "_PSEnsemble: Candidate Features with additional features %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:(NSObject *)a2 contactKeysToFetch:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "conversationIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "_PSEnsemble: Candidates after pruning %{private}@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "_PSEnsemble: InteractionStatistics Candidates with Features %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:(NSObject *)a2 contactKeysToFetch:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "conversationIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "_PSEnsemble: InteractionStatistics Candidates %{private}@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "Event is nil when trying to record people inference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)predictWithPredictionContext:maxSuggestions:contactKeysToFetch:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "no sessionID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)predictWithPredictionContext:(void *)a1 maxSuggestions:(uint64_t)a2 contactKeysToFetch:(NSObject *)a3 .cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  v5 = a1;
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = v5;
  _os_log_debug_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_DEBUG, "Model proxies array: %@", (uint8_t *)a2, 0xCu);

}

- (void)modelProxyToVirtualFeatureStoreFeature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1A07F4000, v0, v1, "Unknown model Proxy key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_suggestionInteractionPredicatesForFirstPartyMessages:(void *)a1 bundleID:(NSObject *)a2 interactionRecipients:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_pas_componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v4, "_suggestionInteractionPredicates returning @[] because %{public}@ is nil", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)suggestionsFromSuggestionProxies:(void *)a1 supportedBundleIDs:(NSObject *)a2 contactKeysToFetch:meContactIdentifier:maxSuggestions:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "trialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Updated all suggestions with trialID: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)suggestionsFromSuggestionProxies:(NSObject *)a3 supportedBundleIDs:contactKeysToFetch:meContactIdentifier:maxSuggestions:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_0(&dword_1A07F4000, a3, (uint64_t)a3, "Attempting to resolve group name or display image", a1);
}

- (void)predictWithMapsPredictionContext:maxSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Maps ShareETA error fetching isMe from contacts: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)rerankMapsSuggestions:(uint8_t *)a1 usingPredictionContext:(_BYTE *)a2 contactResolver:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_0(&dword_1A07F4000, a3, (uint64_t)a3, "Rerank Maps Suggestions: While resolving seeded contact Ids, contact is nil", a1);
}

- (void)_knnZKWSuggestionsWithPredictionContext:(void *)a1 modelConfiguration:(NSObject *)a2 maxSuggestions:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "trialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Updated all suggestions with trialID: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)_knnZKWSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "about to do upateTrialID for zkw suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)appExtensionSuggestionsFromContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "App suggestion inference event item is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
