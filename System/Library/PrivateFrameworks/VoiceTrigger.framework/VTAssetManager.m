@implementation VTAssetManager

- (VTAssetManager)init
{
  VTAssetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  VTAssetManagerEnablePolicy *v5;
  VTPolicy *enablePolicy;
  NSObject *v7;
  VTPolicy *v8;
  _QWORD v10[4];
  id v11;
  id buf[2];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VTAssetManager;
  v2 = -[VTAssetManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Serial VTAsset queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(VTAssetManagerEnablePolicy);
    enablePolicy = v2->_enablePolicy;
    v2->_enablePolicy = &v5->super;

    if (-[VTPolicy isEnabled](v2->_enablePolicy, "isEnabled"))
    {
      v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "VTAssetManagerEnablePolicy is already enabled, fetching remote meta data now", (uint8_t *)buf, 2u);
      }
      -[VTAssetManager _fetchRemoteMetaData](v2, "_fetchRemoteMetaData");
    }
    else
    {
      objc_initWeak(buf, v2);
      v8 = v2->_enablePolicy;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __22__VTAssetManager_init__block_invoke;
      v10[3] = &unk_24C7F4CD8;
      objc_copyWeak(&v11, buf);
      -[VTPolicy setCallback:](v8, "setCallback:", v10);
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
    _MAMigrateAssets();
    _MACleanV1Repository();
  }
  return v2;
}

