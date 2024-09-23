@implementation AppletConfigurationData

+ (id)getOverrideConfig
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  int v5;
  id v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/AppleInternal/com.apple.stockholm.atl.override.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v0, &v7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v7;
  if (v1)
  {
    objc_opt_self();
    v3 = v1;
  }
  else
  {
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v2, "code");
      *(_DWORD *)buf = 67109120;
      v9 = v5;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "No valid override found %d", buf, 8u);
    }

  }
  return v1;
}

+ (id)getInstance
{
  objc_opt_self();
  if (getInstance_onceToken_2 != -1)
    dispatch_once(&getInstance_onceToken_2, &__block_literal_global_5);
  return (id)getInstance_inst_1;
}

void __38__AppletConfigurationData_getInstance__block_invoke()
{
  AppletConfigurationData *v0;
  void *v1;

  v0 = objc_alloc_init(AppletConfigurationData);
  v1 = (void *)getInstance_inst_1;
  getInstance_inst_1 = (uint64_t)v0;

}

- (AppletConfigurationData)init
{
  AppletConfigurationData *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSUserDefaults *userDefaults;
  NSMutableDictionary *v8;
  NSMutableDictionary *pluginCache;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *config;
  NSObject *v15;
  AppletConfigurationData *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSDictionary *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  AppletConfigurationData *v30;
  dispatch_time_t v31;
  NSObject *v32;
  AppletConfigurationData *v33;
  AppletConfigurationData *v34;
  _QWORD v36[4];
  AppletConfigurationData *v37;
  _QWORD block[4];
  AppletConfigurationData *v39;
  objc_super v40;
  uint8_t buf[4];
  _DWORD v42[7];

  *(_QWORD *)&v42[5] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)AppletConfigurationData;
  v2 = -[AppletConfigurationData init](&v40, sel_init);
  if (!v2)
    goto LABEL_26;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("ATLConfiguration", v3);
  queue = v2->queue;
  v2->queue = (OS_dispatch_queue *)v4;

  v2->maErrorCount = 0;
  v2->retryInProgress = 0;
  +[AppletTranslator userDefaults]();
  v6 = objc_claimAutoreleasedReturnValue();
  userDefaults = v2->userDefaults;
  v2->userDefaults = (NSUserDefaults *)v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pluginCache = v2->pluginCache;
  v2->pluginCache = v8;

  v10 = +[AppletTranslator isInternalBuild]();
  if (v10)
  {
    -[NSUserDefaults objectForKey:](v2->userDefaults, "objectForKey:", CFSTR("debug.maMetadataQueryTimeInterval"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NSUserDefaults objectForKey:](v2->userDefaults, "objectForKey:", CFSTR("debug.maMetadataQueryTimeInterval"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v2->maMetadataQueryInterval = (double)(int)objc_msgSend(v12, "intValue");

    }
    else
    {
      v2->maMetadataQueryInterval = 604800.0;
    }
    +[AppletConfigurationData getOverrideConfig]();
    v13 = objc_claimAutoreleasedReturnValue();
    config = v2->config;
    v2->config = (NSDictionary *)v13;

    if (v13)
    {
      ATLLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_DEFAULT, "Override configuration, disabling updates via MA", buf, 2u);
      }

      v16 = v2;
      goto LABEL_26;
    }
  }
  else
  {
    v2->maMetadataQueryInterval = 604800.0;
  }
  +[AppletConfigurationData getStaticConfig](AppletConfigurationData, "getStaticConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  -[NSUserDefaults objectForKey:](v2->userDefaults, "objectForKey:", CFSTR("config"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ATLLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v42 = v19;
    _os_log_impl(&dword_1C3511000, v20, OS_LOG_TYPE_DEFAULT, "Loaded persisted MA config %@", buf, 0xCu);
  }

  if (v19)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    if (v22 == 6)
    {
      objc_msgSend(v18, "addEntriesFromDictionary:", v19);
    }
    else
    {
      ATLLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v42[0] = v22;
        LOWORD(v42[1]) = 1024;
        *(_DWORD *)((char *)&v42[1] + 2) = 6;
        _os_log_impl(&dword_1C3511000, v23, OS_LOG_TYPE_DEFAULT, "Incompatible (%d != %d) version, deleting it", buf, 0xEu);
      }

      -[NSUserDefaults removeObjectForKey:](v2->userDefaults, "removeObjectForKey:", CFSTR("config"));
    }
  }
  objc_storeStrong((id *)&v2->config, v18);
  ATLLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v2->config;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v42 = v25;
    _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_DEFAULT, "Resolved config %@", buf, 0xCu);
  }

  if (v10)
    -[NSUserDefaults setObject:forKey:](v2->userDefaults, "setObject:forKey:", &unk_1E7D9AD58, CFSTR("debug.currentCompatibilityVersion"));
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel_tsmScriptPerformed_, CFSTR("com.apple.stockholm.tsm.script.executed"), 0);

  ATLLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v42 = CFSTR("com.apple.stockholm.tsm.script.executed");
    _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_DEFAULT, "Listening to %@", buf, 0xCu);
  }

  v28 = v2->queue;
  v29 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AppletConfigurationData_init__block_invoke;
  block[3] = &unk_1E7D8A680;
  v30 = v2;
  v39 = v30;
  dispatch_async(v28, block);
  v31 = dispatch_time(0, 15000000000);
  v32 = v2->queue;
  v36[0] = v29;
  v36[1] = 3221225472;
  v36[2] = __31__AppletConfigurationData_init__block_invoke_2;
  v36[3] = &unk_1E7D8A680;
  v33 = v30;
  v37 = v33;
  dispatch_after(v31, v32, v36);
  v34 = v33;

