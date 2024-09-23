@implementation _LTOfflineAssetManager

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.Translator.EMTAssetManager", 0);
    v3 = (void *)_queue;
    _queue = (uint64_t)v2;

  }
}

- (_LTOfflineAssetManager)init
{
  _LTOfflineAssetManager *v2;
  _LTOfflineAssetManager *v3;
  uint64_t v4;
  _LTHotfixManager *hotfixMgr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTOfflineAssetManager;
  v2 = -[_LTOfflineAssetManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_LTOfflineAssetManager _removeOldAssetDirectory](v2, "_removeOldAssetDirectory");
    +[_LTHotfixManager shared](_LTHotfixManager, "shared");
    v4 = objc_claimAutoreleasedReturnValue();
    hotfixMgr = v3->_hotfixMgr;
    v3->_hotfixMgr = (_LTHotfixManager *)v4;

  }
  return v3;
}

- (void)_refreshAllAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke;
  v6[3] = &unk_251A12A48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[_LTDAssetService configAssetWithCompletion:](_LTDAssetService, "configAssetWithCompletion:", v6);

}

- (void)refreshAllIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = _queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_251A129D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeObsoleteAssets
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error querying offline configuration for language pair status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_queryLanguagePairStatusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _LTOfflineAssetManager *v35;
  void (**v36)(id, _QWORD, void *);
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v47 = 0;
  +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v47;
  if (!v6)
  {
    if (v5)
      goto LABEL_6;
    v32 = _LTOSLogAssets();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _queryLanguagePairStatusWithCompletion:].cold.2(v32);
      if (v4)
        goto LABEL_19;
    }
    else if (v4)
    {
LABEL_19:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDF6530], 5, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v33);

      v7 = 0;
      goto LABEL_24;
    }
LABEL_6:
    v35 = self;
    v36 = v4;
    objc_msgSend(v5, "languagePairs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x24BDF6410], "pairWithIdentifiers:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);
          v17 = objc_alloc(MEMORY[0x24BDF6410]);
          objc_msgSend(v16, "sourceLocale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sourceLocale");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithSourceLocale:targetLocale:", v18, v19);
          objc_msgSend(v10, "addObject:", v20);

          v21 = objc_alloc(MEMORY[0x24BDF6410]);
          objc_msgSend(v16, "targetLocale");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "targetLocale");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v21, "initWithSourceLocale:targetLocale:", v22, v23);
          objc_msgSend(v10, "addObject:", v24);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v13);
    }

    v25 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v10, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "sortUsingComparator:", &__block_literal_global_17);
    v42 = 0;
    +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v42;
    v41 = v29;
    +[_LTDAssetService catalogAssetsWithError:](_LTDAssetService, "catalogAssetsWithError:", &v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;

    if (!v7)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16;
      v37[3] = &unk_251A12AD8;
      v37[4] = v35;
      v38 = v28;
      v39 = v30;
      v40 = v5;
      objc_msgSend(v27, "_ltCompactMap:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v36;
      if (v36)
        ((void (**)(id, void *, void *))v36)[2](v36, v34, 0);

      goto LABEL_23;
    }
    v31 = _LTOSLogAssets();
    v4 = v36;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _queryLanguagePairStatusWithCompletion:].cold.1();
      if (!v36)
        goto LABEL_23;
    }
    else if (!v36)
    {
LABEL_23:

      goto LABEL_24;
    }
    v36[2](v36, 0, v7);
    goto LABEL_23;
  }
  v7 = v6;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager removeObsoleteAssets].cold.1();
    if (!v4)
      goto LABEL_24;
    goto LABEL_4;
  }
  if (v4)
LABEL_4:
    v4[2](v4, 0, v7);
LABEL_24:

}

- (void)deleteAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49___LTOfflineAssetManager_deleteAsset_completion___block_invoke;
  v7[3] = &unk_251A12B00;
  v8 = v5;
  v6 = v5;
  +[_LTDAssetService purgeAsset:completion:](_LTDAssetService, "purgeAsset:completion:", a3, v7);

}

