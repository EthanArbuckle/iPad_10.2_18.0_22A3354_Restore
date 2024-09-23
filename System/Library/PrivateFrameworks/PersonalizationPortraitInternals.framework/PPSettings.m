@implementation PPSettings

uint64_t __46__PPSettings_isAppConnectionsLocationsEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 52);
  return result;
}

void __18__PPSettings_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPSettings: Suggestions settings changed", v3, 2u);
  }

  -[PPSettings _updateAppConnectionsSettings](*(_QWORD **)(a1 + 32));
}

- (void)_updateAppConnectionsSettings
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  _QWORD v6[5];
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    pp_default_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPSettings: reading App Connections settings...", buf, 2u);
    }

    v3 = (void *)a1[3];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__PPSettings__updateAppConnectionsSettings__block_invoke;
    v6[3] = &unk_1E7E15FF8;
    v6[4] = a1;
    objc_msgSend(v3, "runWithLockAcquired:", v6);
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(a1, "isAppConnectionsLocationsEnabled");
      *(_DWORD *)buf = 67109120;
      v8 = v5;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPSettings: appConnectionsLocationsEnabled = %d", buf, 8u);
    }

  }
}

- (BOOL)isAppConnectionsLocationsEnabled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PPSettings_isAppConnectionsLocationsEnabled__block_invoke;
  v5[3] = &unk_1E7E16068;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__PPSettings__updateAppConnectionsSettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BYTE *v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v3[52] = objc_msgSend(v2, "showLocationsFoundInApps");

}

- (BOOL)showLocationsFoundInApps
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D70E20];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", v2) ^ 1;

  return v2;
}

uint64_t __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke_2(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *(unsigned int **)(result + 40);
  do
  {
    v2 = __ldaxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __52__PPSettings__purgeRecordsForDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v23;
  id obj;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PPSettings _refreshDisabledBundleIds](*(_QWORD *)(a1 + 32));
  -[PPSettings _donationDisabledBundleIds](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "PPSettings triggering purge of records from %lu disabled bundleIds.", buf, 0xCu);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v29;
    *(_QWORD *)&v5 = 138412290;
    v23 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8);
        +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore", v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v11 = objc_msgSend(v10, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", v9, 0, &v27);
        v12 = v27;

        if ((v11 & 1) == 0)
        {
          pp_default_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v34 = (uint64_t)v12;
            _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPSettings failed to purge named entity records from disabled bundleId: %@", buf, 0xCu);
          }

        }
        +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v15 = objc_msgSend(v14, "deleteAllTopicsFromSourcesWithBundleId:deletedCount:error:", v9, 0, &v26);
        v16 = v26;

        if ((v15 & 1) == 0)
        {
          pp_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v34 = (uint64_t)v16;
            _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPSettings failed to purge topic records from disabled bundleId: %@", buf, 0xCu);
          }

        }
        +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v19 = objc_msgSend(v18, "deleteAllLocationsFromSourcesWithBundleId:deletedCount:error:", v9, 0, &v25);
        v20 = v25;

        if ((v19 & 1) == 0)
        {
          pp_default_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v34 = (uint64_t)v20;
            _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPSettings failed to purge location records from disabled bundleId: %@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  pp_default_log_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPSettings completed disabled bundleId purge.", buf, 2u);
  }

  atomic_store(0, _purgeRecordsForDisabledBundleIdsAsync_isInQueue);
}

void __42__PPSettings__triggerDelayedBundleIdPurge__block_invoke(uint64_t a1)
{
  -[PPSettings _purgeRecordsForDisabledBundleIdsAsync](*(_QWORD *)(a1 + 32));
}

void __40__PPSettings__donationDisabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __39__PPSettings__refreshDisabledBundleIds__block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  id *v4;
  id v5;
  id *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2 + 2;
  v5 = a2[2];
  v6 = a2;
  objc_msgSend(v3, "minusSet:", v5);
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPSettings disabled bundles: %@ newly disabled: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong(v4, *(id *)(a1 + 40));
}

- (void)_refreshDisabledBundleIds
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, id *);
  void *v19;
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("SiriCanLearnFromAppBlacklist"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
      v5 = (void *)MEMORY[0x1E0C9AA60];
      if (v3)
        v5 = (void *)v3;
      v6 = v5;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
        objc_msgSend(v7, "addObject:", *MEMORY[0x1E0D70E08]);
        if (!+[PPSettings isVoiceAssistantEnabled](PPSettings, "isVoiceAssistantEnabled"))
        {
          v8 = (void *)MEMORY[0x1C3BD6630]();
          pp_default_log_handle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "Portrait access to Siri is disabled.", buf, 2u);
          }

          objc_msgSend(v7, "addObject:", *MEMORY[0x1E0D70E78]);
          objc_autoreleasePoolPop(v8);
        }
        v10 = (void *)objc_msgSend(v7, "mutableCopy");
        v11 = *(void **)(a1 + 24);
        v16 = MEMORY[0x1E0C809B0];
        v17 = 3221225472;
        v18 = __39__PPSettings__refreshDisabledBundleIds__block_invoke;
        v19 = &unk_1E7E16020;
        v20 = v10;
        v12 = v7;
        v21 = v12;
        v13 = v10;
        objc_msgSend(v11, "runWithLockAcquired:", &v16);
        pp_default_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = -[NSObject count](v12, "count", v16, v17, v18, v19, v20, v21);
          *(_DWORD *)buf = 134217984;
          v23 = v15;
          _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPSettings loaded %lu disabled bundleIds from prefs", buf, 0xCu);
        }

      }
      else
      {
        pp_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPSettings found unexpected value type for disabled bundleIds.", buf, 2u);
        }
      }

    }
  }
}

