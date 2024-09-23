@implementation TIAssetManager

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  TIAssetsOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CacheDelete - Purgable(urgency=%d)"), "-[TIAssetManager registerCacheDeleteCallbacks]_block_invoke", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v8 = objc_msgSend(WeakRetained, "amountOfPurgeableAssetsWithUrgency:", a2);
  v13[0] = CFSTR("CACHE_DELETE_VOLUME");
  objc_msgSend(a3, "objectForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_1EA13FFA0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_1EA13FFA0);
        if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(&unk_1EA13FFA0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (int64_t)amountOfPurgeableAssetsWithUrgency:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Computing bytes of purgeable assets with urgency %d"), "-[TIAssetManager amountOfPurgeableAssetsWithUrgency:]", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  TIAssetsOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Found %lld purgeable bytes."), "-[TIAssetManager amountOfPurgeableAssetsWithUrgency:]", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  return 0;
}

+ (id)sharedAssetManager
{
  return (id)objc_msgSend(a1, "sharedAssetManagerWithEnabledInputModesProvider:", 0);
}

- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5
{
  _BOOL8 v5;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = (__CFString *)a3;
  objc_msgSend(a4, "normalizedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (__CFString *)(id)*MEMORY[0x1E0D1C9F0];
  if (-[TIAssetManager requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:](self, "requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:", v10)&& v8 == CFSTR("LexiconDelta"))
  {

    v11 = CFSTR("com.apple.MobileAsset.MecabraDictionaryRapidUpdates");
  }
  -[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:](self, "_ddsAssetsForAssetType:languageIdentifier:cachedOnly:", v11, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:](self, "_ddsContentItemsFromAssets:contentType:filteredWithRegion:", v12, v8, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
    -[TIAssetManager _warmAssetQueryForLanguage:](self, "_warmAssetQueryForLanguage:", v10);

  return v13;
}

- (id)_ddsContentItemsFromAssets:(id)a3 contentType:(id)a4 filteredWithRegion:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  _BOOL4 v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  TIAssetsOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_msgSend(v8, "count");
    v13 = "NO";
    if (v5)
      v13 = "YES";
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Filtering content items from %lu asset(s) for contentType '%@' (filteredWithRegion: %s)"), "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v12, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v14;
    _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1CA10], "attributeFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addContentType:", v9);
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("LanguageModel")))
      objc_msgSend(v15, "addContentType:", CFSTR("MultilingualLanguageModel"));
    if (v5)
    {
      v35 = v5;
      v36 = v9;
      v37 = v8;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[TIAssetManager topActiveRegions](self, "topActiveRegions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        v38 = v16;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Country"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Province"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("City"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            TIAssetsOSLogFacility();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Adding country: %@, province: %@, city: %@"), "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v22, v23, v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v45 = v26;
              _os_log_debug_impl(&dword_1DA6F2000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              v16 = v38;
            }

            objc_msgSend(v15, "addRegionWithCountry:province:city:", v22, v23, v24);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v18);
      }

      v9 = v36;
      v8 = v37;
      v5 = v35;
    }
    objc_msgSend(v15, "addRegionWithCountry:province:city:", &stru_1EA1081D0, &stru_1EA1081D0, &stru_1EA1081D0);
    objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentItemsFromAssets:matchingFilter:", v8, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    TIAssetsOSLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = objc_msgSend(v28, "count");
      v32 = "NO";
      if (v5)
        v32 = "YES";
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%s Found %lu content item(s) for contentType '%@' (filteredWithRegion: %s)"), "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v31, v9, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v33;
      _os_log_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

- (id)_ddsAssetsForAssetType:(id)a3 languageIdentifier:(id)a4 cachedOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  TIAssetsOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    if (v5)
      v10 = "YES";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Getting assets for asset type: '%@' language identifier '%@' (cached only: %s)"), "-[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:]", v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CA08]), "initWithAssetType:languageIdentifier:", v7, v8);
  objc_msgSend(v12, "setCachedOnly:", v5);
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v13, "assetsForQuery:error:", v12, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  if (v15)
  {
    TIAssetsOSLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = "NO";
      if (v5)
        v18 = "YES";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error getting assets for language identifier '%@' (cached only: %s): %@"), "-[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:]", v8, v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      _os_log_error_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }

  return v14;
}

+ (id)sharedAssetManagerWithEnabledInputModesProvider:(id)a3
{
  if (__testingInstance_6493)
    return (id)__testingInstance_6493;
  +[TIAssetManager singletonInstanceWithEnabledInputModesProvider:](TIAssetManager, "singletonInstanceWithEnabledInputModesProvider:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstanceWithEnabledInputModesProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__TIAssetManager_singletonInstanceWithEnabledInputModesProvider___block_invoke;
    block[3] = &unk_1EA107438;
    v4 = v3;
    v9 = v4;
    if (singletonInstanceWithEnabledInputModesProvider__onceToken == -1)
    {
      v5 = v4;
    }
    else
    {
      dispatch_once(&singletonInstanceWithEnabledInputModesProvider__onceToken, block);
      v5 = v9;
    }
    v6 = (id)singletonInstanceWithEnabledInputModesProvider__singletonInstance;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ddsLanguageIdentifierFromInputMode:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("ars")))
  {
    TIAssetsOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Override the ars locale with ar"), "-[TIAssetManager ddsLanguageIdentifierFromInputMode:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v3 = CFSTR("ar");
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("fil")))
  {
    TIAssetsOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Override the language code from fil to tl for Tagalog"), "-[TIAssetManager ddsLanguageIdentifierFromInputMode:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v9 = CFSTR("tl");
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("mul")))
    {
      v10 = v3;
    }
    else
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v11;
      v6 = v10;
    }
    v9 = v10;
  }

  return v9;
}

