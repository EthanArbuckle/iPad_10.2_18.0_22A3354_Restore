@implementation PRSModelManager

+ (id)sharedModelManager
{
  if (sharedModelManager_onceToken != -1)
    dispatch_once(&sharedModelManager_onceToken, &__block_literal_global_28);
  return (id)sharedModelManager_sharedManager;
}

- (id)getL2ModelVersionForClientBundle:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_models;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_models, "objectForKeyedSubscript:", &unk_1E6E97C98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)activate
{
  NSObject *activeGroup;
  NSMutableDictionary *obj;

  dispatch_group_wait((dispatch_group_t)self->_modelUpdateGroup, 0xFFFFFFFFFFFFFFFFLL);
  obj = self->_models;
  objc_sync_enter(obj);
  activeGroup = self->_activeGroup;
  ++self->_activeCount;
  dispatch_group_enter(activeGroup);
  objc_sync_exit(obj);

}

void __37__PRSModelManager_sharedModelManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedModelManager_sharedManager;
  sharedModelManager_sharedManager = v0;

}

+ (void)cannedInfoForType:(unint64_t)a3 directivesPath:(id *)a4 modelName:(id *)a5
{
  if (a3)
    +[PRSModelManager cannedInfoForType:directivesPath:modelName:].cold.1();
  SSDefaultsGetAssetPath(CFSTR("directives_l2.mdplist"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  *a5 = CFSTR("spotlight_l2");
}

+ (void)pathsFor:(unint64_t)a3 withParentPath:(id)a4 modelPath:(id *)a5 directivesPath:(id *)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("models"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("directives"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (a3)
    +[PRSModelManager pathsFor:withParentPath:modelPath:directivesPath:].cold.1();
  v11 = (void *)v10;
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("spotlight_l2.mlmodelc"));
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("directives_l2.mdplist"));
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

- (PRSModelManager)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_group_t v15;
  void *v16;
  dispatch_group_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PRSModelManager;
  v2 = -[PRSModelManager init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v4 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v6 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v5;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    v10 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v9;

    *((_BYTE *)v2 + 33) = 0;
    objc_msgSend(*((id *)v2 + 11), "objectForKey:", CFSTR("ModelVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    v13 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = &stru_1E6E549F0;

    v14 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = &stru_1E6E549F0;

    *((_QWORD *)v2 + 1) = 0;
    v15 = dispatch_group_create();
    v16 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v15;

    v17 = dispatch_group_create();
    v18 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v17;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 3));
    dispatch_get_global_queue(25, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__PRSModelManager_init__block_invoke;
    block[3] = &unk_1E6E42FD8;
    v22 = v2;
    dispatch_async(v19, block);

  }
  return (PRSModelManager *)v2;
}

void __23__PRSModelManager_init__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "updateModelsAccordingToHierarchy:updateEnabled:disablePendingUpdates:", 0, 1, 1);
  objc_sync_exit(v2);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
  PRSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B86C5000, v3, OS_LOG_TYPE_INFO, "[Model loading] initial model update finished", v4, 2u);
  }

}

- (void)deactivate
{
  unint64_t activeCount;
  NSMutableDictionary *obj;

  obj = self->_models;
  objc_sync_enter(obj);
  activeCount = self->_activeCount;
  if (activeCount)
  {
    self->_activeCount = activeCount - 1;
    dispatch_group_leave((dispatch_group_t)self->_activeGroup);
  }
  objc_sync_exit(obj);

}

- (void)triggerUpdate
{
  NSMutableDictionary *v3;
  NSObject *v4;
  unint64_t activeCount;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_group_enter((dispatch_group_t)self->_modelUpdateGroup);
  v3 = self->_models;
  objc_sync_enter(v3);
  PRSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    activeCount = self->_activeCount;
    v6 = 134217984;
    v7 = activeCount;
    _os_log_impl(&dword_1B86C5000, v4, OS_LOG_TYPE_INFO, "[Model loading] triggerUpdate with activeCount %lu", (uint8_t *)&v6, 0xCu);
  }

  if (!self->_activeCount)
    -[PRSModelManager updateModelsAccordingToHierarchy](self, "updateModelsAccordingToHierarchy");
  objc_sync_exit(v3);

  dispatch_group_leave((dispatch_group_t)self->_modelUpdateGroup);
}