- (void)_purgeRecordsForDisabledBundleIdsAsync
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    while (!__ldaxr(_purgeRecordsForDisabledBundleIdsAsync_isInQueue))
    {
      if (!__stlxr(1u, _purgeRecordsForDisabledBundleIdsAsync_isInQueue))
      {
        v2 = *(NSObject **)(a1 + 32);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52__PPSettings__purgeRecordsForDisabledBundleIdsAsync__block_invoke;
        block[3] = &unk_1E7E1F4F0;
        block[4] = a1;
        dispatch_async(v2, block);
        return;
      }
    }
    __clrex();
  }
}

- (id)_donationDisabledBundleIds
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3032;
    v13 = __Block_byref_object_dispose__3033;
    v14 = 0;
    v2 = MEMORY[0x1E0C809B0];
    v3 = *(void **)(a1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PPSettings__donationDisabledBundleIds__block_invoke;
    v8[3] = &unk_1E7E16068;
    v8[4] = &v9;
    objc_msgSend(v3, "runWithLockAcquired:", v8);
    v4 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    if (!v4)
    {
      -[PPSettings _refreshDisabledBundleIds](a1);
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__3032;
      v13 = __Block_byref_object_dispose__3033;
      v14 = 0;
      v5 = *(void **)(a1 + 24);
      v7[0] = v2;
      v7[1] = 3221225472;
      v7[2] = __40__PPSettings__donationDisabledBundleIds__block_invoke_2;
      v7[3] = &unk_1E7E16068;
      v7[4] = &v9;
      objc_msgSend(v5, "runWithLockAcquired:", v7);
      v4 = (id)v10[5];
      _Block_object_dispose(&v9, 8);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isVoiceAssistantEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

- (PPSettings)init
{
  PPSettings *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *initializationComplete;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSObject *v20;
  PPSettings *v21;
  uint32_t v22;
  NSObject *v23;
  uint64_t v24;
  NSUserDefaults *portraitDefaults;
  void (**v26)(_QWORD);
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  void *v30;
  _PASLock *v31;
  id v32;
  id v33;
  uint64_t v34;
  PPKVOObserver *weightKVOObserver;
  uint64_t v36;
  PPKVOObserver *abGroupKVObserver;
  uint64_t v38;
  PPKVOObserver *queryPlanLoggingKVOObserver;
  NSObject *v40;
  uint64_t v41;
  NSUserDefaults *canLearnFromAppDefaults;
  PPSettings *v43;
  void *v44;
  uint64_t v45;
  PPKVOObserver *canLearnFromAppKVOObserver;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  _QWORD v52[4];
  PPSettings *v53;
  _QWORD block[4];
  PPSettings *v55;
  _QWORD v56[4];
  PPSettings *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD aBlock[4];
  id v67;
  _QWORD handler[4];
  PPSettings *v69;
  int out_token;
  objc_super v71;
  _BYTE location[12];
  __int16 v73;
  uint32_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)PPSettings;
  v2 = -[PPSettings init](&v71, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = objc_opt_new();
    v5 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v4;

    v6 = objc_opt_new();
    v7 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v6;

    v8 = objc_opt_new();
    v9 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v8;

    *(_DWORD *)(v3 + 48) = 1;
    v10 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

    v11 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

    v12 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v13;

    v15 = dispatch_semaphore_create(0);
    initializationComplete = v2->_initializationComplete;
    v2->_initializationComplete = (OS_dispatch_semaphore *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.proactive.portrait.PPSettings", v17);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v18;

    -[PPSettings _updateAppConnectionsSettings](v2);
    out_token = 0;
    v20 = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __18__PPSettings_init__block_invoke;
    handler[3] = &unk_1E7E15FB0;
    v21 = v2;
    v69 = v21;
    v22 = notify_register_dispatch("com.apple.suggestions.settingsChanged", &out_token, v20, handler);
    if (v22)
    {
      pp_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "com.apple.suggestions.settingsChanged";
        v73 = 1024;
        v74 = v22;
        _os_log_error_impl(&dword_1C392E000, v23, OS_LOG_TYPE_ERROR, "failed to register for notification for %s: status code %d", location, 0x12u);
      }

    }
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.proactive.PersonalizationPortrait"));
    portraitDefaults = v21->_portraitDefaults;
    v21->_portraitDefaults = (NSUserDefaults *)v24;

    if (v21->_portraitDefaults)
    {
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, v21);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __18__PPSettings_init__block_invoke_110;
      aBlock[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v67, (id *)location);
      v26 = (void (**)(_QWORD))_Block_copy(aBlock);
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __18__PPSettings_init__block_invoke_115;
      v64[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v65, (id *)location);
      v27 = (void (**)(_QWORD))_Block_copy(v64);
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __18__PPSettings_init__block_invoke_117;
      v62[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v63, (id *)location);
      v28 = _Block_copy(v62);
      v26[2](v26);
      v27[2](v27);
      -[NSUserDefaults objectForKey:](v21->_portraitDefaults, "objectForKey:", CFSTR("entityBackfillTimestamp"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults objectForKey:](v21->_portraitDefaults, "objectForKey:", CFSTR("entityMappingTrieSha256"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v2->_lock;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __18__PPSettings_init__block_invoke_2_118;
      v59[3] = &unk_1E7E16020;
      v32 = v29;
      v60 = v32;
      v33 = v30;
      v61 = v33;
      -[_PASLock runWithLockAcquired:](v31, "runWithLockAcquired:", v59);

      +[PPKVOObserver observerWithName:object:key:handler:](PPKVOObserver, "observerWithName:object:key:handler:", CFSTR("weightObserver"), v21->_portraitDefaults, CFSTR("weightMultiplier"), v26);
      v34 = objc_claimAutoreleasedReturnValue();
      weightKVOObserver = v21->_weightKVOObserver;
      v21->_weightKVOObserver = (PPKVOObserver *)v34;

      +[PPKVOObserver observerWithName:object:key:handler:](PPKVOObserver, "observerWithName:object:key:handler:", CFSTR("abGroupObserver"), v21->_portraitDefaults, CFSTR("abGroupOverride"), v27);
      v36 = objc_claimAutoreleasedReturnValue();
      abGroupKVObserver = v21->_abGroupKVObserver;
      v21->_abGroupKVObserver = (PPKVOObserver *)v36;

      +[PPKVOObserver observerWithName:object:key:handler:](PPKVOObserver, "observerWithName:object:key:handler:", CFSTR("queryPlanLoggingObserver"), v21->_portraitDefaults, CFSTR("queryPlanLoggingEnabled"), v28);
      v38 = objc_claimAutoreleasedReturnValue();
      queryPlanLoggingKVOObserver = v21->_queryPlanLoggingKVOObserver;
      v21->_queryPlanLoggingKVOObserver = (PPKVOObserver *)v38;

      objc_destroyWeak(&v63);
      objc_destroyWeak(&v65);

      objc_destroyWeak(&v67);
      objc_destroyWeak((id *)location);
    }
    else
    {
      pp_default_log_handle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = CFSTR("com.apple.proactive.PersonalizationPortrait");
        _os_log_error_impl(&dword_1C392E000, v40, OS_LOG_TYPE_ERROR, "Failed to get NSUserDefaults for suite %@.", location, 0xCu);
      }

    }
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.suggestions"));
    canLearnFromAppDefaults = v21->_canLearnFromAppDefaults;
    v21->_canLearnFromAppDefaults = (NSUserDefaults *)v41;

    if (v21->_canLearnFromAppDefaults)
    {
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, v21);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __18__PPSettings_init__block_invoke_126;
      v56[3] = &unk_1E7E1F660;
      v43 = v21;
      v57 = v43;
      objc_copyWeak(&v58, (id *)location);
      v44 = _Block_copy(v56);
      +[PPKVOObserver observerWithName:object:key:handler:](PPKVOObserver, "observerWithName:object:key:handler:", CFSTR("canLearnFromAppKVOObserver"), v21->_canLearnFromAppDefaults, CFSTR("SiriCanLearnFromAppBlacklist"), v44);
      v45 = objc_claimAutoreleasedReturnValue();
      canLearnFromAppKVOObserver = v43->_canLearnFromAppKVOObserver;
      v43->_canLearnFromAppKVOObserver = (PPKVOObserver *)v45;

      v47 = v2->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __18__PPSettings_init__block_invoke_4;
      block[3] = &unk_1E7E1F4F0;
      v55 = v43;
      dispatch_async(v47, block);

      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    else
    {
      pp_default_log_handle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = CFSTR("com.apple.suggestions");
        _os_log_error_impl(&dword_1C392E000, v48, OS_LOG_TYPE_ERROR, "PPSettings failed to get NSUserDefaults for suite %@.", location, 0xCu);
      }

    }
    out_token = 0;
    v49 = v2->_queue;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __18__PPSettings_init__block_invoke_134;
    v52[3] = &unk_1E7E15FB0;
    v53 = v21;
    if (notify_register_dispatch("kAFPreferencesDidChangeDarwinNotification", &out_token, v49, v52))
    {
      pp_default_log_handle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315138;
        *(_QWORD *)&location[4] = "kAFPreferencesDidChangeDarwinNotification";
        _os_log_error_impl(&dword_1C392E000, v50, OS_LOG_TYPE_ERROR, "PPSettings failed to register notification handler for %s .", location, 0xCu);
      }

    }
  }
  return v2;
}

