@implementation UAFPreinstalledAssetsCache

+ (BOOL)isEnabled
{
  _BOOL4 v2;

  v2 = +[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall");
  if (v2)
    LOBYTE(v2) = +[UAFConfiguration assetRootSupported](UAFConfiguration, "assetRootSupported");
  return v2;
}

+ (void)initCache:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_2);
  v4 = (id)qword_2540B1C28;
  objc_sync_enter(v4);
  v5 = qword_2540B1C28;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = qword_2540B1C18;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__UAFPreinstalledAssetsCache_initCache___block_invoke_2;
    v13[3] = &unk_24F1F6F88;
    v10 = v7;
    v14 = v10;
    +[UAFAssetSetObserver listenForUAFNotificationsForAssetSet:forRoot:queue:updateHandler:](UAFAssetSetObserver, "listenForUAFNotificationsForAssetSet:forRoot:queue:updateHandler:", v8, 1, v9, v13);

    v11 = (void *)qword_2540B1C28;
    objc_msgSend(v3, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  objc_sync_exit(v4);

}

void __40__UAFPreinstalledAssetsCache_initCache___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = dispatch_queue_create("com.apple.UnifiedAssetFramework.assetcache", 0);
  v1 = (void *)qword_2540B1C18;
  qword_2540B1C18 = (uint64_t)v0;

  v2 = (void *)qword_2540B1C20;
  qword_2540B1C20 = MEMORY[0x24BDBD1B8];

  v3 = objc_opt_new();
  v4 = (void *)qword_2540B1C28;
  qword_2540B1C28 = v3;

}

uint64_t __40__UAFPreinstalledAssetsCache_initCache___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[UAFPreinstalledAssetsCache initCache:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Invalidating preinstalled asset cache due to root installation for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  return +[UAFPreinstalledAssetsCache invalidateCache](UAFPreinstalledAssetsCache, "invalidateCache");
}

+ (void)invalidateCache
{
  void *v2;
  void *v3;

  v2 = (void *)qword_2540B1C30;
  qword_2540B1C30 = 0;

  v3 = (void *)qword_2540B1C38;
  qword_2540B1C38 = 0;

}

+ (id)assetSpecifier:(id)a3 assetSetConfiguration:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "autoAssetType");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (+[UAFPreinstalledAssetsCache isEnabled](UAFPreinstalledAssetsCache, "isEnabled"))
    {
      +[UAFPreinstalledAssetsCache initCache:](UAFPreinstalledAssetsCache, "initCache:", v6);
      objc_msgSend(v6, "autoAssetType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__0;
      v20 = __Block_byref_object_dispose__0;
      v21 = 0;
      v9 = qword_2540B1C18;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__UAFPreinstalledAssetsCache_assetSpecifier_assetSetConfiguration___block_invoke;
      block[3] = &unk_24F1F78B0;
      v13 = v8;
      v15 = &v16;
      v14 = v5;
      v10 = v8;
      dispatch_sync(v9, block);
      v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

void __67__UAFPreinstalledAssetsCache_assetSpecifier_assetSetConfiguration___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)qword_2540B1C30;
  if (!qword_2540B1C30)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_2540B1C30;
    qword_2540B1C30 = v3;

    v2 = (void *)qword_2540B1C30;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_8;
  if (+[UAFPreinstalledAssetsCache checkForAssetTypePath:](UAFPreinstalledAssetsCache, "checkForAssetTypePath:", a1[4]))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v15 = 136315394;
      v16 = "+[UAFPreinstalledAssetsCache assetSpecifier:assetSetConfiguration:]_block_invoke";
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Querying for %{public}@", (uint8_t *)&v15, 0x16u);
    }

    +[UAFPreinstalledAssetsCache queryAssetType:](UAFPreinstalledAssetsCache, "queryAssetType:", a1[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_2540B1C30, "setObject:forKeyedSubscript:", v8, a1[4]);

LABEL_8:
    objc_msgSend((id)qword_2540B1C30, "objectForKeyedSubscript:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", a1[5]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    return;
  }
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

+ (BOOL)checkForAssetTypePath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  __int128 v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;
  uint8_t v61[32];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)qword_2540B1C38;
  if (!qword_2540B1C38)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_2540B1C38;
    qword_2540B1C38 = v5;

    v4 = (void *)qword_2540B1C38;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0x24F1F6000uLL;
    +[UAFCommonUtilities getMAPath:](UAFCommonUtilities, "getMAPath:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    +[UAFCommonUtilities getMAPath:](UAFCommonUtilities, "getMAPath:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = v11;
    v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (v42)
    {
      v40 = *(_QWORD *)v50;
      v37 = *MEMORY[0x24BDBCCD0];
      *(_QWORD *)&v16 = 136315394;
      v36 = v16;
      v38 = v15;
      v39 = v10;
      do
      {
        v17 = 0;
        v18 = v40;
        do
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v17), "stringByAppendingPathComponent:", v10, v36);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v62 = 0u;
          memset(v61, 0, sizeof(v61));
          if (!objc_msgSend(*(id *)(v12 + 1424), "stat:withBuf:error:", v19, v61, 0))
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v37;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = MEMORY[0x24BDAC760];
            v47[1] = 3221225472;
            v47[2] = __52__UAFPreinstalledAssetsCache_checkForAssetTypePath___block_invoke;
            v47[3] = &unk_24F1F78D8;
            v41 = v19;
            v48 = v41;
            objc_msgSend(v20, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, v22, 1, v47);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v44;
              while (2)
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v44 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "path");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "hasSuffix:", CFSTR(".asset"));

                  if (v30)
                  {
                    UAFGetLogCategory((id *)&UAFLogContextClient);
                    v34 = objc_claimAutoreleasedReturnValue();
                    v10 = v39;
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315650;
                      v54 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
                      v55 = 2114;
                      v56 = v3;
                      v57 = 2114;
                      v58 = v41;
                      _os_log_impl(&dword_229282000, v34, OS_LOG_TYPE_INFO, "%s Root for asset type %{public}@ found at %{public}@", buf, 0x20u);
                    }

                    objc_msgSend((id)qword_2540B1C38, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v3);
                    v15 = v38;

                    v9 = 1;
                    v8 = 0;
                    goto LABEL_31;
                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
                if (v26)
                  continue;
                break;
              }
            }

            UAFGetLogCategory((id *)&UAFLogContextClient);
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              v54 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
              v55 = 2112;
              v56 = v41;
              _os_log_impl(&dword_229282000, v31, OS_LOG_TYPE_INFO, "%s %@ exists but does not contain any assets", buf, 0x16u);
            }

            v15 = v38;
            v10 = v39;
            v12 = 0x24F1F6000;
            v18 = v40;
          }

          ++v17;
        }
        while (v17 != v42);
        v32 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
        v8 = 0;
        v42 = v32;
      }
      while (v32);
    }

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v61 = 136315394;
      *(_QWORD *)&v61[4] = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
      *(_WORD *)&v61[12] = 2114;
      *(_QWORD *)&v61[14] = v3;
      _os_log_impl(&dword_229282000, v33, OS_LOG_TYPE_INFO, "%s No root asset type path found for %{public}@", v61, 0x16u);
    }

    objc_msgSend((id)qword_2540B1C38, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v3);
    v9 = 0;
