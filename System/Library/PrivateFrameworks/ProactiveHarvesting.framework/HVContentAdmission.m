@implementation HVContentAdmission

void __62__HVContentAdmission__shouldAdmitContentFromBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  id *v4;

  v4 = a2;
  if ((objc_msgSend(v4[1], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v4[2], "containsObject:", *(_QWORD *)(a1 + 32)) ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (uint64_t)_shouldAdmitContentFromBundleIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = *(void **)(a1 + 8);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__HVContentAdmission__shouldAdmitContentFromBundleIdentifier___block_invoke;
    v7[3] = &unk_24DD7E270;
    v9 = &v10;
    v8 = v3;
    objc_msgSend(v5, "runWithLockAcquired:", v7);
    a1 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

+ (BOOL)shouldAdmitContentFromBundleIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  void *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[HVContentAdmission sharedInstance]();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HVContentAdmission.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    +[HVContentAdmission sharedInstance]();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
  }
  v9 = -[HVContentAdmission _shouldAdmitContentFromBundleIdentifier:](v6, v8);

  hv_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("Blocking");
    if (v9)
      v11 = CFSTR("Admitting");
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_INFO, "HVContentAdmission: %@ content from bundleIdentifier: %@", buf, 0x16u);
  }

  return v9;
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_294);
  return (id)sharedInstance__pasExprOnceResult;
}

- (HVContentAdmission)init
{
  HVContentAdmission *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  uint64_t v12;
  NSUserDefaults *defaults;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HVContentAdmissionKVOObserver *kvoObserver;
  void *v18;
  uint64_t v19;
  HVContentAdmissionKVOObserver *pastEventsObserver;
  _PASLock *v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  __int128 buf;
  void (*v31)(uint64_t, void *);
  void *v32;
  HVContentAdmission *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)HVContentAdmission;
  v2 = -[HVContentAdmission init](&v29, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 1);
    v5 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v4;

    v6 = objc_opt_new();
    v7 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v6;

    v8 = objc_opt_new();
    v9 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v8;

    *(_BYTE *)(v3 + 40) = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A610]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.suggestions"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v12;

    if (v2->_defaults)
    {
      location = 0;
      objc_initWeak(&location, v2);
      v14 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __26__HVContentAdmission_init__block_invoke;
      v26[3] = &unk_24DD7E650;
      objc_copyWeak(&v27, &location);
      v15 = (void *)MEMORY[0x22074FF64](v26);
      +[HVContentAdmissionKVOObserver observeObject:key:handler:](HVContentAdmissionKVOObserver, "observeObject:key:handler:", v2->_defaults, CFSTR("SiriCanLearnFromAppBlacklist"), v15);
      v16 = objc_claimAutoreleasedReturnValue();
      kvoObserver = v2->_kvoObserver;
      v2->_kvoObserver = (HVContentAdmissionKVOObserver *)v16;

      -[HVContentAdmission _refreshDisabledBundleIds]((uint64_t)v2);
      v24[0] = v14;
      v24[1] = 3221225472;
      v24[2] = __26__HVContentAdmission_init__block_invoke_2;
      v24[3] = &unk_24DD7E650;
      objc_copyWeak(&v25, &location);
      v18 = (void *)MEMORY[0x22074FF64](v24);
      +[HVContentAdmissionKVOObserver observeObject:key:handler:](HVContentAdmissionKVOObserver, "observeObject:key:handler:", v2->_defaults, CFSTR("SuggestionsShowPastEvents"), v18);
      v19 = objc_claimAutoreleasedReturnValue();
      pastEventsObserver = v2->_pastEventsObserver;
      v2->_pastEventsObserver = (HVContentAdmissionKVOObserver *)v19;

      v21 = v2->_lock;
      *(_QWORD *)&buf = v14;
      *((_QWORD *)&buf + 1) = 3221225472;
      v31 = __47__HVContentAdmission__refreshPastEventsSetting__block_invoke;
      v32 = &unk_24DD7E1A8;
      v33 = v2;
      -[_PASLock runWithLockAcquired:](v21, "runWithLockAcquired:", &buf);
      -[HVContentAdmission _migrateIfNeededWithCompletion:]((uint64_t)v2, 0);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
      hv_default_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.suggestions");
        _os_log_error_impl(&dword_21AA1D000, v22, OS_LOG_TYPE_ERROR, "HVContentAdmission failed to get NSUserDefaults for suite %@.", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pastEventsObserver, 0);
  objc_storeStrong((id *)&self->_kvoObserver, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __26__HVContentAdmission_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HVContentAdmission _refreshDisabledBundleIds]((uint64_t)WeakRetained);

}