- (void)setAppConnectionsLocationsEnabled:(BOOL)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PPSettings_setAppConnectionsLocationsEnabled___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v16__0__PPSettingsGuardedData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

- (void)setEntitiesBackfilledTimestamp:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PPSettings_setEntitiesBackfilledTimestamp___block_invoke;
  v7[3] = &unk_1E7E15FF8;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  -[NSUserDefaults setObject:forKey:](self->_portraitDefaults, "setObject:forKey:", v6, CFSTR("entityBackfillTimestamp"));

}

- (void)setEntitiesMappingTrieSha256:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PPSettings_setEntitiesMappingTrieSha256___block_invoke;
  v7[3] = &unk_1E7E15FF8;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  -[NSUserDefaults setObject:forKey:](self->_portraitDefaults, "setObject:forKey:", v6, CFSTR("entityMappingTrieSha256"));

}

- (int)registerDisabledBundleIdentifierChangeHandler:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PPSettings_registerDisabledBundleIdentifierChangeHandler___block_invoke;
  v8[3] = &unk_1E7E160B0;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

- (void)deregisterDisabledBundleIdentifierChangeHandlerWithToken:(int)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  int v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PPSettings_deregisterDisabledBundleIdentifierChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e31_v16__0__PPSettingsGuardedData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

- (void)registerCloudKitDisabledBundleIdRewriteHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke;
  block[3] = &unk_1E7E1F4F0;
  block[4] = self;
  if (registerCloudKitDisabledBundleIdRewriteHandler_onceToken != -1)
    dispatch_once(&registerCloudKitDisabledBundleIdRewriteHandler_onceToken, block);
}

- (void)registerDisabledBundleIdPurgeHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke;
  block[3] = &unk_1E7E1F4F0;
  block[4] = self;
  if (registerDisabledBundleIdPurgeHandler_onceToken != -1)
    dispatch_once(&registerDisabledBundleIdPurgeHandler_onceToken, block);
}

- (void)rewriteSyncStateForDisabledBundleIdsAsync
{
  NSObject *queue;
  _QWORD block[5];

  while (!__ldaxr(rewriteSyncStateForDisabledBundleIdsAsync_isInQueue))
  {
    if (!__stlxr(1u, rewriteSyncStateForDisabledBundleIdsAsync_isInQueue))
    {
      -[PPSettings refreshCloudKitDisabledBundleIdsAsync](self, "refreshCloudKitDisabledBundleIdsAsync");
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PPSettings_rewriteSyncStateForDisabledBundleIdsAsync__block_invoke;
      block[3] = &unk_1E7E1F4F0;
      block[4] = self;
      dispatch_async(queue, block);
      return;
    }
  }
  __clrex();
}

