@implementation CACLanguageAssetManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_15);
  return (id)sCACLanguageAssetManager;
}

void __40__CACLanguageAssetManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)CACLanguageAssetManager), "init");
  v1 = (void *)sCACLanguageAssetManager;
  sCACLanguageAssetManager = v0;

}

- (CACLanguageAssetManager)init
{
  CACLanguageAssetManager *v2;
  uint64_t v3;
  NSMutableDictionary *downloadProgressDictionary;
  uint64_t v5;
  NSMutableDictionary *lastReportedProgressDictionary;
  uint64_t v7;
  NSMutableDictionary *downloadErrorDictionary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CACLanguageAssetManager;
  v2 = -[CACLanguageAssetManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    downloadProgressDictionary = v2->_downloadProgressDictionary;
    v2->_downloadProgressDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    lastReportedProgressDictionary = v2->_lastReportedProgressDictionary;
    v2->_lastReportedProgressDictionary = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    downloadErrorDictionary = v2->_downloadErrorDictionary;
    v2->_downloadErrorDictionary = (NSMutableDictionary *)v7;

    v2->_isInstallationStatusStale = 1;
  }
  return v2;
}

- (id)installationStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[CACLanguageAssetManager isInstallationStatusStale](self, "isInstallationStatusStale"))
  {
    v3 = (void *)objc_msgSend((id)RXObjectCopyProperty(), "mutableCopy");
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelectableLocaleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_203_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
            objc_msgSend(v3, "removeObjectForKey:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[CACLanguageAssetManager setCachedInstallationStatus:](self, "setCachedInstallationStatus:", v3);
    -[CACLanguageAssetManager setIsInstallationStatusStale:](self, "setIsInstallationStatusStale:", 0);
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_markInstallationStatusStale, 0);
    -[CACLanguageAssetManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_markInstallationStatusStale, 0, 10.0);

  }
  -[CACLanguageAssetManager cachedInstallationStatus](self, "cachedInstallationStatus");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__CACLanguageAssetManager_installationStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
}

- (void)markInstallationStatusStale
{
  -[CACLanguageAssetManager setIsInstallationStatusStale:](self, "setIsInstallationStatusStale:", 1);
}

- (void)startDownloadOfLanguage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CACLanguageAssetManager installationStatus](self, "installationStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("Version:")) & 1) == 0)
    -[CACLanguageAssetManager registerForCallback](self, "registerForCallback");
  RXObjectSetProperty();

}

- (void)cancelDownloadOfLanguage:(id)a3
{
  RXObjectSetProperty();
}

- (id)purgeInstalledAsset
{
  void *v3;

  RXObjectCopyProperty();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLanguageAssetManager markInstallationStatusStale](self, "markInstallationStatusStale");
  return v3;
}

- (id)supportedLocaleIdentifiers
{
  return (id)RXObjectCopyProperty();
}

- (id)downloadProgressForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)errorStatusForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return v7;
}

- (void)registerForCallback
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__CACLanguageAssetManager_registerForCallback__block_invoke;
  v2[3] = &unk_24F2AB8E8;
  objc_copyWeak(&v3, &location);
  MEMORY[0x22E2D5614](v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__CACLanguageAssetManager_registerForCallback__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_downloadProgressCallback:", a2);

}

+ (BOOL)isAssetsInstalledForBestLocale
{
  void *v3;
  void *v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isAssetsInstalledForLocale:", v4);

  return (char)a1;
}