- (id)assetForLanguage:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (-[VTAssetManager _isReadyToUse](self, "_isReadyToUse"))
  {
    -[VTAssetManager installedAssetForLanguage:](self, "installedAssetForLanguage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__VTAssetManager_assetForLanguage___block_invoke;
    v8[3] = &unk_24C7F4DC0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)installedAssetForLanguage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[VTAssetManager _isReadyToUse](self, "_isReadyToUse"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4411;
    v15 = __Block_byref_object_dispose__4412;
    v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__VTAssetManager_installedAssetForLanguage___block_invoke;
    block[3] = &unk_24C7F4490;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(queue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_installedAssetForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[VTAssetManager _assetQueryForLanguage:supportPremium:](self, "_assetQueryForLanguage:supportPremium:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "queryMetaDataSync");
  objc_msgSend(v7, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAssetManager _filteredAssetsForAssets:language:supportPremium:](self, "_filteredAssetsForAssets:language:supportPremium:", v9, v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == 2)
  {
    v14 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_20D965000, v14, OS_LOG_TYPE_ERROR, "::: Meta data not available, query again with returnType MAUnionOfCatalogInstalled", (uint8_t *)&v17, 2u);
    }
    -[VTAssetManager _installedAssetWithoutMetaDataForLanguage:supportPremium:](self, "_installedAssetWithoutMetaDataForLanguage:supportPremium:", v6, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v8)
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = (uint64_t)v7;
      v19 = 2050;
      v20 = v8;
      _os_log_error_impl(&dword_20D965000, v15, OS_LOG_TYPE_ERROR, "Error running asset-query : %{public}@, error: %{public}lu", (uint8_t *)&v17, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    v11 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v17 = 134349056;
      v18 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets", (uint8_t *)&v17, 0xCu);

    }
    -[VTAssetManager _findLatestInstalledAsset:](self, "_findLatestInstalledAsset:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_installedAssetWithoutMetaDataForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[VTAssetManager _assetQueryForLanguage:supportPremium:](self, "_assetQueryForLanguage:supportPremium:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "returnTypes:", 2);
  v8 = objc_msgSend(v7, "queryMetaDataSync");
  objc_msgSend(v7, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAssetManager _filteredAssetsForAssets:language:supportPremium:](self, "_filteredAssetsForAssets:language:supportPremium:", v9, v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = VTLogContextFacilityVoiceTrigger;
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543618;
      v16 = (uint64_t)v7;
      v17 = 2050;
      v18 = v8;
      _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "Error running asset-query : %{public}@, error: %{public}lu", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v15 = 134349312;
    v16 = objc_msgSend(v10, "count");
    v17 = 2050;
    v18 = v8;
    _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets with error %{public}lu", (uint8_t *)&v15, 0x16u);

  }
  -[VTAssetManager _findLatestInstalledAsset:](self, "_findLatestInstalledAsset:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_fetchRemoteMetaData
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: Request Fetching RemoteMetaData", buf, 2u);
  }
  v4 = (void *)MEMORY[0x24BE66B98];
  -[VTAssetManager _defaultDownloadOptions](self, "_defaultDownloadOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__VTAssetManager__fetchRemoteMetaData__block_invoke;
  v6[3] = &unk_24C7F44B8;
  v6[4] = self;
  objc_msgSend(v4, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.VoiceTriggerAssets"), v5, v6);

}

- (void)_fetchRemoteAssetForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Request fetching remote asset", buf, 2u);
  }
  -[VTAssetManager _assetQueryForLanguage:supportPremium:](self, "_assetQueryForLanguage:supportPremium:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke;
  v11[3] = &unk_24C7F4508;
  v11[4] = self;
  v12 = v8;
  v13 = v6;
  v14 = v4;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "queryMetaData:", v11);

}

- (void)_updateFromRemoteToLocalAssets:(id)a3
{
  id v4;
  void **p_cache;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  NSObject *v24;
  NSObject *v25;
  void **v26;
  void *v27;
  NSObject *v28;
  VTAssetManager *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_cache = &OBJC_METACLASS___VTSiriNotifications.cache;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "::: Fetching remote asset", buf, 2u);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (v11)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "isLatestCompareTo:", v11))
          {
            v15 = v14;

            v11 = v15;
          }
        }
        else
        {
          v11 = v14;
        }
        if (objc_msgSend(v14, "isVTAssetInstalled"))
        {
          if (v10)
          {
            if (objc_msgSend(v14, "isLatestCompareTo:", v10))
            {
              v16 = v14;

              v10 = v16;
            }
          }
          else
          {
            v10 = v14;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (v22 != v11 && v22 != v10)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "isDownloading"))
          {
            objc_msgSend(v22, "cancelDownloadSync");
          }
          else if (objc_msgSend(v22, "canBePurged"))
          {
            v24 = p_cache[343];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              objc_msgSend(v22, "path");
              v26 = p_cache;
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v39 = v27;
              _os_log_impl(&dword_20D965000, v25, OS_LOG_TYPE_DEFAULT, "::: Purging installed asset : %{public}@", buf, 0xCu);

              p_cache = v26;
            }
            objc_msgSend(v22, "purgeSync");
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v19);
  }

  if (v11 && v11 != v10)
  {
    v28 = p_cache[343];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "::: Request downloading remote asset", buf, 2u);
    }
    -[VTAssetManager _downloadAsset:withComplete:](v29, "_downloadAsset:withComplete:", v11, &__block_literal_global_192);
  }

}

- (id)_findLatestInstalledAsset:(id)a3
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v4 = 134349056;
    v18 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "state", v18);
        v11 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v25 = v10;
          _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "Asset state : %{public}ld", buf, 0xCu);
        }
        if (v10 <= 6 && ((1 << v10) & 0x6C) != 0)
        {
          if (v6)
          {
            if (objc_msgSend(v9, "isLatestCompareTo:", v6))
            {
              v13 = v9;

              v6 = v13;
            }
          }
          else
          {
            v6 = v9;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v14 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v6, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = (unint64_t)v16;
    _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  return v6;
}

- (void)_addKeyValuePairForQuery:(id *)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = *MEMORY[0x24BE66A80];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%d"), 13);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyValuePair:with:", v3, v6);

}