LABEL_26:
  return v2;
}

void __31__AppletConfigurationData_init__block_invoke(uint64_t a1)
{
  -[AppletConfigurationData queryMA](*(_QWORD *)(a1 + 32));
}

- (void)queryMA
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    ATLLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_DEFAULT, "Querying MA", buf, 2u);
    }

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.AppletTranslationLibraryAssets"));
    objc_msgSend(v3, "setDoNotBlockBeforeFirstUnlock:", 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__AppletConfigurationData_queryMA__block_invoke;
    v5[3] = &unk_1E7D8A930;
    v5[4] = a1;
    v6 = v3;
    v4 = v3;
    objc_msgSend(v4, "queryMetaData:", v5);

  }
}

void __31__AppletConfigurationData_init__block_invoke_2(uint64_t a1)
{
  -[AppletConfigurationData maybeQueryMetadata](*(_QWORD *)(a1 + 32));
}

- (void)maybeQueryMetadata
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", CFSTR("nextMetadataCheck"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "timeIntervalSinceNow");
      v5 = v4;
    }
    else
    {
      v5 = -1.0;
    }
    if (v5 <= *(double *)(a1 + 56))
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v6, CFSTR("nextMetadataCheck"));
      ATLLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v13 = v5;
        v14 = 2112;
        v15 = *(double *)&v6;
        _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_DEFAULT, "Clamping ttnc %.0f to interval, next check %@", buf, 0x16u);
      }

      v5 = *(double *)(a1 + 56);
    }
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = *(double *)&v6;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "nextCheck %@ ttNC %.0f", buf, 0x16u);
    }

    if (v5 <= 0.0)
    {
      -[AppletConfigurationData queryMetadata](a1);
    }
    else
    {
      v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      v10 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__AppletConfigurationData_maybeQueryMetadata__block_invoke;
      block[3] = &unk_1E7D8A680;
      block[4] = a1;
      dispatch_after(v9, v10, block);
    }

  }
}

+ (id)getConfig
{
  id *v0;
  id v1;

  objc_opt_self();
  +[AppletConfigurationData getInstance]();
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = v0[3];
  objc_sync_exit(v0);

  return v1;
}

uint64_t __45__AppletConfigurationData_maybeQueryMetadata__block_invoke(uint64_t a1)
{
  return -[AppletConfigurationData maybeQueryMetadata](*(_QWORD *)(a1 + 32));
}

- (void)queryMetadata
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", CFSTR("catalogDownloadStartedOn"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "timeIntervalSinceNow");
      v5 = fabs(v4);
    }
    else
    {
      v6 = *(void **)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("catalogDownloadStartedOn"));

      v5 = 0.0;
    }
    -[AppletConfigurationData optionsForInterval:](a1, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__AppletConfigurationData_queryMetadata__block_invoke;
    v9[3] = &unk_1E7D8A8E0;
    v9[4] = a1;
    objc_msgSend(MEMORY[0x1E0D4E038], "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.AppletTranslationLibraryAssets"), v8, v9);

  }
}