- (void)loadCannedModelWithType:(unint64_t)a3 error:(id *)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  PRSModelContext *v17;
  NSMutableDictionary *models;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "cannedInfoForType:directivesPath:modelName:", a3, &v21, &v20);
  v7 = v21;
  v8 = v20;
  PRSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v10;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1B86C5000, v9, OS_LOG_TYPE_DEFAULT, "[Model loading] loading canned model type %@ model name %@ directive path %@", buf, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "directivesFromFilePath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "processDirectives:", v11);
  v13 = -[SSCoreMLInterface initSpecificModel:error:]([SSCoreMLInterface alloc], "initSpecificModel:error:", v8, a4);
  PRSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_INFO, "[Model loading] model is %@", buf, 0xCu);
  }

  PRSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "getVersionString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_INFO, "[Model loading] loaded model name %@ version %@", buf, 0x16u);

  }
  if (*a4 || !v13)
  {
    PRSLogCategoryDefault();
    v17 = (PRSModelContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
      -[PRSModelManager loadCannedModelWithType:error:].cold.1(a4);
  }
  else
  {
    v17 = -[PRSModelContext initWithModel:directivesManager:type:]([PRSModelContext alloc], "initWithModel:directivesManager:type:", v13, v12, a3);
    models = self->_models;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](models, "setObject:forKeyedSubscript:", v17, v19);

  }
}

+ (id)directivesFromFilePath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const void *v6;
  void *v7;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 8, 0);
  else
    v4 = 0;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_retainAutorelease(v4);
    objc_msgSend(v5, "bytes");
    objc_msgSend(v5, "length");
    v6 = (const void *)_MDPlistContainerCreateWithBytesAndDeallocator();
    v7 = (void *)_MDPlistContainerCopyRootObject();
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __42__PRSModelManager_directivesFromFilePath___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (BOOL)loadModelsWithDirectory:(id)a3 intoModelDict:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v6 = (void *)objc_opt_new();
  v7 = 0;
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    if ((v9 & 1) == 0)
    {
      v16 = v21;
      objc_msgSend(v21, "removeAllObjects");
      objc_msgSend(v21, "addEntriesFromDictionary:", v6);
      v14 = 0;
      v12 = v8;
      v11 = v7;
      goto LABEL_7;
    }
    v23 = v8;
    v24 = v7;
    +[PRSModelManager pathsFor:withParentPath:modelPath:directivesPath:](PRSModelManager, "pathsFor:withParentPath:modelPath:directivesPath:", 0, v5, &v24, &v23);
    v11 = v24;

    v12 = v23;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[PRSModelManager loadModelWithURL:type:directivesPath:intoModelDict:error:](PRSModelManager, "loadModelWithURL:type:directivesPath:intoModelDict:error:", v13, 0, v12, v6, &v22);
    v14 = v22;

    v9 = 0;
    v7 = v11;
    v8 = v12;
  }
  while (!v14);
  PRSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend(v14, "code");
    v19 = CFSTR("nil");
    if (v11)
      v20 = v11;
    else
      v20 = CFSTR("nil");
    *(_DWORD *)buf = 134218498;
    v26 = v18;
    v27 = 2112;
    if (v12)
      v19 = v12;
    v28 = v20;
    v29 = 2112;
    v30 = v19;
    _os_log_error_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_ERROR, "[Model loading] model loading failed with err %ld for model path %@ and directives path %@", buf, 0x20u);
  }

  +[SSADEventReporter reportModelLoadingError](SSADEventReporter, "reportModelLoadingError");
  v16 = v21;
LABEL_7:

  return (v10 & 1) == 0;
}