- (void)triggerDelayedCloudSyncRewrite
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__PPSettings_triggerDelayedCloudSyncRewrite__block_invoke;
  v2[3] = &unk_1E7E1F4F0;
  v2[4] = self;
  -[PPSettings _triggerDelayedOperationWithCoalescingToken:operation:]((uint64_t)self, &triggerDelayedCloudSyncRewrite_pendingRewriteRequests, v2);
}

- (void)refreshCloudKitDisabledBundleIdsAsync
{
  NSObject *queue;
  _QWORD block[5];

  while (!__ldaxr(refreshCloudKitDisabledBundleIdsAsync_isInQueue))
  {
    if (!__stlxr(1u, refreshCloudKitDisabledBundleIdsAsync_isInQueue))
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PPSettings_refreshCloudKitDisabledBundleIdsAsync__block_invoke;
      block[3] = &unk_1E7E1F4F0;
      block[4] = self;
      dispatch_async(queue, block);
      return;
    }
  }
  __clrex();
}

- (id)userDefaults
{
  return self->_portraitDefaults;
}

- (double)weightMultiplier
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PPSettings_weightMultiplier__block_invoke;
  v5[3] = &unk_1E7E16068;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)entitiesBackfilledTimestamp
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3032;
  v10 = __Block_byref_object_dispose__3033;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PPSettings_entitiesBackfilledTimestamp__block_invoke;
  v5[3] = &unk_1E7E16068;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)entitiesMappingPreviousTrieSha256
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3032;
  v10 = __Block_byref_object_dispose__3033;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PPSettings_entitiesMappingPreviousTrieSha256__block_invoke;
  v5[3] = &unk_1E7E16068;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)bundleIdentifierIsEnabledForDonation:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  _PASLock *lock;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[5];
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_initializationComplete, 5.0) == 1)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "timed out waiting on PPSettings initialization", buf, 2u);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_initializationComplete);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy__3032;
    v20 = __Block_byref_object_dispose__3033;
    v21 = 0;
    v7 = MEMORY[0x1E0C809B0];
    lock = self->_lock;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke;
    v17[3] = &unk_1E7E16068;
    v17[4] = buf;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
    v5 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    if ((-[NSObject containsObject:](v5, "containsObject:", v4) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0D70E98], "objectForKeyedSubscript:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = (void *)MEMORY[0x1E0C9AA60];
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke_2;
      v15[3] = &unk_1E7E162A0;
      v16 = v5;
      v6 = objc_msgSend(v11, "indexOfObjectPassingTest:", v15) == 0x7FFFFFFFFFFFFFFFLL;

    }
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = CFSTR("Blocking");
      if (v6)
        v14 = CFSTR("Admitting");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "PPSettings: %@ content from bundleIdentifier: %@", buf, 0x16u);
    }

  }
  return v6;
}

- (BOOL)bundleIdentifierIsEnabledForCloudKit:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _PASLock *lock;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_initializationComplete, 5.0) == 1)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "timed out waiting on PPSettings initialization", buf, 2u);
    }
    goto LABEL_5;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initializationComplete);
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3032;
  v20 = __Block_byref_object_dispose__3033;
  v21 = 0;
  v6 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke;
  v15[3] = &unk_1E7E16068;
  v15[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  v5 = *((id *)v17 + 5);
  _Block_object_dispose(buf, 8);

  if ((-[NSObject containsObject:](v5, "containsObject:", v4) & 1) != 0)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend((id)*MEMORY[0x1E0D70E98], "objectForKeyedSubscript:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke_2;
  v13[3] = &unk_1E7E162A0;
  v5 = v5;
  v14 = v5;
  v8 = objc_msgSend(v11, "indexOfObjectPassingTest:", v13) == 0x7FFFFFFFFFFFFFFFLL;

LABEL_10:
  return v8;
}

- (id)abGroupOverride
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3032;
  v10 = __Block_byref_object_dispose__3033;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PPSettings_abGroupOverride__block_invoke;
  v5[3] = &unk_1E7E16068;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3
{
  double v4;
  NSObject *v5;
  NSUserDefaults *portraitDefaults;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "Setting asset metadata update interval to: %f sec", (uint8_t *)&v8, 0xCu);
  }

  portraitDefaults = self->_portraitDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](portraitDefaults, "setObject:forKey:", v7, CFSTR("assetMetadataUpdateIntervalSeconds"));

}

- (void)clearAssetMetadataRefreshIntervalSeconds
{
  NSObject *v3;
  uint8_t v4[16];

  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Clearing asset metadata update interval.", v4, 2u);
  }

  -[NSUserDefaults removeObjectForKey:](self->_portraitDefaults, "removeObjectForKey:", CFSTR("assetMetadataUpdateIntervalSeconds"));
}

- (double)assetMetadataRefreshIntervalSeconds
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  double v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("assetMetadataUpdateIntervalSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "doubleValue");
      v9 = 134217984;
      v10 = v4;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Using asset metadata update interval override: %f sec", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v2, "doubleValue");
    v6 = v5;
  }
  else
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = 2;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "Asset metadata update interval is unset, using default value of %tu days.", (uint8_t *)&v9, 0xCu);
    }

    v6 = 172800.0;
  }

  return v6;
}

- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSUserDefaults *portraitDefaults;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("assetDefaultBundleOverridePaths"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
  else
    v9 = (void *)objc_opt_new();
  v10 = v9;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v7);
  v11 = objc_msgSend(v10, "count");
  portraitDefaults = self->_portraitDefaults;
  if (v11)
    -[NSUserDefaults setObject:forKey:](portraitDefaults, "setObject:forKey:", v10, CFSTR("assetDefaultBundleOverridePaths"));
  else
    -[NSUserDefaults removeObjectForKey:](portraitDefaults, "removeObjectForKey:", CFSTR("assetDefaultBundleOverridePaths"));

}