- (id)optionsForInterval:(uint64_t)a1
{
  void *v3;

  if (a1)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setRequiresPowerPluggedIn:", a2 < 604800.0);
    objc_msgSend(v3, "setDiscretionary:", a2 < 1209600.0);
    objc_msgSend(v3, "setAllowsCellularAccess:", a2 > 1209600.0);
    objc_msgSend(v3, "setAllowsExpensiveAccess:", a2 > 1814400.0);
    objc_msgSend(v3, "logOptions");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __40__AppletConfigurationData_queryMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a2;
    _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "catalog download result %ld", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_559;
  v7[3] = &unk_1E7D8A8B8;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

void __40__AppletConfigurationData_queryMetadata__block_invoke_559(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 8))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_2;
    v10[3] = &unk_1E7D8A680;
    v10[4] = v2;
    -[AppletConfigurationData retryWithBackoff:](v2, v10);
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 16), "removeObjectForKey:", CFSTR("catalogDownloadStartedOn"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v4, CFSTR("nextMetadataCheck"));
    v5 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 56) * 1000000000.0));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_3;
    v9[3] = &unk_1E7D8A680;
    v9[4] = v6;
    dispatch_after(v5, v7, v9);
    ATLLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_DEFAULT, "Metadata downloaded success, next check %@", buf, 0xCu);
    }

    -[AppletConfigurationData queryMA](*(_QWORD *)(a1 + 32));
  }
}

void __40__AppletConfigurationData_queryMetadata__block_invoke_2(uint64_t a1)
{
  -[AppletConfigurationData maybeQueryMetadata](*(_QWORD *)(a1 + 32));
}

- (void)retryWithBackoff:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_BYTE *)(a1 + 48))
    {
      ATLLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Retry is already in progress, dropping error", buf, 2u);
      }

    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 7;
      if (v5 < 7)
        v6 = *(_QWORD *)(a1 + 40);
      v7 = retryWithBackoff__backoffTable[v6];
      *(_BYTE *)(a1 + 48) = 1;
      *(_QWORD *)(a1 + 40) = v5 + 1;
      ATLLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        v15 = v9;
        v16 = 2048;
        v17 = v7;
        _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "ec %lu retry in %lu sec", buf, 0x16u);
      }

      v10 = dispatch_time(0, 1000000000 * v7);
      v11 = *(NSObject **)(a1 + 8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__AppletConfigurationData_retryWithBackoff___block_invoke;
      v12[3] = &unk_1E7D8AA48;
      v12[4] = a1;
      v13 = v3;
      dispatch_after(v10, v11, v12);

    }
  }

}

void __40__AppletConfigurationData_queryMetadata__block_invoke_3(uint64_t a1)
{
  -[AppletConfigurationData maybeQueryMetadata](*(_QWORD *)(a1 + 32));
}

- (void)tsmScriptPerformed:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AppletConfigurationData_tsmScriptPerformed___block_invoke;
  block[3] = &unk_1E7D8A680;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__AppletConfigurationData_tsmScriptPerformed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  ATLLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_DEFAULT, "TSM script performed, synchronizing catalog as well", v3, 2u);
  }

  -[AppletConfigurationData queryMetadata](*(_QWORD *)(a1 + 32));
}

void __34__AppletConfigurationData_queryMA__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AppletConfigurationData_queryMA__block_invoke_2;
  block[3] = &unk_1E7D8A908;
  block[4] = v2;
  v7 = a2;
  v6 = v3;
  dispatch_async(v4, block);

}

