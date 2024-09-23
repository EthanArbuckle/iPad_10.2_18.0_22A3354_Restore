@implementation SSBullseyeSuggestionsManager

+ (id)sharedSuggestionsManager
{
  if (sharedSuggestionsManager_onceToken != -1)
    dispatch_once(&sharedSuggestionsManager_onceToken, &__block_literal_global_24);
  return (id)sharedSuggestionsManager_gSuggestionsManager;
}

void __56__SSBullseyeSuggestionsManager_sharedSuggestionsManager__block_invoke()
{
  SSBullseyeSuggestionsManager *v0;
  void *v1;

  v0 = -[SSBullseyeSuggestionsManager initWithOptions:]([SSBullseyeSuggestionsManager alloc], "initWithOptions:", 0);
  v1 = (void *)sharedSuggestionsManager_gSuggestionsManager;
  sharedSuggestionsManager_gSuggestionsManager = (uint64_t)v0;

}

- (SSBullseyeSuggestionsManager)initWithOptions:(id)a3
{
  id v4;
  SSBullseyeSuggestionsManager *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSBullseyeSuggestionsManager;
  v5 = -[SSBullseyeSuggestionsManager init](&v11, sel_init);
  if (v5)
  {
    v5->_enabledSuggestionsOverrides = SSDefaultsGetState(5uLL);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SpotlightServices.suggestions.blending", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    -[SSBullseyeSuggestionsManager loadDefaultsWithOptions:](v5, "loadDefaultsWithOptions:", v4);
  }

  return v5;
}