- (void)_refreshDisabledBundleIds
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("SiriCanLearnFromAppBlacklist"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
      v5 = (void *)MEMORY[0x24BDBD1A8];
      if (v3)
        v5 = (void *)v3;
      v6 = v5;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v6);
        hv_default_log_handle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 134217984;
          v10 = -[NSObject count](v7, "count");
          _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, "HVContentAdmission loaded %tu disabled bundleIds from prefs", (uint8_t *)&v9, 0xCu);
        }

        -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:](a1, v7, 0);
      }
      else
      {
        hv_default_log_handle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v9) = 0;
          _os_log_error_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_ERROR, "HVContentAdmission found unexpected value type for disabled bundleIds.", (uint8_t *)&v9, 2u);
        }
      }

    }
  }
}

void __26__HVContentAdmission_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 1);
    v5[1] = 3221225472;
    v5[2] = __47__HVContentAdmission__refreshPastEventsSetting__block_invoke;
    v5[3] = &unk_24DD7E1A8;
    v5[4] = v2;
    v4 = v2;
    v5[0] = MEMORY[0x24BDAC760];
    objc_msgSend(v3, "runWithLockAcquired:", v5);
    v2 = v4;
  }

}

void __47__HVContentAdmission__refreshPastEventsSetting__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BYTE *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  v3[40] = objc_msgSend(v2, "BOOLForKey:", CFSTR("SuggestionsShowPastEvents"));

}

- (void)_migrateIfNeededWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    if (_migrateIfNeededWithCompletion___pasOnceToken12 != -1)
      dispatch_once(&_migrateIfNeededWithCompletion___pasOnceToken12, &__block_literal_global_63);
    v4 = (void *)_migrateIfNeededWithCompletion___pasExprOnceResult;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke_2;
    v6[3] = &unk_24DD7E2F0;
    v6[4] = a1;
    v7 = v3;
    v5 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void (*v4)(uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t result;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[8];
  uint64_t v38;
  void *(*v39)(_QWORD *);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_DEBUG, "HVContentAdmission: migrateIfNeeded", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "BOOLForKey:", CFSTR("spToLearnMigrationPerformed")) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21AA1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "HVContentAdmission: spToLearnMigrationPerformed was YES.", buf, 2u);
    }
  }
  else
  {
    hv_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v3, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: spToLearnMigrationPerformed was NO.", buf, 2u);
    }

    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v4 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr;
    v45 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __getSPGetDisabledBundleSetSymbolLoc_block_invoke;
      v40 = &unk_24DD7E318;
      v41 = &v42;
      __getSPGetDisabledBundleSetSymbolLoc_block_invoke(buf);
      v4 = (void (*)(uint64_t))v43[3];
    }
    _Block_object_dispose(&v42, 8);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSMutableSet * _Nonnull HVSPGetDisabledBundleSet(BOOL)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("HVContentAdmission.m"), 349, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v4(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[HVContentAdmission _disableBundleIdentifier:](*(_QWORD *)(a1 + 32), v9);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      }
      while (v6);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBool:forKey:", 1, CFSTR("spToLearnMigrationPerformed"));
    hv_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_DEFAULT, "HVContentAdmission: spToLearnMigration has been performed.", buf, 2u);
    }

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "BOOLForKey:", CFSTR("findToShowMigrationPerformed")) & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21AA1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "HVContentAdmission: findToShowMigrationPerformed was YES.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "HVContentAdmission: findToShowMigrationPerformed was NO.", buf, 2u);
    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("SuggestionsShowContactsFoundInMail"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
      objc_msgSend(v11, "addObject:", CFSTR("com.apple.MobileAddressBook"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("SuggestionsShowEventsFoundInMail"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) == 0)
      objc_msgSend(v11, "addObject:", CFSTR("com.apple.mobilecal"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("SuggestionsShowLocationsFoundInApps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && (objc_msgSend(v16, "BOOLValue") & 1) == 0)
      objc_msgSend(v11, "addObject:", CFSTR("com.apple.Maps"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("SuggestionsShowTopicsFoundInApps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && (objc_msgSend(v18, "BOOLValue") & 1) == 0)
      objc_msgSend(v11, "addObject:", CFSTR("com.apple.news"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "arrayForKey:", CFSTR("SuggestionsPortraitTopicsAppUsageBlacklist"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
      }
      while (v21);
    }
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v11, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("AppCanShowSiriSuggestionsBlacklist"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBool:forKey:", 1, CFSTR("findToShowMigrationPerformed"));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "HVContentAdmission: findToShowMigration has been performed.", buf, 2u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_disableBundleIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v6[1] = 3221225472;
    v6[2] = __47__HVContentAdmission__disableBundleIdentifier___block_invoke;
    v6[3] = &unk_24DD7E248;
    v5 = v3;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v3;
    v8 = a1;
    objc_msgSend(v4, "runWithLockAcquired:", v6);

    v3 = v5;
  }

}

void __47__HVContentAdmission__disableBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a2 + 8), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v4, CFSTR("SiriCanLearnFromAppBlacklist"));

}

void __53__HVContentAdmission__migrateIfNeededWithCompletion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "HVContentAdmission-migrateIfNeeded", 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_migrateIfNeededWithCompletion___pasExprOnceResult;
  _migrateIfNeededWithCompletion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)_refreshBundleIdentifierDenyListsWithLearnFromDenyList:(void *)a3 configurableDenyList:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HVSpotlightDeletionRequest *v15;
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (a1 && v5 | v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__289;
    v30 = __Block_byref_object_dispose__290;
    v31 = 0;
    v8 = *(void **)(a1 + 8);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __98__HVContentAdmission__refreshBundleIdentifierDenyListsWithLearnFromDenyList_configurableDenyList___block_invoke;
    v22[3] = &unk_24DD7E220;
    v17 = v5;
    v23 = (id)v5;
    v24 = v7;
    v25 = &v26;
    objc_msgSend(v8, "runWithLockAcquired:", v22);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)v27[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x22074FDF0]();
          v15 = -[HVSpotlightDeletionRequest initWithBundleIdentifier:]([HVSpotlightDeletionRequest alloc], "initWithBundleIdentifier:", v13);
          +[HVDonationReceiver defaultReceiver](HVDonationReceiver, "defaultReceiver");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deleteContentWithRequest:error:", v15, 0);

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
      }
      while (v10);
    }

    _Block_object_dispose(&v26, 8);
    v5 = v17;
  }

}

