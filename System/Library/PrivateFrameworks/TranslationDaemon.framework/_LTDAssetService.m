@implementation _LTDAssetService

+ (id)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_2);
  return (id)queue__queue;
}

+ (void)setAssetProviderFixture:(Class)a3
{
  _assetProviderFixture = (uint64_t)a3;
}

+ (Class)assetProviderFixture
{
  return (Class)(id)_assetProviderFixture;
}

+ (_LTDAssetCleanupScheduling)cleanupScheduler
{
  return (_LTDAssetCleanupScheduling *)(id)_cleanupScheduler;
}

+ (void)setCleanupScheduler:(id)a3
{
  objc_storeStrong((id *)&_cleanupScheduler, a3);
}

+ (Class)_serviceProviderForAssetType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v8;

  v3 = a3;
  v4 = v3;
  if (_assetProviderFixture)
  {
    v5 = (id)_assetProviderFixture;
LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.MobileAsset.Speech")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", &stru_251A15610))
  {
    _os_feature_enabled_impl();
    v5 = (id)objc_opt_class();
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.MobileAsset.Trial.Siri.SiriTextToSpeech")))
  {
    objc_opt_class();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    +[_LTDAssetService _serviceProviderForAssetType:].cold.1();
  v6 = 0;
LABEL_7:

  return (Class)v6;
}

+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_serviceProviderForAssetType:", v7), "downloadCatalogForAssetType:completion:", v7, v6);

}

+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a1, "_serviceProviderForAssetType:", v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke;
  v13[3] = &unk_251A11638;
  v15 = v9;
  v16 = a1;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "queryAssetType:filter:completion:", v12, a4, v13);

}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, id);
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, id))a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (objc_msgSend(v10, "isInstalled"))
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_2491B9000, v13, OS_LOG_TYPE_DEFAULT, "Download of already installed asset requested: %{public}@", buf, 0xCu);
    }
    if (v11)
    {
      +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applyAssetUpdates:", v15);

      v11[2](v11, v10);
    }
    if (v12)
      v12[2](v12, 0);
  }
  else
  {
    objc_msgSend(v10, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setOfflineState:", 1);

    v17 = _LTOSLogAssets();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_DEFAULT, "Download of asset requested: %{public}@", buf, 0xCu);
    }
    objc_msgSend(v10, "managedAssetType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(a1, "_serviceProviderForAssetType:", v18);

    objc_msgSend(v19, "downloadAsset:options:progress:completion:", v10, a4, v11, v12);
  }

}

+ (void)downloadAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_group_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  __int128 *v52;
  id v53;
  char v54;
  _QWORD block[4];
  id v56;
  _QWORD *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  NSObject *v65;
  id v66;
  id v67;
  __int128 *p_buf;
  _QWORD *v69;
  id v70;
  unint64_t v71;
  _QWORD v72[4];
  uint8_t v73[128];
  __int128 buf;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v42 = a6;
  v11 = _LTOSLogAssets();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v9, "count");
    _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_DEFAULT, "Starting download of %zd assets", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compareDownloadPriority_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "processorCount");

  v17 = v16 >> 1;
  if (v16 <= 1)
    v17 = 1;
  v43 = v17;
  v18 = _LTOSLogAssets();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v43;
    _os_log_impl(&dword_2491B9000, v18, OS_LOG_TYPE_INFO, "Throttle downloads to %zd concurrent requests", (uint8_t *)&buf, 0xCu);
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__3;
  v77 = __Block_byref_object_dispose__3;
  v78 = 0;
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke;
  v63[3] = &unk_251A116D8;
  v70 = a1;
  v20 = v13;
  v64 = v20;
  v71 = a4;
  v41 = v10;
  v67 = v41;
  p_buf = &buf;
  v21 = v14;
  v65 = v21;
  v69 = v72;
  v22 = v19;
  v66 = v22;
  v23 = (void *)MEMORY[0x2495AE9CC](v63);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v24 = v20;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v60;
    v27 = 1;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v60 != v26)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if ((objc_msgSend(v29, "isTTSModel") & 1) == 0)
          dispatch_group_enter(v21);
        objc_msgSend(v29, "progress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isFinished");

        v32 = (void *)MEMORY[0x2495AE9CC](v23);
        objc_msgSend(v22, "addObject:", v32);

        v27 &= v31;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    }
    while (v25);
  }
  else
  {
    v27 = 1;
  }

  objc_msgSend(a1, "queue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_24;
  block[3] = &unk_251A11700;
  v57 = v72;
  v58 = v43;
  v34 = v22;
  v56 = v34;
  dispatch_async(v33, block);

  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2_25;
  v49[3] = &unk_251A11728;
  v53 = a1;
  v35 = v24;
  v50 = v35;
  v54 = v27;
  v36 = v42;
  v51 = v36;
  v52 = &buf;
  v37 = (void *)MEMORY[0x2495AE9CC](v49);
  objc_msgSend(a1, "queue");
  v38 = objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_30;
  v45[3] = &unk_251A11750;
  v47 = v37;
  v48 = a1;
  v46 = v35;
  v39 = v37;
  v40 = v35;
  dispatch_group_notify(v21, v38, v45);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v72, 8);

}

