@implementation PSGExperimentResolver

void __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
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

void __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
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

void __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
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

void __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
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

void __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  PSGWordBoundarySuggestionsExpConfig *v6;
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
    v3 = (void *)WeakRetained[2];
    v4 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v16[3] = &unk_24FCB4BA8;
    v11 = *(_OWORD *)(a1 + 32);
    v12 = WeakRetained;
    v5 = (id)v11;
    v17 = v11;
    objc_msgSend(v3, "runWithLockAcquired:", v16);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v6 = -[PSGWordBoundarySuggestionsExpConfig initWithNamespaceName:withTrialClient:shouldDownloadAssets:]([PSGWordBoundarySuggestionsExpConfig alloc], "initWithNamespaceName:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), v12[3], *(unsigned __int8 *)(a1 + 56));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 40))
      {
        v10 = (void *)v12[2];
        v13[0] = v4;
        v13[1] = 3221225472;
        v13[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v13[3] = &unk_24FCB4BA8;
        v15 = v9;
        v14 = *(id *)(a1 + 32);
        objc_msgSend(v10, "runWithLockAcquired:", v13);

      }
    }

    WeakRetained = v12;
  }

}

void __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  PSGResponseSuggestionsExpConfig *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    v4 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v14[3] = &unk_24FCB4BA8;
    v16 = *(_QWORD *)(a1 + 48);
    v10 = WeakRetained;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v3, "runWithLockAcquired:", v14);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v5 = -[PSGResponseSuggestionsExpConfig initWithNamespaceName:withLanguage:withTrialClient:shouldDownloadAssets:]([PSGResponseSuggestionsExpConfig alloc], "initWithNamespaceName:withLanguage:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10[3], *(unsigned __int8 *)(a1 + 64));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v8 = *(_QWORD *)(a1 + 48);
      if (*(_QWORD *)(*(_QWORD *)(v8 + 8) + 40))
      {
        v9 = (void *)v10[1];
        v11[0] = v4;
        v11[1] = 3221225472;
        v11[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v11[3] = &unk_24FCB4BA8;
        v13 = v8;
        v12 = *(id *)(a1 + 32);
        objc_msgSend(v9, "runWithLockAcquired:", v11);

      }
    }

    WeakRetained = v10;
  }

}

- (void)warmupForLocale:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](self, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", v6, 1);
  v5 = -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v6, 1);

}

- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  _PASLock *responseSuggestionsConfigLock;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  __int16 v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  BOOL v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v6 = a3;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BE28658], "languageForLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_zkwLangAndNamespaces, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      responseSuggestionsConfigLock = self->_responseSuggestionsConfigLock;
      v10 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v37[3] = &unk_24FCB4BA8;
      v39 = &v40;
      v11 = v7;
      v38 = v11;
      -[_PASLock runWithLockAcquired:](responseSuggestionsConfigLock, "runWithLockAcquired:", v37);
      v12 = v41[5];
      if (v12)
        goto LABEL_9;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      v36 = 0;
      location = 0;
      objc_initWeak(&location, self);
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
      block[3] = &unk_24FCB4BF8;
      objc_copyWeak(&v28, &location);
      v27 = &v31;
      v25 = v8;
      v13 = v11;
      v26 = v13;
      v29 = a4;
      v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      objc_msgSend((id)objc_opt_class(), "sharedZKWQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v14);

      v16 = dispatch_time(0, 1000000000);
      dispatch_block_wait(v14, v16);
      objc_storeStrong(v41 + 5, (id)v32[5]);
      if (!v41[5])
      {
        psg_default_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 0;
          _os_log_impl(&dword_22F6A5000, v17, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)&v23, 2u);
        }

        -[PSGExperimentResolver _getDefaultResponseSuggestionsExperimentConfig:](self, "_getDefaultResponseSuggestionsExperimentConfig:", v13);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v41[5];
        v41[5] = (id)v18;

      }
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v31, 8);

      v12 = v41[5];
      if (v12)
      {
LABEL_9:
        v20 = v12;
      }
      else
      {
        -[PSGExperimentResolver _getDefaultResponseSuggestionsExperimentConfig:](self, "_getDefaultResponseSuggestionsExperimentConfig:", v13);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;

    }
    else
    {
      -[PSGExperimentResolver _getDefaultResponseSuggestionsExperimentConfig:](self, "_getDefaultResponseSuggestionsExperimentConfig:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[PSGExperimentResolver _getDefaultResponseSuggestionsExperimentConfig:](self, "_getDefaultResponseSuggestionsExperimentConfig:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v40, 8);

  return v21;
}

- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  _PASLock *wordBoundaryConfigLock;
  uint64_t v10;
  id v11;
  id v12;
  dispatch_block_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  __int16 v22[8];
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  id v26;
  BOOL v27;
  id location;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BE28658], "languageForLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_wordBoundaryLangAndNamespaces, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      wordBoundaryConfigLock = self->_wordBoundaryConfigLock;
      v10 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v35[3] = &unk_24FCB4BA8;
      v37 = &v38;
      v11 = v7;
      v36 = v11;
      -[_PASLock runWithLockAcquired:](wordBoundaryConfigLock, "runWithLockAcquired:", v35);
      v12 = v39[5];
      if (v12)
        goto LABEL_9;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy_;
      v33 = __Block_byref_object_dispose_;
      v34 = 0;
      location = 0;
      objc_initWeak(&location, self);
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
      block[3] = &unk_24FCB4BD0;
      objc_copyWeak(&v26, &location);
      v25 = &v29;
      v24 = v8;
      v27 = a4;
      v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      objc_msgSend((id)objc_opt_class(), "sharedWordBoundaryQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v14, v13);

      v15 = dispatch_time(0, 1000000000);
      dispatch_block_wait(v13, v15);
      objc_storeStrong(v39 + 5, (id)v30[5]);
      if (!v39[5])
      {
        psg_default_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v22[0] = 0;
          _os_log_impl(&dword_22F6A5000, v16, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)v22, 2u);
        }

        -[PSGExperimentResolver _getDefaultWordBoundarySuggestionsExperimentConfig:](self, "_getDefaultWordBoundarySuggestionsExperimentConfig:", v11);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v39[5];
        v39[5] = (id)v17;

      }
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v29, 8);

      v12 = v39[5];
      if (v12)
      {
LABEL_9:
        v19 = v12;
      }
      else
      {
        -[PSGExperimentResolver _getDefaultWordBoundarySuggestionsExperimentConfig:](self, "_getDefaultWordBoundarySuggestionsExperimentConfig:", v11);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;

    }
    else
    {
      -[PSGExperimentResolver _getDefaultWordBoundarySuggestionsExperimentConfig:](self, "_getDefaultWordBoundarySuggestionsExperimentConfig:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[PSGExperimentResolver _getDefaultWordBoundarySuggestionsExperimentConfig:](self, "_getDefaultWordBoundarySuggestionsExperimentConfig:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v38, 8);

  return v20;
}

+ (id)sharedZKWQueue
{
  if (sharedZKWQueue__pasOnceToken5 != -1)
    dispatch_once(&sharedZKWQueue__pasOnceToken5, &__block_literal_global_52);
  return (id)sharedZKWQueue__pasExprOnceResult;
}

+ (id)sharedWordBoundaryQueue
{
  if (sharedWordBoundaryQueue__pasOnceToken4 != -1)
    dispatch_once(&sharedWordBoundaryQueue__pasOnceToken4, &__block_literal_global_1031);
  return (id)sharedWordBoundaryQueue__pasExprOnceResult;
}

+ (PSGExperimentResolver)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PSGExperimentResolver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, block);
  return (PSGExperimentResolver *)(id)sharedInstance__pasExprOnceResult;
}