+ (void)loadModelWithURL:(id)a3 type:(unint64_t)a4 directivesPath:(id)a5 intoModelDict:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  SSCoreMLInterface *v16;
  void *v17;
  PRSModelContext *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11 && objc_msgSend(v12, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "directivesFromFilePath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "processDirectives:", v14);
      v16 = -[SSCoreMLInterface initWithURL:error:]([SSCoreMLInterface alloc], "initWithURL:error:", v11, a7);
      v17 = v16;
      if (!*a7)
      {
        if (v16)
        {
          v18 = -[PRSModelContext initWithModel:directivesManager:type:]([PRSModelContext alloc], "initWithModel:directivesManager:type:", v16, v15, a4);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v19);

        }
        else
        {
          v24 = PRSModelErrorDomain;
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v28 = CFSTR("type");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", v24, -1, v26);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = PRSModelErrorDomain;
      v30 = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -1000, v17);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = PRSModelErrorDomain;
    v32 = CFSTR("type");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -1001, v15);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (BOOL)loadCannedModels
{
  char v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *modelType;
  uint8_t buf[8];
  id v14;

  v3 = 1;
  while (1)
  {
    v4 = v3;
    if ((v3 & 1) == 0)
      break;
    v14 = 0;
    -[PRSModelManager loadCannedModelWithType:error:](self, "loadCannedModelWithType:error:", 0, &v14);
    v5 = v14;
    v3 = 0;
    if (v5)
    {
      v6 = v5;
      PRSLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PRSModelManager loadCannedModels].cold.1((uint64_t)v6, v7);

      getpid();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("failed load canned model type %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SimulateCrash();

      goto LABEL_9;
    }
  }
  modelType = self->_modelType;
  self->_modelType = (NSString *)CFSTR("Canned");

  -[NSUserDefaults setValue:forKey:](self->_userDefaults, "setValue:forKey:", self->_modelType, CFSTR("ModelName"));
  PRSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B86C5000, v6, OS_LOG_TYPE_DEFAULT, "[Model loading] loaded canned models", buf, 2u);
  }
LABEL_9:

  return (v4 & 1) == 0;
}

- (BOOL)loadModels
{
  uint64_t v3;
  void *v4;
  NSString *modelType;
  __CFString *v7;

  if (!self->_trialEnabled)
    return -[PRSModelManager loadCannedModels](self, "loadCannedModels");
  v3 = 2;
  while (1)
  {
    +[SSModelLoader assetDirectoryPathForType:forUpdate:](SSModelLoader, "assetDirectoryPathForType:forUpdate:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PRSModelManager loadModelsWithDirectory:intoModelDict:](PRSModelManager, "loadModelsWithDirectory:intoModelDict:", v4, self->_models))
    {
      break;
    }

    if (!--v3)
      return -[PRSModelManager loadCannedModels](self, "loadCannedModels");
  }
  if (v3 == 1)
  {
    modelType = self->_modelType;
    v7 = CFSTR("Default");
    goto LABEL_10;
  }
  if (v3 == 2)
  {
    modelType = self->_modelType;
    v7 = CFSTR("Experimental");
LABEL_10:
    self->_modelType = &v7->isa;

  }
  return 1;
}

- (void)updateModelsAccordingToHierarchy:(id)a3 updateEnabled:(BOOL)a4 disablePendingUpdates:(BOOL)a5
{
  _BOOL4 v6;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;

  v6 = a4;
  v8 = a3;
  +[SSModelLoader sharedInstance](SSModelLoader, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPendingUpdates");

  if (!a5 && v10)
  {
    v11 = dispatch_group_create();
    +[SSModelLoader sharedInstance](SSModelLoader, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "moveNewlyPackagedAssets:", v11);

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v6)
  {
    v13 = -[NSMutableDictionary count](self->_models, "count") ? v10 : 1;
    if (v13 == 1 && !-[PRSModelManager loadModels](self, "loadModels"))
    {
      PRSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PRSModelManager updateModelsAccordingToHierarchy:updateEnabled:disablePendingUpdates:].cold.1(v14);

    }
  }
  if (v8)
    dispatch_group_leave(v8);

}

- (void)updateModelsAccordingToHierarchy
{
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("SearchRankingDisableModelUpdate"), CFSTR("com.apple.searchd"), &keyExistsAndHasValidFormat);
  -[PRSModelManager updateModelsAccordingToHierarchy:updateEnabled:disablePendingUpdates:](self, "updateModelsAccordingToHierarchy:updateEnabled:disablePendingUpdates:", 0, keyExistsAndHasValidFormat == 0, 0);
}

