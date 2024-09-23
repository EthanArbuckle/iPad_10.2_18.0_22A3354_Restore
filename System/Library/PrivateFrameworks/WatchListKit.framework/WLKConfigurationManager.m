@implementation WLKConfigurationManager

void __41__WLKConfigurationManager_sharedInstance__block_invoke()
{
  NSObject *v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Init", ", buf, 2u);
  }

  v1 = -[WLKConfigurationManager _init]([WLKConfigurationManager alloc], "_init");
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

  WLKStartupSignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Init", ", v4, 2u);
  }

}

- (id)_init
{
  WLKConfigurationManager *v2;
  WLKConfigurationManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *fetchQueue;
  void *v7;
  WLKSharedFileStorage *v8;
  WLKSharedFileStorage *fileCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WLKConfigurationManager;
  v2 = -[WLKConfigurationManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_extendedCacheExpireDuration = 0.0;
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("WLKConfigurationManagerInternalFetch", 0, v4);
    fetchQueue = v3->_fetchQueue;
    v3->_fetchQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleLibraryDidChangeNotification_, CFSTR("WLKAppLibraryDidChangeNotification"), 0);

    v8 = -[WLKSharedFileStorage initWithFileName:class:]([WLKSharedFileStorage alloc], "initWithFileName:class:", CFSTR("serverConfiguration.plist"), objc_opt_class());
    fileCache = v3->_fileCache;
    v3->_fileCache = v8;

  }
  return v3;
}

- (void)setExtendedCacheExpireDuration:(double)a3
{
  self->_extendedCacheExpireDuration = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  return (id)sharedInstance_sharedInstance;
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t *v24;
  char v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  const __CFString *v39;
  id v40;
  NSObject *v41;
  const __CFString *v42;
  id WeakRetained;
  void *v44;
  void *v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  __int128 *p_buf;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t v56[4];
  const __CFString *v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utsk");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  switch(*(_QWORD *)(a1 + 64))
  {
    case 0:
      if (!v2)
        goto LABEL_26;
      if ((objc_msgSend(v2, "isValid") & 1) != 0)
        goto LABEL_19;
      WLKNetworkingLogObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is no good. Load new one then replace the cache later when response comes", (uint8_t *)&buf, 2u);
      }

      goto LABEL_7;
    case 1:
      if (!v2)
        goto LABEL_26;
      goto LABEL_19;
    case 2:
      if (!v2)
        goto LABEL_26;
      goto LABEL_20;
    case 3:
LABEL_7:
      v4 = 1;
      goto LABEL_27;
    case 4:
      if (!v2)
        goto LABEL_26;
      if ((objc_msgSend(v2, "isValid") & 1) != 0)
        goto LABEL_19;
      WLKNetworkingLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is no good. If fails to load, use expired.", (uint8_t *)&buf, 2u);
      }

      v4 = 0;
      v6 = 0;
      goto LABEL_28;
    case 5:
      if (!v2)
        goto LABEL_26;
      objc_msgSend(*(id *)(a1 + 32), "extendedCacheExpireDuration");
      if ((objc_msgSend(v2, "isValidWithinExtendedExpiration:") & 1) == 0)
      {
        WLKNetworkingLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is not valid within extended expiration duration, try to load another one", (uint8_t *)&buf, 2u);
        }

LABEL_26:
        v4 = 0;
LABEL_27:
        v6 = 1;