void __34__AppletConfigurationData_queryMA__block_invoke_2(uint64_t a1)
{
  -[AppletConfigurationData handleQueryResult:query:](*(dispatch_queue_t **)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
}

- (void)handleQueryResult:(void *)a3 query:
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  dispatch_queue_t *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id location;
  _BYTE buf[24];
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[1]);
    objc_initWeak(&location, a1);
    ATLLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1C3511000, v6, OS_LOG_TYPE_DEFAULT, "Query %@ result %ld", buf, 0x16u);
    }

    switch(a2)
    {
      case 0:
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v5, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
              v14 = (dispatch_queue_t *)objc_loadWeakRetained(&location);
              -[AppletConfigurationData handleQuerySuccess:](v14, v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v10);
        }

        break;
      case 1:
      case 3:
      case 4:
      case 6:
      case 8:
      case 10:
      case 12:
        ATLLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = a2;
          _os_log_impl(&dword_1C3511000, v7, OS_LOG_TYPE_ERROR, "MA Transient error %ld", buf, 0xCu);
        }

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __51__AppletConfigurationData_handleQueryResult_query___block_invoke;
        v28[3] = &unk_1E7D8A870;
        objc_copyWeak(&v29, &location);
        -[AppletConfigurationData retryWithBackoff:]((uint64_t)a1, v28);
        objc_destroyWeak(&v29);
        break;
      case 2:
        -[AppletConfigurationData queryMetadata]((uint64_t)a1);
        break;
      case 5:
      case 7:
      case 11:
      case 13:
      case 14:
        ATLLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "MA Fatal Error not retrying", buf, 2u);
        }

        break;
      case 9:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v32 = -1;
        ATLLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1C3511000, v15, OS_LOG_TYPE_DEFAULT, "Registering for lock status changes", v23, 2u);
        }

        v16 = *(_QWORD *)&buf[8];
        v17 = a1[1];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __51__AppletConfigurationData_handleQueryResult_query___block_invoke_563;
        v21[3] = &unk_1E7D8A958;
        v21[4] = buf;
        objc_copyWeak(&v22, &location);
        notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(v16 + 24), v17, v21);
        if (MKBDeviceUnlockedSinceBoot())
        {
          ATLLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEFAULT, "Device unlocked between last query and registration, canceling notify and requery", v23, 2u);
          }

          v19 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
          if (v19 >= 1)
          {
            notify_cancel(v19);
            *(_DWORD *)(*(_QWORD *)&buf[8] + 24) = -1;
          }
          v20 = objc_loadWeakRetained(&location);
          -[AppletConfigurationData queryMA](v20);

        }
        objc_destroyWeak(&v22);
        _Block_object_dispose(buf, 8);
        break;
      default:
        break;
    }
    objc_destroyWeak(&location);
  }

}

void __51__AppletConfigurationData_handleQueryResult_query___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AppletConfigurationData queryMA](WeakRetained);

}

- (void)handleQuerySuccess:(dispatch_queue_t *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    dispatch_assert_queue_V2(a1[1]);
    ATLLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "assetId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "state");
      objc_msgSend(v3, "attributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v5;
      v20 = 2048;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1C3511000, v4, OS_LOG_TYPE_DEFAULT, "Got asset id %@ state %ld attributes %@", buf, 0x20u);

    }
    if ((-[AppletConfigurationData isEligibleAsset:]((uint64_t)a1, v3) & 1) != 0)
    {
      v8 = objc_msgSend(v3, "state");
      v9 = &__block_literal_global_567;
      switch(v8)
      {
        case 0:
          ATLLogObject();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_DEFAULT, "Unknown asset state . . . ", buf, 2u);
          }

          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __46__AppletConfigurationData_handleQuerySuccess___block_invoke_566;
          v15[3] = &unk_1E7D8A870;
          objc_copyWeak(&v16, &location);
          -[AppletConfigurationData retryWithBackoff:]((uint64_t)a1, v15);
          objc_destroyWeak(&v16);
          break;
        case 1:
        case 4:
          v11 = a1[1];
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __46__AppletConfigurationData_handleQuerySuccess___block_invoke_2;
          v13[3] = &unk_1E7D8A9C0;
          v13[4] = a1;
          v14 = v3;
          dispatch_async(v11, v13);

          break;
        case 2:
        case 5:
        case 6:
          -[AppletConfigurationData handleAvailableAsset:](a1, v3);
          break;
        case 3:
          goto LABEL_11;
        default:
          break;
      }
    }
    else if (objc_msgSend(v3, "state") == 2)
    {
      ATLLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_DEFAULT, "Purgning ineligible asset in installed state", buf, 2u);
      }

      v9 = &__block_literal_global_565;
LABEL_11:
      objc_msgSend(v3, "purge:", v9);
    }
    objc_destroyWeak(&location);
  }

}

void __51__AppletConfigurationData_handleQueryResult_query___block_invoke_563(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id WeakRetained;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_DEFAULT, "Got lock status change, querying and canceling notify token %d", (uint8_t *)v5, 8u);
  }

  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[AppletConfigurationData queryMA](WeakRetained);

    notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
  }
}