- (void)loadDefaultsWithOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *defaultOptions;
  SRResources *v6;
  SRResources *resources;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  int64_t v34;
  void *v35;
  uint64_t v36;
  int64_t v37;
  void *v38;
  uint64_t v39;
  int64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  v4 = (NSDictionary *)objc_msgSend(v52, "copy");
  defaultOptions = self->_defaultOptions;
  self->_defaultOptions = v4;

  SSDefaultsGetResources();
  v6 = (SRResources *)objc_claimAutoreleasedReturnValue();
  resources = self->_resources;
  self->_resources = v6;

  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("EnableSuggestionsBlending"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v52;
  v51 = (void *)v8;
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EnableSuggestionsBlending"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EnableSuggestionsBlending"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

    v51 = (void *)v11;
    v9 = v52;
  }
  if (v51)
  {
    v12 = objc_msgSend(v51, "BOOLValue");
    v9 = v52;
  }
  else
  {
    v12 = 0;
  }
  self->_enabledSuggestionsBlending = v12;
  if (!v9 && -[SSBullseyeSuggestionsManager enabledSuggestionsOverrides](self, "enabledSuggestionsOverrides"))
    self->_enabledSuggestionsBlending = _os_feature_enabled_impl();
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("EnableFullSuggestionsBlending"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v52;
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EnableFullSuggestionsBlending"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EnableFullSuggestionsBlending"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

    v50 = (void *)v15;
    v13 = v52;
  }
  if (v50)
  {
    v16 = objc_msgSend(v50, "BOOLValue");
    v13 = v52;
  }
  else
  {
    v16 = 0;
  }
  self->_enabledFullSuggestionsBlending = v16;
  if (!v13 && -[SSBullseyeSuggestionsManager enabledSuggestionsOverrides](self, "enabledSuggestionsOverrides"))
    self->_enabledFullSuggestionsBlending = _os_feature_enabled_impl();
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("ServerSuggestionThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("serverThreshold"));
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  if (!v17
    || (objc_msgSend(v17, "doubleValue"), v19 == 0.0)
    || (objc_msgSend(v17, "doubleValue"), v20 == 2.22507386e-308))
  {
    v21 = 0;
  }
  else
  {
    v21 = v17;
  }
  objc_storeStrong((id *)&self->_serverSuggestionThreshold, v21);
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("LocalSuggestionThreshold"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("localThreshold"));
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  if (!v22
    || (objc_msgSend(v22, "doubleValue"), v24 == 0.0)
    || (objc_msgSend(v22, "doubleValue"), v25 == 2.22507386e-308))
  {
    v26 = 0;
  }
  else
  {
    v26 = v22;
  }
  objc_storeStrong((id *)&self->_localSuggestionThreshold, v26);
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("MaxTotalSuggestions"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("maxTotalSuggestions"));
    v28 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v28;
  }
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("MaxTotalSuggestionsForAboveFoldResults"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("maxTotalSuggestionsForAboveFoldResults"));
    v30 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v30;
  }
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("EnableForceAboveFoldResults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("EnableForceAboveFoldResults"));
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v32;
  }
  if (v31)
    v33 = objc_msgSend(v31, "BOOLValue");
  else
    v33 = 0;
  self->_enabledAboveFoldResults = v33;
  if (v27)
    v34 = objc_msgSend(v27, "integerValue");
  else
    v34 = 0x7FFFFFFFLL;
  self->_maxTotalSuggestionCount = v34;
  if (v29)
    v34 = objc_msgSend(v29, "integerValue");
  self->_maxTotalSuggestionCountForAboveFoldResults = v34;
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("MaxServerSuggestionCount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("maxServerSuggestions"));
    v36 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v36;
  }
  if (!v35 || objc_msgSend(v35, "integerValue") < 0)
    v37 = 0x7FFFFFFFLL;
  else
    v37 = objc_msgSend(v35, "integerValue");
  self->_maxServerSuggestionCount = v37;
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("MaxSuggestionCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("maxLocalSuggestions"));
    v39 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v39;
  }
  if (!v38 || objc_msgSend(v38, "integerValue") < 0)
    v40 = 0x7FFFFFFFLL;
  else
    v40 = objc_msgSend(v38, "integerValue");
  self->_maxLocalSuggestionCount = v40;
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("LocalDisplayPosition"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v31;
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("localDisplayPosition"));
    v42 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v42;
  }
  if (!v41 || objc_msgSend(v41, "integerValue") == 0x7FFFFFFF || objc_msgSend(v41, "integerValue") == -1)
    v43 = 0;
  else
    v43 = objc_msgSend(v41, "unsignedIntValue");
  self->_localDisplayPosition = v43;
  -[SRResources objectForKey:](self->_resources, "objectForKey:", CFSTR("IgnoreMaxCountForSingleSuggestionsType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("ignoreMaxCountForSingleSuggestionsType"));
    v45 = v35;
    v46 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v46;
    v35 = v45;
  }
  if (v44)
    v47 = objc_msgSend(v44, "BOOLValue");
  else
    v47 = 0;
  self->_ignoreMaxCount = v47;
  if (-[SSBullseyeSuggestionsManager enabledSuggestionsBlending](self, "enabledSuggestionsBlending"))
  {
    -[SRResources filePathForKey:](self->_resources, "filePathForKey:", CFSTR("SuggestionsBlendingModel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBullseyeSuggestionsManager loadBlendingModelWithPath:forceLoad:](self, "loadBlendingModelWithPath:forceLoad:", v48, v52 != 0);

  }
}

- (void)updateDefaultsWithOptions:(id)a3
{
  void *v4;
  int v5;
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
  id v18;

  v18 = a3;
  -[SSBullseyeSuggestionsManager resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasUpdates");

  if (v5)
    -[SSBullseyeSuggestionsManager loadDefaultsWithOptions:](self, "loadDefaultsWithOptions:", self->_defaultOptions);
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("serverThreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_storeStrong((id *)&self->_serverSuggestionThreshold, v6);
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("localThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_storeStrong((id *)&self->_localSuggestionThreshold, v7);
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("maxTotalSuggestions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    self->_maxTotalSuggestionCount = objc_msgSend(v8, "integerValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("maxServerSuggestions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    self->_maxServerSuggestionCount = objc_msgSend(v10, "integerValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("maxLocalSuggestions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    self->_maxLocalSuggestionCount = objc_msgSend(v12, "integerValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("localDisplayPosition"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    self->_localDisplayPosition = objc_msgSend(v14, "unsignedIntValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ignoreMaxCountForSingleSuggestionsType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    self->_ignoreMaxCount = objc_msgSend(v16, "BOOLValue");

}

- (void)loadBlendingModelWithPath:(id)a3 forceLoad:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSString *v11;
  NSString *blendingModelPath;
  void *v13;
  void *v14;
  void *v15;
  SSCoreMLInterface *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;

  v4 = a4;
  v6 = a3;
  -[SSBullseyeSuggestionsManager blendingModelPath](self, "blendingModelPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    -[SSBullseyeSuggestionsManager blendingModelPath](self, "blendingModelPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v6);

    if ((v10 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  v11 = (NSString *)objc_msgSend(v6, "copy");
  blendingModelPath = self->_blendingModelPath;
  self->_blendingModelPath = v11;

  if (v4)
  {
    v13 = (void *)MEMORY[0x1E0C99E98];
    -[SSBullseyeSuggestionsManager blendingModelPath](self, "blendingModelPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:isDirectory:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v16 = -[SSCoreMLInterface initWithURL:error:]([SSCoreMLInterface alloc], "initWithURL:error:", v15, &v27);
    v17 = v27;
    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SSBullseyeSuggestionsManager loadBlendingModelWithPath:forceLoad:].cold.1((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      -[SSBullseyeSuggestionsManager clearBlendingModel](self, "clearBlendingModel");
    }
    else
    {
      -[SSBullseyeSuggestionsManager setBlendingModel:](self, "setBlendingModel:", v16);
    }

  }
  else
  {
    -[SSBullseyeSuggestionsManager queue](self, "queue");
    v25 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke;
    v26[3] = &unk_1E6E42FD8;
    v26[4] = self;
    dispatch_async(v25, v26);

  }
LABEL_14:

}

void __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  SSCoreMLInterface *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "blendingModelPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v5 = -[SSCoreMLInterface initWithURL:error:]([SSCoreMLInterface alloc], "initWithURL:error:", v4, &v23);
  v6 = v23;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SSBullseyeSuggestionsManager loadBlendingModelWithPath:forceLoad:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setBlendingModel:", v5);
    objc_msgSend(*(id *)(a1 + 32), "modelFeatureNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_6;
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v15)
      __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  objc_msgSend(*(id *)(a1 + 32), "clearBlendingModel");
LABEL_6:

}

- (SSCoreMLInterface)blendingModel
{
  SSBullseyeSuggestionsManager *v2;
  SSCoreMLInterface *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_blendingModel;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBlendingModel:(id)a3
{
  SSBullseyeSuggestionsManager *v5;
  uint64_t v6;
  NSDictionary *modelFeatureNames;
  id v8;

  v8 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_blendingModel, a3);
  -[SSCoreMLInterface getInputDescriptionsByName](v5->_blendingModel, "getInputDescriptionsByName");
  v6 = objc_claimAutoreleasedReturnValue();
  modelFeatureNames = v5->_modelFeatureNames;
  v5->_modelFeatureNames = (NSDictionary *)v6;

  objc_sync_exit(v5);
}

- (void)clearBlendingModel
{
  SSCoreMLInterface *blendingModel;
  NSString *blendingModelPath;
  NSDictionary *modelFeatureNames;
  SSBullseyeSuggestionsManager *obj;

  obj = self;
  objc_sync_enter(obj);
  blendingModel = obj->_blendingModel;
  obj->_blendingModel = 0;

  blendingModelPath = obj->_blendingModelPath;
  obj->_blendingModelPath = 0;

  modelFeatureNames = obj->_modelFeatureNames;
  obj->_modelFeatureNames = 0;

  obj->_enabledSuggestionsBlending = 0;
  objc_sync_exit(obj);

}

- (id)orderedSuggestionsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  id v53;
  id v54;

  v47 = a3;
  v54 = a4;
  v46 = a5;
  v51 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  -[SSBullseyeSuggestionsManager updateDefaultsWithOptions:](self, "updateDefaultsWithOptions:", v26);
  -[SSBullseyeSuggestionsManager blendingModel](self, "blendingModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v21;
  v53 = v26;
  v49 = v22;
  if (v27)
  {
    v28 = v25;
    v29 = v51;
    v30 = v46;
    if (-[SSBullseyeSuggestionsManager enabledFullSuggestionsBlending](self, "enabledFullSuggestionsBlending"))
    {
      v42 = v22;
      v31 = v47;
      -[SSBullseyeSuggestionsManager release2023_blendingWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:shortcutSuggestionResults:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:](self, "release2023_blendingWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:shortcutSuggestionResults:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:", v47, v54, v46, v51, v19, v20, v52, v42, v23, v24, v25, v53);
    }
    else
    {
      v41 = v22;
      v31 = v47;
      -[SSBullseyeSuggestionsManager release2023_blendingByPolicyWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:](self, "release2023_blendingByPolicyWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:", v47, v54, v46, v51, v19, v20, v41, v23, v24, v25, v53);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = v26;
    v40 = v21;
    v43 = v22;
    v30 = v46;
    v31 = v47;
    v29 = v51;
    -[SSBullseyeSuggestionsManager release2022_blendingByPolicyWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:shortcutSuggestionResults:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:](self, "release2022_blendingByPolicyWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:shortcutSuggestionResults:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:", v47, v54, v46, v51, v19, v20, v40, v43, v23, v24, v25, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v25;
  }
  if (!+[SSQueryIntentManager isEnabled](SSQueryIntentManager, "isEnabled"))
  {
    v38 = v53;
    v37 = v45;
    goto LABEL_14;
  }
  v48 = v28;
  objc_msgSend(v31, "queryIntent");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
LABEL_13:
    v28 = v48;
    v38 = v53;
    v37 = v45;
    goto LABEL_14;
  }
  v33 = (void *)v32;
  v34 = v30;
  objc_msgSend(v31, "queryIntent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "intentType");

  if (!v36)
  {
    v30 = v34;
    v29 = v51;
    goto LABEL_13;
  }
  -[SSBullseyeSuggestionsManager intentBasedSuggestionBlending:suggestions:](self, "intentBasedSuggestionBlending:suggestions:", v31, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v34;
  v29 = v51;
  v28 = v48;
  v38 = v53;
LABEL_14:

  return v37;
}

- (id)_getScoreForSuggestionResult:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  id v76;
  double v77;
  void *v78;
  SSBullseyeSuggestionsManager *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (double)(int)objc_msgSend(v5, "type");
  objc_msgSend(v5, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)(unint64_t)objc_msgSend(v8, "length");

  objc_msgSend(v5, "completion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (double)(unint64_t)objc_msgSend(v10, "length");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("plen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("slen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / (v11 + 1.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("ratio"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "rankingScore");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("score"));

  objc_msgSend(v5, "spotlightSuggestion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "spotlightSuggestion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "features");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (getFeaturesForSuggestionResult_onceToken == -1)
    {
      if (v20)
      {
LABEL_4:
        v90 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", getFeaturesForSuggestionResult_sFeatureClasses, v20, &v90);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v90;
        if (!v22 && v21)
        {
          objc_msgSend(v6, "addEntriesFromDictionary:", v21);
          v22 = 0;
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
LABEL_26:
        v49 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v49)
          -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:].cold.2(v49, v50, v51, v52, v53, v54, v55, v56);
        goto LABEL_28;
      }
    }
    else
    {
      dispatch_once(&getFeaturesForSuggestionResult_onceToken, &__block_literal_global_238);
      if (v20)
        goto LABEL_4;
    }
    v22 = 0;
    v21 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v5, "suggestion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "suggestion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "score");
    objc_msgSend(v24, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v26, CFSTR("score"));

    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "suggestion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "type"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v29, CFSTR("stype"));

    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "suggestion");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "suggestion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v32, "length"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v33, CFSTR("sslen"));

    objc_msgSend(v5, "suggestion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v31) = objc_opt_isKindOfClass();

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v5, "suggestion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v20, "queryLen"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v35, CFSTR("queryLen"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v20, "fragments"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v36, CFSTR("fragments"));

      v37 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "age");
      objc_msgSend(v37, "numberWithDouble:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v38, CFSTR("age"));

      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "prob");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v40, CFSTR("prob"));

      objc_msgSend(v20, "compositeScore");
      v42 = v41;
      v43 = 0.0;
      if (v42 != 1.79769313e308)
        objc_msgSend(v20, "compositeScore", 0.0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v44, CFSTR("compositeScore"));

      if (objc_msgSend(v20, "isSingleThread"))
        v45 = &unk_1E6E9A250;
      else
        v45 = &unk_1E6E9A240;
      objc_msgSend(v6, "setObject:forKey:", v45, CFSTR("isSingleThread"));
      if (objc_msgSend(v20, "hasUsedDate"))
        v46 = &unk_1E6E9A250;
      else
        v46 = &unk_1E6E9A240;
      objc_msgSend(v6, "setObject:forKey:", v46, CFSTR("hasUsedDate"));
      if (objc_msgSend(v20, "isShortcut"))
        v47 = &unk_1E6E9A250;
      else
        v47 = &unk_1E6E9A240;
      objc_msgSend(v6, "setObject:forKey:", v47, CFSTR("isShortcut"));
      if (objc_msgSend(v20, "hasMultipleResults"))
        v48 = &unk_1E6E9A250;
      else
        v48 = &unk_1E6E9A240;
      objc_msgSend(v6, "setObject:forKey:", v48, CFSTR("hasMultipleResults"));
      goto LABEL_29;
    }
  }
LABEL_30:
  objc_msgSend(v5, "serverFeatures");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v87 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v57, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v63, v62);

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    }
    while (v59);
  }

  if (v6 && objc_msgSend(v6, "count"))
  {
    v64 = (void *)objc_opt_new();
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v80 = self;
    -[SSBullseyeSuggestionsManager modelFeatureNames](self, "modelFeatureNames");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v83 != v68)
            objc_enumerationMutation(v65);
          v70 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKey:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKey:", v72, v70);

          }
          else
          {
            objc_msgSend(v64, "setObject:forKey:", &unk_1E6E9A240, v70);
          }
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      }
      while (v67);
    }

    -[SSBullseyeSuggestionsManager blendingModel](v80, "blendingModel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    objc_msgSend(v73, "predictFromDictionaryFeatures:error:", v64, &v81);
    v75 = v74;
    v76 = v81;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:].cold.1((uint64_t)v64, v75);
      if (v76)
        goto LABEL_51;
    }
    else if (v76)
    {
LABEL_51:
      v78 = &unk_1E6E9A240;
LABEL_55:

      goto LABEL_56;
    }
    *(float *)&v77 = v75;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  v78 = &unk_1E6E9A240;
LABEL_56:

  return v78;
}

- (id)suggestionKeyWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  SSNormalizedQueryString(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_filterSuggestionResultsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 contactSuggestionResults:(id)a7 localSuggestionResults:(id)a8 serverSuggestionResults:(id)a9 options:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t m;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id obj;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  SSBullseyeSuggestionsManager *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v87 = a4;
  v17 = a5;
  v95 = a6;
  v18 = a7;
  v19 = a8;
  v85 = a9;
  v86 = a10;
  v103 = (void *)objc_opt_new();
  v98 = (id)objc_opt_new();
  v93 = (void *)objc_opt_new();
  v88 = v16;
  objc_msgSend(v16, "searchString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v20);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v18;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
  if (v21)
  {
    v22 = v21;
    v90 = 0;
    v23 = *(_QWORD *)v122;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v122 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        objc_msgSend(v25, "completion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if ((!v95 || (objc_msgSend(v95, "containsObject:", v27) & 1) == 0)
          && (objc_msgSend(v93, "containsObject:", v27) & 1) == 0
          && objc_msgSend(v27, "containsString:", v94))
        {
          v28 = v90;
          if (!v90)
            v28 = (void *)objc_opt_new();
          objc_msgSend(v28, "addObject:", v25);
          objc_msgSend(v93, "addObject:", v27);
          v90 = v28;
          if (-[SSBullseyeSuggestionsManager maxLocalSuggestionCount](self, "maxLocalSuggestionCount") != 0x7FFFFFFF)
          {
            v29 = objc_msgSend(v28, "count");
            if (v29 >= -[SSBullseyeSuggestionsManager maxLocalSuggestionCount](self, "maxLocalSuggestionCount"))
            {

              goto LABEL_19;
            }
          }
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
      if (v22)
        continue;
      break;
    }
  }
  else
  {
    v90 = 0;
  }
LABEL_19:
  v97 = v17;

  v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = (id)objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_105);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v31 = v19;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
  v104 = self;
  if (!v32)
  {
    v89 = 0;
    v35 = v98;
    goto LABEL_53;
  }
  v33 = v32;
  v89 = 0;
  v34 = *(_QWORD *)v118;
  v35 = v98;
  v101 = v31;
  do
  {
    v36 = 0;
    do
    {
      if (*(_QWORD *)v118 != v34)
        objc_enumerationMutation(v101);
      v37 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v36);
      v38 = objc_msgSend(v37, "type");
      objc_msgSend(v37, "completion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38 == 38 || v38 == 32)
      {
        if ((!v95 || (objc_msgSend(v95, "containsObject:", v40) & 1) == 0)
          && (objc_msgSend(v35, "containsObject:", v40) & 1) == 0)
        {
          objc_msgSend(v96, "addObject:", v37);
        }
        if (!v35)
          v35 = (void *)objc_opt_new();
        v41 = v35;
LABEL_33:
        objc_msgSend(v41, "addObject:", v40);
        goto LABEL_34;
      }
      if ((objc_msgSend(v103, "containsObject:", v40) & 1) == 0)
      {
        if (objc_msgSend(v40, "isEqualToString:", v94))
        {
          if (v38 == 34)
          {
            v42 = v37;

            v89 = v42;
          }
        }
        else if (!v95 || (objc_msgSend(v95, "containsObject:", v40) & 1) == 0)
        {
          if (v38 != 31 && v38 != 16)
            goto LABEL_46;
          -[SSBullseyeSuggestionsManager localSuggestionThreshold](self, "localSuggestionThreshold");
          v43 = objc_claimAutoreleasedReturnValue();
          if (!v43)
            goto LABEL_46;
          v44 = (void *)v43;
          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v37, "rankingScore");
          objc_msgSend(v45, "numberWithDouble:");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSBullseyeSuggestionsManager localSuggestionThreshold](self, "localSuggestionThreshold");
          v47 = v35;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (id)objc_msgSend(v46, "compare:", v48);

          v35 = v47;
          self = v104;

          if (v99 == (id)-1)
LABEL_46:
            objc_msgSend(v96, "addObject:", v37);
          v41 = v103;
          if (!v103)
            v41 = (void *)objc_opt_new();
          v103 = v41;
          goto LABEL_33;
        }
      }
LABEL_34:

      ++v36;
    }
    while (v33 != v36);
    v31 = v101;
    v49 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
    v33 = v49;
  }
  while (v49);
LABEL_53:

  objc_msgSend(v31, "removeAllObjects");
  objc_msgSend(v31, "addObjectsFromArray:", v96);
  v50 = v35;
  if (!objc_msgSend(v35, "count"))
  {
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v51 = v90;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v114;
      do
      {
        for (j = 0; j != v53; ++j)
        {
          if (*(_QWORD *)v114 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
          objc_msgSend(v56, "completion");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](v104, "suggestionKeyWithCompletion:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v50;
          if ((objc_msgSend(v50, "containsObject:", v58) & 1) == 0)
            objc_msgSend(v31, "addObject:", v56);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
      }
      while (v53);
    }

  }
  objc_msgSend(v96, "removeAllObjects");
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v102 = v31;
  v59 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v60; ++k)
      {
        if (*(_QWORD *)v110 != v61)
          objc_enumerationMutation(v102);
        v63 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
        if (!_os_feature_enabled_impl()
          || objc_msgSend(v63, "type") != 32 && objc_msgSend(v63, "type") != 38)
        {
          if (objc_msgSend(v63, "type") == 32 || objc_msgSend(v63, "type") == 38)
          {
            objc_msgSend(v96, "addObject:", v63);
          }
          else
          {
            objc_msgSend(v63, "completion");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](v104, "suggestionKeyWithCompletion:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = v50;
            if ((objc_msgSend(v50, "containsObject:", v65) & 1) == 0)
              objc_msgSend(v96, "addObject:", v63);

          }
        }
      }
      v60 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    }
    while (v60);
  }

  objc_msgSend(v102, "removeAllObjects");
  objc_msgSend(v102, "addObjectsFromArray:", v96);
  v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v100 = v85;
  v66 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
  if (v66)
  {
    v67 = v66;
    v68 = 0;
    v69 = *(_QWORD *)v106;
    v70 = v97;
    do
    {
      for (m = 0; m != v67; ++m)
      {
        if (*(_QWORD *)v106 != v69)
          objc_enumerationMutation(v100);
        v72 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * m);
        if (objc_msgSend(v72, "type") == 29)
        {
          v73 = v72;

          v68 = v73;
        }
        else
        {
          -[SSBullseyeSuggestionsManager serverSuggestionThreshold](v104, "serverSuggestionThreshold");
          v74 = objc_claimAutoreleasedReturnValue();
          if (!v74)
            goto LABEL_89;
          v75 = (void *)v74;
          v76 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v72, "rankingScore");
          objc_msgSend(v76, "numberWithDouble:");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSBullseyeSuggestionsManager serverSuggestionThreshold](v104, "serverSuggestionThreshold");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v77, "compare:", v78);

          v70 = v97;
          if (v79 != 1)
          {
LABEL_89:
            objc_msgSend(v72, "entityIdentifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            if (v80)
            {
              if (!objc_msgSend(v70, "count")
                || (objc_msgSend(v72, "entityIdentifier"),
                    v81 = (void *)objc_claimAutoreleasedReturnValue(),
                    v82 = objc_msgSend(v70, "containsObject:", v81),
                    v81,
                    (v82 & 1) == 0))
              {
                objc_msgSend(v92, "addObject:", v72);
              }
            }
            else
            {
              objc_msgSend(v72, "completion");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](v104, "suggestionKeyWithCompletion:", v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v103, "containsObject:", v84) & 1) == 0)
                objc_msgSend(v92, "addObject:", v72);

            }
          }
        }
        v35 = v50;
      }
      v67 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
    }
    while (v67);
  }
  else
  {
    v68 = 0;
    v70 = v97;
  }

  objc_msgSend(v100, "removeAllObjects");
  objc_msgSend(v100, "addObjectsFromArray:", v92);
  if (!v68 && v89)
    objc_msgSend(v102, "addObject:", v89);

}