+ (void)purgeAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  objc_msgSend(v9, "managedAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "_serviceProviderForAssetType:", v7);

  objc_msgSend(v8, "purgeAsset:completion:", v9, v6);
}

+ (void)bootstrapWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44___LTDAssetService_bootstrapWithCompletion___block_invoke;
  v6[3] = &unk_251A11778;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "refreshCatalogIfNeededWithCompletion:", v6);

}

+ (id)_libraryDirectory
{
  uid_t v2;
  passwd *v3;
  char *pw_dir;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v12;

  v2 = getuid();
  v3 = getpwuid(v2);
  if (v3 && (pw_dir = v3->pw_dir) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", pw_dir, 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_LTDAssetService _libraryDirectory].cold.2(v8);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;

    if (v5)
    {
      v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[_LTDAssetService _libraryDirectory].cold.1();
    }
  }

  return v7;
}

+ (id)assetDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37___LTDAssetService_assetDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (assetDirectoryURL_onceToken != -1)
    dispatch_once(&assetDirectoryURL_onceToken, block);
  return (id)assetDirectoryURL__assetDirectoryURL;
}

+ (int64_t)_catalogRefreshInterval
{
  return 86400;
}

+ (BOOL)_isCatalogRefreshWaitExpired
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  _LTPreferencesLastOfflineAssetCatalogUpdate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = (uint64_t)fabs(v5);
    if (objc_msgSend(a1, "_catalogRefreshInterval") >= v6)
    {
      v16 = 0;
      goto LABEL_9;
    }
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[_LTDAssetService _isCatalogRefreshWaitExpired].cold.2(v7, a1, v6);
  }
  else
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[_LTDAssetService _isCatalogRefreshWaitExpired].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = 1;
LABEL_9:

  return v16;
}

+ (void)_forceOneTimeCatalogRefresh
{
  if ((_hasForcedOneTimeCatalogRefresh & 1) == 0)
  {
    _hasForcedOneTimeCatalogRefresh = 1;
    objc_msgSend(a1, "setNeedsCatalogRefresh:", 1);
  }
}

+ (void)_test_resetForceOneTimeCatalogRefresh
{
  _hasForcedOneTimeCatalogRefresh = 0;
}

+ (id)defaultCatalogTypeWithError:(id *)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;

  v9 = 0;
  +[_LTDConfigurationService assetConfigurationWithError:](_LTDConfigurationService, "assetConfigurationWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v5)
  {
    objc_msgSend(v4, "currentSpeechTranslationAssetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = _LTOSLogAssets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService defaultCatalogTypeWithError:].cold.1();
    if (a3)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!a3)
    goto LABEL_7;
LABEL_4:
  v7 = 0;
  *a3 = objc_retainAutorelease(v5);
LABEL_8:

  return v7;
}

+ (BOOL)_isObsoleteCatalogType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  v12 = 0;
  objc_msgSend(a1, "defaultCatalogTypeWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6 || (objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "hasPrefix:", v10);
    if (v7)
    {
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[_LTDAssetService _isObsoleteCatalogType:].cold.1();
    }

  }
  return v7;
}