LABEL_28:
        WLKStartupSignpostLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v12))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B515A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync", ", (uint8_t *)&buf, 2u);
        }

        +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:](WLKSettingsCloudUtilities, "synchronizeSettingsFromCloudIfNeededWithCompletion:", &__block_literal_global_25);
        WLKNetworkingLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "_stringForCachePolicy:", *(_QWORD *)(a1 + 64));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - fetchConfiguration with cachePolicy: %@", (uint8_t *)&buf, 0xCu);

        }
        v45 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        if (!v45)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__0;
        v61 = __Block_byref_object_dispose__0;
        v62 = 0;
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__0;
        v54 = __Block_byref_object_dispose__0;
        v55 = 0;
        v15 = dispatch_semaphore_create(0);
        v16 = *(_QWORD *)(a1 + 64);
        v17 = *(_QWORD *)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 32), "extendedCacheExpireDuration");
        v19 = v18;
        if (v16 == 1)
          v20 = 2;
        else
          v20 = v4;
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_28;
        v46[3] = &unk_1E68A82D0;
        v48 = &v50;
        p_buf = &buf;
        v22 = v15;
        v47 = v22;
        +[WLKConfigurationRequest fetchWithOptions:cachePolicy:wlkCachePolicy:extendedCacheExpireDuration:sessionConfiguration:queryParameters:fileStorage:completion:](WLKConfigurationRequest, "fetchWithOptions:cachePolicy:wlkCachePolicy:extendedCacheExpireDuration:sessionConfiguration:queryParameters:fileStorage:completion:", v17, v20, v16, 0, v45, v21, v19, v46);
        dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
        if (v2)
        {
          v23 = objc_msgSend(v2, "isValidIgnoringExpiration");
          v24 = v51;
          if (v23)
          {
            v25 = v51[5] ? 1 : v6;
            if ((v25 & 1) == 0)
            {
              WLKNetworkingLogObject();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v56 = 0;
                _os_log_impl(&dword_1B515A000, v26, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Current init/config is valid and new init/config is nil. Policy allows the use of expired init/config.", v56, 2u);
              }

              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_67:

              _Block_object_dispose(&v50, 8);
              _Block_object_dispose(&buf, 8);

              v10 = 0;
              goto LABEL_68;
            }
          }
        }
        else
        {
          v24 = v51;
        }
        objc_msgSend(WeakRetained, "_setConfig:", v24[5]);
        objc_msgSend((id)v51[5], "utsk");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44 && (objc_msgSend(v44, "isEqualToString:", v27) & 1) == 0)
        {
          WLKNetworkingLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_1B515A000, v28, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Posting UTSK didChange notification", v56, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v51[5], "responseDictionary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "postNotificationName:object:", CFSTR("WLKServerConfigurationUTSKDidChangeNotification"), v30);

        }
        if (v2)
        {
          objc_msgSend(v2, "responseDictionary");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v51[5], "responseDictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v31, "isEqualToDictionary:", v32);

          if ((v33 & 1) == 0)
          {
            WLKNetworkingLogObject();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v56 = 0;
              _os_log_impl(&dword_1B515A000, v34, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Posting in-process didChange notification", v56, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v51[5], "responseDictionary");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "postNotificationName:object:", CFSTR("WLKServerConfigurationDidChangeNotification"), v36);

          }
        }
        v37 = v51[5];
        WLKNetworkingLogObject();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = CFSTR("success");
          if (!v37)
            v39 = CFSTR("failure");
          *(_DWORD *)v56 = 138412290;
          v57 = v39;
          _os_log_impl(&dword_1B515A000, v38, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Firing completion handler %@", v56, 0xCu);
        }

        if (v37)
        {
          v40 = 0;
        }
        else
        {
          WLKNetworkingLogObject();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *(const __CFString **)(*((_QWORD *)&buf + 1) + 40);
            *(_DWORD *)v56 = 138412290;
            v57 = v42;
            _os_log_impl(&dword_1B515A000, v41, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Error: %@", v56, 0xCu);
          }

          v40 = *(id *)(*((_QWORD *)&buf + 1) + 40);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        goto LABEL_67;
      }
LABEL_19:
      v7 = v2;
LABEL_20:
      WLKNetworkingLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "_stringForCachePolicy:", *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache can be used for this policy, return it now, cachePolicy=%@", (uint8_t *)&buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v10 = v2;
LABEL_68:

      return;
    default:
      goto LABEL_26;
  }
}

- (void)fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (!v11)
    -[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:].cold.1();
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  -[WLKConfigurationManager _config](self, "_config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  switch(a4)
  {
    case 0uLL:
      if (v13 && objc_msgSend(v13, "isValid"))
        goto LABEL_4;
      goto LABEL_17;
    case 1uLL:
    case 2uLL:
      if (v13)
        goto LABEL_4;
      goto LABEL_17;
    case 4uLL:
      if (!v13 || (objc_msgSend(v13, "isValidIgnoringExpiration") & 1) == 0)
        goto LABEL_17;
      goto LABEL_4;
    case 5uLL:
      WLKNetworkingLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[WLKConfigurationManager _stringForCachePolicy:](self, "_stringForCachePolicy:", 5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLKConfigurationManager extendedCacheExpireDuration](self, "extendedCacheExpireDuration");
        v22 = 138412546;
        v23 = v18;
        v24 = 2048;
        v25 = v19;
        _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: cachePolicy=%@, extendedCacheExpireDuration=%f", (uint8_t *)&v22, 0x16u);

      }
      if (!v14)
        goto LABEL_17;
      -[WLKConfigurationManager extendedCacheExpireDuration](self, "extendedCacheExpireDuration");
      if ((objc_msgSend(v14, "isValidWithinExtendedExpiration:") & 1) == 0)
        goto LABEL_17;
LABEL_4:
      WLKNetworkingLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[WLKConfigurationManager _stringForCachePolicy:](self, "_stringForCachePolicy:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v16;
        _os_log_impl(&dword_1B515A000, v15, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: Use memory cache immediately, cachePolicy: %@", (uint8_t *)&v22, 0xCu);

      }
      ((void (**)(_QWORD, void *, _QWORD))v12)[2](v12, v14, 0);
      break;
    default:
LABEL_17:
      WLKNetworkingLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[WLKConfigurationManager _stringForCachePolicy:](self, "_stringForCachePolicy:", a4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_impl(&dword_1B515A000, v20, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: Enter fetchQueue to fetch configuration, cachePolicy: %@", (uint8_t *)&v22, 0xCu);

      }
      -[WLKConfigurationManager _fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:](self, "_fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", a3, a4, v10, v12);
      break;
  }

}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("Unmapped");
  else
    return off_1E68A8360[a3];
}