uint64_t __190__SSBullseyeSuggestionsManager__filterSuggestionResultsWithQueryContext_filters_entityFilters_contactFilters_contactSuggestionResults_localSuggestionResults_serverSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)_rankedSuggestionsResultsWithQueryContext:(id)a3 serverSuggestionResults:(id)a4 localSuggestionResults:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:](self, "_getScoreForSuggestionResult:options:", v18, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v15);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:](self, "_getScoreForSuggestionResult:options:", v25, v11, (_QWORD)v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v26, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

  objc_msgSend(v12, "keysSortedByValueUsingComparator:", &__block_literal_global_107);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __129__SSBullseyeSuggestionsManager__rankedSuggestionsResultsWithQueryContext_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1)
    return 1;
  else
    return -1;
}

- (id)release2023_blendingWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  SSBullseyeSuggestionsManager *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v60;
  id v61;
  id v62;
  void *context;
  id v64;
  id v65;
  void *v66;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[4];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v76 = a4;
  v75 = a5;
  v74 = a6;
  v19 = a7;
  v20 = a8;
  v71 = a9;
  v70 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v73 = a14;
  v24 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1BCCB3708]();
  v66 = v20;
  if (objc_msgSend(v21, "count")
    || objc_msgSend(v23, "count")
    || objc_msgSend(v22, "count")
    || objc_msgSend(v71, "count")
    || objc_msgSend(v70, "count"))
  {
    context = v26;
    v65 = v19;
    v27 = v20;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v28 = v22;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v29)
    {
      v30 = v29;
      v31 = v23;
      v32 = *(_QWORD *)v83;
LABEL_8:
      v33 = 0;
      while (1)
      {
        if (*(_QWORD *)v83 != v32)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v33);
        if (objc_msgSend(v34, "type") == 29)
          break;
        if (v30 == ++v33)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
          if (v30)
            goto LABEL_8;
          v62 = 0;
          v35 = v28;
          goto LABEL_17;
        }
      }
      v36 = v34;

      if (v36)
      {
        v37 = v36;
        v35 = v27;
        v62 = v37;
        v27 = v37;
LABEL_17:
        v38 = v69;
        v23 = v31;
        v24 = 0x1E0C99000;
        goto LABEL_19;
      }
      v62 = 0;
      v38 = v69;
      v23 = v31;
      v24 = 0x1E0C99000uLL;
    }
    else
    {
      v62 = 0;
      v35 = v28;
      v38 = v69;
LABEL_19:

    }
    if (objc_msgSend(v23, "count"))
      v39 = (id)objc_msgSend(v23, "mutableCopy");
    else
      v39 = objc_alloc_init(*(Class *)(v24 + 3560));
    v40 = v39;
    if (objc_msgSend(v28, "count"))
      v41 = (id)objc_msgSend(v28, "mutableCopy");
    else
      v41 = objc_alloc_init(*(Class *)(v24 + 3560));
    v42 = v41;
    v64 = v22;
    v43 = self;
    -[SSBullseyeSuggestionsManager _filterSuggestionResultsWithQueryContext:filters:entityFilters:contactFilters:contactSuggestionResults:localSuggestionResults:serverSuggestionResults:options:](self, "_filterSuggestionResultsWithQueryContext:filters:entityFilters:contactFilters:contactSuggestionResults:localSuggestionResults:serverSuggestionResults:options:", v38, v76, v75, v74, v21, v40, v41, v73);
    if (v27 && (objc_msgSend(v42, "containsObject:", v27) & 1) == 0)
      objc_msgSend(v42, "addObject:", v27);
    -[SSBullseyeSuggestionsManager _rankedSuggestionsResultsWithQueryContext:serverSuggestionResults:localSuggestionResults:options:](self, "_rankedSuggestionsResultsWithQueryContext:serverSuggestionResults:localSuggestionResults:options:", v38, v42, v40, v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SSBullseyeSuggestionsManager enabledAboveFoldResults](self, "enabledAboveFoldResults"))
      goto LABEL_34;
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ForceAboveFoldResults"));
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_34;
    v45 = (void *)v44;
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ForceAboveFoldResults"));
    v46 = v21;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "BOOLValue");

    v21 = v46;
    v43 = self;

    if (v48)
      v49 = -[SSBullseyeSuggestionsManager maxTotalSuggestionCountForAboveFoldResults](self, "maxTotalSuggestionCountForAboveFoldResults");
    else