+ (void)setNeedsCatalogRefresh:(BOOL)a3
{
  id v3;

  if (a3)
  {
    _LTPreferencesSetLastOfflineAssetCatalogUpdate(0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _LTPreferencesSetLastOfflineAssetCatalogUpdate(v3);

  }
}

+ (BOOL)needsCatalogRefresh
{
  int v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = objc_msgSend(a1, "_isCatalogRefreshWaitExpired");
  if (v2)
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEFAULT, "Catalog needs to refresh since the poll interval has elapsed", v5, 2u);
    }
  }
  return v2;
}

+ (void)refreshCatalogIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  void (**v9)(id, _QWORD, id);
  id v10;
  uint8_t buf[8];
  id v12;

  v4 = (void (**)(id, _QWORD, id))a3;
  if ((objc_msgSend(a1, "needsCatalogRefresh") & 1) != 0)
  {
    objc_msgSend(a1, "setNeedsCatalogRefresh:", 0);
    v12 = 0;
    objc_msgSend(a1, "defaultCatalogTypeWithError:", &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v6)
    {
      objc_msgSend(a1, "setNeedsCatalogRefresh:", 1);
      if (v4)
        v4[2](v4, 0, v6);
    }
    else
    {
      v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_DEFAULT, "Update offline asset catalog", buf, 2u);
      }
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke;
      v8[3] = &unk_251A11800;
      v10 = a1;
      v9 = v4;
      objc_msgSend(a1, "downloadCatalogForAssetType:completion:", v5, v8);

    }
  }
  else if (v4)
  {
    v4[2](v4, 0, 0);
  }

}

+ (void)_refreshHotfixWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Trying to refresh hotfix asset", buf, 2u);
  }
  +[_LTHotfixManager shared](_LTHotfixManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke;
  v7[3] = &unk_251A112E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "refreshHotfix:", v7);

}

+ (void)configAssetWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Trying to download config asset", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46___LTDAssetService_configAssetWithCompletion___block_invoke;
  v7[3] = &unk_251A11850;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(a1, "catalogAssetsWithCompletion:", v7);

}

+ (id)configAssetIfAvailableWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;

  v16 = 0;
  objc_msgSend(a1, "catalogAssetsWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (!v6)
  {
    +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((objc_msgSend(v10, "isInstalled") & 1) != 0)
      {
        v9 = v11;
        v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(a1, "_installConfigAsset:completion:", v11, 0);
      objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 8, CFSTR("Not installed"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v14 = _LTOSLogAssets();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        +[_LTDAssetService configAssetIfAvailableWithError:].cold.2();
        if (a3)
          goto LABEL_14;
      }
      else if (a3)
      {
LABEL_14:
        v7 = objc_retainAutorelease(v7);
        v9 = 0;
        *a3 = v7;
        goto LABEL_21;
      }
LABEL_20:
      v9 = 0;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 7, CFSTR("No config asset in result from sync catalog request"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      if (!a3)
        goto LABEL_11;
    }
    else if (!a3)
    {
LABEL_11:

      v7 = 0;
      goto LABEL_20;
    }
    *a3 = objc_retainAutorelease(v12);
    goto LABEL_11;
  }
  v7 = v6;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService configAssetIfAvailableWithError:].cold.3();
    if (a3)
      goto LABEL_4;
LABEL_16:
    v9 = 0;
    goto LABEL_22;
  }
  if (!a3)
    goto LABEL_16;
LABEL_4:
  v7 = objc_retainAutorelease(v7);
  v9 = 0;
  *a3 = v7;
LABEL_22:

  return v9;
}