- (BOOL)otherModelsAvailable
{
  return -[NSMutableDictionary count](self->_otherModels, "count") != 0;
}

- (float)computeL2ScoresForVectors:(id)a3 secondVector:(id)a4 withServerFeatures:(id)a5 withBundleFeatures:(id)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 shouldCancel:(BOOL *)a9 clientBundle:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  float *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  void *v41;
  double v42;
  NSObject *v43;
  uint64_t v44;
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 *p_buf;
  BOOL *v53;
  int v54;
  uint8_t v55[4];
  uint64_t v56;
  __int128 buf;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v46 = a10;
  if (a9 && *a9)
  {
    v22 = 0;
  }
  else
  {
    PRSLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1B86C5000, v23, OS_LOG_TYPE_INFO, "computing L2 scores for %lu items", (uint8_t *)&buf, 0xCu);
    }

    -[PRSModelManager models](self, "models");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
    {
      PRSLogCategoryDefault();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PRSModelManager computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:].cold.2(self);

      getpid();
      v26 = (void *)MEMORY[0x1E0CB3940];
      -[PRSModelManager modelVersion](self, "modelVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("expected models version %@"), v27, v46);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SimulateCrash();

      +[SSADEventReporter reportBadL2Models](SSADEventReporter, "reportBadL2Models");
    }
    pthread_mutex_lock(&sComputeScoreLock);
    if (a9 && *a9)
    {
      pthread_mutex_unlock(&sComputeScoreLock);
      v22 = 0;
    }
    else
    {
      v29 = dispatch_group_create();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x2020000000;
      v59 = 0;
      dispatch_get_global_queue(33, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __162__PRSModelManager_computeL2ScoresForVectors_secondVector_withServerFeatures_withBundleFeatures_experimentalWeight1_experimentalWeight2_shouldCancel_clientBundle___block_invoke;
      block[3] = &unk_1E6E44E18;
      p_buf = &buf;
      block[4] = self;
      v31 = v18;
      v48 = v31;
      v49 = v21;
      v50 = v20;
      v32 = v24;
      v54 = 33;
      v51 = v32;
      v53 = a9;
      dispatch_group_async(v29, v30, block);

      dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      pthread_mutex_unlock(&sComputeScoreLock);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
      {
        if (a7 <= 0.0 && a8 <= 0.0)
        {
          objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E6E97C98);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "directivesManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "weightX");
          a7 = v35;
          objc_msgSend(v34, "weightY");
          a8 = v36;

        }
        PRSLogCategoryDefault();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[PRSModelManager computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:].cold.1(v37, a7, a8);

        v38 = objc_msgSend(v31, "count");
        if (v38)
        {
          v39 = 0;
          do
          {
            v40 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 4 * v39);
            objc_msgSend(v31, "objectAtIndexedSubscript:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v42) = v40;
            objc_msgSend(v41, "setOriginalL2Score:", v42);

            ++v39;
          }
          while (v38 != v39);
        }
        PRSLogCategoryDefault();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = objc_msgSend(v31, "count");
          *(_DWORD *)v55 = 134217984;
          v56 = v44;
          _os_log_impl(&dword_1B86C5000, v43, OS_LOG_TYPE_INFO, "finished computing L2 scores for %lu items", v55, 0xCu);
        }

        v22 = *(float **)(*((_QWORD *)&buf + 1) + 24);
      }
      else
      {
        v22 = 0;
      }

      _Block_object_dispose(&buf, 8);
    }

  }
  return v22;
}

void __162__PRSModelManager_computeL2ScoresForVectors_secondVector_withServerFeatures_withBundleFeatures_experimentalWeight1_experimentalWeight2_shouldCancel_clientBundle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", &unk_1E6E97C98);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v2, "computeScoresForFeatures:withBundleFeatures:serverBundleFeatures:usingModelContext:qos:shouldCancel:filterBundle:", v3, v4, v5, v6, *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 80), 0);

}