LABEL_34:
      v49 = -[SSBullseyeSuggestionsManager maxTotalSuggestionCount](v43, "maxTotalSuggestionCount");
    v50 = v49;
    v51 = v70;
    v52 = v71;
    if (objc_msgSend(v70, "count"))
    {
      memset(v81, 0, sizeof(v81));
      if (objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v81, v87, 16))
      {
        if (v50)
        {
          objc_msgSend(v25, "addObject:", **((_QWORD **)&v81[0] + 1));
          if (v50 != 0x7FFFFFFF)
            --v50;
        }
      }
    }
    if (objc_msgSend(v71, "count"))
    {
      v61 = v23;
      v68 = v21;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v53 = v71;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v78;
LABEL_43:
        v57 = 0;
        while (1)
        {
          if (*(_QWORD *)v78 != v56)
            objc_enumerationMutation(v53);
          if (!v50)
            break;
          objc_msgSend(v25, "addObject:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v57));
          if (v50 != 0x7FFFFFFF)
            --v50;
          if (v55 == ++v57)
          {
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
            if (v55)
              goto LABEL_43;
            break;
          }
        }
      }

      v38 = v69;
      v51 = v70;
      v52 = v71;
      v21 = v68;
      v23 = v61;
    }
    objc_msgSend(v25, "addObjectsFromArray:", v72);
    if (v50 != 0x7FFFFFFF)
    {
      while (objc_msgSend(v25, "count") > v50)
        objc_msgSend(v25, "removeLastObject");
    }
    if (v27 && (objc_msgSend(v25, "containsObject:", v27) & 1) == 0)
    {
      if (v50 != 0x7FFFFFFF && objc_msgSend(v25, "count") >= v50)
        objc_msgSend(v25, "removeLastObject");
      objc_msgSend(v25, "insertObject:atIndex:", v27, 0);
    }

    objc_autoreleasePoolPop(context);
    v58 = v25;
    v22 = v64;
    v19 = v65;
  }
  else
  {
    if (v19)
      objc_msgSend(v25, "addObject:", v19);
    v38 = v69;
    v51 = v70;
    v52 = v71;
    if (v66)
      objc_msgSend(v25, "addObject:");
    v60 = v25;
    objc_autoreleasePoolPop(v26);
  }

  return v25;
}

- (id)release2023_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 actionSuggestionResults:(id)a9 contactSuggestionResults:(id)a10 serverSuggestionResults:(id)a11 localSuggestionResults:(id)a12 options:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  SSBullseyeSuggestionsManager *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  int v100;
  void *v101;
  id v102;
  id v104;
  void *v105;
  _BOOL4 v106;
  id v107;
  void *v108;
  void *context;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v124;
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
  _OWORD v137[4];
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  char v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v119 = a3;
  v18 = a4;
  v19 = a5;
  v118 = a6;
  v20 = a7;
  v21 = a8;
  v121 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1BCCB3708]();
  v28 = v20;
  v120 = v21;
  if (objc_msgSend(v22, "count")
    || objc_msgSend(v24, "count")
    || objc_msgSend(v23, "count")
    || objc_msgSend(v121, "count"))
  {
    context = v27;
    v110 = v28;
    v111 = v24;
    if (objc_msgSend(v24, "count"))
      v29 = (id)objc_msgSend(v24, "mutableCopy");
    else
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = v29;
    v122 = v26;
    v112 = v23;
    if (objc_msgSend(v23, "count"))
      v31 = (id)objc_msgSend(v23, "mutableCopy");
    else
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = v31;
    -[SSBullseyeSuggestionsManager _filterSuggestionResultsWithQueryContext:filters:entityFilters:contactFilters:contactSuggestionResults:localSuggestionResults:serverSuggestionResults:options:](self, "_filterSuggestionResultsWithQueryContext:filters:entityFilters:contactFilters:contactSuggestionResults:localSuggestionResults:serverSuggestionResults:options:", v119, v18, v19, v118, v22, v30, v31, v25);
    -[SSBullseyeSuggestionsManager _rankedSuggestionsResultsWithQueryContext:serverSuggestionResults:localSuggestionResults:options:](self, "_rankedSuggestionsResultsWithQueryContext:serverSuggestionResults:localSuggestionResults:options:", v119, v32, v30, v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v33;
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v34, "type") == 28
          || objc_msgSend(v34, "type") == 29
          || objc_msgSend(v34, "type") == 17;
      v35 = v122;

    }
    else
    {
      v106 = 0;
      v35 = v122;
    }
    v36 = v120;
    v117 = v25;
    if (objc_msgSend(v32, "count"))
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v37 = v32;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
      if (v38)
      {
        v39 = v38;
        v40 = v19;
        v41 = v18;
        v42 = *(_QWORD *)v142;
LABEL_21:
        v43 = 0;
        while (1)
        {
          if (*(_QWORD *)v142 != v42)
            objc_enumerationMutation(v37);
          v44 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v43);
          if (objc_msgSend(v44, "type") == 29)
            break;
          if (v39 == ++v43)
          {
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
            if (v39)
              goto LABEL_21;
            v45 = v120;
            v18 = v41;
            v19 = v40;
            v35 = v122;
            v25 = v117;
            goto LABEL_31;
          }
        }
        v46 = v44;

        v36 = v120;
        v18 = v41;
        v19 = v40;
        v35 = v122;
        v25 = v117;
        if (!v46)
          goto LABEL_32;
        v37 = v46;

        v45 = v37;
      }
      else
      {
        v45 = v120;
      }