- (id)trialPathOverrides
{
  void *v2;
  void *v3;
  id v4;

  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("trialPathOverrides"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (BOOL)trialUseDefaultFiles
{
  void *v2;
  char v3;

  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("trialUseDefaultFiles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)setTrialUseDefaultFiles:(BOOL)a3
{
  NSUserDefaults *portraitDefaults;
  id v4;

  portraitDefaults = self->_portraitDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](portraitDefaults, "setObject:forKey:", v4, CFSTR("trialUseDefaultFiles"));

}

- (id)trialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 882, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("trialPathOverrides"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setTrialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSUserDefaults *portraitDefaults;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v9 = a4;
  v10 = a5;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v9)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_20;
LABEL_3:
  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("trialPathOverrides"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10
    || (objc_msgSend(v11, "objectForKeyedSubscript:", v25),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "objectForKeyedSubscript:", v9),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = objc_msgSend(v12, "mutableCopy");
    else
      v15 = objc_opt_new();
    v16 = (void *)v15;
    objc_msgSend(v12, "objectForKeyedSubscript:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = (void *)objc_msgSend(v17, "mutableCopy");
    else
      v18 = (void *)objc_opt_new();
    v19 = v18;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, v9);
    if (objc_msgSend(v19, "count"))
      v20 = v19;
    else
      v20 = 0;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v25);
    v21 = objc_msgSend(v16, "count");
    portraitDefaults = self->_portraitDefaults;
    if (v21)
      -[NSUserDefaults setObject:forKey:](portraitDefaults, "setObject:forKey:", v16, CFSTR("trialPathOverrides"));
    else
      -[NSUserDefaults removeObjectForKey:](portraitDefaults, "removeObjectForKey:", CFSTR("trialPathOverrides"));

  }
}

- (id)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("assetDefaultBundleOverridePaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasWrittenSharedWithYouContentAvailable
{
  return -[NSUserDefaults BOOLForKey:](self->_portraitDefaults, "BOOLForKey:", CFSTR("WrittenSharedWithYouContentAvailable"));
}

- (BOOL)hasWrittenSharedWithYouContentConsumed
{
  return -[NSUserDefaults BOOLForKey:](self->_portraitDefaults, "BOOLForKey:", CFSTR("WrittenSharedWithYouContentConsumed"));
}

- (void)setWrittenSharedWithYouContentAvailable:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_portraitDefaults, "setBool:forKey:", a3, CFSTR("WrittenSharedWithYouContentAvailable"));
}

- (void)setWrittenSharedWithYouContentConsumed:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_portraitDefaults, "setBool:forKey:", a3, CFSTR("WrittenSharedWithYouContentConsumed"));
}

- (void)setQueryPlanLoggingEnabled:(BOOL)a3
{
  NSUserDefaults *portraitDefaults;

  portraitDefaults = self->_portraitDefaults;
  if (a3)
    -[NSUserDefaults setObject:forKey:](portraitDefaults, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("queryPlanLoggingEnabled"));
  else
    -[NSUserDefaults removeObjectForKey:](portraitDefaults, "removeObjectForKey:", CFSTR("queryPlanLoggingEnabled"));
}

- (BOOL)queryPlanLoggingEnabled
{
  void *v2;
  char v3;

  -[NSUserDefaults objectForKey:](self->_portraitDefaults, "objectForKey:", CFSTR("queryPlanLoggingEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (int)registerQueryPlanLoggingChangeHandler:(id)a3
{
  id v5;
  _PASLock *lock;
  id v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSettings.m"), 984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PPSettings_registerQueryPlanLoggingChangeHandler___block_invoke;
  v10[3] = &unk_1E7E160B0;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
  LODWORD(lock) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return (int)lock;
}

- (void)deregisterQueryPlanLoggingChangeHandlerWithToken:(int)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  int v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PPSettings_deregisterQueryPlanLoggingChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e31_v16__0__PPSettingsGuardedData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

- (BOOL)isAuthorizedToLogLocation
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/WirelessDiagnostics.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundle:", v2) == 3;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPlanLoggingKVOObserver, 0);
  objc_storeStrong((id *)&self->_abGroupKVObserver, 0);
  objc_storeStrong((id *)&self->_weightKVOObserver, 0);
  objc_storeStrong((id *)&self->_canLearnFromAppKVOObserver, 0);
  objc_storeStrong((id *)&self->_initializationComplete, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_canLearnFromAppDefaults, 0);
  objc_storeStrong((id *)&self->_portraitDefaults, 0);
}

void __63__PPSettings_deregisterQueryPlanLoggingChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

}

void __52__PPSettings_registerQueryPlanLoggingChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3;
  const void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2[12];
  a2[12] = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  v4 = *(const void **)(a1 + 32);
  v5 = a2;
  v8 = _Block_copy(v4);
  v6 = (void *)v5[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

void __29__PPSettings_abGroupOverride__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 72));
}

void __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

uint64_t __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

uint64_t __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __47__PPSettings_entitiesMappingPreviousTrieSha256__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 64));
}

void __41__PPSettings_entitiesBackfilledTimestamp__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 56));
}

double __30__PPSettings_weightMultiplier__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 8);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __51__PPSettings_refreshCloudKitDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
  -[PPSettings _refreshCloudKitDisabledBundleIds](*(_QWORD *)(a1 + 32));
  atomic_store(0, refreshCloudKitDisabledBundleIdsAsync_isInQueue);
}