- (float)computeScoresForFeatures:(id)a3 withBundleFeatures:(id)a4 serverBundleFeatures:(id)a5 usingModelContext:(id)a6 qos:(unsigned int)a7 shouldCancel:(BOOL *)a8 filterBundle:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v31;
  id v32;
  unsigned int v33;
  size_t iterations;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  BOOL *v42;
  void *v43;
  char v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = objc_msgSend(v14, "count");
  v20 = 0;
  if (v17 && v19)
  {
    if (a8 && *a8)
    {
      v20 = 0;
    }
    else
    {
      v20 = malloc_type_calloc(objc_msgSend(v14, "count"), 4uLL, 0x100004052888210uLL);
      objc_msgSend(v17, "directivesManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v14, "count");
      v23 = v22 / 0x1E;
      if (v22 % 0x1E)
        ++v23;
      iterations = v23;
      v31 = v16;
      v32 = v15;
      objc_msgSend(v21, "processResultSetValuesWithMap:serverFeatures:", v15, v16);
      objc_msgSend(v21, "processingContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "expandedFeatureCount");

      objc_msgSend(v17, "model");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (PRSRankingSDEnabledFlagState() >> 1) & 1;
      dispatch_get_global_queue(a7, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke;
      block[3] = &unk_1E6E44E40;
      v41 = v25;
      v42 = a8;
      v36 = v14;
      v37 = v18;
      v28 = v21;
      v38 = v28;
      v39 = v26;
      v43 = v20;
      v44 = v33;
      v40 = v17;
      v29 = v26;
      dispatch_apply(iterations, v27, block);

      objc_msgSend(v28, "cleanup");
      if (a8 && *a8)
      {
        free(v20);
        v20 = 0;
      }
      v16 = v31;
      v15 = v32;

    }
  }

  return (float *)v20;
}

void __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int8x16_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int8x16_t v44;
  void *v45;
  int v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *context;
  int64x2_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  _OWORD v65[8];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCB3708]();
  v4 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v5;
  v66[1] = &unk_1E6E97CB0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initForFloat32TypeWithShape:", v6);

  v8 = 0;
  v63 = 30 * a2;
  memset(v65, 0, sizeof(v65));
  v61 = vdupq_n_s64(0x10uLL);
  v62 = v7;
  do
  {
    v9 = *(_BYTE **)(a1 + 80);
    if (v9)
    {
      if (*v9)
        break;
    }
    v10 = v63 + v8;
    if (v63 + v8 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
      break;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!*(_QWORD *)(a1 + 40)
      || (objc_msgSend(v11, "bundleID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40)),
          v13,
          v14))
    {
      v15 = objc_msgSend(v12, "indexScore");
      v17 = 0;
      v18 = (int64x2_t)xmmword_1B87DF3C0;
      v19 = (int64x2_t)xmmword_1B87DF3B0;
      v20 = (int64x2_t)xmmword_1B87DF3A0;
      v21 = (int64x2_t)xmmword_1B87DF390;
      v22 = (int64x2_t)xmmword_1B87DF380;
      v23 = (int64x2_t)xmmword_1B87DF370;
      v24 = (int64x2_t)xmmword_1B87DF360;
      v25 = (int64x2_t)xmmword_1B87DF350;
      v26.i64[0] = 0x101010101010101;
      v26.i64[1] = 0x101010101010101;
      do
      {
        v27 = 2 * v16;
        if ((v25.i8[8] & 0x40) != 0)
          v28 = v16 >> v25.i8[8];
        else
          v28 = ((2 * v16) << ~v25.i8[8]) | (v15 >> v25.i8[8]);
        if ((v25.i8[0] & 0x40) != 0)
          v29 = v16 >> v25.i8[0];
        else
          v29 = (v27 << ~v25.i8[0]) | (v15 >> v25.i8[0]);
        if ((v24.i8[8] & 0x40) != 0)
          v30 = v16 >> v24.i8[8];
        else
          v30 = (v27 << ~v24.i8[8]) | (v15 >> v24.i8[8]);
        if ((v24.i8[0] & 0x40) != 0)
          v31 = v16 >> v24.i8[0];
        else
          v31 = (v27 << ~v24.i8[0]) | (v15 >> v24.i8[0]);
        if ((v23.i8[8] & 0x40) != 0)
          v32 = v16 >> v23.i8[8];
        else
          v32 = (v27 << ~v23.i8[8]) | (v15 >> v23.i8[8]);
        if ((v23.i8[0] & 0x40) != 0)
          v33 = v16 >> v23.i8[0];
        else
          v33 = (v27 << ~v23.i8[0]) | (v15 >> v23.i8[0]);
        if ((v22.i8[8] & 0x40) != 0)
          v34 = v16 >> v22.i8[8];
        else
          v34 = (v27 << ~v22.i8[8]) | (v15 >> v22.i8[8]);
        if ((v22.i8[0] & 0x40) != 0)
          v35 = v16 >> v22.i8[0];
        else
          v35 = (v27 << ~v22.i8[0]) | (v15 >> v22.i8[0]);
        if ((v21.i8[8] & 0x40) != 0)
          v36 = v16 >> v21.i8[8];
        else
          v36 = (v27 << ~v21.i8[8]) | (v15 >> v21.i8[8]);
        if ((v21.i8[0] & 0x40) != 0)
          v37 = v16 >> v21.i8[0];
        else
          v37 = (v27 << ~v21.i8[0]) | (v15 >> v21.i8[0]);
        if ((v20.i8[8] & 0x40) != 0)
          v38 = v16 >> v20.i8[8];
        else
          v38 = (v27 << ~v20.i8[8]) | (v15 >> v20.i8[8]);
        v39 = (v27 << ~v20.i8[0]) | (v15 >> v20.i8[0]);
        if ((v20.i8[0] & 0x40) != 0)
          v39 = v16 >> v20.i8[0];
        if ((v19.i8[8] & 0x40) != 0)
          v40 = v16 >> v19.i8[8];
        else
          v40 = (v27 << ~v19.i8[8]) | (v15 >> v19.i8[8]);
        v41 = (v27 << ~v19.i8[0]) | (v15 >> v19.i8[0]);
        v42 = (v27 << ~v18.i8[0]) | (v15 >> v18.i8[0]);
        if ((v19.i8[0] & 0x40) != 0)
          v41 = v16 >> v19.i8[0];
        if ((v18.i8[0] & 0x40) != 0)
          v42 = v16 >> v18.i8[0];
        if ((v18.i8[8] & 0x40) != 0)
          v43 = v16 >> v18.i8[8];
        else
          LOBYTE(v43) = ((_BYTE)v27 << ~v18.i8[8]) | (v15 >> v18.i8[8]);
        v44.i8[0] = v42;
        v44.i8[1] = v43;
        v44.i8[2] = v41;
        v44.i8[3] = v40;
        v44.i8[4] = v39;
        v44.i8[5] = v38;
        v44.i8[6] = v37;
        v44.i8[7] = v36;
        v44.i8[8] = v35;
        v44.i8[9] = v34;
        v44.i8[10] = v33;
        v44.i8[11] = v32;
        v44.i8[12] = v31;
        v44.i8[13] = v30;
        v44.i8[14] = v29;
        v44.i8[15] = v28;
        v20 = vaddq_s64(v20, v61);
        v19 = vaddq_s64(v19, v61);
        v65[v17] = vandq_s8(v44, v26);
        v18 = vaddq_s64(v18, v61);
        ++v17;
        v21 = vaddq_s64(v21, v61);
        v22 = vaddq_s64(v22, v61);
        v23 = vaddq_s64(v23, v61);
        v24 = vaddq_s64(v24, v61);
        v25 = vaddq_s64(v25, v61);
      }
      while (v17 != 8);
      v7 = v62;
      objc_msgSend(*(id *)(a1 + 48), "processL2FeatureVector:populatingValues:scoreValue:count:", v12, objc_msgSend(v62, "floatPointer", *(double *)v18.i64, *(double *)v19.i64, *(double *)v20.i64, *(double *)v21.i64, *(double *)v22.i64, *(double *)v23.i64, *(double *)v24.i64, *(double *)v25.i64), v65, 95);
      v45 = *(void **)(a1 + 56);
      v64 = 0;
      objc_msgSend(v45, "predict:error:", v62, &v64);
      v47 = v46;
      v48 = v64;
      if (v48)
      {
        v58 = v48;
        PRSLogCategoryDefault();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke_cold_1(v58);

        break;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * v10) = v47;
      if (*(_BYTE *)(a1 + 96))
      {
        objc_getAssociatedObject(v12, "_rankingItemObjectKey");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 72));
          if (*(_QWORD *)(a1 + 72))
          {
            v51 = 0;
            do
            {
              v52 = (void *)MEMORY[0x1E0CB37E8];
              LODWORD(v53) = *(_DWORD *)(objc_msgSend(v62, "floatPointer") + 4 * v51);
              objc_msgSend(v52, "numberWithFloat:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v54);

              ++v51;
            }
            while (*(_QWORD *)(a1 + 72) > v51);
          }
          if (!objc_msgSend(*(id *)(a1 + 64), "type"))
          {
            objc_setAssociatedObject(v49, "_l2FeaturesObjectKey", v50, (void *)1);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setAssociatedObject(v49, "_l2FeatureCountObjectKey", v55, (void *)1);

            LODWORD(v56) = v47;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setAssociatedObject(v49, "_l2ScoreObjectKey", v57, (void *)1);

          }
        }

      }
    }

    ++v8;
  }
  while (v8 != 30);

  objc_autoreleasePoolPop(context);
}