LABEL_31:

      v36 = v45;
    }
LABEL_32:
    v47 = self;
    v114 = v18;
    if (-[SSBullseyeSuggestionsManager enabledAboveFoldResults](self, "enabledAboveFoldResults"))
    {
      v48 = v36;
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ForceAboveFoldResults"));
      v49 = objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v50 = (void *)v49;
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ForceAboveFoldResults"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "BOOLValue");

        v47 = self;
        v140 = 0;
        v36 = v48;
        if (v52)
        {
          v53 = -[SSBullseyeSuggestionsManager maxTotalSuggestionCountForAboveFoldResults](self, "maxTotalSuggestionCountForAboveFoldResults");
LABEL_39:
          v140 = v53;
          if (v36)
          {
            objc_msgSend(v32, "removeObject:", v36);
            objc_msgSend(v35, "addObject:", v36);
            if (v140 != 0x7FFFFFFF)
              --v140;
          }
          v116 = v36;
          v54 = objc_msgSend(v30, "count");
          v55 = objc_msgSend(v121, "count") + v54;
          v56 = objc_msgSend(v32, "count");
          v139 = -[SSBullseyeSuggestionsManager maxLocalSuggestionCount](v47, "maxLocalSuggestionCount");
          v138 = -[SSBullseyeSuggestionsManager maxServerSuggestionCount](v47, "maxServerSuggestionCount");
          if (objc_msgSend(v121, "count"))
          {
            memset(v137, 0, sizeof(v137));
            v57 = v121;
            if (objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", v137, v148, 16))
            {
              if (v140)
              {
                objc_msgSend(v122, "addObject:", **((_QWORD **)&v137[0] + 1));
                if (v140 != 0x7FFFFFFF)
                  --v140;
              }
            }

          }
          v113 = v22;
          SSSplitCounts(v55, v139, 0, v56, v138, 0, v140, &v139, &v138, &v140);
          v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v133 = 0u;
          v134 = 0u;
          v135 = 0u;
          v136 = 0u;
          v61 = v32;
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v134;
LABEL_50:
            v65 = 0;
            while (1)
            {
              if (*(_QWORD *)v134 != v64)
                objc_enumerationMutation(v61);
              v66 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * v65);
              v67 = objc_msgSend(v58, "count");
              if (v67 >= v138)
                break;
              objc_msgSend(v58, "addObject:", v66);
              if (v63 == ++v65)
              {
                v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
                if (v63)
                  goto LABEL_50;
                break;
              }
            }
          }
          v124 = v59;
          v115 = v58;
          v105 = v61;

          objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_110);
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v68 = v30;
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
          if (v69)
          {
            v70 = v69;
            v71 = 0;
            v72 = 0;
            v73 = *(_QWORD *)v130;
            while (1)
            {
              v74 = 0;
              do
              {
                if (*(_QWORD *)v130 != v73)
                  objc_enumerationMutation(v68);
                v75 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v74);
                v76 = objc_msgSend(v75, "type");
                if (v76 == 38 || v76 == 32)
                {
                  v77 = v60;
LABEL_64:
                  objc_msgSend(v77, "addObject:", v75);
                  goto LABEL_65;
                }
                if (v71 || v76 != 35)
                {
                  if (v72 || v76 != 34)
                  {
                    v77 = v124;
                    goto LABEL_64;
                  }
                  v72 = v75;
                }
                else
                {
                  v71 = v75;
                }
LABEL_65:
                ++v74;
              }
              while (v70 != v74);
              v78 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
              v70 = v78;
              if (!v78)
                goto LABEL_77;
            }
          }
          v71 = 0;
          v72 = 0;
LABEL_77:

          v79 = objc_msgSend(v122, "count");
          objc_msgSend(v60, "sortUsingComparator:", &__block_literal_global_111);
          do
          {
            if (!objc_msgSend(v60, "count"))
              break;
            v80 = objc_msgSend(v122, "count");
            if (v80 >= v140)
              break;
            v81 = objc_msgSend(v122, "count") - v79;
            if (v81 > v139)
              break;
            objc_msgSend(v60, "firstObject");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "addObject:", v82);
            objc_msgSend(v60, "removeObject:", v82);
            if (v139 != 0x7FFFFFFF)
              --v139;
            v83 = objc_msgSend(v124, "count");

            if (v83)
              break;
          }
          while (!v71 && !v72);
          if (v71 && (v84 = objc_msgSend(v122, "count"), v84 < v140))
          {
            v85 = objc_msgSend(v122, "count");
            v86 = v139;
            v87 = v85 - v79 < v139;
            v88 = v116;
            v25 = v117;
            v89 = v115;
            v90 = v124;
            if (v87)
            {
              objc_msgSend(v122, "addObject:", v71);
              if (v139 == 0x7FFFFFFF)
                goto LABEL_96;
              v86 = --v139;
            }
          }
          else
          {
            v86 = v139;
            v88 = v116;
            v25 = v117;
            v89 = v115;
            v90 = v124;
          }
          if (v86 != 0x7FFFFFFF)
          {
            do
            {
              v91 = objc_msgSend(v90, "count");
              if (v91 <= v139)
                break;
              objc_msgSend(v90, "removeLastObject");
            }
            while (v139 != 0x7FFFFFFF);
          }
LABEL_96:
          if (v72 && objc_msgSend(v90, "count") && (objc_msgSend(v90, "containsObject:", v72) & 1) == 0)
          {
            objc_msgSend(v90, "removeLastObject");
            objc_msgSend(v90, "addObject:", v72);
          }
          v26 = v122;
          if (!v106 || (v92 = objc_msgSend(v60, "count"), v71) || v92)
          {
            objc_msgSend(v122, "addObjectsFromArray:", v90);
          }
          else if (objc_msgSend(v90, "count"))
          {
            v107 = v19;
            v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v125 = 0u;
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v94 = v89;
            v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
            if (v95)
            {
              v96 = v95;
              v97 = *(_QWORD *)v126;
              do
              {
                for (i = 0; i != v96; ++i)
                {
                  if (*(_QWORD *)v126 != v97)
                    objc_enumerationMutation(v94);
                  v99 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
                  v100 = objc_msgSend(v99, "type");
                  v101 = v93;
                  if (v100 != 28)
                  {
                    if (objc_msgSend(v99, "type") == 29)
                      v101 = v93;
                    else
                      v101 = v122;
                  }
                  objc_msgSend(v101, "addObject:", v99);
                }
                v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
              }
              while (v96);
            }

            v26 = v122;
            v90 = v124;
            objc_msgSend(v122, "addObjectsFromArray:", v124);
            objc_msgSend(v122, "addObjectsFromArray:", v93);

            v19 = v107;
            v88 = v116;
            v25 = v117;
            v89 = v115;
            goto LABEL_118;
          }
          objc_msgSend(v122, "addObjectsFromArray:", v89);
LABEL_118:

          v28 = v110;
          objc_autoreleasePoolPop(context);
          v102 = v26;
          v22 = v113;
          v18 = v114;
          v24 = v111;
          v23 = v112;
          goto LABEL_119;
        }
      }
      else
      {
        v140 = 0;
      }
    }
    else
    {
      v140 = 0;
    }
    v53 = -[SSBullseyeSuggestionsManager maxTotalSuggestionCount](v47, "maxTotalSuggestionCount");
    goto LABEL_39;
  }
  if (v120)
    objc_msgSend(v26, "addObject:");
  if (v28)
    objc_msgSend(v26, "addObject:", v28);
  v104 = v26;

  objc_autoreleasePoolPop(v27);
LABEL_119:

  return v26;
}

uint64_t __251__SSBullseyeSuggestionsManager_release2023_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