void __98__HVContentAdmission__refreshBundleIdentifierDenyListsWithLearnFromDenyList_configurableDenyList___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)a1[4];
  if (!v4)
    v4 = (void *)*((_QWORD *)v3 + 1);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  v7 = a1[5];
  if (!v7)
    v7 = *((_QWORD *)v3 + 2);
  objc_msgSend(v5, "unionSet:", v7);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *((id *)v3 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12++), "contentAdmissionBlocklistDidChange:", v6, (_QWORD)v24);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

  v13 = objc_msgSend(v6, "mutableCopy");
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "minusSet:", *((_QWORD *)v3 + 1));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "minusSet:", *((_QWORD *)v3 + 2));
  hv_default_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_21AA1D000, v16, OS_LOG_TYPE_DEBUG, "HVContentAdmission disabled bundles: %@ newly disabled: %@", buf, 0x16u);
  }

  v17 = (void *)a1[4];
  if (v17)
  {
    v18 = objc_msgSend(v17, "copy");
    v19 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v18;

  }
  v20 = (void *)a1[5];
  if (v20)
  {
    v21 = objc_msgSend(v20, "copy");
    v22 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v21;

  }
}

+ (void)initialize
{
  id v3;
  id v4;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    v4 = +[HVContentAdmission sharedInstance]();
}

+ (void)addContentAdmissionObserver:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  +[HVContentAdmission sharedInstance]();
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v6)
  {
    v5 = (void *)v6[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__HVContentAdmission_addContentAdmissionObserver___block_invoke;
    v7[3] = &unk_24DD7E1A8;
    v8 = v4;
    objc_msgSend(v5, "runWithLockAcquired:", v7);

  }
}

+ (void)registerConfigurationAsset:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD *val;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a3;
  +[HVContentAdmission sharedInstance]();
  val = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (val)
  {
    location = 0;
    objc_initWeak(&location, val);
    v5 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke;
    v16[3] = &unk_24DD7E1D0;
    objc_copyWeak(&v17, &location);
    v6 = (void *)MEMORY[0x22074FF64](v16);
    v7 = (void *)val[1];
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke_44;
    v14[3] = &unk_24DD7E1A8;
    v8 = v4;
    v15 = v8;
    objc_msgSend(v7, "runWithLockAcquired:", v14);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __50__HVContentAdmission__registerConfigurationAsset___block_invoke_2;
    v12[3] = &unk_24DD7E1F8;
    v9 = v6;
    v13 = v9;
    v10 = (id)objc_msgSend(v8, "registerUpdateHandler:", v12);
    (*((void (**)(id, id))v9 + 2))(v9, v8);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

+ (void)updateConfigurableBundleIdentifierDenyList:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HVContentAdmission sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:]((uint64_t)v4, 0, v3);

}

+ (void)disableBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HVContentAdmission sharedInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HVContentAdmission _disableBundleIdentifier:]((uint64_t)v4, v3);

}