LABEL_31:

  }
  return v9;
}

uint64_t __52__UAFPreinstalledAssetsCache_checkForAssetTypePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 136315906;
    v11 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]_block_invoke";
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_INFO, "%s Error encountered while enumerating contents of %@.  URL: %@, error: %@", (uint8_t *)&v10, 0x2Au);
  }

  return 0;
}

+ (id)queryAssetType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", v3);
  v5 = v4;
  if (!v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Error creating MAAssetQuery for asset type %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  objc_msgSend(v4, "returnTypes:", 3);
  objc_msgSend(v5, "setDoNotBlockOnNetworkStatus:", 1);
  objc_msgSend(v5, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("isRoot"), CFSTR("1"));
  v6 = objc_msgSend(v5, "queryMetaDataSync");
  if (v6)
  {
    v7 = v6;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
      v18 = 2112;
      v19 = v3;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s MA query for %@ failed with result: %ld", buf, 0x20u);
    }
LABEL_7:

    v9 = (id)qword_2540B1C20;
    goto LABEL_14;
  }
  objc_msgSend(v5, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
    v18 = 2114;
    v19 = v3;
    v20 = 1024;
    LODWORD(v21) = objc_msgSend(v10, "count");
    _os_log_debug_impl(&dword_229282000, v11, OS_LOG_TYPE_DEBUG, "%s Query for %{public}@ returned %d assets", buf, 0x1Cu);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __45__UAFPreinstalledAssetsCache_queryAssetType___block_invoke;
    v14[3] = &unk_24F1F7900;
    v9 = v12;
    v15 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  }
  else
  {
    v9 = (id)qword_2540B1C20;
  }

LABEL_14:
  return v9;
}

void __45__UAFPreinstalledAssetsCache_queryAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "assetProperty:", CFSTR("AssetSpecifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315394;
      v7 = "+[UAFPreinstalledAssetsCache queryAssetType:]_block_invoke";
      v8 = 2114;
      v9 = v3;
      _os_log_debug_impl(&dword_229282000, v5, OS_LOG_TYPE_DEBUG, "%s MAAsset without specifier: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

+ (id)assetSpecifiersFromRoots:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  objc_msgSend(v3, "autoAssetType");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (+[UAFPreinstalledAssetsCache isEnabled](UAFPreinstalledAssetsCache, "isEnabled"))
    {
      +[UAFPreinstalledAssetsCache initCache:](UAFPreinstalledAssetsCache, "initCache:", v3);
      objc_msgSend(v3, "autoAssetType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__0;
      v16 = __Block_byref_object_dispose__0;
      v17 = 0;
      v6 = qword_2540B1C18;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __55__UAFPreinstalledAssetsCache_assetSpecifiersFromRoots___block_invoke;
      v9[3] = &unk_24F1F7118;
      v10 = v5;
      v11 = &v12;
      v7 = v5;
      dispatch_sync(v6, v9);
      v4 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

void __55__UAFPreinstalledAssetsCache_assetSpecifiersFromRoots___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)qword_2540B1C30;
  if (!qword_2540B1C30)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_2540B1C30;
    qword_2540B1C30 = v3;

    v2 = (void *)qword_2540B1C30;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_6;
  if (+[UAFPreinstalledAssetsCache checkForAssetTypePath:](UAFPreinstalledAssetsCache, "checkForAssetTypePath:", *(_QWORD *)(a1 + 32)))
  {
    +[UAFPreinstalledAssetsCache queryAssetType:](UAFPreinstalledAssetsCache, "queryAssetType:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_2540B1C30, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));

LABEL_6:
    objc_msgSend((id)qword_2540B1C30, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    return;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "+[UAFPreinstalledAssetsCache assetSpecifiersFromRoots:]_block_invoke";
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_INFO, "%s No root asset type path found for %{public}@", buf, 0x16u);
  }

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

@end