+ (BOOL)isAssetsInstalledForLocale:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(a1, "downloadedLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__CACLanguageAssetManager_isAssetsInstalledForLocale___block_invoke;
  v8[3] = &unk_24F2AB910;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __54__CACLanguageAssetManager_isAssetsInstalledForLocale___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (id)downloadedLocaleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installationStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasPrefix:", CFSTR("Version:")))
          objc_msgSend(v14, "addObject:", v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v14;
}

+ (id)downloadingLocaleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  char v19;
  id v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installationStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACLanguageAssetManager downloadedLocaleIdentifiers](CACLanguageAssetManager, "downloadedLocaleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSelectableLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
        {
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[CACLanguageAssetManager sharedManager](CACLanguageAssetManager, "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "downloadProgressForLanguage:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyPercentage"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "floatValue");
          v17 = v16;

          if (v12
            || (objc_msgSend(v14, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyCompleted")),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "BOOLValue"),
                v18,
                (v19 & 1) == 0)
            && v17 > 0.0)
          {
            objc_msgSend(v21, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v21;
}

- (void)_downloadProgressCallback:(__CFDictionary *)a3
{
  id v5;

  -[CACLanguageAssetManager setDownloadProgress:](self, "setDownloadProgress:");
  -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:](self, "_updateInstallationStatusFromDownloadStatus:", a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("CACNotificationAssetDownloadProgressChanged"), 0);

}

- (void)_updateInstallationStatusFromDownloadStatus:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFNumber *Value;
  const __CFNumber *v28;
  const __CFNumber *v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float v67;
  float v68;
  float valuePtr;
  _QWORD v70[4];
  _QWORD v71[5];

  v71[4] = *MEMORY[0x24BDAC8D0];
  CFDictionaryGetValue(a3, CFSTR("Language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(a3, CFSTR("Phase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Idle")) & 1) != 0)
    goto LABEL_22;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DownloadFailed")))
  {
    -[CACLanguageAssetManager markInstallationStatusStale](self, "markInstallationStatusStale");
    if (CFDictionaryGetValue(a3, CFSTR("Error")) != (const void *)*MEMORY[0x24BDBD430]
      && CFDictionaryGetValue(a3, CFSTR("Error")))
    {
      CFDictionaryGetValue(a3, CFSTR("Error"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CACLogAssetDownload();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

      if (v5)
      {
        -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", &unk_24F2CE9E0, v5);

        -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:](self, "_handleErrorInDownloadForLanguage:", v5);
      }

    }
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Stalled")))
  {
    -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", &unk_24F2CE9F8, v5);

    -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:](self, "_handleErrorInDownloadForLanguage:", v5);
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Downloaded")))
  {
    -[CACLanguageAssetManager markInstallationStatusStale](self, "markInstallationStatusStale");
    -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", &unk_24F2CEA10, v5);

    -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:](self, "_handleErrorInDownloadForLanguage:", v5);
    -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("DownloadProgressDictionaryKeyCompleted"));

    CACLogAssetDownload();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.2((uint64_t)v5, self);

LABEL_21:
    -[CACLanguageAssetManager _sendProgressNotificationIfNeededForLanguage:](self, "_sendProgressNotificationIfNeededForLanguage:", v5);
    goto LABEL_22;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Cancelled")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("CancelFailed")))
  {
    CACLogAssetDownload();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.3((uint64_t)v6, v21);

    -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("DownloadProgressDictionaryKeyCompleted"));

    -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", &unk_24F2CEA28, CFSTR("DownloadProgressDictionaryKeyPercentage"));

    -[CACLanguageAssetManager markInstallationStatusStale](self, "markInstallationStatusStale");
    goto LABEL_21;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Downloading")))
  {
    -[CACLanguageAssetManager markInstallationStatusStale](self, "markInstallationStatusStale");
    CACLogAssetDownload();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.7((uint64_t)v6, v31, v39, v40, v41, v42, v43, v44);
    goto LABEL_31;
  }
  -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", &unk_24F2CEA10, v5);

  -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:](self, "_handleErrorInDownloadForLanguage:", v5);
  valuePtr = -1.0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("TimeRemaining"));
  CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
  v68 = -1.0;
  v28 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("BytesWritten"));
  CFNumberGetValue(v28, kCFNumberFloatType, &v68);
  v67 = -1.0;
  v29 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("BytesTotal"));
  CFNumberGetValue(v29, kCFNumberFloatType, &v67);
  if (valuePtr == -1.0 && v68 == -1.0 && v67 <= 0.0)
  {
    CACLogAssetDownload();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.6(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_31:

    goto LABEL_22;
  }
  if (v68 == -1.0 || v67 <= 0.0)
  {
    CACLogAssetDownload();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.4(v31, v53, v54, v55, v56, v57, v58, v59);
    goto LABEL_31;
  }
  if (valuePtr == -1.0)
  {
    CACLogAssetDownload();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[CACLanguageAssetManager _updateInstallationStatusFromDownloadStatus:].cold.5(v31, v60, v61, v62, v63, v64, v65, v66);
    goto LABEL_31;
  }
  v70[0] = CFSTR("DownloadProgressDictionaryKeyPercentage");
  *(float *)&v30 = v68 / v67;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v45;
  v70[1] = CFSTR("DownloadProgressDictionaryKeyTimeRemaining");
  *(float *)&v46 = valuePtr;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v47;
  v70[2] = CFSTR("DownloadProgressDictionaryKeyTotalBytes");
  *(float *)&v48 = v67;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = CFSTR("DownloadProgressDictionaryKeyCompleted");
  v71[2] = v49;
  v71[3] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "mutableCopy");

  if (v51)
  {
    -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKey:", v51, v5);

  }
  -[CACLanguageAssetManager _sendProgressNotificationIfNeededForLanguage:](self, "_sendProgressNotificationIfNeededForLanguage:", v5);

LABEL_22:
}

- (void)_sendProgressNotificationIfNeededForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v32;
  int v33;
  id v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CACLanguageAssetManager downloadProgressDictionary](self, "downloadProgressDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACLanguageAssetManager lastReportedProgressDictionary](self, "lastReportedProgressDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyPercentage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v6, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyTotalBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  objc_msgSend(v6, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyTimeRemaining"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  objc_msgSend(v8, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyPercentage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  objc_msgSend(v8, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyTotalBytes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;

  objc_msgSend(v8, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyTimeRemaining"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25;

  objc_msgSend(v6, "objectForKey:", CFSTR("DownloadProgressDictionaryKeyCompleted"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  if (!v6 || v28 || v20 != v11 || v26 != v17 || v23 != v14)
  {
    if (v6)
    {
      -[CACLanguageAssetManager lastReportedProgressDictionary](self, "lastReportedProgressDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v6, v4);

    }
    CACLogAssetDownload();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412546;
      v34 = v4;
      v35 = 2048;
      v36 = v11;
      _os_log_impl(&dword_229A40000, v30, OS_LOG_TYPE_DEFAULT, "percent %@: %f", (uint8_t *)&v33, 0x16u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationAssetDownloadProgressChanged"), 0, 0, 1u);
    CACLogAssetDownload();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[CACLanguageAssetManager _sendProgressNotificationIfNeededForLanguage:].cold.1((uint64_t)v4, v32);

  }
}

- (void)_handleErrorInDownloadForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CACLanguageAssetManager downloadErrorDictionary](self, "downloadErrorDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  CACLogAssetDownload();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CACLanguageAssetManager _handleErrorInDownloadForLanguage:].cold.1((uint64_t)v4, self);

  if (v7)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CACNotificationAssetDownloadProgressErrorOccured"), 0, 0, 1u);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("CACNotificationAssetDownloadErrorOccured"), v4);

    CACLogAssetDownload();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = CFSTR("CACNotificationAssetDownloadProgressErrorOccured");
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_229A40000, v11, OS_LOG_TYPE_INFO, "Sent error notification %@ for language %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (NSDictionary)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgress, a3);
}

- (BOOL)isRegisteredForCallback
{
  return self->_isRegisteredForCallback;
}

- (void)setIsRegisteredForCallback:(BOOL)a3
{
  self->_isRegisteredForCallback = a3;
}

- (NSMutableDictionary)downloadProgressDictionary
{
  return self->_downloadProgressDictionary;
}

- (void)setDownloadProgressDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressDictionary, a3);
}

- (NSMutableDictionary)lastReportedProgressDictionary
{
  return self->_lastReportedProgressDictionary;
}

- (void)setLastReportedProgressDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedProgressDictionary, a3);
}

- (NSMutableDictionary)downloadErrorDictionary
{
  return self->_downloadErrorDictionary;
}

- (void)setDownloadErrorDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_downloadErrorDictionary, a3);
}