- (id)_filteredAssetsForAssets:(id)a3 language:(id)a4 supportPremium:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    if (a5)
    {
      if (v8)
      {
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v14, "attributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "valueForKey:", CFSTR("Languages"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "containsObject:", v8))
              objc_msgSend(v28, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v11);
      }
      else
      {
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_msgSend(v18, "attributes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "valueForKey:", CFSTR("Languages"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v18);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v11);
      }
    }
    else
    {
      do
      {
        for (k = 0; k != v11; ++k)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
          objc_msgSend(v22, "attributes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "valueForKey:", CFSTR("Languages"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v8 || objc_msgSend(v24, "containsObject:", v8))
          {
            objc_msgSend(v23, "objectForKey:", CFSTR("Footprint"));
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v26 != CFSTR("Premium"))
              objc_msgSend(v28, "addObject:", v22);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }
  }

  return v28;
}

- (id)_assetQueryForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[VTAssetManager _assetQueryForLanguage:supportPremium:]";
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BA8]), "initWithType:", CFSTR("com.apple.MobileAsset.VoiceTriggerAssets"));
  v13 = v7;
  -[VTAssetManager _addKeyValuePairForQuery:](self, "_addKeyValuePairForQuery:", &v13);
  v8 = v13;

  v9 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v8, "queryParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v15 = "-[VTAssetManager _assetQueryForLanguage:supportPremium:]";
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_INFO, "::: %{public}s, query: %{public}@", buf, 0x16u);

  }
  return v8;
}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[VTAssetManager _runAssetQuery:completion:]";
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__VTAssetManager__runAssetQuery_completion___block_invoke;
  v12[3] = &unk_24C7F48B8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, v12);

}

- (BOOL)_isReadyToUse
{
  void *v2;
  char v3;

  +[VTFirstUnlockMonitor sharedInstance](VTFirstUnlockMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstUnlocked");

  return v3;
}

- (id)_defaultDownloadOptions
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v5 = 136446210;
    v6 = "-[VTAssetManager _defaultDownloadOptions]";
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_INFO, "::: %{public}s", (uint8_t *)&v5, 0xCu);
  }
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAllowsCellularAccess:", 0);
  objc_msgSend(v3, "setCanUseLocalCacheServer:", 1);
  return v3;
}

- (void)_downloadAsset:(id)a3 withComplete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: Start downloading asset", buf, 2u);
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__VTAssetManager__downloadAsset_withComplete___block_invoke_204;
  v11[3] = &unk_24C7F45B8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[VTAssetManager _startDownloadingVoiceTriggerAsset:progress:completion:](self, "_startDownloadingVoiceTriggerAsset:progress:completion:", v10, &__block_literal_global_203, v11);

}

- (void)_startDownloadingVoiceTriggerAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _BYTE buf[12];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[VTAssetManager _startDownloadingVoiceTriggerAsset:progress:completion:]";
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
    v11 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = objc_msgSend(v8, "state");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    v29 = 1026;
    v30 = v13;
    _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_INFO, "Attempting to download asset %{public}@ with asset state : %{public}u", buf, 0x12u);

  }
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke;
  v25[3] = &unk_24C7F45E0;
  v15 = v9;
  v27 = v15;
  v16 = v8;
  v26 = v16;
  v17 = (void *)MEMORY[0x212BACF9C](v25);
  switch(objc_msgSend(v16, "state"))
  {
    case 0:
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 6;
      goto LABEL_7;
    case 1:
      *(_QWORD *)buf = 0;
      if ((objc_msgSend(v16, "spaceCheck:", buf) & 1) != 0)
      {
        objc_msgSend(v16, "attachProgressCallBack:", v17);
        -[VTAssetManager _defaultDownloadOptions](self, "_defaultDownloadOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke_2;
        v23[3] = &unk_24C7F4608;
        v24 = v10;
        objc_msgSend(v16, "startDownload:then:", v22, v23);

        v20 = 0;
      }
      else
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v19 = 5;
LABEL_7:
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("VTAssetManager"), v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v21 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "Asset doesn't need downloading, invoking completion", buf, 2u);
        }
        if (v10)
          (*((void (**)(id, void *))v10 + 2))(v10, v20);
      }

      return;
    case 2:
    case 3:
    case 5:
    case 6:
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 4;
      goto LABEL_7;
    case 4:
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = 3;
      goto LABEL_7;
    default:
      v20 = 0;
      goto LABEL_8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "expectedTimeRemaining");
  if (v3 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachProgressCallBack:", 0);
  }
  else
  {
    v4 = (double)objc_msgSend(v6, "totalWritten");
    if (v4 / (float)objc_msgSend(v6, "totalExpected") > 0.0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(void))(v5 + 16))();
    }
  }

}