- (void)offlineLanguageStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = _queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48___LTOfflineAssetManager_offlineLanguageStatus___block_invoke;
  v7[3] = &unk_251A12770;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_removeOldAssetDirectory
{
  dispatch_async((dispatch_queue_t)_queue, &__block_literal_global_18);
}

+ (id)assetDirectory
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;

  v2 = (void *)assetDirectory__assetURL;
  if (assetDirectory__assetURL)
  {
LABEL_2:
    v3 = v2;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[_LTDConfigurationService assetConfigurationWithError:](_LTDConfigurationService, "assetConfigurationWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (!v6)
  {
    +[_LTDAssetService assetDirectoryURL](_LTDAssetService, "assetDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAssetDirectoryName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)assetDirectory__assetURL;
    assetDirectory__assetURL = v12;

    v16 = 0;
    objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", assetDirectory__assetURL, 1, 0, &v16);
    v14 = v16;
    if (v14)
    {
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[_LTOfflineAssetManager assetDirectory].cold.1();
    }

    v2 = (void *)assetDirectory__assetURL;
    goto LABEL_2;
  }
  v7 = v6;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[_LTOfflineAssetManager assetDirectory].cold.2();

  v3 = 0;
  return v3;
}

- (id)_assetIdentifiersForLanguagePairDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("assets.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = 0;
LABEL_9:
    v8 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_10;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager _assetIdentifiersForLanguagePairDirectory:].cold.1();
    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)assetIdentifierReferenceCountDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTOfflineAssetManager assetDirectory](_LTOfflineAssetManager, "assetDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v19 = v2;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;

  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager assetIdentifierReferenceCountDictionary].cold.1();
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v24 = v8;
        -[_LTOfflineAssetManager _assetIdentifiersForLanguagePairDirectory:](self, "_assetIdentifiersForLanguagePairDirectory:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v26 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v3, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = v15;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v17 = &unk_251A50B30;
              }
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v11);
        }

        v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v23);
  }

  return v3;
}

- (void)purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, id);
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(id, id);
  id v16;

  v5 = a4;
  v8 = (void (**)(id, id))a5;
  objc_msgSend(a3, "canonicalLocalePair");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:](self, "_speechTranslationAssetInfoForLocalePair:error:", v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v11)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager purgeAssetForLanguagePair:userInitiated:completion:].cold.1();
    v8[2](v8, v11);
  }
  else
  {
    v13 = _queue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77___LTOfflineAssetManager_purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
    v14[3] = &unk_251A112E0;
    v15 = v8;
    objc_msgSend(v10, "purgeAssetUserInitiated:queue:completion:", v5, v13, v14);

  }
}