uint64_t __251__SSBullseyeSuggestionsManager_release2023_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)release2022_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  _BOOL4 v50;
  uint64_t v51;
  int64_t v52;
  BOOL v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  char v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t m;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  _BOOL8 v126;
  unsigned int v127;
  void *v128;
  void *v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  BOOL v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  id v155;
  id v156;
  uint64_t *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  char v162;
  uint64_t v163;
  void *v164;
  char v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  uint64_t v172;
  void *v173;
  char v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  void *v180;
  id v182;
  _BOOL4 v183;
  int v184;
  uint64_t v185;
  _BOOL4 v186;
  int v187;
  unsigned int v188;
  uint64_t v189;
  unint64_t v190;
  int64_t v191;
  id v192;
  id v193;
  void *v194;
  id v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  id v200;
  id v201;
  id v202;
  id v203;
  void *v204;
  id v205;
  void *v206;
  void *v207;
  id v208;
  unint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  int v228;
  void *v229;
  id v230;
  id v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  _BYTE v266[128];
  uint64_t v267;

  v267 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v217 = a5;
  v231 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v203 = a10;
  v25 = a11;
  v200 = a12;
  v201 = a13;
  v198 = a14;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = v20;
  objc_msgSend(v20, "searchString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v27);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v22;
  v197 = v23;
  v205 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v208 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v199 = v25;
  if (objc_msgSend(v25, "count")
    || objc_msgSend(v201, "count")
    || objc_msgSend(v200, "count")
    || objc_msgSend(v24, "count")
    || objc_msgSend(v203, "count"))
  {
    v214 = (void *)objc_opt_new();
    v223 = (void *)objc_opt_new();
    v207 = (void *)objc_opt_new();
    v206 = (void *)objc_opt_new();
    v212 = (void *)objc_opt_new();
    v29 = -[SSBullseyeSuggestionsManager maxTotalSuggestionCount](self, "maxTotalSuggestionCount");
    v209 = -[SSBullseyeSuggestionsManager maxLocalSuggestionCount](self, "maxLocalSuggestionCount");
    v191 = -[SSBullseyeSuggestionsManager maxServerSuggestionCount](self, "maxServerSuggestionCount");
    v195 = v28;
    if (v198)
    {
      objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localDisplayPosition"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localDisplayPosition"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v190 = (int)objc_msgSend(v31, "intValue");

      }
      else
      {
        v190 = -[SSBullseyeSuggestionsManager localDisplayPosition](self, "localDisplayPosition");
      }

      objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localThreshold"));
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localThreshold"));
        v34 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("serverThreshold"));
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("serverThreshold"));
          v215 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
LABEL_16:
        -[SSBullseyeSuggestionsManager serverSuggestionThreshold](self, "serverSuggestionThreshold");
        v37 = (id)objc_claimAutoreleasedReturnValue();

        v215 = v37;
        if (!v198)
        {
          v187 = -[SSBullseyeSuggestionsManager ignoreMaxCount](self, "ignoreMaxCount");
          v188 = 0;
          v202 = 0;
          v193 = 0;
          v50 = 1;
          LOBYTE(v184) = 1;
          goto LABEL_37;
        }
LABEL_17:
        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localFilteringScore"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("localFilteringScore"));
          v202 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v202 = 0;
        }

        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("qualityThreshold"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("qualityThreshold"));
          v193 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v193 = 0;
        }
        v40 = v34;

        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("ignoreMaxCountForSingleSuggestionsType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("ignoreMaxCountForSingleSuggestionsType"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = objc_msgSend(v42, "BOOLValue");

        }
        else
        {
          v187 = -[SSBullseyeSuggestionsManager ignoreMaxCount](self, "ignoreMaxCount");
        }

        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("prefersLocalUserTypedSuggestion"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("prefersLocalUserTypedSuggestion"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = objc_msgSend(v44, "BOOLValue");

        }
        else
        {
          v188 = 0;
        }

        objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("suggestionsAreBlended"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("suggestionsAreBlended"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend(v46, "BOOLValue") ^ 1;

        }
        else
        {
          LOBYTE(v184) = 1;
        }
        v34 = v40;

        if (v202)
        {
          if (!v193)
          {
            v186 = 0;
LABEL_38:
            v213 = v34;
            v194 = v26;
            v192 = v21;
            v196 = v24;
            v51 = objc_msgSend(v24, "count");
            v52 = v29 - v51;
            if (v29 < v51)
              v52 = 0;
            v185 = v51;
            if (v51)
              v53 = v29 == 0x7FFFFFFF;
            else
              v53 = 1;
            if (v53)
              v52 = v29;
            v189 = v52;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            v227 = (void *)objc_opt_new();
            v218 = (void *)objc_opt_new();
            v219 = (void *)objc_opt_new();
            v204 = (void *)objc_opt_new();
            v257 = 0u;
            v258 = 0u;
            v259 = 0u;
            v260 = 0u;
            v54 = v200;
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v257, v266, 16);
            if (v55)
            {
              v56 = v55;
              v228 = 0;
              v57 = *(_QWORD *)v258;
              v222 = v195;
              v226 = v197;
              v58 = v214;
LABEL_48:
              v59 = 0;
              while (2)
              {
                if (*(_QWORD *)v258 != v57)
                  objc_enumerationMutation(v54);
                v60 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * v59);
                v61 = objc_msgSend(v60, "type");
                objc_msgSend(v60, "completion");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                switch(v61)
                {
                  case 27:
                    goto LABEL_69;
                  case 28:
                    if (objc_msgSend(v63, "isEqualToString:", v225))
                    {
                      objc_msgSend(v60, "setType:", 29);
                      goto LABEL_54;
                    }
                    objc_msgSend(v220, "addObject:", v60);
                    v228 |= objc_msgSend(v58, "count") == 0;
                    goto LABEL_68;
                  case 29:
LABEL_54:
                    v64 = v60;

                    objc_msgSend(v220, "addObject:", v64);
                    v228 |= objc_msgSend(v58, "count") == 0;
                    v226 = v64;
                    goto LABEL_68;
                  case 30:
                    v72 = v60;

                    v222 = v72;
                    goto LABEL_68;
                  default:
                    if (v61 != 17)
                      goto LABEL_68;
                    if (v215)
                    {
                      v65 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v60, "rankingScore");
                      objc_msgSend(v65, "numberWithDouble:");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = objc_msgSend(v66, "compare:", v215);

                      if (v67 == -1)
                        goto LABEL_69;
                    }
                    objc_msgSend(v60, "entityIdentifier");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = v68;
                    if (v217 && v68)
                    {
                      objc_msgSend(v60, "entityIdentifier");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      v71 = objc_msgSend(v217, "containsObject:", v70);

                      if ((v71 & 1) != 0)
                      {
                        v58 = v214;
                        goto LABEL_69;
                      }
                    }
                    else
                    {

                    }
                    objc_msgSend(v60, "entityIdentifier");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v73)
                      objc_msgSend(v212, "addObject:", v63);
                    objc_msgSend(v227, "addObject:", v63);
                    objc_msgSend(v211, "addObject:", v60);
                    v58 = v214;
LABEL_68:
                    objc_msgSend(v58, "addObject:", v60);
LABEL_69:

                    if (v56 != ++v59)
                      continue;
                    v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v257, v266, 16);
                    if (!v56)
                      goto LABEL_73;
                    goto LABEL_48;
                }
              }
            }
            v228 = 0;
            v222 = v195;
            v226 = v197;
            v58 = v214;
LABEL_73:

            if (v226 && (objc_msgSend(v58, "containsObject:", v226) & 1) == 0)
            {
              objc_msgSend(v58, "addObject:", v226);
              objc_msgSend(v220, "addObject:", v226);
            }
            v253 = 0u;
            v254 = 0u;
            v183 = objc_msgSend(v58, "count") != 1;
            v255 = 0u;
            v256 = 0u;
            v74 = v199;
            v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v253, v265, 16);
            if (v75)
            {
              v76 = v75;
              v77 = *(_QWORD *)v254;
              while (2)
              {
                for (i = 0; i != v76; ++i)
                {
                  if (*(_QWORD *)v254 != v77)
                    objc_enumerationMutation(v74);
                  v79 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * i);
                  objc_msgSend(v79, "completion");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v80);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((!v231 || (objc_msgSend(v231, "containsObject:", v81) & 1) == 0)
                    && (objc_msgSend(v219, "containsObject:", v81) & 1) == 0)
                  {
                    if (objc_msgSend(v81, "containsString:", v225))
                    {
                      objc_msgSend(v206, "addObject:", v79);
                      objc_msgSend(v219, "addObject:", v81);
                      if (v209 != 0x7FFFFFFF && objc_msgSend(v206, "count") >= v209)
                      {

                        goto LABEL_91;
                      }
                    }
                  }

                }
                v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v253, v265, 16);
                if (v76)
                  continue;
                break;
              }
            }