- (NSDictionary)cachedInstallationStatus
{
  return self->_cachedInstallationStatus;
}

- (void)setCachedInstallationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInstallationStatus, a3);
}

- (BOOL)isInstallationStatusStale
{
  return self->_isInstallationStatusStale;
}

- (void)setIsInstallationStatusStale:(BOOL)a3
{
  self->_isInstallationStatusStale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInstallationStatus, 0);
  objc_storeStrong((id *)&self->_downloadErrorDictionary, 0);
  objc_storeStrong((id *)&self->_lastReportedProgressDictionary, 0);
  objc_storeStrong((id *)&self->_downloadProgressDictionary, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Error in asset download: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "downloadProgressDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3(&dword_229A40000, v3, v4, "Setting completion dict for language %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "Received Cancel phase %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_229A40000, a1, a3, "Bad info received on bytes written or total bytes!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_229A40000, a1, a3, "No info received on time remaining!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_229A40000, a1, a3, "Error: all fields marked to be ignored even though still downloading.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateInstallationStatusFromDownloadStatus:(uint64_t)a3 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Unrecognized download phase received %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_sendProgressNotificationIfNeededForLanguage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("CACNotificationAssetDownloadProgressChanged");
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "Sent notification %@ for language %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleErrorInDownloadForLanguage:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "downloadErrorDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3(&dword_229A40000, v3, v4, "Error for  language %@. Error Dictionary: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