+ (BOOL)suggestionsShouldShowPastEvents
{
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  +[HVContentAdmission sharedInstance]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v4 = *(void **)(v2 + 8);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__HVContentAdmission__suggestionsShouldShowPastEvents__block_invoke;
    v7[3] = &unk_24DD7E298;
    v7[4] = &v8;
    objc_msgSend(v4, "runWithLockAcquired:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)clearTestSettings
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  +[HVContentAdmission sharedInstance]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = *(void **)(v2 + 8);
    v6[1] = 3221225472;
    v6[2] = __40__HVContentAdmission__clearTestSettings__block_invoke;
    v6[3] = &unk_24DD7E1A8;
    v6[4] = v3;
    v5 = v3;
    v6[0] = MEMORY[0x24BDAC760];
    objc_msgSend(v4, "runWithLockAcquired:", v6);
    v3 = v5;
  }

}

+ (void)migrateForTests
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v2 = dispatch_semaphore_create(0);
  +[HVContentAdmission sharedInstance]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__HVContentAdmission_migrateForTests__block_invoke;
  v5[3] = &unk_24DD7F578;
  v6 = v2;
  v4 = v2;
  -[HVContentAdmission _migrateIfNeededWithCompletion:]((uint64_t)v3, v5);

  objc_msgSend(MEMORY[0x24BE7A5D8], "waitForSemaphore:", v4);
}

intptr_t __37__HVContentAdmission_migrateForTests__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __36__HVContentAdmission_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __40__HVContentAdmission__clearTestSettings__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[10];

  v18[9] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18[0] = CFSTR("SiriCanLearnFromAppBlacklist");
  v18[1] = CFSTR("spToLearnMigrationPerformed");
  v18[2] = CFSTR("findToShowMigrationPerformed");
  v18[3] = CFSTR("SuggestionsShowContactsFoundInMail");
  v18[4] = CFSTR("SuggestionsShowEventsFoundInMail");
  v18[5] = CFSTR("SuggestionsShowLocationsFoundInApps");
  v18[6] = CFSTR("SuggestionsShowTopicsFoundInApps");
  v18[7] = CFSTR("SuggestionsPortraitTopicsAppUsageBlacklist");
  v18[8] = CFSTR("AppCanShowSiriSuggestionsBlacklist");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 9);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++), (_QWORD)v13);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v9 = objc_opt_new();
  v10 = (void *)v3[1];
  v3[1] = v9;

  v11 = objc_opt_new();
  v12 = (void *)v3[2];
  v3[2] = v11;

}

uint64_t __54__HVContentAdmission__suggestionsShouldShowPastEvents__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 40);
  return result;
}

void __50__HVContentAdmission__registerConfigurationAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("ProactiveHarvestingConfig.plist"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v16 = 0;
      v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v5, 0, &v16);
      v7 = v16;
      if (v6)
      {
        v15 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v15);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v15;

        if (v9)
        {
          hv_default_log_handle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v18 = v6;
            v19 = 2112;
            v20 = v9;
            _os_log_error_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_ERROR, "HVContentAdmission Error deserializing ProactiveHarvesting config plist %@: %@", buf, 0x16u);
          }
        }
        else
        {
          v11 = objc_alloc(MEMORY[0x24BDBCF20]);
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("BundleIdentifierDenyList"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "initWithArray:", v12);

          hv_default_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = -[NSObject count](v10, "count");
            *(_DWORD *)buf = 134217984;
            v18 = (const __CFString *)v14;
            _os_log_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEFAULT, "HVContentAdmission received %tu disabled bundleIds from mobile asset", buf, 0xCu);
          }

          -[HVContentAdmission _refreshBundleIdentifierDenyListsWithLearnFromDenyList:configurableDenyList:]((uint64_t)WeakRetained, 0, v10);
        }

      }
      else
      {
        hv_default_log_handle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v5;
          v19 = 2112;
          v20 = v7;
          _os_log_error_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_ERROR, "HVContentAdmission Error obtaining data for ProactiveHarvesting config plist %@: %@", buf, 0x16u);
        }
        v9 = v7;
      }

    }
    else
    {
      hv_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = CFSTR("ProactiveHarvestingConfig.plist");
        _os_log_error_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_ERROR, "HVContentAdmission Error finding ProactiveHarvesting config plist (path: %@)", buf, 0xCu);
      }
    }

  }
}

void __50__HVContentAdmission__registerConfigurationAsset___block_invoke_44(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 32), *(id *)(a1 + 32));
}

uint64_t __50__HVContentAdmission__registerConfigurationAsset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__HVContentAdmission_addContentAdmissionObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 24), "addObject:", *(_QWORD *)(a1 + 32));
}

@end