- (uint64_t)isEligibleAsset:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  _BYTE v19[10];
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == 6)
    {
      objc_msgSend(*(id *)(a1 + 16), "objectForKey:", CFSTR("config"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9 || -[NSObject compare:](v9, "compare:", v11) == -1)
      {
        v12 = MGCopyAnswer();
        objc_msgSend(v4, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("deviceClasses"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v15, "containsObject:", v12);
        if ((v13 & 1) == 0)
        {
          ATLLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 138412546;
            *(_QWORD *)v19 = v15;
            *(_WORD *)&v19[8] = 2112;
            v20 = v12;
            _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_DEFAULT, "Asset ineligible because device class %@ does not contain %@", (uint8_t *)&v18, 0x16u);
          }

        }
      }
      else
      {
        ATLLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412546;
          *(_QWORD *)v19 = v11;
          *(_WORD *)&v19[8] = 2112;
          v20 = v9;
          _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_DEFAULT, "Asset CV %@ <= currentCV %@", (uint8_t *)&v18, 0x16u);
        }
        v13 = 0;
      }

    }
    else
    {
      ATLLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109376;
        *(_DWORD *)v19 = v7;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 6;
        _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_DEFAULT, "Asset ineligible, asset compatVersion %d mine %d", (uint8_t *)&v18, 0xEu);
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __46__AppletConfigurationData_handleQuerySuccess___block_invoke_566(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AppletConfigurationData queryMA](WeakRetained);

}

void __46__AppletConfigurationData_handleQuerySuccess___block_invoke_2(uint64_t a1)
{
  -[AppletConfigurationData downloadAsset:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)downloadAsset:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", CFSTR("assetDownloadStartedOn"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      v7 = fabs(v6);
    }
    else
    {
      v8 = *(void **)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("assetDownloadStartedOn"));

      v7 = 0.0;
    }
    -[AppletConfigurationData optionsForInterval:](a1, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__AppletConfigurationData_downloadAsset___block_invoke;
    v11[3] = &unk_1E7D8A930;
    v11[4] = a1;
    v12 = v3;
    objc_msgSend(v12, "startDownload:then:", v10, v11);

  }
}

- (void)handleAvailableAsset:(dispatch_queue_t *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[1]);
    if ((-[AppletConfigurationData isEligibleAsset:]((uint64_t)a1, v3) & 1) != 0)
    {
      objc_msgSend(v3, "getLocalFileUrl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ATLConfiguration.plist"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, &v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v19;
      if (v6)
      {
        v8 = objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v3, "attributes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, CFSTR("_CompatibilityVersion"));

        objc_msgSend(v3, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, CFSTR("_ContentVersion"));

        +[AppletConfigurationData getStaticConfig](AppletConfigurationData, "getStaticConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        objc_msgSend(v14, "addEntriesFromDictionary:", v8);
        v15 = a1;
        objc_sync_enter(v15);
        objc_storeStrong(v15 + 3, v14);
        objc_msgSend(v15[4], "removeAllObjects");
        objc_sync_exit(v15);

        objc_msgSend(v15[2], "setObject:forKey:", v8, CFSTR("config"));
        objc_msgSend(v15[2], "synchronize");
        objc_msgSend(v3, "purge:", &__block_literal_global_575);
        ATLLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v17;
          _os_log_impl(&dword_1C3511000, v16, OS_LOG_TYPE_DEFAULT, "Asset version %@ successfully set and syncrhonized", buf, 0xCu);

        }
      }
      else
      {
        ATLLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v5;
          v22 = 2112;
          v23 = v7;
          _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "Failed to load config at URL %@ error %@", buf, 0x16u);
        }
      }

    }
    else
    {
      ATLLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_DEFAULT, "Purging ineligible asset", buf, 2u);
      }

      objc_msgSend(v3, "purge:", &__block_literal_global_571);
    }
  }

}

void __41__AppletConfigurationData_downloadAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AppletConfigurationData_downloadAsset___block_invoke_2;
  block[3] = &unk_1E7D8A908;
  v7 = a2;
  block[4] = v2;
  v6 = v3;
  dispatch_async(v4, block);

}