- (void)_refreshCloudKitDisabledBundleIds
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[PPSettings cloudSyncDisabledFirstPartyBundleIds](PPSettings, "cloudSyncDisabledFirstPartyBundleIds");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithSet:", v3);

    v5 = *MEMORY[0x1E0D70E68];
    v6 = *MEMORY[0x1E0C8EED0];
    v29[0] = *MEMORY[0x1E0C8EE20];
    v29[1] = v6;
    v7 = *MEMORY[0x1E0D70E38];
    v30[0] = v5;
    v30[1] = v7;
    v29[2] = *MEMORY[0x1E0C8EF18];
    v30[2] = *MEMORY[0x1E0D70E78];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    if (!v9)
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPSettings failed to open accountStore", buf, 2u);
      }

    }
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke;
    v24[3] = &unk_1E7E16278;
    v25 = v9;
    v12 = v4;
    v26 = v12;
    v13 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);

    v14 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    v15 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    if (v14)
    {
      objc_msgSend(v12, "addObjectsFromArray:", v14);
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v14;
        _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "PPSettings TCC disabled for Ubiquity: %@", buf, 0xCu);
      }
    }
    else
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPSettings failed to load bundleIds disabled for Ubiquity.", buf, 2u);
      }
    }

    if (v15)
    {
      objc_msgSend(v12, "addObjectsFromArray:", v15);
      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v15;
        _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "PPSettings TCC disabled for Liverpool: %@", buf, 0xCu);
      }
    }
    else
    {
      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPSettings failed to load bundleIds disabled for Liverpool.", buf, 2u);
      }
    }

    v18 = *(void **)(a1 + 24);
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke_171;
    v22[3] = &unk_1E7E15FF8;
    v19 = v12;
    v23 = v19;
    objc_msgSend(v18, "runWithLockAcquired:", v22);
    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v28 = v21;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPSettings loaded %lu disabled bundleIds from CloudKit prefs.", buf, 0xCu);
    }

  }
}

void __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifiersEnabledForDataclass:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = "sync ok";
    v11 = 138412802;
    v12 = v5;
    if (!v9)
      v10 = "sync disable";
    v13 = 2112;
    v14 = v6;
    v15 = 2080;
    v16 = v10;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPSettings checking dataclass %@ --> %@: %s", (uint8_t *)&v11, 0x20u);
  }

}

void __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke_171(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 24), *(id *)(a1 + 32));
}

uint64_t __44__PPSettings_triggerDelayedCloudSyncRewrite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rewriteSyncStateForDisabledBundleIdsAsync");
}

- (void)_triggerDelayedOperationWithCoalescingToken:(void *)a3 operation:
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned int *v12;

  v5 = a3;
  if (a1)
  {
    if (_triggerDelayedOperationWithCoalescingToken_operation___pasOnceToken33 != -1)
      dispatch_once(&_triggerDelayedOperationWithCoalescingToken_operation___pasOnceToken33, &__block_literal_global_164);
    v6 = (void *)_triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult;
    do
      v7 = __ldaxr(a2);
    while (__stlxr(v7 + 1, a2));
    v8 = (void *)MEMORY[0x1E0D81598];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke_2;
    v10[3] = &unk_1E7E18338;
    v12 = a2;
    v11 = v5;
    v9 = v6;
    objc_msgSend(v8, "runAsyncOnQueue:afterDelaySeconds:block:", v9, v10, 180.0);

  }
}

void __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.suggestions.ppsettings.delayed-operation-queue", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult;
  _triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __55__PPSettings_rewriteSyncStateForDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3032;
    v15 = __Block_byref_object_dispose__3033;
    v16 = 0;
    v2 = MEMORY[0x1E0C809B0];
    v3 = *(void **)(v1 + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__PPSettings__cloudKitDisabledBundleIds__block_invoke;
    v11[3] = &unk_1E7E16068;
    v11[4] = &buf;
    objc_msgSend(v3, "runWithLockAcquired:", v11);
    v4 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    if (!v4)
    {
      -[PPSettings _refreshCloudKitDisabledBundleIds](v1);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v13 = 0x3032000000;
      v14 = __Block_byref_object_copy__3032;
      v15 = __Block_byref_object_dispose__3033;
      v16 = 0;
      v5 = *(void **)(v1 + 24);
      v10[0] = v2;
      v10[1] = 3221225472;
      v10[2] = __40__PPSettings__cloudKitDisabledBundleIds__block_invoke_2;
      v10[3] = &unk_1E7E16068;
      v10[4] = &buf;
      objc_msgSend(v5, "runWithLockAcquired:", v10);
      v4 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

    }
  }
  else
  {
    v4 = 0;
  }
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit sync is disabled for %tu bundleIds", (uint8_t *)&buf, 0xCu);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disableSyncForBundleIds:", v4);

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disableSyncForBundleIds:", v4);

  atomic_store(0, rewriteSyncStateForDisabledBundleIdsAsync_isInQueue);
}