+ (void)_installConfigAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isInstalled") & 1) == 0 && !objc_msgSend(v6, "isDownloading"))
  {
    v25 = 0;
    objc_msgSend(a1, "installedAssetsWithError:", &v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;
    objc_msgSend(a1, "filterConfigAssetFromAssets:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v6);
    v20 = _LTOSLogAssets();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (!v19)
    {
      if (v21)
        +[_LTDAssetService _installConfigAsset:completion:].cold.3(v20);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __51___LTDAssetService__installConfigAsset_completion___block_invoke;
      v22[3] = &unk_251A11878;
      v24 = v7;
      v23 = v6;
      objc_msgSend(a1, "downloadAsset:options:progress:completion:", v23, 2, 0, v22);

      goto LABEL_13;
    }
    if (v21)
    {
      +[_LTDAssetService _installConfigAsset:completion:].cold.2(v20);
      if (!v7)
        goto LABEL_13;
    }
    else if (!v7)
    {
LABEL_13:

      goto LABEL_14;
    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_13;
  }
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    +[_LTDAssetService _installConfigAsset:completion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    if (!v7)
      goto LABEL_14;
    goto LABEL_5;
  }
  if (v7)
LABEL_5:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_14:

}

+ (void)catalogAssetsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD, id);
  id v9;

  v4 = (void (**)(id, _QWORD, id))a3;
  v9 = 0;
  objc_msgSend(a1, "defaultCatalogTypeWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v4[2](v4, 0, v6);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke;
    v7[3] = &unk_251A115E8;
    v8 = v4;
    objc_msgSend(a1, "queryAssetType:filter:completion:", v5, 1, v7);

  }
}

+ (id)catalogAssetsWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "defaultCatalogTypeWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v11 = 0;
  objc_msgSend(a1, "queryAssetType:filter:error:", v5, 1, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService catalogAssetsWithError:].cold.1();
      if (!a3)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  if (a3)
  {
LABEL_7:
    v7 = objc_retainAutorelease(v7);
    *a3 = v7;
  }
LABEL_8:

  return v8;
}

+ (void)installedAssetsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD, id);
  id v9;

  v4 = (void (**)(id, _QWORD, id))a3;
  v9 = 0;
  objc_msgSend(a1, "defaultCatalogTypeWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    v4[2](v4, 0, v6);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50___LTDAssetService_installedAssetsWithCompletion___block_invoke;
    v7[3] = &unk_251A115E8;
    v8 = v4;
    objc_msgSend(a1, "queryAssetType:filter:completion:", v5, 2, v7);

  }
}

+ (id)installedAssetsWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "defaultCatalogTypeWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v11 = 0;
  objc_msgSend(a1, "queryAssetType:filter:error:", v5, 2, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService installedAssetsWithError:].cold.1();
      if (!a3)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  if (a3)
  {
LABEL_7:
    v7 = objc_retainAutorelease(v7);
    *a3 = v7;
  }
LABEL_8:

  return v8;
}

+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v17;

  v8 = a3;
  v17 = 0;
  objc_msgSend((id)objc_msgSend(a1, "_serviceProviderForAssetType:", v8), "queryAssetType:filter:error:", v8, a4, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(a1, "_assetsSortedByVersion:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "code") != 14
    || (objc_msgSend(v11, "domain"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("LTTranslationDaemonErrorDomain")),
        v12,
        !v13))
  {
LABEL_8:
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService queryAssetType:filter:error:].cold.1();
      if (a5)
        goto LABEL_10;
    }
    else if (a5)
    {
LABEL_10:
      v14 = 0;
      *a5 = objc_retainAutorelease(v11);
      goto LABEL_13;
    }
    v14 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(a1, "_isObsoleteCatalogType:", v8) & 1) == 0)
  {
    objc_msgSend(a1, "_forceOneTimeCatalogRefresh");
    objc_msgSend(a1, "refreshCatalogIfNeededWithCompletion:", 0);
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x24BDBD1A8];
LABEL_13:

  return v14;
}

+ (id)filterConfigAssetFromAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "lt_filterUsingBlock:", &__block_literal_global_57);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(a1, "_assetsSortedByVersion:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_assetsSortedByVersion:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compareAssetVersionReversed_);
}