void __41__AppletConfigurationData_downloadAsset___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v9 = v3;
    _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_DEFAULT, "Download result %ld", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 10 || v4 == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", CFSTR("assetDownloadStartedOn"));
    -[AppletConfigurationData handleAvailableAsset:](*(dispatch_queue_t **)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__AppletConfigurationData_downloadAsset___block_invoke_570;
    v7[3] = &unk_1E7D8A680;
    v7[4] = v6;
    -[AppletConfigurationData retryWithBackoff:](v6, v7);
  }
}

uint64_t __41__AppletConfigurationData_downloadAsset___block_invoke_570(uint64_t a1)
{
  return -[AppletConfigurationData queryMA](*(_QWORD *)(a1 + 32));
}

uint64_t __44__AppletConfigurationData_retryWithBackoff___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)pluginDecoderForMid:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AppletConfigurationData getInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppletConfigurationData pluginDecoderForMid:depth:](v4, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pluginDecoderForMid:(int)a3 depth:
{
  id v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    v6 = a1;
    objc_sync_enter(v6);
    objc_msgSend(v6[4], "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = v8;
    }
    else
    {
      objc_msgSend(v6[3], "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pluginData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        +[PluginDecoder decoderWithData:]((uint64_t)PluginDecoder, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6[4], "setObject:forKeyedSubscript:", v12, v5);
        v8 = v12;
        v9 = v8;
      }
      else
      {
        objc_msgSend(v6[3], "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pluginAlias"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        if (a3 <= 11 && v14)
        {
          -[AppletConfigurationData pluginDecoderForMid:depth:](v6, v14, (a3 + 1));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v8 = 0;
      }

    }
    objc_sync_exit(v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)dataHash
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HashHelper hashHelper]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addDictionary:](v3, v2);
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper getHash](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)scriptForModule:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[AppletConfigurationData getConfig]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appletConfigurationScript"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)plasticCardScriptForModule:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[AppletConfigurationData getConfig]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appletPlasticModeScript"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)extraDebugScriptForModule:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[AppletConfigurationData getConfig]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appletDebugScript"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getNFCSettings
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nfcSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "No NFC Settings in config?!", v7, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (id)getWuluSettings
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("wuluSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "No Wulu Settings in config?!", v7, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (id)getHerculesSettings
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("herculesSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "No Hercules Settings in config?!", v7, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (id)getSlalomSettings
{
  void *v2;
  void *v3;
  id v4;

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("slalomSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];

  return v4;
}

+ (id)getDreamworksSettings
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dreamworksSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "No Dreamworks Settings in config?!", v7, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (id)getExpressModeSettings
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  +[AppletConfigurationData getConfig]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expressMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    ATLLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "No EM Settings in config?!", v7, 2u);
    }

    v4 = (id)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

+ (BOOL)setConfiguration:(id)a3
{
  id v3;
  id *v4;
  _QWORD *v5;
  void *v6;

  v3 = a3;
  if (!v3)
  {
    +[AppletConfigurationData getStaticConfig](AppletConfigurationData, "getStaticConfig");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[AppletConfigurationData getInstance]();
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[4], "removeAllObjects");

  }
  objc_opt_self();
  +[AppletConfigurationData getInstance]();
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[3];
  v5[3] = v3;

  return 1;
}

+ (void)init
{
  id v2;

  v2 = +[AppletConfigurationData getInstance]();
  +[AppletConfigurationData registerStateHandler]();
}

+ (void)registerStateHandler
{
  objc_opt_self();
  if (registerStateHandler_onceToken != -1)
    dispatch_once(&registerStateHandler_onceToken, &__block_literal_global_579);
}

uint64_t __47__AppletConfigurationData_registerStateHandler__block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__47__AppletConfigurationData_registerStateHandler__block_invoke_2()
{
  return +[AppletConfigurationData dumpState]();
}