- (void)purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint8_t *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _LTHotfixManager *hotfixMgr;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _LTHotfixManager *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD block[4];
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint8_t *v50;
  id v51;
  id obj;
  uint8_t v53[4];
  uint64_t v54;
  uint8_t v55[128];
  uint8_t buf[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v4 = a3;
  v62 = *MEMORY[0x24BDAC8D0];
  v28 = a4;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEFAULT, "Requested to delete all offline assets, excluding config: %{BOOL}i", buf, 8u);
  }
  *(_QWORD *)buf = 0;
  v57 = buf;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__6;
  v60 = __Block_byref_object_dispose__6;
  v61 = 0;
  +[_LTOfflineAssetManager assetDirectory](_LTOfflineAssetManager, "assetDirectory");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v57;
  obj = (id)*((_QWORD *)v57 + 5);
  v9 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &obj);
  v27 = (void *)v6;
  objc_storeStrong((id *)v8 + 5, obj);

  if ((v9 & 1) == 0)
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager purgeAllAssetsExcludingConfig:completion:].cold.2();
  }
  v11 = (void *)*((_QWORD *)v57 + 5);
  *((_QWORD *)v57 + 5) = 0;

  v12 = v57;
  v51 = (id)*((_QWORD *)v57 + 5);
  +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v51);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)v12 + 5, v51);
  if (v29)
  {
    if (objc_msgSend(v29, "count", v6))
    {
      v13 = dispatch_group_create();
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__6;
      v44[4] = __Block_byref_object_dispose__6;
      v45 = 0;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v14 = v29;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
      v16 = 0;
      if (v15)
      {
        v17 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if ((objc_msgSend(v19, "isConfig") & v4 & 1) == 0)
            {
              dispatch_group_enter(v13);
              v37[0] = MEMORY[0x24BDAC760];
              v37[1] = 3221225472;
              v37[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_27;
              v37[3] = &unk_251A113C0;
              v39 = v44;
              v38 = v13;
              -[_LTOfflineAssetManager deleteAsset:completion:](self, "deleteAsset:completion:", v19, v37);

              ++v16;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
        }
        while (v15);
      }

      dispatch_group_enter(v13);
      hotfixMgr = self->_hotfixMgr;
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2_28;
      v34[3] = &unk_251A113C0;
      v36 = v44;
      v21 = v13;
      v35 = v21;
      -[_LTHotfixManager deleteHotfix:](hotfixMgr, "deleteHotfix:", v34);
      v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 134217984;
        v54 = v16;
        _os_log_impl(&dword_2491B9000, v22, OS_LOG_TYPE_INFO, "Waiting for %zd assets to be deleted", v53, 0xCu);
      }
      v23 = _queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_30;
      block[3] = &unk_251A12B98;
      v33 = v44;
      v32 = v28;
      dispatch_group_notify(v21, v23, block);

      _Block_object_dispose(v44, 8);
    }
    else
    {
      v26 = self->_hotfixMgr;
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2;
      v46[3] = &unk_251A112E0;
      v47 = v28;
      -[_LTHotfixManager deleteHotfix:](v26, "deleteHotfix:", v46);
      v21 = v47;
    }
  }
  else
  {
    v24 = _LTOSLogAssets();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager purgeAllAssetsExcludingConfig:completion:].cold.1();
    v25 = _queue;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke;
    v48[3] = &unk_251A12B48;
    v49 = v28;
    v50 = buf;
    dispatch_async(v25, v48);
    v21 = v49;
  }

  _Block_object_dispose(buf, 8);
}

- (void)debugDumpAssets:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = _LTOSLogAssets();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = v8;
          objc_msgSend(v7, "assetTypeName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v7, "assetVersion");
          v12 = objc_msgSend(v7, "requiredCapabilityIdentifier");
          objc_msgSend(v7, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v20 = v7;
          v21 = 2112;
          v22 = v10;
          v23 = 2048;
          v24 = v11;
          v25 = 2048;
          v26 = v12;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "%@ %@ Version %zd Capability %zd %@", buf, 0x34u);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
    }
    while (v4);
  }

}

- (void)_updateAsset:(id)a3 catalogAssets:(id)a4 downloadGroup:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _LTOfflineAssetManager *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  NSObject *v34;
  _LTOfflineAssetManager *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v39;
    *(_QWORD *)&v15 = 138544130;
    v29 = v15;
    v30 = v13;
    v31 = v10;
    do
    {
      v18 = 0;
      v32 = v16;
      do
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isNewerCompatibleVersionThan:", v10, v29))
        {
          v20 = _LTOSLogAssets();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = v20;
            objc_msgSend(v19, "assetTypeName");
            v22 = self;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v17;
            v25 = v12;
            v26 = v11;
            v27 = objc_msgSend(v19, "assetVersion");
            objc_msgSend(v19, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v43 = v19;
            v44 = 2114;
            v45 = v23;
            v46 = 2048;
            v47 = v27;
            v11 = v26;
            v12 = v25;
            v17 = v24;
            v48 = 2114;
            v49 = v28;
            _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "update asset: %{public}@; type: %{public}@; version: %zd; name: %{public}@",
              buf,
              0x2Au);

            self = v22;
            v13 = v30;
            v10 = v31;
          }
          dispatch_group_enter(v12);
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke;
          v33[3] = &unk_251A12BC0;
          v34 = v12;
          v37 = v13;
          v35 = self;
          v36 = v10;
          +[_LTDAssetService downloadAsset:options:progress:completion:](_LTDAssetService, "downloadAsset:options:progress:completion:", v19, 2, 0, v33);

          v16 = v32;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v16);
  }

}