void __62__TIAssetManager_ddsAssetsForInputMode_cachedOnly_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "normalizedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ddsLanguageIdentifierFromInputMode:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_ddsAssetsForLanguageIdentifier:cachedOnly:", v5, *(unsigned __int8 *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  -[TIAssetManager dispatchQueue](self, "dispatchQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v10 = v7;
  v11 = v8;
  TIDispatchAsync();

}

- (id)_ddsAssetsForLanguageIdentifier:(id)a3 cachedOnly:(BOOL)a4
{
  return -[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:](self, "_ddsAssetsForAssetType:languageIdentifier:cachedOnly:", *MEMORY[0x1E0D1C9F0], a3, a4);
}

- (TIAssetManager)init
{
  return -[TIAssetManager initWithRequestedInputModes:inputModePreferenceProvider:enabledInputModesProvider:](self, "initWithRequestedInputModes:inputModePreferenceProvider:enabledInputModesProvider:", 0, 0, 0);
}

- (TIAssetManager)initWithRequestedInputModes:(id)a3 inputModePreferenceProvider:(id)a4 enabledInputModesProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIAssetManager *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *dispatchQueue;
  TIRequestedInputModes *v15;
  void *requestedInputModes;
  TIRequestedInputModes *v17;
  uint64_t v18;
  TIRequestedInputModes *v19;
  NSArray *requestedInputModes_mainThreadCache;
  _TIInputModePreferenceProvider *v21;
  TIInputModePreferenceProvider *inputModePreferenceProvider;
  uint64_t v23;
  id enabledInputModeIdentifiersProviderBlock;
  NSArray *v25;
  NSArray *currentActiveRegions;
  NSArray *v27;
  NSArray *currentNormalizedActiveRegions;
  void *v29;
  double v30;
  void *v31;
  TIRequestedInputModes *v32;
  _QWORD v34[4];
  TIAssetManager *v35;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)TIAssetManager;
  v11 = -[TIAssetManager init](&v36, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.TextInput.asset-manager", v12);
    dispatchQueue = v11->_dispatchQueue;
    v11->_dispatchQueue = (OS_dispatch_queue *)v13;

    if (v8)
    {
      v15 = (TIRequestedInputModes *)v8;
      requestedInputModes = v11->_requestedInputModes;
      v11->_requestedInputModes = v15;
    }
    else
    {
      v17 = [TIRequestedInputModes alloc];
      +[TIRequestedInputModes defaultDatabaseURL](TIRequestedInputModes, "defaultDatabaseURL");
      requestedInputModes = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[TIRequestedInputModes initWithURL:](v17, "initWithURL:", requestedInputModes);
      v19 = v11->_requestedInputModes;
      v11->_requestedInputModes = (TIRequestedInputModes *)v18;

    }
    requestedInputModes_mainThreadCache = v11->_requestedInputModes_mainThreadCache;
    v11->_requestedInputModes_mainThreadCache = (NSArray *)MEMORY[0x1E0C9AA60];

    if (v9)
      v21 = (_TIInputModePreferenceProvider *)v9;
    else
      v21 = objc_alloc_init(_TIInputModePreferenceProvider);
    inputModePreferenceProvider = v11->_inputModePreferenceProvider;
    v11->_inputModePreferenceProvider = (TIInputModePreferenceProvider *)v21;

    v23 = objc_msgSend(v10, "copy");
    enabledInputModeIdentifiersProviderBlock = v11->_enabledInputModeIdentifiersProviderBlock;
    v11->_enabledInputModeIdentifiersProviderBlock = (id)v23;

    v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    currentActiveRegions = v11->_currentActiveRegions;
    v11->_currentActiveRegions = v25;

    v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    currentNormalizedActiveRegions = v11->_currentNormalizedActiveRegions;
    v11->_currentNormalizedActiveRegions = v27;

    v29 = (void *)MEMORY[0x1E0C99D68];
    -[TIAssetManager requestExpirationInterval](v11, "requestExpirationInterval");
    objc_msgSend(v29, "dateWithTimeIntervalSinceNow:", -v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v11->_requestedInputModes;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke;
    v34[3] = &unk_1EA103228;
    v35 = v11;
    -[TIRequestedInputModes removeInputModesBeforeDate:handler:](v32, "removeInputModesBeforeDate:handler:", v31, v34);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[TIAssetManager unregisterForNotifications](self, "unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)TIAssetManager;
  -[TIAssetManager dealloc](&v3, sel_dealloc);
}

- (double)requestExpirationInterval
{
  return 864000.0;
}

- (NSMutableSet)languagesWithWarmedAssets
{
  NSMutableSet *languagesWithWarmedAssets;
  NSMutableSet *v4;
  NSMutableSet *v5;

  languagesWithWarmedAssets = self->_languagesWithWarmedAssets;
  if (!languagesWithWarmedAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_languagesWithWarmedAssets;
    self->_languagesWithWarmedAssets = v4;

    languagesWithWarmedAssets = self->_languagesWithWarmedAssets;
  }
  return languagesWithWarmedAssets;
}

- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3
{
  void *v4;
  id enabledInputModeIdentifiersProviderBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  enabledInputModeIdentifiersProviderBlock = self->_enabledInputModeIdentifiersProviderBlock;
  self->_enabledInputModeIdentifiersProviderBlock = v4;

}

- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[TIAssetManager dispatchQueue](self, "dispatchQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  TIDispatchAsync();

}

- (void)_warmAssetQueriesForInputModes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIAssetManager _warmAssetQueryForLanguage:](self, "_warmAssetQueryForLanguage:", v10);
        -[TIAssetManager _warmLDEnumerateAssetQueriesForInputMode:](self, "_warmLDEnumerateAssetQueriesForInputMode:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_warmLDEnumerateAssetQueriesForInputMode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TIAssetManager dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  TIDispatchAsync();

}

- (void)_warmAssetQueryForLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TIAssetManager dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  TIDispatchAsync();

}

- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__TIAssetManager_requestAssetDownloadForLanguage_completion___block_invoke;
  v7[3] = &unk_1EA102930;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[TIAssetManager getActiveRegionsWithCompletion:](self, "getActiveRegionsWithCompletion:", v7);

}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  void (**v12)(id, _QWORD);
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  v22 = a5;
  v12 = (void (**)(id, _QWORD))a7;
  v13 = a6;
  v14 = a4;
  -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CA08]), "initWithLanguageIdentifier:", v15);
  objc_msgSend(v16, "setLocalOnly:", 0);
  objc_msgSend(v16, "setInstalledOnly:", 0);
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D1C9D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D1C9D8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D1C9C8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addRegionWithCountry:province:city:", v17, v18, v19);

  }
  v20 = objc_alloc_init(MEMORY[0x1E0D1CA00]);
  objc_msgSend(v20, "setPreferredDownloadFrequency:", 1);
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAssertionForAssetsWithQuery:policy:assertionID:clientID:", v16, v20, v14, v13);

  v12[2](v12, 0);
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v6 = (void *)MEMORY[0x1E0D1C9F8];
  v9 = (void (**)(id, _QWORD))a5;
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAssertionWithIdentifier:", v7);

  v9[2](v9, 0);
}

- (void)registerForNotifications
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_appleKeyboardsPreferencesChanged_, CFSTR("AppleKeyboardsPreferencesChangedNotification_Private"), 0);

  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDelegate:", self);

  -[TIAssetManager registerCacheDeleteCallbacks](self, "registerCacheDeleteCallbacks");
}

- (void)unregisterForNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)didUpdateAssetsWithType:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TIAssetsOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Handling DDS update of asset type: %@"), "-[TIAssetManager didUpdateAssetsWithType:]", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  TIDispatchAsync();

}

- (void)appleKeyboardsPreferencesChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Observed keyboard preferences changed."), "-[TIAssetManager appleKeyboardsPreferencesChanged:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[TIAssetManager activeInputModeLevels](self, "activeInputModeLevels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAssetManager updateAssertionsForInputModes:](self, "updateAssertionsForInputModes:", v6);

  }
  else
  {
    TIDispatchSync();
  }
}

- (void)updateAssertionsForInputModes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.kbd"));

  if (v6)
  {
    _TIQueueUserInitiated();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3;
    TIDispatchAsync();

  }
  else
  {
    TIAssetsOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Skipping update asset assertions"), "-[TIAssetManager updateAssertionsForInputModes:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
  }

}

- (id)assetTypeForAssertionId:(id)a3
{
  if (objc_msgSend(a3, "hasSuffix:", CFSTR(".mecabra_dictionary_rapid_updates_new")))
    return CFSTR("com.apple.MobileAsset.MecabraDictionaryRapidUpdates");
  else
    return (id)*MEMORY[0x1E0D1C9F0];
}

- (id)multilingualLocaleIdentifierForInputMode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE110]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "performSelector:", sel_stringValue);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)localeIdentifierForAssertionId:(id)a3 inputMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[TIAssetManager multilingualLocaleIdentifierForInputMode:](self, "multilingualLocaleIdentifierForInputMode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasSuffix:", CFSTR(".preferred_mul_locale"));

  if ((v9 & (v8 != 0)) != 0)
    v10 = v8;
  else
    v10 = v6;
  v11 = v10;

  return v11;
}

- (void)addAssertionWithInputMode:(id)a3 assertionID:(id)a4 potentialRegions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[TIAssetManager assetTypeForAssertionId:](self, "assetTypeForAssertionId:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAssetManager localeIdentifierForAssertionId:inputMode:](self, "localeIdentifierForAssertionId:inputMode:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIAssetManager ddsLinguisticAssetQueryWithAssetType:inputModeIdentifier:withRegions:](self, "ddsLinguisticAssetQueryWithAssetType:inputModeIdentifier:withRegions:", v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0D1CA00]);
  objc_msgSend(v14, "setPreferredDownloadFrequency:", 2);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Adding assertion: %@ with assetType: %@ query: %@ policy: %@"), "-[TIAssetManager addAssertionWithInputMode:assertionID:potentialRegions:]", v11, v8, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v17;
    _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAssertionForAssetsWithQuery:policy:assertionID:clientID:", v13, v14, v8, CFSTR("com.apple.TextInput"));

}