+ (_DWORD)dumpState
{
  void *v0;
  void *v1;
  void *v2;
  _DWORD *v3;
  id v4;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0CB38B0];
  +[AppletConfigurationData getConfig]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dataWithPropertyList:format:options:error:", v1, 200, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = malloc_type_calloc(1uLL, objc_msgSend(v2, "length") + 200, 0x892A2071uLL);
  *v3 = 1;
  v3[1] = objc_msgSend(v2, "length");
  __strlcpy_chk();
  v4 = objc_retainAutorelease(v2);
  memcpy(v3 + 50, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pluginCache, 0);
  objc_storeStrong((id *)&self->config, 0);
  objc_storeStrong((id *)&self->userDefaults, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

+ (id)getStaticConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[9];
  _QWORD v28[9];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("appletConfigurationScript");
  v25[1] = CFSTR("appletPlasticModeScript");
  v26[0] = &unk_1E7D9CF48;
  v26[1] = &unk_1E7D9CF78;
  v27[0] = CFSTR("D1560000101000001201");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v2;
  v27[1] = CFSTR("9156000014020001");
  v23[0] = CFSTR("appletConfigurationScript");
  v23[1] = CFSTR("appletPlasticModeScript");
  v24[0] = &unk_1E7D9CF60;
  v24[1] = &unk_1E7D9CF78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v3;
  v27[2] = CFSTR("A000000704A0010010010001");
  v21[0] = CFSTR("appletConfigurationScript");
  v21[1] = CFSTR("appletPlasticModeScript");
  v22[0] = &unk_1E7D9CF90;
  v22[1] = &unk_1E7D9CFA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v4;
  v27[3] = CFSTR("A0000003965453000000010150000000");
  v19[0] = CFSTR("appletConfigurationScript");
  v19[1] = CFSTR("appletPlasticModeScript");
  v20[0] = &unk_1E7D9CFD8;
  v20[1] = &unk_1E7D9CFC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v5;
  v27[4] = CFSTR("F8434E412E43414C2E52657633");
  v17[0] = CFSTR("appletConfigurationScript");
  v17[1] = CFSTR("appletPlasticModeScript");
  v18[0] = &unk_1E7D9D008;
  v18[1] = &unk_1E7D9CFF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v6;
  v27[5] = CFSTR("nfcSettings");
  objc_opt_self();
  v28[5] = &unk_1E7D9D208;
  v27[6] = CFSTR("wuluSettings");
  objc_opt_self();
  v28[6] = &unk_1E7D9D820;
  v27[7] = CFSTR("expressMode");
  +[AppletConfigurationData getStaticExpressModeSettings]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v7;
  v27[8] = CFSTR("herculesSettings");
  +[AppletConfigurationData getStaticHerculesSettings]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v33[0] = CFSTR("dreamworksMetroTypes");
  v33[1] = CFSTR("dreamworksBusTypeRanges");
  v34[0] = &unk_1E7D9D110;
  v34[1] = &unk_1E7D9D170;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v10;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("appletConfigurationScript");
  v29[1] = CFSTR("appletPlasticModeScript");
  v30[0] = &unk_1E7D9D0E0;
  v30[1] = &unk_1E7D9D0F8;
  v31[0] = CFSTR("A0000008588400010100");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("dreamworksSettings");
  v32[0] = v14;
  v32[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v15);

  return v12;
}