- (void)updateAllAssets:(id)a3
{
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  id obj;
  void *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  void (**v34)(_QWORD, _QWORD);
  uint8_t *v35;
  _QWORD v36[5];
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  char v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to update all assets", buf, 2u);
  }
  v48 = 0;
  +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v48, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v48;
  v47 = v5;
  +[_LTDAssetService catalogAssetsWithError:](_LTDAssetService, "catalogAssetsWithError:", &v47);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v47;

  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager updateAllAssets:].cold.2();
    ((void (**)(_QWORD, id))v25)[2](v25, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v46);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v46;
    if (v9)
    {
      v6 = v9;
      v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_LTOfflineAssetManager updateAllAssets:].cold.1();
      ((void (**)(_QWORD, id))v25)[2](v25, v6);
    }
    else
    {
      objc_msgSend(v8, "languagePairs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v11;
      v6 = 0;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v43;
        do
        {
          v14 = 0;
          v15 = v6;
          do
          {
            if (*(_QWORD *)v43 != v13)
              objc_enumerationMutation(obj);
            objc_msgSend(MEMORY[0x24BDF6410], "pairWithIdentifiers:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v15;
            -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:](self, "_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:", v16, v29, v28, v8, &v41);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v41;

            objc_msgSend(v17, "availabilityInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "pairState") == 2)
              objc_msgSend(v26, "addObject:", v16);

            ++v14;
            v15 = v6;
          }
          while (v12 != v14);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v12);
      }

      v19 = _LTOSLogAssets();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "----------------------------- check config asset for update ------------------------------------ ", buf, 2u);
      }
      +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      v38 = buf;
      v39 = 0x2020000000;
      v22 = MEMORY[0x24BDAC760];
      v40 = 0;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke;
      v36[3] = &unk_251A12BE8;
      v36[4] = buf;
      -[_LTOfflineAssetManager _updateAsset:catalogAssets:downloadGroup:completion:](self, "_updateAsset:catalogAssets:downloadGroup:completion:", v20, v28, v21, v36);
      v23 = _queue;
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2;
      block[3] = &unk_251A12C78;
      v34 = v25;
      block[4] = self;
      v31 = v28;
      v32 = v29;
      v33 = v26;
      v35 = buf;
      dispatch_group_notify(v21, v23, block);

      _Block_object_dispose(buf, 8);
    }

  }
}

- (void)updateSpeechTranslationAssetSymLinks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  id v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v31 = 0;
    +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v31;
    v30 = v5;
    +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v30;

    v29 = v7;
    +[_LTDAssetService catalogAssetsWithError:](_LTDAssetService, "catalogAssetsWithError:", &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;

    v10 = _LTOSLogAssets();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_LTOfflineAssetManager updateSpeechTranslationAssetSymLinks:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Fixing symlinks", buf, 2u);
      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v21 = v4;
      v12 = v4;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v13)
      {
        v14 = v13;
        v9 = 0;
        v15 = *(_QWORD *)v25;
        do
        {
          v16 = 0;
          v17 = v9;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
            v23 = v17;
            -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:](self, "_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:", v18, v6, v8, v22, &v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v23;

            objc_msgSend(v19, "availabilityInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "pairState") == 2)
              objc_msgSend(v19, "createSymlinkDirectoryForMTAssets");

            ++v16;
            v17 = v9;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v14);
      }
      else
      {
        v9 = 0;
      }

      v4 = v21;
    }

  }
}