- (double)extendedCacheExpireDuration
{
  return self->_extendedCacheExpireDuration;
}

- (id)_config
{
  WLKServerConfigurationResponse *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  v3 = self->_config;
  os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
  return v3;
}

uint64_t __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *fetchQueue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21[3];
  id location;
  _QWORD v23[4];
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke;
  v23[3] = &unk_1E68A7C90;
  v24 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x1B5E47FF4](v23);
  objc_initWeak(&location, self);
  fetchQueue = self->_fetchQueue;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_2;
  v18[3] = &unk_1E68A82F8;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a4;
  v21[2] = (id)a3;
  v19 = v10;
  v20 = v14;
  v18[4] = self;
  v16 = v10;
  v17 = v14;
  dispatch_async(fetchQueue, v18);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)_setConfig:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  objc_storeStrong((id *)&self->_config, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
  if (v6)
  {
    +[WLKStoredConfigurationManager sharedInstance](WLKStoredConfigurationManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateConfiguration:", v6);

  }
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setUtsk:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  WLKServerConfigurationResponse *v11;
  WLKServerConfigurationResponse *config;
  WLKServerConfigurationResponse *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  -[WLKServerConfigurationResponse utsk](self->_config, "utsk");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[WLKServerConfigurationResponse utsk](self->_config, "utsk"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", v4),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    WLKNetworkingLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[WLKServerConfigurationResponse utsk](self->_config, "utsk");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Handling UTSK change: %@ -> %@", (uint8_t *)&v16, 0x16u);

    }
    -[WLKServerConfigurationResponse configurationResponseByReplacingUTSK:](self->_config, "configurationResponseByReplacingUTSK:", v4);
    v11 = (WLKServerConfigurationResponse *)objc_claimAutoreleasedReturnValue();
    config = self->_config;
    self->_config = v11;
    v13 = v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKServerConfigurationResponse responseDictionary](self->_config, "responseDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "postNotificationName:object:", CFSTR("WLKServerConfigurationUTSKDidChangeNotification"), v15);
    os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
    -[WLKConfigurationManager _invalidateCache](self, "_invalidateCache");
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
  }

}

- (WLKConfigurationManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKConfigurationManagerInitException"), CFSTR("init is not supported. Use +sharedInstance"));

  return 0;
}

- (void)fetchConfigurationWithCompletionHandler:(id)a3
{
  -[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:](self, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 0, 0, a3);
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (v4)
  {
    WLKNetworkingLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_23_cold_1(a2, v4, v5);

  }
  WLKStartupSignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync", ", v7, 2u);
  }

}

- (id)_configuration
{
  return -[WLKConfigurationManager _configurationWithOptions:cachePolicy:queryParameters:](self, "_configurationWithOptions:cachePolicy:queryParameters:", 0, 0, 0);
}

- (id)_configurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a5;
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__WLKConfigurationManager__configurationWithOptions_cachePolicy_queryParameters___block_invoke;
  v14[3] = &unk_1E68A8320;
  v16 = &v17;
  v10 = v9;
  v15 = v10;
  -[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:](self, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", a3, a4, v8, v14);
  v11 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v10, v11);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __81__WLKConfigurationManager__configurationWithOptions_cachePolicy_queryParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6 && !a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_utsk
{
  void *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  -[WLKServerConfigurationResponse utsk](self->_config, "utsk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
  return v4;
}

- (void)_invalidateCache
{
  NSObject *v3;
  WLKServerConfigurationResponse *config;
  uint8_t v5[16];

  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating cache", v5, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  config = self->_config;
  self->_config = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
  -[WLKConfigurationManager _invalidateNetworkCache](self, "_invalidateNetworkCache");
}

- (void)_invalidateNetworkCache
{
  NSObject *v3;
  uint8_t v4[16];

  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating URL cache", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&__accessLock);
  -[WLKSharedFileStorage delete:](self->_fileCache, "delete:", &__block_literal_global_34);
  os_unfair_lock_unlock((os_unfair_lock_t)&__accessLock);
}

void __50__WLKConfigurationManager__invalidateNetworkCache__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WLKNetworkingLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating disk cache success: %d Err: %@", (uint8_t *)v6, 0x12u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCache, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

- (void)fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:.cold.1()
{
  __assert_rtn("-[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:]", "WLKConfigurationManager.m", 99, "completion != nil");
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_23_cold_1(char a1, void *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a1 & 1;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_1B515A000, a3, OS_LOG_TYPE_ERROR, "WLKConfigurationManager - fetchConfiguration SettingsSync success: %d error: %@", (uint8_t *)v6, 0x12u);

}

@end