void __40__PPSettings__cloudKitDisabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __40__PPSettings__cloudKitDisabledBundleIds__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD handler[5];
  id v16;
  int out_token;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PPSettings _purgeRecordsForDisabledBundleIdsAsync](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2;
  block[3] = &unk_1E7E1F4F0;
  block[4] = v2;
  dispatch_async(v4, block);
  aBlock[0] = v3;
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3;
  aBlock[3] = &unk_1E7E1F4F0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v18[0] = v3;
    v18[1] = 3221225472;
    v18[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2_161;
    v18[3] = &unk_1E7E1D3B0;
    v9 = v5;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v9;
    +[PPKVOObserver observerWithName:object:key:handler:](PPKVOObserver, "observerWithName:object:key:handler:", CFSTR("purgeObserver"), v8, CFSTR("SiriCanLearnFromAppBlacklist"), v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)registerDisabledBundleIdPurgeHandler__purgeObserver;
    registerDisabledBundleIdPurgeHandler__purgeObserver = v10;

    v7 = *(_QWORD *)(a1 + 32);
  }
  out_token = 0;
  v12 = *(NSObject **)(v7 + 32);
  handler[0] = v3;
  handler[1] = 3221225472;
  handler[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3_162;
  handler[3] = &unk_1E7E16230;
  v13 = v6;
  handler[4] = *(_QWORD *)(a1 + 32);
  v16 = v13;
  if (notify_register_dispatch("kAFPreferencesDidChangeDarwinNotification", &out_token, v12, handler))
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "kAFPreferencesDidChangeDarwinNotification";
      _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPSettings failed to associate bundleId purge handler with notification %s .", buf, 0xCu);
    }

  }
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  -[PPSettings _donationDisabledBundleIds](*(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds;
  registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds = v1;

}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_4;
  block[3] = &unk_1E7E1F4F0;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2_161(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[PPSettings _triggerDelayedBundleIdPurge](*(_QWORD *)(a1 + 32));
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3_162(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[PPSettings _triggerDelayedBundleIdPurge](*(_QWORD *)(a1 + 32));
}

- (void)_triggerDelayedBundleIdPurge
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __42__PPSettings__triggerDelayedBundleIdPurge__block_invoke;
    v1[3] = &unk_1E7E1F4F0;
    v1[4] = a1;
    -[PPSettings _triggerDelayedOperationWithCoalescingToken:operation:](a1, (unsigned int *)&_triggerDelayedBundleIdPurge_pendingPurgeRequests, v1);
  }
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PPSettings _refreshDisabledBundleIds](*(_QWORD *)(a1 + 32));
  -[PPSettings _donationDisabledBundleIds](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "minusSet:", registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds);
  objc_storeStrong((id *)&registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds, v2);
  if (objc_msgSend(v3, "count"))
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v7) = 134217984;
      *(_QWORD *)((char *)&v7 + 4) = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSettings invalidating client caches due to %lu newly disabled bundleId(s).", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)&v7 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __40__PPSettings__invokeChangeHandlersAsync__block_invoke;
    v9 = &unk_1E7E15FF8;
    v10 = v5;
    objc_msgSend(v6, "runWithLockAcquired:", &v7);
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32), &__block_literal_global_158);
  }

}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_157()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
}

uint64_t __40__PPSettings__invokeChangeHandlersAsync__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PPSettings__invokeChangeHandlersAsync__block_invoke_2;
  v4[3] = &unk_1E7E160F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __40__PPSettings__invokeChangeHandlersAsync__block_invoke_2(uint64_t a1, int a2, dispatch_block_t block)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32), block);
}

void __40__PPSettings__donationDisabledBundleIds__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  id v17;
  _QWORD handler[4];
  id v19;
  int out_token;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rewriteSyncStateForDisabledBundleIdsAsync");
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2;
  aBlock[3] = &unk_1E7E1F4F0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.suggestions.pp.disabled-bundleid-update-notification", 9);
  v4 = objc_claimAutoreleasedReturnValue();
  out_token = 0;
  handler[0] = v2;
  handler[1] = 3221225472;
  handler[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_3;
  handler[3] = &unk_1E7E161A0;
  v5 = v3;
  v19 = v5;
  if (notify_register_dispatch("com.apple.tcc.access.changed", &out_token, v4, handler))
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "com.apple.tcc.access.changed";
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPSettings failed to register for notification: %s", buf, 0xCu);
    }

  }
  if (kPPCanLearnFromAppKey_block_invoke__pasOnceToken24 != -1)
    dispatch_once(&kPPCanLearnFromAppKey_block_invoke__pasOnceToken24, &__block_literal_global_153);
  v7 = (id)kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C8F1C0];
  v14[0] = v2;
  v14[1] = 3221225472;
  v14[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2_155;
  v14[3] = &unk_1E7E161E8;
  v15 = v7;
  v16 = v4;
  v17 = v5;
  v10 = v5;
  v11 = v4;
  v12 = v7;
  v13 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, 0, v14);

}

uint64_t __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshCloudKitDisabledBundleIdsAsync");
  return objc_msgSend(*(id *)(a1 + 32), "triggerDelayedCloudSyncRewrite");
}

uint64_t __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2_155(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  if ((_DWORD)v3)
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_152()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0C8F110], *MEMORY[0x1E0C8F030], 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult;
  kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __71__PPSettings_deregisterDisabledBundleIdentifierChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);

}

void __60__PPSettings_registerDisabledBundleIdentifierChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3;
  const void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2[12];
  a2[12] = v3 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  v4 = *(const void **)(a1 + 32);
  v5 = a2;
  v8 = _Block_copy(v4);
  v6 = (void *)v5[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

void __43__PPSettings_setEntitiesMappingTrieSha256___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 64), *(id *)(a1 + 32));
}

void __45__PPSettings_setEntitiesBackfilledTimestamp___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 56), *(id *)(a1 + 32));
}

uint64_t __48__PPSettings_setAppConnectionsLocationsEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 52) = *(_BYTE *)(result + 32);
  return result;
}

void __18__PPSettings_init__block_invoke_110(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "objectForKey:", CFSTR("weightMultiplier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "doubleValue");
      v5 = v4;
    }
    else
    {
      pp_default_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v11 = CFSTR("weightMultiplier");
        v12 = 2112;
        v13 = CFSTR("com.apple.proactive.PersonalizationPortrait");
        _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Did not find numeric value for key \"%@\" in NSUserDefaults domain %@.", buf, 0x16u);
      }

      v5 = 1.0;
    }
    v7 = (void *)v2[3];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __18__PPSettings_init__block_invoke_112;
    v9[3] = &__block_descriptor_40_e31_v16__0__PPSettingsGuardedData_8l;
    *(double *)&v9[4] = v5;
    objc_msgSend(v7, "runWithLockAcquired:", v9);
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v11 = *(const __CFString **)&v5;
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "Selected new weight multiplier: %g", buf, 0xCu);
    }

  }
}