- (void)_downloadPassthroughAssetForLocale:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  +[_LTDTTSAssetService downloadVoiceAssetsForLanguagePair:](_LTDTTSAssetService, "downloadVoiceAssetsForLanguagePair:", v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke;
  v11[3] = &unk_251A12CA0;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[_LTOfflineAssetManager refreshAllIfNeededWithCompletion:](self, "refreshAllIfNeededWithCompletion:", v11);

}

- (void)downloadAssetsForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "canonicalLocalePair");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isPassthrough"))
  {
    -[_LTOfflineAssetManager _downloadPassthroughAssetForLocale:userInitiated:completion:](self, "_downloadPassthroughAssetForLocale:userInitiated:completion:", v9, v5, v8);
  }
  else
  {
    +[_LTDTTSAssetService downloadVoiceAssetsForLanguagePair:](_LTDTTSAssetService, "downloadVoiceAssetsForLanguagePair:", v9);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke;
    v10[3] = &unk_251A12CF0;
    v12 = v8;
    v10[4] = self;
    v11 = v9;
    v13 = v5;
    -[_LTOfflineAssetManager refreshAllIfNeededWithCompletion:](self, "refreshAllIfNeededWithCompletion:", v10);

  }
}

- (id)modelURLsForLanguagePair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[_LTOfflineAssetManager assetDirectory](_LTOfflineAssetManager, "assetDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTHotfixManager hotfixURL](self->_hotfixMgr, "hotfixURL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v16 = v8;
    v17 = v7;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v16;
    v12 = 2;
  }
  else
  {
    v15 = v7;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = (uint64_t *)&v15;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v6 = a3;
  -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:](self, "_speechTranslationAssetInfoForLocalePair:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "lt_unsupporedLocalePairError:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager speechTranslationAssetInfoForLocalePair:error:].cold.1();
      if (!a4)
        goto LABEL_12;
    }
    else if (!a4)
    {
LABEL_12:

      v9 = 0;
      goto LABEL_13;
    }
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isCompletePassthroughModel")
    && (objc_msgSend(v8, "isCompleteBidirectionalModel") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Incomplete speech translation model for %@"), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 19, v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager speechTranslationAssetInfoForLocalePair:error:].cold.2();
      if (!a4)
        goto LABEL_11;
    }
    else if (!a4)
    {
LABEL_11:

      goto LABEL_12;
    }
    *a4 = objc_retainAutorelease(v14);
    goto LABEL_11;
  }
  v9 = v8;
LABEL_13:

  return v9;
}

- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v23 = 0;
  +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  if (!v8)
  {
    if (!v7)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:].cold.1();
      v9 = 0;
      goto LABEL_13;
    }
    v22 = 0;
    +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v21 = v13;
    +[_LTDAssetService catalogAssetsWithError:](_LTDAssetService, "catalogAssetsWithError:", &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    if (v9)
    {
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:].cold.3();
        if (a4)
          goto LABEL_9;
      }
      else if (a4)
      {
LABEL_9:
        v9 = objc_retainAutorelease(v9);
        v11 = 0;
        *a4 = v9;
LABEL_26:

        goto LABEL_27;
      }
      v11 = 0;
      goto LABEL_26;
    }
    v20 = 0;
    -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:](self, "_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:", v6, v12, v14, v7, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (!v9)
    {
      v11 = v17;
      goto LABEL_25;
    }
    v18 = _LTOSLogAssets();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:].cold.2();
      if (a4)
        goto LABEL_17;
    }
    else if (a4)
    {
LABEL_17:
      v11 = 0;
      *a4 = objc_retainAutorelease(v9);
LABEL_25:

      goto LABEL_26;
    }
    v11 = 0;
    goto LABEL_25;
  }
  v9 = v8;
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:].cold.4();
    if (a4)
      goto LABEL_4;
