@implementation WBSTranslationAvailability

+ (id)sharedAvailability
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSTranslationAvailability_sharedAvailability__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAvailability_onceToken != -1)
    dispatch_once(&sharedAvailability_onceToken, block);
  return (id)sharedAvailability_sharedInstance;
}

void __48__WBSTranslationAvailability_sharedAvailability__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedAvailability_sharedInstance;
  sharedAvailability_sharedInstance = (uint64_t)v1;

}

- (WBSTranslationAvailability)init
{
  return (WBSTranslationAvailability *)-[WBSTranslationAvailability _initWithAvailabilityProvider:](self, "_initWithAvailabilityProvider:", self);
}

- (id)_initWithAvailabilityProvider:(id)a3
{
  id v4;
  WBSTranslationAvailability *v5;
  WBSTranslationAvailability *v6;
  void *v7;
  WBSTranslationAvailability *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTranslationAvailability;
  v5 = -[WBSTranslationAvailability init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_availabilityProvider, v4);
    -[WBSTranslationAvailability _updateCachedValues](v6, "_updateCachedValues");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__didUpdateSupportedRegionAndLocalePairs, *MEMORY[0x1E0C99720], 0);

    v8 = v6;
  }

  return v6;
}

- (void)getTranslationAvailabilityWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, uint64_t);
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, uint64_t))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__26;
  v14 = __Block_byref_object_dispose__26;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5444748;
  v9[4] = self;
  v9[5] = &v10;
  performWithLock(&self->_lock, v9);
  v6 = (void *)v11[5];
  if (v6)
  {
    v4[2](v4, objc_msgSend(v6, "BOOLValue"));
  }
  else
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E5443108;
    v7[4] = self;
    v8 = v4;
    performWithLock(&self->_lock, v7);

  }
  _Block_object_dispose(&v10, 8);

}

void __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1A85D45E4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5446F88;
  v8 = v2;
  v9 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = MEMORY[0x1A85D45E4](v7);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

}

uint64_t __78__WBSTranslationAvailability_getTranslationAvailabilityWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getAvailableLocalePairsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  _QWORD v6[5];
  void (**v7)(id, _QWORD);
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (void (**)(id, _QWORD))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5446FB0;
  v8[4] = self;
  v8[5] = &v13;
  v8[6] = &v9;
  performWithLock(&self->_lock, v8);
  if (*((_BYTE *)v10 + 24))
  {
    v4[2](v4, v14[5]);
  }
  else
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5443108;
    v6[4] = self;
    v7 = v4;
    performWithLock(&self->_lock, v6);

  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

}

void __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 32);
}

void __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1A85D45E4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5446FD8;
  v8 = v2;
  v9 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = MEMORY[0x1A85D45E4](v7);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

}

void __75__WBSTranslationAvailability_getAvailableLocalePairsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getAllTargetLocalesInUserPreferredOrderWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5443DC8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[WBSTranslationAvailability getAvailableLocalePairsWithCompletionHandler:](self, "getAvailableLocalePairsWithCompletionHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__26;
    v19 = __Block_byref_object_dispose__26;
    v20 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E5444748;
    v14[4] = WeakRetained;
    v14[5] = &v15;
    performWithLock(WeakRetained + 2, v14);
    objc_msgSend((id)v16[5], "userPreferredTargetLocales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    availablePreferredTargetLocalesFilteredBySupportedLocales(v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v8);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E5447000;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __91__WBSTranslationAvailability_getAllTargetLocalesInUserPreferredOrderWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "targetLocaleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *LTTranslatorClass;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = preferredTaskHint();
  LTTranslatorClass = get_LTTranslatorClass();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__WBSTranslationAvailability_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441E68;
  v8 = v3;
  v6 = v3;
  -[objc_class taskIsSupportedInCurrentRegion:completion:](LTTranslatorClass, "taskIsSupportedInCurrentRegion:completion:", v4, v7);

}

uint64_t __90__WBSTranslationAvailability_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v6 = v5;
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Translation supported in current region result from Translation.framework: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *LTTranslatorClass;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (get_LTTranslatorClass())
  {
    v4 = preferredTaskHint();
    LTTranslatorClass = get_LTTranslatorClass();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5443B08;
    v7 = v3;
    -[objc_class availableLocalePairsForTask:completion:](LTTranslatorClass, "availableLocalePairsForTask:completion:", v4, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, MEMORY[0x1E0C9AA60]);
  }

}

void __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Translation supported pairs from Translation.framework: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

WBSLocalePair *__72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSLocalePair *v3;

  v2 = a2;
  v3 = -[WBSLocalePair initWithLTLocalePair:]([WBSLocalePair alloc], "initWithLTLocalePair:", v2);

  return v3;
}