- (PSGExperimentResolver)init
{
  PSGExperimentResolver *v2;
  uint64_t v3;
  TRIClient *trialClient;
  NSObject *v5;
  uint64_t v6;
  NSDictionary *zkwLangAndNamespaces;
  uint64_t v8;
  NSDictionary *wordBoundaryLangAndNamespaces;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *responseSuggestionsConfigLock;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *wordBoundaryConfigLock;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  TRIClient *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  TRIClient *v32;
  id v33;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  uint8_t buf[8];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)PSGExperimentResolver;
  v2 = -[PSGExperimentResolver init](&v49, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 103);
    v3 = objc_claimAutoreleasedReturnValue();
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

    psg_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 103;
      _os_log_impl(&dword_22F6A5000, v5, OS_LOG_TYPE_DEFAULT, "PSGExperimentResolver -- setting up trial client for client id %d", buf, 8u);
    }

    v54[0] = CFSTR("en");
    v54[1] = CFSTR("zh-Hans");
    v55[0] = CFSTR("QUICK_TYPE_ZKW_EN");
    v55[1] = CFSTR("QUICK_TYPE_ZKW_ZH_HANS");
    v54[2] = CFSTR("ja");
    v54[3] = CFSTR("es");
    v55[2] = CFSTR("QUICK_TYPE_ZKW_JP");
    v55[3] = CFSTR("QUICK_TYPE_ZKW_ES");
    v54[4] = CFSTR("fr");
    v55[4] = CFSTR("QUICK_TYPE_ZKW_FR");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
    v6 = objc_claimAutoreleasedReturnValue();
    zkwLangAndNamespaces = v2->_zkwLangAndNamespaces;
    v2->_zkwLangAndNamespaces = (NSDictionary *)v6;

    v52[0] = CFSTR("en");
    v52[1] = CFSTR("zh-Hans");
    v53[0] = CFSTR("QUICK_TYPE_WB_EN");
    v53[1] = CFSTR("QUICK_TYPE_WB_ZH_HANS");
    v52[2] = CFSTR("ja");
    v52[3] = CFSTR("es");
    v53[2] = CFSTR("QUICK_TYPE_WB_JP");
    v53[3] = CFSTR("QUICK_TYPE_WB_ES");
    v52[4] = CFSTR("fr");
    v53[4] = CFSTR("QUICK_TYPE_WB_FR");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    wordBoundaryLangAndNamespaces = v2->_wordBoundaryLangAndNamespaces;
    v2->_wordBoundaryLangAndNamespaces = (NSDictionary *)v8;

    v10 = objc_alloc(MEMORY[0x24BE7A610]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    responseSuggestionsConfigLock = v2->_responseSuggestionsConfigLock;
    v2->_responseSuggestionsConfigLock = (_PASLock *)v12;

    v14 = objc_alloc(MEMORY[0x24BE7A610]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15);
    wordBoundaryConfigLock = v2->_wordBoundaryConfigLock;
    v2->_wordBoundaryConfigLock = (_PASLock *)v16;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v2);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[NSDictionary allKeys](v2->_zkwLangAndNamespaces, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v2->_zkwLangAndNamespaces, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v2->_trialClient;
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __29__PSGExperimentResolver_init__block_invoke;
          v41[3] = &unk_24FCB4AD0;
          objc_copyWeak(&v44, (id *)buf);
          v25 = v23;
          v42 = v25;
          v43 = v22;
          v26 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v24, "addUpdateHandlerForNamespaceName:usingBlock:", v25, v41);

          objc_destroyWeak(&v44);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v19);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSDictionary allValues](v2->_wordBoundaryLangAndNamespaces, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v27);
          v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v32 = v2->_trialClient;
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __29__PSGExperimentResolver_init__block_invoke_5;
          v35[3] = &unk_24FCB4B20;
          objc_copyWeak(&v36, (id *)buf);
          v35[4] = v31;
          v33 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v32, "addUpdateHandlerForNamespaceName:usingBlock:", v31, v35);
          objc_destroyWeak(&v36);
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v28);
    }

    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3
{
  return -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](self, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", a3, 0);
}

- (id)getResponseSuggestionsExperimentConfig:(id)a3
{
  return -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", a3, 0);
}

- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_getDefaultWordBoundarySuggestionsExperimentConfig:(id)a3
{
  return (id)objc_opt_new();
}