LABEL_13:
    v11 = 0;
    goto LABEL_27;
  }
  if (!a4)
    goto LABEL_13;
LABEL_4:
  v9 = objc_retainAutorelease(v9);
  v11 = 0;
  *a4 = v9;
LABEL_27:

  return v11;
}

- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 installedAssets:(id)a4 catalogAssets:(id)a5 offlineConfig:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  _LTSpeechTranslationAssetInfo *v21;
  void *v23;
  NSObject *v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "canonicalLocalePair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "canonicalIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "offlinePairConfigurationWithIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "pairAssetList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
  {
    v20 = objc_msgSend(v16, "isPassthrough");

    if ((v20 & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1540], "lt_unsupporedLocalePairError:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _LTOSLogAssets();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:].cold.1();
      if (!a7)
        goto LABEL_9;
    }
    else if (!a7)
    {
LABEL_9:

      v21 = 0;
      goto LABEL_5;
    }
    *a7 = objc_retainAutorelease(v23);
    goto LABEL_9;
  }

LABEL_4:
  v21 = -[_LTSpeechTranslationAssetInfo initWithInstalledAssets:catalogAssets:localePair:offlineConfig:assetManager:]([_LTSpeechTranslationAssetInfo alloc], "initWithInstalledAssets:catalogAssets:localePair:offlineConfig:assetManager:", v13, v14, v16, v18, self);
LABEL_5:

  return v21;
}

- (id)getEndpointerAssetWithType:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  id v16;

  v16 = 0;
  +[_LTDConfigurationService assetConfigurationWithError:](_LTDConfigurationService, "assetConfigurationWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (!v7)
  {
    objc_msgSend(v6, "currentEndpointAssetType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    +[_LTDAssetService queryAssetType:filter:error:](_LTDAssetService, "queryAssetType:filter:error:", v11, a3, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (!v8)
    {
      v10 = v12;
      goto LABEL_14;
    }
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager getEndpointerAssetWithType:error:].cold.1();
      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      v10 = 0;
      *a4 = objc_retainAutorelease(v8);
LABEL_14:

      goto LABEL_15;
    }
    v10 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager getEndpointerAssetWithType:error:].cold.2();
    if (a4)
      goto LABEL_4;
LABEL_11:
    v10 = 0;
    goto LABEL_15;
  }
  if (!a4)
    goto LABEL_11;
LABEL_4:
  v8 = objc_retainAutorelease(v8);
  v10 = 0;
  *a4 = v8;
LABEL_15:

  return v10;
}

- (id)endpointAssetInfoWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _LTHybridEndpointerAssetInfo *v8;

  v6 = a3;
  -[_LTOfflineAssetManager getEndpointerAssetWithType:error:](self, "getEndpointerAssetWithType:error:", 2, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a4)
      *a4 = 0;
    -[_LTOfflineAssetManager getEndpointerAssetWithType:error:](self, "getEndpointerAssetWithType:error:", 3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[_LTHybridEndpointerAssetInfo initWithAvailableAssets:context:]([_LTHybridEndpointerAssetInfo alloc], "initWithAvailableAssets:context:", v7, v6);

  return v8;
}

+ (id)fallBackAssetResourcePath
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Fallback asset resource path : %{public}@", (uint8_t *)&v8, 0xCu);

  }
  return v3;
}

- (id)languageDetectorAssetWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  _LTLanguageDetectorAssetInfo *v6;

  +[_LTOfflineAssetManager fallBackAssetResourcePath](_LTOfflineAssetManager, "fallBackAssetResourcePath", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("LanguageDetectorDefaultAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("featureCombinationLID.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {

    v5 = 0;
  }
  v6 = -[_LTLanguageDetectorAssetInfo initWithAssetUrl:featureCombinationAssetUrl:]([_LTLanguageDetectorAssetInfo alloc], "initWithAssetUrl:featureCombinationAssetUrl:", v4, v5);

  return v6;
}

- (void)assetSize:(id)a3
{
  void (**v3)(id, _QWORD, id);
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void (**v27)(id, _QWORD, id);
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD, id))a3;
  v42 = 0;
  +[_LTDConfigurationService assetConfigurationWithError:](_LTDConfigurationService, "assetConfigurationWithError:", &v42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v42;
  if (v5)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[_LTOfflineAssetManager assetDirectory].cold.2();
      if (!v3)
        goto LABEL_32;
      goto LABEL_4;
    }
    if (v3)