void __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VTAssetManager"), 2, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
  else if (v2)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

void __46__VTAssetManager__downloadAsset_withComplete___block_invoke_204(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)VTLogContextFacilityVoiceTrigger;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "assetServerUrl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "::: Error downloading from %{public}@ with error %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v4;
      objc_msgSend(v9, "assetServerUrl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "::: download completed successfully from %{public}@.", (uint8_t *)&v13, 0xCu);

    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }

}

void __46__VTAssetManager__downloadAsset_withComplete___block_invoke(double a1)
{
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134349056;
    v4 = a1 * 100.0;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: download progress: %{public}3.0f%%", (uint8_t *)&v3, 0xCu);
  }
}

void __44__VTAssetManager__runAssetQuery_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v9 = "-[VTAssetManager _runAssetQuery:completion:]_block_invoke";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_INFO, "::: %{public}s; query: %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__VTAssetManager__runAssetQuery_completion___block_invoke_199;
  v5[3] = &unk_24C7F4550;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v6, "queryMetaData:", v5);

}

void __44__VTAssetManager__runAssetQuery_completion___block_invoke_199(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2
    || (objc_msgSend(*(id *)(a1 + 32), "results"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v14 = 134349056;
      v15 = a2;
      _os_log_error_impl(&dword_20D965000, v4, OS_LOG_TYPE_ERROR, "Error running asset query: error %{public}lu, or result is empty", (uint8_t *)&v14, 0xCu);
      v5 = *(_QWORD *)(a1 + 40);
      if (!v5)
        return;
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (!v5)
        return;
    }
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    return;
  }
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134349056;
    v15 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Found %{public}lu assets", (uint8_t *)&v14, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __49__VTAssetManager__updateFromRemoteToLocalAssets___block_invoke()
{
  id v0;

  +[VTAssetMonitor sharedInstance](VTAssetMonitor, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "notifyNewAssetDownloaded");

}

void __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  block[0] = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 8);
  block[2] = __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke_2;
  block[3] = &unk_24C7F44E0;
  block[1] = 3221225472;
  v9 = a2;
  block[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 56);
  dispatch_async(v5, block);

}

void __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v9 = 134349056;
      v10 = v1;
      _os_log_error_impl(&dword_20D965000, v2, OS_LOG_TYPE_ERROR, "Failed to finish query with error %{public}lu", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_filteredAssetsForAssets:language:supportPremium:", v5, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = 134349056;
      v10 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateFromRemoteToLocalAssets:", v6);

  }
}

void __38__VTAssetManager__fetchRemoteMetaData__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v6 = 134349056;
      v7 = a2;
      _os_log_error_impl(&dword_20D965000, v2, OS_LOG_TYPE_ERROR, "Failed to download meta data with error %{public}lu", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "Meta data downloaded successfully", (uint8_t *)&v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_assetQueryForLanguage:supportPremium:", 0, +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_runAssetQuery:completion:", v5, 0);

  }
}

void __44__VTAssetManager_installedAssetForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_installedAssetForLanguage:supportPremium:", *(_QWORD *)(a1 + 40), +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __35__VTAssetManager_assetForLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRemoteAssetForLanguage:supportPremium:", *(_QWORD *)(a1 + 40), +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"));
}

void __22__VTAssetManager_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchRemoteMetaData");
    WeakRetained = v4;
  }

}

+ (id)sharedInstance
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = "+[VTAssetManager sharedInstance]";
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_INFO, "::: %{public}s", (uint8_t *)&v4, 0xCu);
  }
  if (sharedInstance_onceToken_4418 != -1)
    dispatch_once(&sharedInstance_onceToken_4418, &__block_literal_global_4419);
  return (id)sharedInstance_sSharedAssetManager;
}

void __32__VTAssetManager_sharedInstance__block_invoke()
{
  VTAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(VTAssetManager);
  v1 = (void *)sharedInstance_sSharedAssetManager;
  sharedInstance_sSharedAssetManager = (uint64_t)v0;

}

@end