+ (id)_assetsIdentifiersForPairNames:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v45;
  if (!v7)
  {
    v44 = 0;
    +[_LTDConfigurationService asrConfigurationWithError:](_LTDConfigurationService, "asrConfigurationWithError:", &v44);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v44;
    if (!v8)
    {
      v29 = v5;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v5;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v33)
      {
        v31 = *(_QWORD *)v41;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
            v35 = v13;
            objc_msgSend(v34, "componentsSeparatedByString:", CFSTR("-"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v37;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v37 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
                  objc_msgSend(v11, "localeIdentifiers");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "containsObject:", v19);

                  if (v21)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ASR-%@"), v19);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "addObject:", v22);

                  }
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TTS-%@"), v19);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v23);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
              }
              while (v16);
            }
            objc_msgSend(v32, "offlinePairConfigurationWithIdentifier:", v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "pairAssetList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = _LTOSLogAssets();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              v47 = v25;
              v48 = 2114;
              v49 = v34;
              _os_log_debug_impl(&dword_2491B9000, v26, OS_LOG_TYPE_DEBUG, "Adding assets [%{public}@] for pair %{public}@", buf, 0x16u);
            }
            objc_msgSend(v6, "addObjectsFromArray:", v25);

            v13 = v35 + 1;
          }
          while (v35 + 1 != v33);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v33);
      }

      objc_msgSend(v6, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
      v5 = v29;
      goto LABEL_32;
    }
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService _assetsIdentifiersForPairNames:error:].cold.1();
      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      v10 = 0;
      *a4 = objc_retainAutorelease(v8);
LABEL_32:

      goto LABEL_33;
    }
    v10 = 0;
    goto LABEL_32;
  }
  v8 = v7;
  v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService _assetsIdentifiersForPairNames:error:].cold.2();
    if (a4)
      goto LABEL_4;
LABEL_29:
    v10 = 0;
    goto LABEL_33;
  }
  if (!a4)
    goto LABEL_29;
LABEL_4:
  v8 = objc_retainAutorelease(v8);
  v10 = 0;
  *a4 = v8;
LABEL_33:

  return v10;
}

+ (id)_pairNamesForLocales:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v9), "_ltLocaleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }
  v24 = v5;

  v25 = v4;
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "count");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v11;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v27)
  {
    v14 = 0;
    v26 = *(_QWORD *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v29 = v14;
        v30 = v13;
        objc_msgSend(obj, "subarrayWithRange:", v14, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v32;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v32 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v16, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v21));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v22);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          }
          while (v19);
        }
        v14 = v29 + 1;
        v13 = v30 - 1;

        ++v15;
      }
      while (v15 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v27);
  }

  return v12;
}

+ (id)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v18 = 0;
  objc_msgSend(a1, "catalogAssetsWithError:", &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v10)
  {
    v11 = v10;
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService assetsForLocales:includeTTS:error:].cold.1();
      if (a5)
        goto LABEL_4;
    }
    else if (a5)
    {
LABEL_4:
      v11 = objc_retainAutorelease(v11);
      v13 = 0;
      *a5 = v11;
      goto LABEL_10;
    }
    v13 = 0;
    goto LABEL_10;
  }
  if (v6)
  {
    objc_msgSend(a1, "_ttsAssetsForLocales:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  v17 = 0;
  objc_msgSend(a1, "filterAssets:forLocales:error:", v9, v8, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
LABEL_10:

  return v13;
}

+ (void)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke;
  v12[3] = &unk_251A11908;
  v16 = a4;
  v14 = v9;
  v15 = a1;
  v13 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a1, "catalogAssetsWithCompletion:", v12);

}

+ (id)_ttsAssetsForLocales:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _LTDTTSAssetModel *v11;
  _LTDAssetModel *v12;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "_ltLocaleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("TTS-%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[_LTDTTSAssetModel initWithAssetIdentifier:]([_LTDTTSAssetModel alloc], "initWithAssetIdentifier:", v10);
        v12 = -[_LTDAssetModel initWithProvider:]([_LTDAssetModel alloc], "initWithProvider:", v11);
        if (v12)
          objc_msgSend(v15, "addObject:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v15;
}