LABEL_4:
      v3[2](v3, 0, v5);
  }
  else
  {
    v27 = v3;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "currentSpeechTranslationAssetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v7;
    v26 = v4;
    objc_msgSend(v4, "currentEndpointAssetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    v10 = 0;
    if (v30)
    {
      v29 = *(_QWORD *)v39;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11);
          v37 = 0;
          +[_LTDAssetService queryAssetType:filter:error:](_LTDAssetService, "queryAssetType:filter:error:", v12, 2, &v37);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          v15 = v14;
          if (!v13)
          {
            v25 = _LTOSLogAssets();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v15;
              _os_log_impl(&dword_2491B9000, v25, OS_LOG_TYPE_INFO, "Asset size calculation failure: %@", buf, 0xCu);
            }
            v3 = v27;
            v27[2](v27, 0, v15);

            goto LABEL_31;
          }
          v31 = v11;
          v32 = v14;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v16 = v13;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                if (objc_msgSend(v21, "unarchivedSize") && objc_msgSend(v21, "unarchivedSize") > 0)
                {
                  v10 += objc_msgSend(v21, "unarchivedSize");
                }
                else
                {
                  v22 = _LTOSLogAssets();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v45 = v21;
                    _os_log_impl(&dword_2491B9000, v22, OS_LOG_TYPE_INFO, "Asset unarchive size is nil or less than 1: %@", buf, 0xCu);
                  }
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v18);
          }

          v11 = v31 + 1;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v30)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _LTOSLogAssets();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v23;
      _os_log_impl(&dword_2491B9000, v24, OS_LOG_TYPE_INFO, "Asset size calculated as %{public}@", buf, 0xCu);
    }
    v3 = v27;
    ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

LABEL_31:
    v5 = 0;
    v4 = v26;
  }
LABEL_32:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotfixMgr, 0);
}

- (void)_queryLanguagePairStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read asset catalogs for language pair status query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_queryLanguagePairStatusWithCompletion:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "missing mt_app.offline.plist", v1, 2u);
}

+ (void)assetDirectory
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

- (void)_assetIdentifiersForLanguagePairDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to deserialize JSON at path '%{public}@' error %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)assetIdentifierReferenceCountDictionary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to get language pair asset directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)purgeAssetForLanguagePair:userInitiated:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to purge assets for language pair %{public}@: unable to get asset info: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)purgeAllAssetsExcludingConfig:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed asset query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)purgeAllAssetsExcludingConfig:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to delete asset link directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)updateAllAssets:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read offline configuration for asset update %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)updateAllAssets:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read asset catalogs for asset update %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)updateSpeechTranslationAssetSymLinks:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read asset catalogs for symlink update: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)speechTranslationAssetInfoForLocalePair:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Can't get speech asset info for pair %{public}@ because we couldn't get asset info; it may be unsupported: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)speechTranslationAssetInfoForLocalePair:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Can't get speech asset info for pair %{public}@ because we don't have a complete bi-directional model: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read mt_app.offline.plist for asset pair %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to generate asset info for asset pair %@: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read asset catalog for asset pair %@: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to read offline configuration for asset pair %@: %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Error getting asset info for pair %{public}@; %@");
  OUTLINED_FUNCTION_1_2();
}

- (void)getEndpointerAssetWithType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to query endpointer assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)getEndpointerAssetWithType:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read endpointer config: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