- (NSDictionary)zkwLangAndNamespaces
{
  return self->_zkwLangAndNamespaces;
}

- (NSDictionary)wordBoundaryLangAndNamespaces
{
  return self->_wordBoundaryLangAndNamespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordBoundaryLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_zkwLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_wordBoundaryConfigLock, 0);
  objc_storeStrong((id *)&self->_responseSuggestionsConfigLock, 0);
}

uint64_t __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

void __29__PSGExperimentResolver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  dispatch_block_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__PSGExperimentResolver_init__block_invoke_2;
  block[3] = &unk_24FCB4AA8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  +[PSGExperimentResolver sharedZKWQueue](PSGExperimentResolver, "sharedZKWQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

  objc_destroyWeak(&v11);
}

void __29__PSGExperimentResolver_init__block_invoke_5(uint64_t a1, void *a2)
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
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __29__PSGExperimentResolver_init__block_invoke_6;
  v9 = &unk_24FCB4AF8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 32);
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v6);
  +[PSGExperimentResolver sharedWordBoundaryQueue](PSGExperimentResolver, "sharedWordBoundaryQueue", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

  objc_destroyWeak(&v11);
}

void __29__PSGExperimentResolver_init__block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  PSGWordBoundarySuggestionsExpConfig *v5;
  PSGWordBoundarySuggestionsExpConfig *v6;
  void *v7;
  PSGWordBoundarySuggestionsExpConfig *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD v11[4];
  PSGWordBoundarySuggestionsExpConfig *v12;
  uint64_t v13;
  _QWORD v14[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = (void *)WeakRetained[2];
    v4 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __29__PSGExperimentResolver_init__block_invoke_7;
    v14[3] = &unk_24FCB4A58;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "runWithLockAcquired:", v14);
    v5 = -[PSGWordBoundarySuggestionsExpConfig initWithNamespaceName:withTrialClient:shouldDownloadAssets:]([PSGWordBoundarySuggestionsExpConfig alloc], "initWithNamespaceName:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), v10[3], 0);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)v10[2];
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __29__PSGExperimentResolver_init__block_invoke_8;
      v11[3] = &unk_24FCB4A80;
      v8 = v5;
      v9 = *(_QWORD *)(a1 + 32);
      v12 = v8;
      v13 = v9;
      objc_msgSend(v7, "runWithLockAcquired:", v11);

    }
    WeakRetained = v10;
  }

}

uint64_t __29__PSGExperimentResolver_init__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __29__PSGExperimentResolver_init__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  PSGResponseSuggestionsExpConfig *v5;
  PSGResponseSuggestionsExpConfig *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[4];
  PSGResponseSuggestionsExpConfig *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = MEMORY[0x24BDAC760];
    v4 = (void *)WeakRetained[1];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __29__PSGExperimentResolver_init__block_invoke_3;
    v12[3] = &unk_24FCB4A58;
    v8 = WeakRetained;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v4, "runWithLockAcquired:", v12);
    v5 = -[PSGResponseSuggestionsExpConfig initWithNamespaceName:withLanguage:withTrialClient:shouldDownloadAssets:]([PSGResponseSuggestionsExpConfig alloc], "initWithNamespaceName:withLanguage:withTrialClient:shouldDownloadAssets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8[3], 0);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)v8[1];
      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __29__PSGExperimentResolver_init__block_invoke_4;
      v9[3] = &unk_24FCB4A80;
      v10 = v5;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v7, "runWithLockAcquired:", v9);

    }
    WeakRetained = v8;
  }

}

uint64_t __29__PSGExperimentResolver_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __39__PSGExperimentResolver_sharedZKWQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGResponseSuggestions-initNamespace", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedZKWQueue__pasExprOnceResult;
  sharedZKWQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __48__PSGExperimentResolver_sharedWordBoundaryQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGWordBoundary-initNamespace", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedWordBoundaryQueue__pasExprOnceResult;
  sharedWordBoundaryQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __39__PSGExperimentResolver_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