- (double)testL2WithData:(id)a3 experimental:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  id v13;

  v5 = a3;
  -[PRSModelManager models](self, "models");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v9, "predict:error:", v5, &v13);
  v11 = v10;
  if (v13)
    -[PRSModelManager testL2WithData:experimental:].cold.1();

  return v11;
}

- (BOOL)disablePolicy
{
  return self->_disablePolicy;
}

- (void)setDisablePolicy:(BOOL)a3
{
  self->_disablePolicy = a3;
}

- (BOOL)trialEnabled
{
  return self->_trialEnabled;
}

- (void)setTrialEnabled:(BOOL)a3
{
  self->_trialEnabled = a3;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
  objc_storeStrong((id *)&self->_modelType, a3);
}

- (NSMutableDictionary)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
  objc_storeStrong((id *)&self->_models, a3);
}

- (NSString)otherModelsType
{
  return self->_otherModelsType;
}

- (void)setOtherModelsType:(id)a3
{
  objc_storeStrong((id *)&self->_otherModelsType, a3);
}

- (NSMutableDictionary)otherModels
{
  return self->_otherModels;
}

- (void)setOtherModels:(id)a3
{
  objc_storeStrong((id *)&self->_otherModels, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_otherModels, 0);
  objc_storeStrong((id *)&self->_otherModelsType, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelUpdateGroup, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);
}