LABEL_91:

            v251 = 0u;
            v252 = 0u;
            v249 = 0u;
            v250 = 0u;
            v82 = v201;
            v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v249, v264, 16);
            if (v83)
            {
              v84 = v83;
              v221 = 0;
              v85 = *(_QWORD *)v250;
              do
              {
                for (j = 0; j != v84; ++j)
                {
                  if (*(_QWORD *)v250 != v85)
                    objc_enumerationMutation(v82);
                  v87 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * j);
                  v88 = objc_msgSend(v87, "type");
                  objc_msgSend(v87, "completion");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v89);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();

                  switch(v88)
                  {
                    case ' ':
                    case '&':
                      objc_msgSend(v87, "rankingScore");
                      if (v91 != 0.0
                        && (!v231 || (objc_msgSend(v231, "containsObject:", v90) & 1) == 0)
                        && (objc_msgSend(v218, "containsObject:", v90) & 1) == 0)
                      {
                        objc_msgSend(v207, "addObject:", v87);
                        objc_msgSend(v227, "addObject:", v90);
                        v92 = v218;
                        goto LABEL_112;
                      }
                      break;
                    case '"':
                      objc_msgSend(v216, "searchString");
                      v97 = objc_claimAutoreleasedReturnValue();
                      if (!v97
                        || (v98 = (void *)v97,
                            v99 = objc_msgSend(v90, "isEqualToString:", v225),
                            v98,
                            (v99 & 1) == 0))
                      {
                        if ((objc_msgSend(v227, "containsObject:", v90) & 1) == 0)
                        {
                          v100 = v205;
                          goto LABEL_120;
                        }
                      }
                      break;
                    case '#':
                      v101 = v87;

                      objc_msgSend(v223, "addObject:", v101);
                      v221 = v101;
                      break;
                    case '\'':
                      if ((objc_msgSend(v227, "containsObject:", v90) & 1) == 0)
                      {
                        v100 = v208;
LABEL_120:
                        objc_msgSend(v100, "addObject:", v87);
                        v92 = v223;
                        v96 = v87;
                        goto LABEL_121;
                      }
                      break;
                    default:
                      if (!v231 || (objc_msgSend(v231, "containsObject:", v90) & 1) == 0)
                      {
                        if (!v213
                          || (v93 = (void *)MEMORY[0x1E0CB37E8],
                              objc_msgSend(v87, "rankingScore"),
                              objc_msgSend(v93, "numberWithDouble:"),
                              v94 = (void *)objc_claimAutoreleasedReturnValue(),
                              v95 = objc_msgSend(v94, "compare:", v213),
                              v94,
                              v95 != -1))
                        {
                          if ((!objc_msgSend(v227, "containsObject:", v90)
                             || objc_msgSend(v212, "containsObject:", v90))
                            && (objc_msgSend(v218, "containsObject:", v90) & 1) == 0)
                          {
                            if (objc_msgSend(v219, "containsObject:", v90))
                              objc_msgSend(v204, "addObject:", v87);
                            objc_msgSend(v223, "addObject:", v87);
                            v92 = v227;
LABEL_112:
                            v96 = v90;
LABEL_121:
                            objc_msgSend(v92, "addObject:", v96);
                          }
                        }
                      }
                      break;
                  }

                }
                v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v249, v264, 16);
              }
              while (v84);
            }
            else
            {
              v221 = 0;
            }

            v102 = v203;
            v103 = v214;
            v104 = v218;
            if (!objc_msgSend(v207, "count"))
            {
              v247 = 0u;
              v248 = 0u;
              v245 = 0u;
              v246 = 0u;
              v105 = v206;
              v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v245, v263, 16);
              if (v106)
              {
                v107 = v106;
                v108 = *(_QWORD *)v246;
                do
                {
                  for (k = 0; k != v107; ++k)
                  {
                    if (*(_QWORD *)v246 != v108)
                      objc_enumerationMutation(v105);
                    v110 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * k);
                    objc_msgSend(v110, "completion");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SSBullseyeSuggestionsManager suggestionKeyWithCompletion:](self, "suggestionKeyWithCompletion:", v111);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();

                    if ((objc_msgSend(v218, "containsObject:", v112) & 1) == 0)
                      objc_msgSend(v207, "addObject:", v110);

                  }
                  v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v245, v263, 16);
                }
                while (v107);
              }

              v243 = 0u;
              v244 = 0u;
              v241 = 0u;
              v242 = 0u;
              v113 = v204;
              v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v241, v262, 16);
              if (v114)
              {
                v115 = v114;
                v116 = *(_QWORD *)v242;
                do
                {
                  for (m = 0; m != v115; ++m)
                  {
                    if (*(_QWORD *)v242 != v116)
                      objc_enumerationMutation(v113);
                    objc_msgSend(v223, "removeObject:", *(_QWORD *)(*((_QWORD *)&v241 + 1) + 8 * m));
                  }
                  v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v241, v262, 16);
                }
                while (v115);
              }

              v103 = v214;
              v102 = v203;
            }
            objc_msgSend(v223, "sortedArrayUsingComparator:", &__block_literal_global_120_0);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = (void *)objc_msgSend(v118, "mutableCopy");

            v26 = v194;
            if (v207)
              v120 = objc_msgSend(v207, "count");
            else
              v120 = 0;
            if (v119)
            {
              v121 = objc_msgSend(v119, "count");
              if (v103)
              {
LABEL_149:
                v122 = objc_msgSend(v103, "count");
                goto LABEL_152;
              }
            }
            else
            {
              v121 = 0;
              if (v103)
                goto LABEL_149;
            }
            v122 = 0;
