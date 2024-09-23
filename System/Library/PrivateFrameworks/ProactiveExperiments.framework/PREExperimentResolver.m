@implementation PREExperimentResolver

- (PREExperimentResolver)init
{
  uint64_t v2;
  TRIClient *trialClient;
  NSObject *v4;
  uint64_t v5;
  NSDictionary *smartReplyLangAndNamespaces;
  id v7;
  void *v8;
  uint64_t v9;
  _PASLock *guardedSmartReplyConfig;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TRIClient *v17;
  id v18;
  PREExperimentResolver *val;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _QWORD v29[7];
  _QWORD v30[7];
  uint8_t buf[8];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PREExperimentResolver;
  val = -[PREExperimentResolver init](&v27, sel_init);
  if (val)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 101);
    v2 = objc_claimAutoreleasedReturnValue();
    trialClient = val->_trialClient;
    val->_trialClient = (TRIClient *)v2;

    pre_responses_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 101;
      _os_log_impl(&dword_1C35DB000, v4, OS_LOG_TYPE_DEFAULT, "PREExperimentResolver -- setting up trial client for client id %d", buf, 8u);
    }

    v29[0] = CFSTR("en");
    v29[1] = CFSTR("es");
    v30[0] = CFSTR("SMART_REPLY_EN");
    v30[1] = CFSTR("SMART_REPLY_ES");
    v29[2] = CFSTR("fr");
    v29[3] = CFSTR("hi");
    v30[2] = CFSTR("SMART_REPLY_FR");
    v30[3] = CFSTR("SMART_REPLY_HI");
    v29[4] = CFSTR("hi-Latn");
    v29[5] = CFSTR("ja");
    v30[4] = CFSTR("SMART_REPLY_HI_LATN");
    v30[5] = CFSTR("SMART_REPLY_JP");
    v29[6] = CFSTR("zh-Hans");
    v30[6] = CFSTR("SMART_REPLY_ZH_HANS");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
    v5 = objc_claimAutoreleasedReturnValue();
    smartReplyLangAndNamespaces = val->_smartReplyLangAndNamespaces;
    val->_smartReplyLangAndNamespaces = (NSDictionary *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D815F0]);
    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(v7, "initWithGuardedData:", v8);
    guardedSmartReplyConfig = val->_guardedSmartReplyConfig;
    val->_guardedSmartReplyConfig = (_PASLock *)v9;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, val);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSDictionary allValues](val->_smartReplyLangAndNamespaces, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      v14 = MEMORY[0x1E0C809B0];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
          v17 = val->_trialClient;
          v21[0] = v14;
          v21[1] = 3221225472;
          v21[2] = __29__PREExperimentResolver_init__block_invoke;
          v21[3] = &unk_1E7D9E198;
          objc_copyWeak(&v22, (id *)buf);
          v21[4] = v16;
          v18 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v17, "addUpdateHandlerForNamespaceName:usingBlock:", v16, v21);
          objc_destroyWeak(&v22);
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    objc_destroyWeak((id *)buf);
  }
  return val;
}

- (void)warmupForLocale:(id)a3
{
  id v3;

  v3 = -[PREExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", a3, 1);
}

- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _PASLock *guardedSmartReplyConfig;
  uint64_t v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  __int16 v23;
  _QWORD block[4];
  id v25;
  uint8_t *v26;
  id v27;
  BOOL v28;
  id location;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKey:](self->_smartReplyLangAndNamespaces, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      guardedSmartReplyConfig = self->_guardedSmartReplyConfig;
      v11 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v36[3] = &unk_1E7D9E1E0;
      v38 = &v39;
      v12 = v8;
      v37 = v12;
      -[_PASLock runWithLockAcquired:](guardedSmartReplyConfig, "runWithLockAcquired:", v36);
      v13 = v40[5];
      if (!v13)
      {
        *(_QWORD *)buf = 0;
        v31 = buf;
        v32 = 0x3032000000;
        v33 = __Block_byref_object_copy_;
        v34 = __Block_byref_object_dispose_;
        v35 = 0;
        location = 0;
        objc_initWeak(&location, self);
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
        block[3] = &unk_1E7D9E208;
        objc_copyWeak(&v27, &location);
        v26 = buf;
        v25 = v12;
        v28 = a4;
        v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        objc_msgSend((id)objc_opt_class(), "sharedQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v15, v14);

        v16 = dispatch_time(0, 1000000000);
        dispatch_block_wait(v14, v16);
        objc_storeStrong(v40 + 5, *((id *)v31 + 5));
        if (!v40[5])
        {
          pre_responses_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v23 = 0;
            _os_log_impl(&dword_1C35DB000, v17, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)&v23, 2u);
          }

          -[PREExperimentResolver _getDefaultResponseSuggestionsExperimentConfig:](self, "_getDefaultResponseSuggestionsExperimentConfig:", v7);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v40[5];
          v40[5] = (id)v18;

        }
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);

        v13 = v40[5];
        if (!v13)
        {
          pre_responses_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C35DB000, v20, OS_LOG_TYPE_FAULT, "No Smart Reply experiment configuration found, no default supplied", buf, 2u);
          }

          v13 = v40[5];
        }
      }
      v21 = v13;

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
    v7 = v6;
  }
  _Block_object_dispose(&v39, 8);

  return v21;
}

- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3
{
  return -[PREResponseSuggestionsExpConfig initWithNamespaceName:withTrialClient:shouldDownloadAssets:]([PREResponseSuggestionsExpConfig alloc], "initWithNamespaceName:withTrialClient:shouldDownloadAssets:", 0, self->_trialClient, 0);
}

- (NSDictionary)smartReplyLangAndNamespaces
{
  return self->_smartReplyLangAndNamespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_guardedSmartReplyConfig, 0);
}

void __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  PREResponseSuggestionsExpConfig *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  __int128 v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    v4 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v16[3] = &unk_1E7D9E1E0;
    v11 = *(_OWORD *)(a1 + 32);
    v12 = WeakRetained;
    v5 = (id)v11;
    v17 = v11;
    objc_msgSend(v3, "runWithLockAcquired:", v16);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v6 = -[PREResponseSuggestionsExpConfig initWithNamespaceName:withTrialClient:shouldDownloadAssets:]([PREResponseSuggestionsExpConfig alloc], "initWithNamespaceName:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), v12[2], *(unsigned __int8 *)(a1 + 56));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 40))
      {
        v10 = (void *)v12[1];
        v13[0] = v4;
        v13[1] = 3221225472;
        v13[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v13[3] = &unk_1E7D9E1E0;
        v15 = v9;
        v14 = *(id *)(a1 + 32);
        objc_msgSend(v10, "runWithLockAcquired:", v13);

      }
    }

    WeakRetained = v12;
  }

}

void __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

void __29__PREExperimentResolver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_block_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __29__PREExperimentResolver_init__block_invoke_2;
  v9 = &unk_1E7D9E5B0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 32);
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v6);
  +[PREExperimentResolver sharedQueue](PREExperimentResolver, "sharedQueue", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

  objc_destroyWeak(&v11);
}

void __29__PREExperimentResolver_init__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  PREResponseSuggestionsExpConfig *v5;
  PREResponseSuggestionsExpConfig *v6;
  void *v7;
  PREResponseSuggestionsExpConfig *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD v11[4];
  PREResponseSuggestionsExpConfig *v12;
  uint64_t v13;
  _QWORD v14[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = (void *)WeakRetained[1];
    v4 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __29__PREExperimentResolver_init__block_invoke_3;
    v14[3] = &unk_1E7D9E148;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "runWithLockAcquired:", v14);
    v5 = -[PREResponseSuggestionsExpConfig initWithNamespaceName:withTrialClient:shouldDownloadAssets:]([PREResponseSuggestionsExpConfig alloc], "initWithNamespaceName:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), v10[2], 0);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)v10[1];
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __29__PREExperimentResolver_init__block_invoke_4;
      v11[3] = &unk_1E7D9E170;
      v8 = v5;
      v9 = *(_QWORD *)(a1 + 32);
      v12 = v8;
      v13 = v9;
      objc_msgSend(v7, "runWithLockAcquired:", v11);

    }
    WeakRetained = v10;
  }

}

uint64_t __29__PREExperimentResolver_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__PREExperimentResolver_init__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PREExperimentResolver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, block);
  return (id)sharedInstance__pasExprOnceResult_1310;
}

+ (id)sharedQueue
{
  if (sharedQueue__pasOnceToken4 != -1)
    dispatch_once(&sharedQueue__pasOnceToken4, &__block_literal_global_1309);
  return (id)sharedQueue__pasExprOnceResult;
}

void __36__PREExperimentResolver_sharedQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PREResponseSuggestions-initNamespace", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedQueue__pasExprOnceResult;
  sharedQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __39__PREExperimentResolver_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1310;
  sharedInstance__pasExprOnceResult_1310 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