- (id)ddsAssertionIDsFromInputMode:(id)a3 withPotentialRegions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  TIAssetManager *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.TextInput.assertion"), "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v9, "mutableCopy");

  if (-[TIAssetManager inputModeHasRegions:](self, "inputModeHasRegions:", v8))
  {
    v38 = self;
    v39 = v8;
    v40 = v7;
    v41 = v6;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v7;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v10)
    {
      v11 = v10;
      v43 = *(_QWORD *)v46;
      v12 = *MEMORY[0x1E0D1C9D0];
      v13 = (void *)*MEMORY[0x1E0D1C9E8];
      v14 = *MEMORY[0x1E0D1C9D8];
      v15 = *MEMORY[0x1E0D1C9C8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v43)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", v12);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
            v20 = (void *)v18;
          else
            v20 = v13;
          v21 = v20;

          objc_msgSend(v17, "objectForKeyedSubscript:", v14);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = (void *)v22;
          else
            v24 = v13;
          v25 = v24;

          objc_msgSend(v17, "objectForKeyedSubscript:", v15);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
            v28 = (void *)v26;
          else
            v28 = v13;
          v29 = v28;

          objc_msgSend(v44, "appendFormat:", CFSTR("_%@_%@_%@"), v21, v25, v29);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v11);
    }

    v7 = v40;
    v6 = v41;
    self = v38;
    v8 = v39;
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v44, 0);
  if (-[TIAssetManager requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:](self, "requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:", v8))
  {
    objc_msgSend(v44, "stringByAppendingString:", CFSTR(".mecabra_dictionary_rapid_updates_new"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v31);

  }
  -[TIAssetManager multilingualLocaleIdentifierForInputMode:](self, "multilingualLocaleIdentifierForInputMode:", v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.TextInput.assertion"), "stringByAppendingFormat:", CFSTR(".%@.%@"), v6, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    objc_msgSend(v35, "stringByAppendingString:", CFSTR(".preferred_mul_locale"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v36);

  }
  return v30;
}

- (BOOL)inputModeHasRegions:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("zh")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsString:", CFSTR("yue"));

  return v4;
}

- (void)scheduleAssetsDidChangeNotificationWithDelay:(double)a3
{
  void *v3;

  -[TIAssetManager dispatchQueue](self, "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIDispatchAsync();

}

- (void)didUpdateAssets
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Posting notifcation: %@."), "-[TIAssetManager didUpdateAssets]", CFSTR("TIAssetsDidChangeNotification"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("TIAssetsDidChangeNotification"), self);

}

- (id)levelsForInputMode:(id)a3
{
  void *v3;
  void *v4;

  TIInputModeGetComponentsFromIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetNormalizedLevelsFromComponents();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)enabledInputModes
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TIAssetManager enabledInputModeIdentifiersProviderBlock](self, "enabledInputModeIdentifiersProviderBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TIAssetManager enabledInputModeIdentifiersProviderBlock](self, "enabledInputModeIdentifiersProviderBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
  }
  else
  {
    -[TIAssetManager inputModePreferenceProvider](self, "inputModePreferenceProvider");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledInputModeIdentifiers");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        TIInputModeGetNormalizedIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)defaultEnabledInputModes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[TIAssetManager inputModePreferenceProvider](self, "inputModePreferenceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultEnabledInputModesForCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        TIInputModeGetNormalizedIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)activeInputModes
{
  void *v3;
  void *v4;
  void *v5;

  -[TIAssetManager enabledInputModes](self, "enabledInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAssetManager requestedInputModes_mainThreadCache](self, "requestedInputModes_mainThreadCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activeInputModeLevels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[TIAssetManager enabledInputModes](self, "enabledInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAssetManager requestedInputModes_mainThreadCache](self, "requestedInputModes_mainThreadCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[TIAssetManager levelsForInputMode:](self, "levelsForInputMode:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)updatedActiveRegions
{
  -[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:](self, "updatedActiveRegionsWithCompletionWithCompletion:", 0);
  return -[TIAssetManager currentNormalizedActiveRegions](self, "currentNormalizedActiveRegions");
}

- (void)updatedActiveRegionsWithCompletionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[TIAssetManager currentActiveRegions](self, "currentActiveRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__6347;
  v12[4] = __Block_byref_object_dispose__6348;
  v13 = _Block_copy(v4);
  _TIQueueUserInitiated();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v9 = v4;
  v10 = v7;
  TIDispatchAsync();

  _Block_object_dispose(v12, 8);
}

- (void)normalizedRegionsForGeoCodedAddresses:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  TIGeocodeCompletionHandlerHolder *v12;
  id v13;
  TIGeocodeCompletionHandlerHolder *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  TIGeocodeCompletionHandlerHolder *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v8 = (void *)getCLGeocoderClass_softClass;
    v34 = getCLGeocoderClass_softClass;
    v9 = MEMORY[0x1E0C809B0];
    if (!getCLGeocoderClass_softClass)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __getCLGeocoderClass_block_invoke;
      v30[3] = &unk_1EA107058;
      v30[4] = &v31;
      __getCLGeocoderClass_block_invoke((uint64_t)v30);
      v8 = (void *)v32[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v31, 8);
    v11 = objc_alloc_init(v10);
    v12 = objc_alloc_init(TIGeocodeCompletionHandlerHolder);
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __71__TIAssetManager_normalizedRegionsForGeoCodedAddresses_withCompletion___block_invoke;
    aBlock[3] = &unk_1EA0FF5C8;
    v13 = v5;
    v20 = v13;
    v25 = &v26;
    v21 = v7;
    v22 = v11;
    v23 = v12;
    v24 = v6;
    v14 = v12;
    v15 = v11;
    v16 = _Block_copy(aBlock);
    -[TIGeocodeCompletionHandlerHolder setGeocodeCompletionHandler:](v14, "setGeocodeCompletionHandler:", v16);
    objc_msgSend(v13, "objectAtIndexedSubscript:", v27[3]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "geocodePostalAddress:preferredLocale:completionHandler:", v17, v18, v16);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v7);
  }

}

- (id)topActiveRegions
{
  void *v2;
  void *v3;
  void *v4;

  -[TIAssetManager currentNormalizedActiveRegions](self, "currentNormalizedActiveRegions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIMobileAssetMatch mobileAssetMatchWithTypes:inputModeLevels:regions:](TIMobileAssetMatch, "mobileAssetMatchWithTypes:inputModeLevels:regions:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "regions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ddsLinguisticAssetQueryWithAssetType:(id)a3 inputModeIdentifier:(id)a4 withRegions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TIAssetManager ddsLanguageIdentifierFromInputMode:](self, "ddsLanguageIdentifierFromInputMode:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CA08]), "initWithAssetType:languageIdentifier:", v8, v11);
  objc_msgSend(v12, "setInstalledOnly:", 0);
  v32 = v12;
  objc_msgSend(v12, "setLocalOnly:", 0);
  if (-[TIAssetManager inputModeHasRegions:](self, "inputModeHasRegions:", v9))
  {
    if (objc_msgSend(v10, "count"))
    {
      v27 = v11;
      v28 = v10;
      v29 = v9;
      v30 = v8;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v10;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v34;
        v16 = *MEMORY[0x1E0D1C9D0];
        v17 = *MEMORY[0x1E0D1C9D8];
        v18 = *MEMORY[0x1E0D1C9C8];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v20, "objectForKeyedSubscript:", v16, v27, v28, v29, v30);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "filter");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addRegionWithCountry:province:city:", v21, v22, v23);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v14);
      }

      v9 = v29;
      v8 = v30;
      v11 = v27;
      v10 = v28;
    }
    else
    {
      objc_msgSend(v12, "filter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addRegionWithCountry:province:city:", 0, 0, 0);

    }
  }

  return v32;
}