+ (id)filterAssets:(id)a3 forLocales:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  void *v43;
  void *v44;
  id v45;
  id v46;
  int64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v45 = a4;
  v9 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v11);
  }

  v16 = v45;
  objc_msgSend(a1, "_pairNamesForLocales:", v45);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(a1, "_assetsIdentifiersForPairNames:error:", v17, &v53);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v53;
  v20 = _LTOSLogAssets();
  v21 = v20;
  if (!v19)
  {
    v44 = v17;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v18;
      _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "Required Assets: %{public}@", buf, 0xCu);
    }
    v23 = +[_LTDANEService capability](_LTDANEService, "capability");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v43 = v18;
    v25 = v18;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (!v26)
    {
LABEL_36:

      objc_msgSend(v24, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v44;
      v16 = v45;
      v19 = 0;
      v18 = v43;
      goto LABEL_37;
    }
    v27 = v26;
    v28 = *(_QWORD *)v50;
    v46 = v25;
    v47 = v23;
LABEL_17:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v28)
        objc_enumerationMutation(v25);
      v30 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v29);
      objc_msgSend(v9, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (!v31)
        goto LABEL_34;
      v33 = objc_msgSend(v31, "assetType");
      if ((unint64_t)(v33 - 7) < 2)
        goto LABEL_33;
      if (v33 != 6 && v33 != 2)
        goto LABEL_34;
      if (objc_msgSend(v32, "isANEModel"))
        break;
      objc_msgSend(v24, "objectForKeyedSubscript:", v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_33;
LABEL_34:

      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (!v27)
          goto LABEL_36;
        goto LABEL_17;
      }
    }
    v35 = objc_msgSend(v32, "requiredCapabilityIdentifier");
    if (v23 < v35)
      goto LABEL_34;
    v36 = v35;
    objc_msgSend(v24, "objectForKeyedSubscript:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v24;
    v39 = objc_msgSend(v37, "requiredCapabilityIdentifier");

    v40 = v36 <= v39;
    v24 = v38;
    v25 = v46;
    v23 = v47;
    if (v40)
      goto LABEL_34;
LABEL_33:
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, v30);
    goto LABEL_34;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService filterAssets:forLocales:error:].cold.1();
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (a5)
LABEL_11:
    *a5 = objc_retainAutorelease(v19);
LABEL_12:
  v22 = (void *)MEMORY[0x24BDBD1A8];
LABEL_37:

  return v22;
}

+ (id)matchingASRAssetForLocale:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(a1, "assetsForLocales:includeTTS:error:", v7, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (!v9)
  {
    objc_msgSend(a1, "matchingASRAssetInAssets:forLocale:", v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService matchingASRAssetForLocale:error:].cold.1();
    if (a4)
      goto LABEL_4;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_7;
LABEL_4:
  v11 = 0;
  *a4 = objc_retainAutorelease(v9);
LABEL_8:

  return v11;
}

+ (id)matchingASRAssetInAssets:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isASRModel", (_QWORD)v13)
          && (objc_msgSend(v11, "supportsLocale:", v6) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_12;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

+ (void)_serviceProviderForAssetType:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_2491B9000, v0, OS_LOG_TYPE_FAULT, "No service provider defined for asset type: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_libraryDirectory
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Failed call to getpwuid, fall back to file manager", v1, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)_isCatalogRefreshWaitExpired
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_8(a1);
  v6 = 134218240;
  v7 = a3;
  v8 = 2048;
  v9 = objc_msgSend(a2, "_catalogRefreshInterval");
  _os_log_debug_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEBUG, "Catalog needs refresh since last poll was %zd which exceeds %zd", (uint8_t *)&v6, 0x16u);

}

+ (void)defaultCatalogTypeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error reading asset configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_isObsoleteCatalogType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v0, v1, "Detected obsolete catalog type: %{public}@", v2);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configAssetIfAvailableWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Config asset not available: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configAssetIfAvailableWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Config asset catalog read failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_installConfigAsset:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Config asset is already installed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

+ (void)_installConfigAsset:(void *)a1 completion:.cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v1, v2, "Installed config asset is already current version %zd", v3);

  OUTLINED_FUNCTION_9();
}

+ (void)_installConfigAsset:(void *)a1 completion:.cold.3(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v1, v2, "Config asset is outdated, downloading version %zd", v3);

  OUTLINED_FUNCTION_9();
}

+ (void)catalogAssetsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error sync querying catalog assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)installedAssetsWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error sync querying installed assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)queryAssetType:filter:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Asset sync query failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_assetsIdentifiersForPairNames:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read offline ASR configuration for asset pairs %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)_assetsIdentifiersForPairNames:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read offline configuration for asset pairs %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)assetsForLocales:includeTTS:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read assets for locales %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)filterAssets:forLocales:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read assets for pair names %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)matchingASRAssetForLocale:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read assets for locale %@: %@");
  OUTLINED_FUNCTION_1_2();
}

@end