+ (id)getStaticExpressModeSettings
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v10 = CFSTR("rfModifierTCIs");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciNYTR3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciBrisbaneTR3, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciAccessIS, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciRevere, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciLyon, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &getStaticExpressModeSettings_tciSF, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getStaticHerculesSettings
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = CFSTR("fareTables");
  objc_msgSend(&unk_1E7D9AF20, "stringValue");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v6[0] = CFSTR("KHkBAQABAlAoeQIBAAECTCh5BgEAAQWoKXkBAQABAk8qeQEBAAECTip5AgEAAQM8KnkGAQABBaoreQEBAAECTS15AQEAAQXRLnkBAQABBdAyKQEDAAEAYT55AQEAAQI4P3kCAQABAjk/eQYBAAEFqUAAAQMAAEABQAACAwAAQAJAAAMDAAEE9EAABAMAAEAEQAAFAwAAQAVAAAYDAABABkAABwMAAEB/QAAJAwAAQAlAABADAABAhEAAEQMAAECFQAASAwAAQIZAABMDAABAh0AAFAMAAECIQAAVAwAAQIlAABYDAABACkAAFwMAAECLQACAAwAAQIBAAIEDAABAfkABCAMAAEAIQAGDAwAAQINAFQ8DAABAgkAWDgMAAECBQBZ/AwABBgxAMwwDAAEFMEBlCwMAAQTgURUBAQABBsBjFgEDAAEAYnIWAQMAAQBjgXkBAQABA1CaAQgBAACaCKMBCAEAAKMI8AABAwABAPrwAAIDAAEA+/AABgMAAQW/8DMMAwABAhfxAAEDAAEA+PEAAgMAAQD58QAGAwABBbzxAIADAAEFw/EzDAMAAQIY8gABAwABAPzyAAIDAAEA/fIABgMAAQXC8jMMAwABAhnzAAEDAAEB/PMAAgMAAQH98wAGAwABBcHzAIADAAEFx/QAAQMAAQIS9AACAwABAhP0AAYDAAEFwPUAAQMAAQH+9QACAwABAf/1AAYDAAEFvvUAgAMAAQXF9gABAwABAhD2AAIDAAECEfYABgMAAQW99gCAAwABBcT5AAEDAAECFPkAgAMAAQXG+gACAwABAhX7AAYDAAECFvwzDAMAAQIa");
  objc_msgSend(&unk_1E7D9AFF8, "stringValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  v6[1] = CFSTR("AA0BAQABBH4BDQEBAAEEfwENAgEAAQSAAwoBAQABAZsFAwEBAAEElgUGAQEAAQANBQsBAQABBFYFDgEBAAEFlgYLAgEAAQRXBg4CAQABBZcHBgEBAAEEIwcLBAEAAQRYBw0BAQABBIcHDQIBAAEEiAcNBAEAAQSKBw0FAQABBIkHDgUBAAEFmQgBAQEAAAgBCAYBAQABBCQICwUBAAEEWQgOBAEAAQWYEAIBAQABAbMQAgIBAAEBtBEFAQEAAQM+EQsBAQABBGQSBQIBAAEDQBMFBAEAAQNCFAUFAQABA0QUBgEBAAEAURQLAQEAAQRnFQUBAQABAz8WBQUBAAEDRRcFAgEAAQNBGAUEAQABA0MYBgEBAAEAMhgIAQEAAQPAGQUBAQABBKwdAQEBAAAdAR0GAQEAAQQXHgUBAQABBTIfBgEBAAEENyEJAQEAAQLEIgkCAQABAsUjCQUBAAECxiMMAQEAAQRJJAkEAQABAsckDAIBAAEESiUCAQEAAQI2JQYBAQABBO4lDAUBAAEESyYCAQEAAQI3JgYBAQABBP8mDAQBAAEETCcCAQEAAQI4JwwBAQABBE0oAgIBAAECOSkCAgEAAQI6KgICAQABAjsrBwEBAAEDvzEHAQEAAQPMMQcCAQABA9gyBwEBAAEDzTIHAgEAAQPZMwcBAQABA84zBwIBAAED2jQGAQEAAQA7NAcBAQABA880BwIBAAED2zUHAQEAAQPQNQcCAQABA902AAIBAAEC0TcAAgEAAQLSNwYBAQABADo4BgEBAAEAOTkGAQEAAQA2OgABAQABA4I6AAIBAAEDgzoABAEAAQOEOgAFAQABA4U6AgUBAAECbjoGAQEAAQAwOwABAQABA448AAEBAAEDjz0AAQEAAQOQPgABAQABA5E/AAEBAAEDkj8CBAEAAQJ0PwcBAQABA/FCAgUBAAECeEMCBQEAAQJ5RAIFAQABAnpFAgQBAAECfEYCBAEAAQJ+RwIEAQABAoBPBwEBAAEEAVAHAgEAAQQCUgoBAQABApVWAAMDAAEDHFcCAQEAAQUEWAABAQABBPtYAgIBAAEFBVoAAQEAAQOTXQABAQABA5R/CgEBAAEDrX8KAgEAAQOuhgABAQABADyGAAIBAAEAPYYKAQEAAQO1hwABAwABAMmHAAIDAAEAU4cABAMAAQE9hwAFAwABAFSHCgIBAAEDsogKAgEAAQOziQoCAQABA7SKAAEBAAEDlYoKAQEAAQO2iwABAQABA5aLCgEBAAEDt4wAAQEAAQOXjAQBAQABAeWNAAEBAAEDmJkAAgEAAQT9mwAFAQABBQGcAAQBAAEFAJ0AAQEAAQURnwABAQABBUO5AQMBAAEDLroBAwEAAQMvvQEBAQABA1C+AQEBAAEDUcABAQEAAQNTwQECAQABA1XDAQIBAAEDVMUBBAEAAQNnxgEFAQABA2jPAQEBAAEDh9ABAQEAAQOI2QEBAQABA9HdAQEBAAED5eQBAQEAAQQT7wEBAQABBM3yAQEBAAEE0PgBAQEAAQUC");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