- (id)ddsLinguisticAssetQueryForInputModeIdentifier:(id)a3 withRegions:(id)a4
{
  return -[TIAssetManager ddsLinguisticAssetQueryWithAssetType:inputModeIdentifier:withRegions:](self, "ddsLinguisticAssetQueryWithAssetType:inputModeIdentifier:withRegions:", *MEMORY[0x1E0D1C9F0], a3, a4);
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke;
  v10[3] = &unk_1EA0FF668;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[TIAssetManager getActiveRegionsWithCompletion:](self, "getActiveRegionsWithCompletion:", v10);

}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke;
  v10[3] = &unk_1EA0FF668;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[TIAssetManager getActiveRegionsWithCompletion:](self, "getActiveRegionsWithCompletion:", v10);

}

- (void)getActiveRegionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TIAssetManager_getActiveRegionsWithCompletion___block_invoke;
  v6[3] = &unk_1EA100B90;
  v7 = v4;
  v5 = v4;
  -[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:](self, "updatedActiveRegionsWithCompletionWithCompletion:", v6);

}

- (void)registerCacheDeleteCallbacks
{
  id v2[5];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[1] = (id)MEMORY[0x1E0C809B0];
  v2[2] = (id)3221225472;
  v2[3] = __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke;
  v2[4] = &unk_1EA0FF708;
  objc_copyWeak(&v3, &location);
  objc_copyWeak(v2, &location);
  CacheDeleteRegisterInfoCallbacks();
  objc_destroyWeak(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (int64_t)tryToPurgeAssetAmount:(int64_t)a3 urgency:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v13 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Attempting to purge %ld bytes of assets with urgency %d"), "-[TIAssetManager tryToPurgeAssetAmount:urgency:]", a3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[TIAssetManager activeInputModes](self, "activeInputModes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAssetManager updateAssertionsForInputModes:](self, "updateAssertionsForInputModes:", v9);

  }
  else
  {
    TIDispatchSync();
  }
  return 0;
}

- (id)enabledInputModeIdentifiersProviderBlock
{
  return self->_enabledInputModeIdentifiersProviderBlock;
}

- (id)preferencesProviderBlock
{
  return self->_preferencesProviderBlock;
}

- (void)setPreferencesProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)requestedInputModes_mainThreadCache
{
  return self->_requestedInputModes_mainThreadCache;
}

- (void)setRequestedInputModes_mainThreadCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TIInputModePreferenceProvider)inputModePreferenceProvider
{
  return self->_inputModePreferenceProvider;
}

- (NSArray)currentActiveRegions
{
  return self->_currentActiveRegions;
}

- (void)setCurrentActiveRegions:(id)a3
{
  objc_storeStrong((id *)&self->_currentActiveRegions, a3);
}

- (NSArray)currentNormalizedActiveRegions
{
  return self->_currentNormalizedActiveRegions;
}

- (void)setCurrentNormalizedActiveRegions:(id)a3
{
  objc_storeStrong((id *)&self->_currentNormalizedActiveRegions, a3);
}

- (NSTimer)didUpdateAssetsTimer
{
  return self->_didUpdateAssetsTimer;
}

- (void)setDidUpdateAssetsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_didUpdateAssetsTimer, a3);
}

- (TIRequestedInputModes)requestedInputModes
{
  return self->_requestedInputModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedInputModes, 0);
  objc_storeStrong((id *)&self->_didUpdateAssetsTimer, 0);
  objc_storeStrong((id *)&self->_currentNormalizedActiveRegions, 0);
  objc_storeStrong((id *)&self->_currentActiveRegions, 0);
  objc_storeStrong((id *)&self->_inputModePreferenceProvider, 0);
  objc_storeStrong((id *)&self->_requestedInputModes_mainThreadCache, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_preferencesProviderBlock, 0);
  objc_storeStrong(&self->_enabledInputModeIdentifiersProviderBlock, 0);
  objc_storeStrong((id *)&self->_languagesWithWarmedAssets, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
}