uint64_t __72__WBSTranslationAvailability_supportedLocalePairsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compactDescriptionForLogging");
}

- (NSArray)userPreferredTargetLocales
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__26;
  v16 = __Block_byref_object_dispose__26;
  v17 = 0;
  p_lock = &self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke;
  v11[3] = &unk_1E5444748;
  v11[4] = self;
  v11[5] = &v12;
  performWithLock(&self->_lock, v11);
  v5 = (void *)v13[5];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v13[5];
    v13[5] = v6;

    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke_2;
    v10[3] = &unk_1E5445AB0;
    v10[4] = self;
    v10[5] = &v12;
    performWithLock(p_lock, v10);
    v5 = (void *)v13[5];
  }
  v8 = v5;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v8;
}

void __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __56__WBSTranslationAvailability_userPreferredTargetLocales__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_updateCachedValues
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  id from;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id location;

  objc_initWeak(&location, self);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  v27 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke;
  v21[3] = &unk_1E5444748;
  v21[4] = self;
  v21[5] = &v22;
  performWithLock(&self->_lock, v21);
  v4 = dispatch_group_create();
  objc_initWeak(&from, (id)v23[5]);
  dispatch_group_enter(v4);
  v5 = (void *)v23[5];
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_2;
  v16[3] = &unk_1E54470D0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v6 = v4;
  v17 = v6;
  objc_msgSend(v5, "isTranslationSupportedForCurrentRegionWithCompletionHandler:", v16);
  dispatch_group_enter(v6);
  v7 = (void *)v23[5];
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_4;
  v12[3] = &unk_1E5447120;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "supportedLocalePairsWithCompletionHandler:", v12);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_6;
  v9[3] = &unk_1E5447170;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);

  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&location);
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_2(uint64_t a1, char a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_3;
    v6[3] = &unk_1E54470A8;
    v6[4] = WeakRetained;
    objc_copyWeak(&v7, (id *)(a1 + 48));
    v8 = a2;
    performWithLock(v5 + 2, v6);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    objc_destroyWeak(&v7);
  }

}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained == v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_5;
    v6[3] = &unk_1E54470F8;
    v6[4] = WeakRetained;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    v7 = v3;
    performWithLock(v5 + 2, v6);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

    objc_destroyWeak(&v8);
  }

}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained == v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  }
}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_6(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  _QWORD v4[6];
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__WBSTranslationAvailability__updateCachedValues__block_invoke_7;
    v4[3] = &unk_1E5447148;
    v4[4] = WeakRetained;
    v4[5] = &v6;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    performWithLock(v3 + 2, v4);
    if (*((_BYTE *)v7 + 24))
      -[os_unfair_lock_s _didUpdateSupportedRegionAndLocalePairs](v3, "_didUpdateSupportedRegionAndLocalePairs");
    objc_destroyWeak(&v5);
    _Block_object_dispose(&v6, 8);
  }

}

void __49__WBSTranslationAvailability__updateCachedValues__block_invoke_7(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained == v2;

}

- (void)_didUpdateSupportedRegionAndLocalePairs
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[9];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__26;
  v22 = __Block_byref_object_dispose__26;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35;
  v16 = __Block_byref_object_dispose__36;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__WBSTranslationAvailability__didUpdateSupportedRegionAndLocalePairs__block_invoke;
  v5[3] = &unk_1E5447198;
  v5[4] = self;
  v5[5] = &v24;
  v5[6] = &v18;
  v5[7] = &v12;
  v5[8] = &v6;
  performWithLock(&self->_lock, v5);
  v2 = v13[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *((unsigned __int8 *)v25 + 24));
  v3 = v7[5];
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v19[5]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("translationAvailabilityDidChange"), 0);

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
}

void __69__WBSTranslationAvailability__didUpdateSupportedRegionAndLocalePairs__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 40), "BOOLValue");
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  v2 = MEMORY[0x1A85D45E4](*(_QWORD *)(a1[4] + 56));
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = MEMORY[0x1A85D45E4](*(_QWORD *)(a1[4] + 64));
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = a1[4];
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = 0;

  v10 = a1[4];
  v11 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = 0;

  v12 = a1[4];
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availableLocalePairsCompletionHandler, 0);
  objc_storeStrong(&self->_availableInCurrentRegionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedUserPreferredLocales, 0);
  objc_storeStrong((id *)&self->_cachedTranslationAvailableInCurrentRegion, 0);
  objc_storeStrong((id *)&self->_cachedAvailableLocalePairs, 0);
  objc_destroyWeak((id *)&self->_availabilityProvider);
}

@end