void __18__PPSettings_init__block_invoke_115(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "objectForKey:", CFSTR("abGroupOverride"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[3];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __18__PPSettings_init__block_invoke_2;
    v7[3] = &unk_1E7E15FF8;
    v5 = v3;
    v8 = v5;
    objc_msgSend(v4, "runWithLockAcquired:", v7);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.abGroupOverrideChanged");
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "Detected new abGroupOverride: %@", buf, 0xCu);
    }

  }
}

void __18__PPSettings_init__block_invoke_117(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *WeakRetained;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3032;
    v16 = __Block_byref_object_dispose__3033;
    v17 = 0;
    v1 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__PPSettings__updateQueryPlanLogging__block_invoke;
    v11[3] = &unk_1E7E16068;
    v11[4] = &v12;
    objc_msgSend(v1, "runWithLockAcquired:", v11);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = (id)v13[5];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v8;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v2);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++) + 16))();
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
      }
      while (v3);
    }

    _Block_object_dispose(&v12, 8);
  }

}

void __18__PPSettings_init__block_invoke_2_118(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 7, *(id *)(a1 + 32));
  v4 = a2;
  objc_storeStrong(v4 + 8, *(id *)(a1 + 40));

}

void __18__PPSettings_init__block_invoke_126(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__PPSettings_init__block_invoke_2_127;
  block[3] = &unk_1E7E1FCC0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

intptr_t __18__PPSettings_init__block_invoke_4(uint64_t a1)
{
  -[PPSettings _refreshDisabledBundleIds](*(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
}

void __18__PPSettings_init__block_invoke_134(uint64_t a1)
{
  -[PPSettings _refreshDisabledBundleIds](*(_QWORD *)(a1 + 32));
  if (!+[PPSettings isCloudSyncEnabled](PPSettings, "isCloudSyncEnabled") && *(_QWORD *)(a1 + 32))
  {
    do
    {
      if (__ldaxr(_handleCloudStorageDeletedByUser_isInQueue))
      {
        __clrex();
        return;
      }
    }
    while (__stlxr(1u, _handleCloudStorageDeletedByUser_isInQueue));
    if (_handleCloudStorageDeletedByUser__pasOnceToken15 != -1)
      dispatch_once(&_handleCloudStorageDeletedByUser__pasOnceToken15, &__block_literal_global_139);
    dispatch_async((dispatch_queue_t)_handleCloudStorageDeletedByUser__pasExprOnceResult, &__block_literal_global_142);
  }
}

void __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_2()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  pp_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v0, OS_LOG_TYPE_DEFAULT, "PPSettings: clearing remote records from database because user triggered Siri cloud storage deletion", v5, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:", &__block_literal_global_146_3106);

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:", &__block_literal_global_149_3107);

  atomic_store(0, _handleCloudStorageDeletedByUser_isInQueue);
}

uint64_t __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_2_148()
{
  return 1;
}

uint64_t __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_144()
{
  return 1;
}

void __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPSettings-DKEventDeletionProcessing", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_handleCloudStorageDeletedByUser__pasExprOnceResult;
  _handleCloudStorageDeletedByUser__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __18__PPSettings_init__block_invoke_2_127(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[PPSettings _refreshDisabledBundleIds]((uint64_t)WeakRetained);
    v2 = (void *)*((_QWORD *)v3 + 3);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__PPSettings__invokeChangeHandlersAsync__block_invoke;
    v4[3] = &unk_1E7E15FF8;
    v4[4] = v3;
    objc_msgSend(v2, "runWithLockAcquired:", v4);
    dispatch_async(*((dispatch_queue_t *)v3 + 4), &__block_literal_global_3110);
    WeakRetained = v3;
  }

}

void __18__PPSettings_init__block_invoke_3()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
}

void __37__PPSettings__updateQueryPlanLogging__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v7[5], "allValues");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __18__PPSettings_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 72), *(id *)(a1 + 32));
}

double __18__PPSettings_init__block_invoke_112(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PPSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken4, block);
  return (id)sharedInstance__pasExprOnceResult_3127;
}

+ (id)cloudSyncDisabledFirstPartyBundleIds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[9];

  v21[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D70E28];
  v21[0] = *MEMORY[0x1E0D70E18];
  v21[1] = v2;
  v3 = *MEMORY[0x1E0D70DC0];
  v21[2] = *MEMORY[0x1E0D70E50];
  v21[3] = v3;
  v4 = *MEMORY[0x1E0D70DC8];
  v21[4] = *MEMORY[0x1E0D70E40];
  v21[5] = v4;
  v5 = *MEMORY[0x1E0D70E08];
  v21[6] = *MEMORY[0x1E0D70E60];
  v21[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = (void *)*MEMORY[0x1E0D70E98];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)disableBundleIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3032;
    v16 = __Block_byref_object_dispose__3033;
    v17 = 0;
    v6 = *(void **)(v4 + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__PPSettings__disableBundleIdentifier___block_invoke;
    v11[3] = &unk_1E7E16068;
    v11[4] = &v12;
    objc_msgSend(v6, "runWithLockAcquired:", v11);
    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", v5);
    objc_msgSend(*(id *)(v4 + 16), "setObject:forKey:", v9, CFSTR("SiriCanLearnFromAppBlacklist"));

  }
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PPSettings _refreshDisabledBundleIds]((uint64_t)v10);

}

+ (void)clearTestSettings
{
  id v2;

  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*((id *)v2 + 2), "removeObjectForKey:", CFSTR("SiriCanLearnFromAppBlacklist"));
    dispatch_sync(*((dispatch_queue_t *)v2 + 4), &__block_literal_global_191);
  }

}

void __39__PPSettings__disableBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __28__PPSettings_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_3127;
  sharedInstance__pasExprOnceResult_3127 = v1;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)isCloudSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudSyncEnabled");

  return v3;
}

@end