void __48__TIAssetManager_tryToPurgeAssetAmount_urgency___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeInputModes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateAssertionsForInputModes:", v2);

}

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke_242(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(a3, "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  TIAssetsOSLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CacheDelete - Purge(amount=%lld, urgency=%d)"), "-[TIAssetManager registerCacheDeleteCallbacks]_block_invoke", v7, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v10 = objc_msgSend(WeakRetained, "tryToPurgeAssetAmount:urgency:", v7, a2);
  v15[0] = CFSTR("CACHE_DELETE_VOLUME");
  objc_msgSend(a3, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CACHE_DELETE_VOLUME");
  objc_msgSend(a3, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v7[0] = v3;
  v7[1] = &unk_1EA140390;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__TIAssetManager_getActiveRegionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  aBlock[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2;
  aBlock[3] = &unk_1EA0FF6B8;
  v4 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  v18 = v4;
  v19 = *(id *)(a1 + 48);
  v20 = &v24;
  v21 = v22;
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "multilingualLocaleIdentifierForInputMode:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    ++v25[3];
    objc_msgSend(*(id *)(a1 + 32), "ddsLinguisticAssetQueryForInputModeIdentifier:withRegions:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_232;
    v15[3] = &unk_1EA0FF6E0;
    v16 = v6;
    objc_msgSend(v9, "updateAssetForQuery:callback:", v8, v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "ddsLinguisticAssetQueryForInputModeIdentifier:withRegions:", *(_QWORD *)(a1 + 40), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2_233;
  v13[3] = &unk_1EA0FF6E0;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "updateAssetForQuery:callback:", v10, v13);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  char v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_3;
  v9[3] = &unk_1EA0FF690;
  v7 = *(id *)(a1 + 40);
  v14 = a2;
  v10 = v7;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 56);
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2_233(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void (*v3)(void);
  const __CFString *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 72))
      v4 = CFSTR("Yes");
    else
      v4 = CFSTR("No");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s updateAssetForQuery for identifier: %@ completed with didSucceed: %@, error: %@"), "-[TIAssetManager updateAssetForInputModeIdentifier:callback:]_block_invoke_3", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_4:
    v3();
    return;
  }
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) &= *(_BYTE *)(a1 + 72);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_4;
  }
}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  aBlock[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2;
  aBlock[3] = &unk_1EA0FF618;
  v4 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  v18 = v4;
  v19 = *(id *)(a1 + 48);
  v20 = v26;
  v21 = v25;
  v22 = v24;
  v23 = &v27;
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "multilingualLocaleIdentifierForInputMode:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    ++v28[3];
    objc_msgSend(*(id *)(a1 + 32), "ddsLinguisticAssetQueryForInputModeIdentifier:withRegions:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_223;
    v15[3] = &unk_1EA0FF640;
    v16 = v6;
    objc_msgSend(v9, "fetchAssetUpdateStatusForQuery:callback:", v8, v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "ddsLinguisticAssetQueryForInputModeIdentifier:withRegions:", *(_QWORD *)(a1 + 40), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2_224;
  v13[3] = &unk_1EA0FF640;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "fetchAssetUpdateStatusForQuery:callback:", v10, v13);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_3;
  v9[3] = &unk_1EA0FF5F0;
  v7 = *(id *)(a1 + 40);
  v15 = a2;
  v10 = v7;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 72);
  v8 = v5;
  dispatch_async(v6, v9);

}

uint64_t __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_223(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2_224(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  void (*v3)(void);
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s fetchAssetUpdateStatusForQuery for identifier: %@ completed with status: %ld, error: %@"), "-[TIAssetManager fetchAssetUpdateStatusForInputModeIdentifier:callback:]_block_invoke_3", a1[4], a1[11], a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  if (a1[5])
  {
    v3 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_14;
  }
  v4 = a1[11];
  switch(v4)
  {
    case 2:
      v5 = a1 + 8;
      goto LABEL_11;
    case 1:
      v5 = a1 + 9;
      goto LABEL_11;
    case 0:
      v5 = a1 + 7;
LABEL_11:
      ++*(_QWORD *)(*(_QWORD *)(*v5 + 8) + 24);
      break;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) != *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24)
                                                      + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24)
                                                      + *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24))
    return;
  v3 = *(void (**)(void))(a1[6] + 16);
LABEL_14:
  v3();
}