LABEL_152:
            v239 = v209;
            v240 = v189;
            v123 = v191;
            v238 = v191;
            if (v187)
            {
              v124 = v209;
              if (v122 < 2)
                v124 = v189;
              v209 = v124;
              if (!(v120 | v121))
                v123 = v189;
            }
            if (v189 != 0x7FFFFFFF)
            {
              if (v222)
                v125 = v188;
              else
                v125 = 0;
              SSSplitCounts(v121 + v120, v209, v125, v122, v123, 0, v189, &v239, &v238, &v240);
            }
            v126 = !v186;
            if (v190)
              v126 = v190;
            v224 = v126;
            if (v222)
              v127 = v188;
            else
              v127 = 0;
            if (v127 == 1)
              objc_msgSend(v194, "addObject:", v222);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v128;
            if (v240 == 0x7FFFFFFF)
            {
              objc_msgSend(v128, "addObjectsFromArray:", v103);
            }
            else if (objc_msgSend(v103, "count"))
            {
              if ((v184 & 1) != 0)
              {
                v130 = v183 & v228;
                v236 = 0;
                v237 = 0;
                if (objc_msgSend(v220, "count") == 1)
                {
                  v131 = objc_msgSend(v220, "count");
                  v132 = objc_msgSend(v211, "count");
                  SSSplitCounts(v131, 0x7FFFFFFFLL, 0, v132, 0x7FFFFFFFLL, 0, v238, &v236, &v237, 0);
                }
                else
                {
                  v134 = objc_msgSend(v211, "count");
                  v135 = objc_msgSend(v220, "count");
                  SSSplitCounts(v134, 0x7FFFFFFFLL, 0, v135, 0x7FFFFFFFLL, 0, v238, &v237, &v236, 0);
                }
                getFilteredSuggestionResults(v220, v236);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                getFilteredSuggestionResults(v211, v237);
                v136 = objc_claimAutoreleasedReturnValue();
                v137 = (void *)v136;
                v138 = v130 == 0;
                if (v130)
                  v139 = v133;
                else
                  v139 = (void *)v136;
                if (v130)
                  v140 = (void *)v136;
                else
                  v140 = v133;
                v141 = v224;
                if (!v138)
                  v141 = 1;
                v224 = v141;
                objc_msgSend(v129, "addObjectsFromArray:", v139);
                objc_msgSend(v129, "addObjectsFromArray:", v140);

              }
              else
              {
                getFilteredSuggestionResults(v103, v238);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "addObjectsFromArray:", v133);
              }

            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v207, "count"))
            {
              v229 = v129;
              v234 = 0u;
              v235 = 0u;
              v232 = 0u;
              v233 = 0u;
              v143 = v207;
              v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v232, v261, 16);
              if (v144)
              {
                v145 = v144;
                v146 = 0;
                v147 = *(_QWORD *)v233;
LABEL_191:
                v148 = 0;
                v149 = v146 + v145;
                while (1)
                {
                  if (*(_QWORD *)v233 != v147)
                    objc_enumerationMutation(v143);
                  v150 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * v148);
                  if ((v209 & 0x8000000000000000) == 0)
                  {
                    v151 = v146 + v148;
                    if (objc_msgSend(v119, "count"))
                    {
                      if (v151 && v146 + v148 + 1 >= v239)
                        break;
                    }
                    if (!objc_msgSend(v119, "count") && v151 >= v239)
                      break;
                  }
                  objc_msgSend(v142, "addObject:", v150);
                  if (v145 == ++v148)
                  {
                    v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v232, v261, 16);
                    v146 = v149;
                    if (v145)
                      goto LABEL_191;
                    break;
                  }
                }
              }

              v26 = v194;
              v102 = v203;
              v104 = v218;
              v129 = v229;
            }
            if (v119)
              objc_msgSend(v142, "addObjectsFromArray:", v119);
            if (objc_msgSend(v196, "count"))
              objc_msgSend(v26, "addObjectsFromArray:", v196);
            if (objc_msgSend(v102, "count"))
              objc_msgSend(v26, "addObjectsFromArray:", v102);
            v152 = v224;
            if (v221 && (objc_msgSend(v26, "containsObject:", v221) & 1) == 0)
            {
              objc_msgSend(v26, "removeLastObject");
              objc_msgSend(v26, "addObject:", v221);
            }
            v153 = v142;
            v154 = v239;
            v155 = v129;
            v210 = v155;
            if (v224)
            {
              v156 = v155;

              v154 = v238;
              v230 = v153;

              v157 = &v239;
            }
            else
            {
              v157 = &v238;
              v156 = v153;
              v230 = v155;
            }
            v158 = *v157;
            getFilteredSuggestionResults(v156, v154);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObjectsFromArray:", v159);
            if (v224)
            {
              v160 = v198;
              if (v226 && (objc_msgSend(v26, "containsObject:", v226) & 1) == 0)
              {
                objc_msgSend(v26, "removeLastObject");
                objc_msgSend(v26, "addObject:", v226);
              }
            }
            else
            {
              v160 = v198;
              if (objc_msgSend(v205, "count")
                && (objc_msgSend(v205, "firstObject"),
                    v161 = (void *)objc_claimAutoreleasedReturnValue(),
                    v162 = objc_msgSend(v26, "containsObject:", v161),
                    v161,
                    v152 = v224,
                    (v162 & 1) == 0))
              {
                objc_msgSend(v26, "removeLastObject");
                objc_msgSend(v205, "firstObject");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v167);

                v152 = v224;
                v104 = v218;
              }
              else
              {
                v163 = objc_msgSend(v208, "count");
                v104 = v218;
                if (!v203)
                {
                  if (v163)
                  {
                    if (!v185)
                    {
                      objc_msgSend(v208, "firstObject");
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                      v165 = objc_msgSend(v26, "containsObject:", v164);

                      v152 = v224;
                      if ((v165 & 1) == 0)
                      {
                        objc_msgSend(v26, "removeLastObject");
                        objc_msgSend(v208, "firstObject");
                        v166 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "addObject:", v166);

                        v152 = v224;
                      }
                    }
                  }
                }
              }
            }
            getFilteredSuggestionResults(v230, v158);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObjectsFromArray:", v168);
            if (v152)
            {
              if (objc_msgSend(v205, "count"))
              {
                objc_msgSend(v205, "firstObject");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v170 = objc_msgSend(v26, "containsObject:", v169);

                v171 = v205;
                v104 = v218;
                if (!v170)
                  goto LABEL_234;
              }
              v172 = objc_msgSend(v208, "count");
              if (!v203)
              {
                if (v172)
                {
                  if (!v185)
                  {
                    objc_msgSend(v208, "firstObject");
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    v174 = objc_msgSend(v26, "containsObject:", v173);

                    v171 = v208;
                    v104 = v218;
                    if ((v174 & 1) == 0)
                    {
LABEL_234:
                      objc_msgSend(v26, "removeLastObject");
                      objc_msgSend(v171, "firstObject");
                      v175 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "addObject:", v175);

                    }
                  }
                }
              }
              v176 = v226;
              if (!v226)
                goto LABEL_241;
            }
            else
            {
              v176 = v226;
              if (!v226)
              {
LABEL_241:
                v177 = v26;

                v21 = v192;
                v178 = v231;
                v28 = v195;
                v24 = v196;
                v179 = v197;
                v180 = v205;
                goto LABEL_242;
              }
              if ((objc_msgSend(v26, "containsObject:", v226) & 1) == 0)
              {
                objc_msgSend(v26, "removeLastObject");
                objc_msgSend(v26, "addObject:", v226);
              }
            }
            objc_msgSend(v26, "removeObject:", v176);
            objc_msgSend(v26, "insertObject:atIndex:", v176, 0);
            goto LABEL_241;
          }
          objc_msgSend(v202, "doubleValue");
          v48 = v47;
          objc_msgSend(v193, "doubleValue");
          v50 = v48 >= v49;
        }
        else
        {
          v202 = 0;
          v50 = 1;
        }
LABEL_37:
        v186 = v50;
        goto LABEL_38;
      }
    }
    else
    {
      v190 = -[SSBullseyeSuggestionsManager localDisplayPosition](self, "localDisplayPosition");
    }
    -[SSBullseyeSuggestionsManager localSuggestionThreshold](self, "localSuggestionThreshold");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    if (!v198)
      goto LABEL_16;
    goto LABEL_14;
  }
  v179 = v197;
  if (v197)
    objc_msgSend(v26, "addObject:", v197);
  v178 = v231;
  v160 = v198;
  v180 = v205;
  if (v28)
    objc_msgSend(v26, "addObject:", v28);
  v182 = v26;
  v221 = 0;
  v222 = v28;
  v226 = v197;
LABEL_242:

  return v26;
}

uint64_t __277__SSBullseyeSuggestionsManager_release2022_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_shortcutSuggestionResults_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)intentBasedSuggestionBlending:(id)a3 suggestions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  unsigned int v23;
  void *context;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "queryIntent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_23;
  v8 = (void *)v7;
  objc_msgSend(v5, "queryIntent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "intentType"))
  {

    goto LABEL_23;
  }
  objc_msgSend(v5, "queryIntent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_23:
    v12 = v6;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1BCCB3708]();
  v26 = v5;
  objc_msgSend(v5, "queryIntent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestionConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "localSuggestionQuota");
  v16 = objc_msgSend(v14, "serverSuggestionQuota");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "type");
        if (v23 <= 0x27)
        {
          if (((1 << v23) & 0xCF80010000) != 0)
          {
            if (v15)
            {
              objc_msgSend(v12, "addObject:", v22);
              --v15;
            }
          }
          else if (((1 << v23) & 0x10020000) != 0)
          {
            if (v16)
            {
              objc_msgSend(v12, "addObject:", v22);
              --v16;
            }
          }
          else if (v23 == 29 && objc_msgSend(v14, "showWebAsTypedSuggestion"))
          {
            objc_msgSend(v12, "addObject:", v22);
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  objc_autoreleasePoolPop(context);
  v5 = v26;
LABEL_24:

  return v12;
}

- (SRResources)resources
{
  return self->_resources;
}

- (NSString)blendingModelPath
{
  return self->_blendingModelPath;
}

- (NSDictionary)modelFeatureNames
{
  return self->_modelFeatureNames;
}

- (BOOL)enabledSuggestionsOverrides
{
  return self->_enabledSuggestionsOverrides;
}

- (BOOL)enabledSuggestionsBlending
{
  return self->_enabledSuggestionsBlending;
}

- (BOOL)enabledFullSuggestionsBlending
{
  return self->_enabledFullSuggestionsBlending;
}

- (BOOL)enabledAboveFoldResults
{
  return self->_enabledAboveFoldResults;
}

- (BOOL)ignoreMaxCount
{
  return self->_ignoreMaxCount;
}

- (NSNumber)serverSuggestionThreshold
{
  return self->_serverSuggestionThreshold;
}

- (NSNumber)localSuggestionThreshold
{
  return self->_localSuggestionThreshold;
}

- (int64_t)maxTotalSuggestionCount
{
  return self->_maxTotalSuggestionCount;
}

- (int64_t)maxTotalSuggestionCountForAboveFoldResults
{
  return self->_maxTotalSuggestionCountForAboveFoldResults;
}

- (int64_t)maxServerSuggestionCount
{
  return self->_maxServerSuggestionCount;
}

- (int64_t)maxLocalSuggestionCount
{
  return self->_maxLocalSuggestionCount;
}

- (unint64_t)localDisplayPosition
{
  return self->_localDisplayPosition;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localSuggestionThreshold, 0);
  objc_storeStrong((id *)&self->_serverSuggestionThreshold, 0);
  objc_storeStrong((id *)&self->_modelFeatureNames, 0);
  objc_storeStrong((id *)&self->_blendingModelPath, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_blendingModel, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
}

- (void)loadBlendingModelWithPath:(uint64_t)a3 forceLoad:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, MEMORY[0x1E0C81028], a3, "SuggestionsManager: error loading blending model <%@>", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B86C5000, MEMORY[0x1E0C81028], a3, "SuggestionsManager: error loading model feature names", a5, a6, a7, a8, 0);
}

- (void)_getScoreForSuggestionResult:(uint64_t)a1 options:(float)a2 .cold.1(uint64_t a1, float a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_debug_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Suggestions blending: extracted features <%@>;\n score: %f",
    (uint8_t *)&v2,
    0x16u);
  OUTLINED_FUNCTION_8();
}

- (void)_getScoreForSuggestionResult:(uint64_t)a3 options:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B86C5000, MEMORY[0x1E0C81028], a3, "Suggestions blending: unable to read local features", a5, a6, a7, a8, 0);
}

@end