+ (void)cannedInfoForType:directivesPath:modelName:.cold.1()
{
  __assert_rtn("+[PRSModelManager cannedInfoForType:directivesPath:modelName:]", "PRSModelManager.m", 128, "NO");
}

+ (void)pathsFor:withParentPath:modelPath:directivesPath:.cold.1()
{
  __assert_rtn("+[PRSModelManager pathsFor:withParentPath:modelPath:directivesPath:]", "PRSModelManager.m", 153, "NO");
}

- (void)loadCannedModelWithType:(id *)a1 error:.cold.1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*a1, "code");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1B86C5000, v1, v2, "[Model loading] canned model loading failed in load canned model with err %ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)loadCannedModels
{
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "[Model loading] unrecoverable - failed to load canned model type %@ with err %@", v5, 0x16u);

}

- (void)updateModelsAccordingToHierarchy:(os_log_t)log updateEnabled:disablePendingUpdates:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "[Model loading] Error in loading models", v1, 2u);
}

- (void)computeL2ScoresForVectors:(double)a3 secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:.cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEBUG, "using weights X %f Y %f", (uint8_t *)&v3, 0x16u);
}

- (void)computeL2ScoresForVectors:(void *)a1 secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "modelVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1B86C5000, v2, v3, "unable to compute L2scores with no models; version %@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_3();
}

void __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1B86C5000, v1, v2, "error in L2 model score computation: %ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)testL2WithData:experimental:.cold.1()
{
  __assert_rtn("-[PRSModelManager testL2WithData:experimental:]", "PRSModelManager.m", 687, "error == nil");
}

@end