void __71__TIAssetManager_normalizedRegionsForGeoCodedAddresses_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TIAssetsOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s ERROR: Cannot geocode address %@ : %@"), "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_error_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    TIAssetsOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%s Successfully geocoded address %@ to %@"), "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", v30, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v31;
      _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v32[0] = CFSTR("City");
    -[NSObject locality](v7, "locality");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_1EA1081D0;
    v33[0] = v14;
    v32[1] = CFSTR("Province");
    -[NSObject administrativeArea](v7, "administrativeArea");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_1EA1081D0;
    v33[1] = v17;
    v32[2] = CFSTR("Country");
    -[NSObject country](v7, "country");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1EA1081D0;
    v33[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
  }

  v22 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v22 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    TIAssetsOSLogFacility();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Finished geocoding %d addresses"), "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", objc_msgSend(*(id *)(a1 + 32), "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v28;
      _os_log_debug_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 56), "setGeocodeCompletionHandler:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v23 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "geocodeCompletionHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "geocodePostalAddress:preferredLocale:completionHandler:", v24, v25, v26);

  }
}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[5];
  id v55;
  __int128 *p_buf;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  __int128 buf;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Updating active regions..."), "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v39;
    _os_log_debug_impl(&dword_1DA6F2000, v1, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

  }
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMeCardRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchForMeCardRegions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  TIAssetsOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Got me card regions from InputContext : %@"), "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke", v3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v40;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  v46 = v6;
  if (v7)
  {
    v8 = v7;
    v44 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v63 != v44)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "mutableCopy");
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        +[TIMobileAssetMatch knownAssetRegionAttributes](TIMobileAssetMatch, "knownAssetRegionAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v59 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
              objc_msgSend(v10, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
                objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1EA1081D0, v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
          }
          while (v13);
        }

        v6 = v46;
        objc_msgSend(v46, "addObject:", v10);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "preferencesProviderBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferencesProviderBlock");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE470]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueForPreferenceKey:", *MEMORY[0x1E0DBE470]);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "integerValue") - 1;
  if (v22 <= 2)
    objc_msgSend(v6, "addObject:", *(&off_1EA0FF7A0 + v22));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    TIAssetsOSLogFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Regions unchanged, returning old set %@"), "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke_2", *(_QWORD *)(a1 + 40));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v41;
      _os_log_debug_impl(&dword_1DA6F2000, v24, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
    v25 = *(_QWORD *)(a1 + 48);
    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

    }
  }
  else
  {
    v45 = v21;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__199;
    v70 = __Block_byref_object_dispose__200;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_201;
    aBlock[3] = &unk_1EA0FF578;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v27 = v6;
    v55 = v27;
    p_buf = &buf;
    v57 = *(_QWORD *)(a1 + 56);
    v28 = _Block_copy(aBlock);
    +[TIMobileAssetMatch mobileAssetMatchWithTypes:inputModeLevels:regions:](TIMobileAssetMatch, "mobileAssetMatchWithTypes:inputModeLevels:regions:", 0, 0, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v29, "regions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v51 != v34)
            objc_enumerationMutation(v31);
          +[TIAssetManager _addressFromRegion:](TIAssetManager, "_addressFromRegion:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v33);
    }

    v37 = *(void **)(a1 + 32);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_204;
    v47[3] = &unk_1EA100CB8;
    v48 = v28;
    v49 = &buf;
    v38 = v28;
    objc_msgSend(v37, "normalizedRegionsForGeoCodedAddresses:withCompletion:", v30, v47);

    _Block_object_dispose(&buf, 8);
    v21 = v45;
    v6 = v46;
  }

}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentActiveRegions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentNormalizedActiveRegions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  TIAssetsOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "currentActiveRegions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentNormalizedActiveRegions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s Set active regions: %@, normalized regions: %@"), "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentNormalizedActiveRegions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_204(uint64_t a1, void *a2)
{
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v3 = a2;
  TIDispatchAsync();

}

void __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "didUpdateAssetsTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  if ((v3 & 1) == 0)
  {
    TIAssetsOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduling AssetsDidChangeNotification with delay = %g second(s)"), "-[TIAssetManager scheduleAssetsDidChangeNotificationWithDelay:]_block_invoke", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v6 = *(double *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_165;
    v10[3] = &unk_1EA0FF550;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:repeats:block:", 0, v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDidUpdateAssetsTimer:", v7);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didUpdateAssetsTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", v9, *MEMORY[0x1E0C99748]);

  }
}

void __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_165(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIDispatchAsync();

}

uint64_t __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Firing delayed AssetsDidChangeNotification now"), "-[TIAssetManager scheduleAssetsDidChangeNotificationWithDelay:]_block_invoke_2");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  TIDispatchAsync();
  return objc_msgSend(*(id *)(a1 + 32), "setDidUpdateAssetsTimer:", 0);
}

uint64_t __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_168(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateAssets");
}

void __48__TIAssetManager_updateAssertionsForInputModes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__TIAssetManager_updateAssertionsForInputModes___block_invoke_2;
  v5[3] = &unk_1EA102930;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "getActiveRegionsWithCompletion:", v5);

}

void __48__TIAssetManager_updateAssertionsForInputModes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionIDsForClientID:", CFSTR("com.apple.TextInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    v10 = *MEMORY[0x1E0DBE190];
    v27 = *MEMORY[0x1E0DBE190];
    v28 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      v29 = v8;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "containsString:", v10) & 1) == 0)
        {
          v31 = v11;
          objc_msgSend(*(id *)(a1 + 40), "ddsAssertionIDsFromInputMode:withPotentialRegions:", v12, v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v37 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
                if ((objc_msgSend(v6, "containsObject:", v18) & 1) == 0
                  && (objc_msgSend(v4, "containsObject:", v18) & 1) == 0)
                {
                  objc_msgSend(*(id *)(a1 + 40), "addAssertionWithInputMode:assertionID:potentialRegions:", v12, v18, v3);
                }
                objc_msgSend(v4, "addObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v15);
          }

          v10 = v27;
          v9 = v28;
          v8 = v29;
          v11 = v31;
        }
        ++v11;
      }
      while (v11 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v8);
  }

  v19 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v19, "minusSet:", v4);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeAssertionWithIdentifier:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v22);
  }

}

void __51__TIAssetManager_appleKeyboardsPreferencesChanged___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeInputModeLevels");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateAssertionsForInputModes:", v2);

}

void __42__TIAssetManager_didUpdateAssetsWithType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "activeInputModeLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_2;
  v5[3] = &unk_1EA102930;
  v5[4] = v3;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "getActiveRegionsWithCompletion:", v5);

}

void __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  TIDispatchAsync();

}

uint64_t __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "languagesWithWarmedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_warmAssetQueriesForInputModes:", *(_QWORD *)(a1 + 40));
}

void __61__TIAssetManager_requestAssetDownloadForLanguage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ddsAssertionIDsFromInputMode:withPotentialRegions:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a1;
  objc_msgSend(*(id *)(a1 + 32), "ddsLanguageIdentifierFromInputMode:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertionIDsForClientID:", CFSTR("com.apple.TextInput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(*(id *)(v18 + 32), "assetTypeForAssertionId:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          TIAssetsOSLogFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s AssertionId: %@, AssetType: %@"), "-[TIAssetManager requestAssetDownloadForLanguage:completion:]_block_invoke", v11, v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v25 = v17;
            _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CA08]), "initWithAssetType:languageIdentifier:", v12, v19);
          objc_msgSend(v14, "setLocalOnly:", 0);
          objc_msgSend(v14, "setInstalledOnly:", 0);
          v15 = objc_alloc_init(MEMORY[0x1E0D1CA00]);
          objc_msgSend(MEMORY[0x1E0D1C9F8], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAssertionForAssetsWithQuery:policy:assertionID:clientID:", v14, v15, v11, CFSTR("com.apple.TextInput"));

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

}

void __45__TIAssetManager__warmAssetQueryForLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "languagesWithWarmedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "languagesWithWarmedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

    TIAssetsOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Warming asset query for language '%@'"), "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "_ddsAssetsForLanguageIdentifier:cachedOnly:", *(_QWORD *)(a1 + 40), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    if (objc_msgSend(*(id *)(a1 + 32), "requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:", *(_QWORD *)(a1 + 40)))
    {
      TIAssetsOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Warming MecabraDictionaryRapidUpdates asset query for language '%@'"), "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_ddsAssetsForAssetType:languageIdentifier:cachedOnly:", CFSTR("com.apple.MobileAsset.MecabraDictionaryRapidUpdates"), *(_QWORD *)(a1 + 40), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v12);

    }
    v13 = objc_msgSend(v9, "count");
    TIAssetsOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Warmed asset query for language '%@' returned %lu assets"), "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(_QWORD *)(a1 + 40), objc_msgSend(v9, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "scheduleAssetsDidChangeNotificationWithDelay:", 3.0);
    }
    else
    {
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Warmed asset query for language '%@' returned no assets"), "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(_QWORD *)(a1 + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }

  }
}

void __59__TIAssetManager__warmLDEnumerateAssetQueriesForInputMode___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "multilingualLocaleIdentifierForInputMode:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObject:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LDEnumerateAssetDataItems();

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __94__TIAssetManager_ddsAssetContentItemsWithContentType_inputMode_filteredWithRegion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ddsLanguageIdentifierFromInputMode:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_ddsAssetsForLanguageIdentifier:cachedOnly:", v7, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_ddsContentItemsFromAssets:contentType:filteredWithRegion:", v4, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  TIDispatchAsync();

}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setRequestedInputModes_mainThreadCache:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "activeInputModeLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 32);
  v4 = v2;
  TIDispatchAsync();

}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "registerForNotifications");
  objc_msgSend(*(id *)(a1 + 32), "updateAssertionsForInputModes:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_4;
  v3[3] = &unk_1EA102930;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "getActiveRegionsWithCompletion:", v3);

}

uint64_t __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_warmAssetQueriesForInputModes:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "scheduleAssetsDidChangeNotificationWithDelay:", 3.0);
}

+ (id)_addressFromRegion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C97378];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("City"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCity:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Province"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Country"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCountry:", v8);
  return v5;
}

+ (id)_regionFromAddress:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("City");
  v3 = a3;
  objc_msgSend(v3, "city");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1EA1081D0;
  v15[0] = v6;
  v14[1] = CFSTR("Province");
  objc_msgSend(v3, "state");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1EA1081D0;
  v15[1] = v9;
  v14[2] = CFSTR("Country");
  objc_msgSend(v3, "country");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = &stru_1EA1081D0;
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (int64_t)assetUpdateStatusforDDSAssetUpdateStatus:(int64_t)a3
{
  int64_t v3;
  NSObject *v4;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 3)
  {
    TIAssetsOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unexpected asset update status: %ld returned from the data delivery service"), "+[TIAssetManager assetUpdateStatusforDDSAssetUpdateStatus:]", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    return 0;
  }
  return v3;
}

void __65__TIAssetManager_singletonInstanceWithEnabledInputModesProvider___block_invoke(uint64_t a1)
{
  TIAssetManager *v1;
  void *v2;

  v1 = -[TIAssetManager initWithRequestedInputModes:inputModePreferenceProvider:enabledInputModesProvider:]([TIAssetManager alloc], "initWithRequestedInputModes:inputModePreferenceProvider:enabledInputModesProvider:", 0, 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)singletonInstanceWithEnabledInputModesProvider__singletonInstance;
  singletonInstanceWithEnabledInputModesProvider__singletonInstance = (uint64_t)v1;

}

+ (void)setSharedAssetManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_6493 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_6493, a3);
    v4 = v5;
  }

}

@end
