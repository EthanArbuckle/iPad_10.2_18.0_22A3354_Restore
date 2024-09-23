@implementation LTDLanguageAssetService

void __33___LTDLanguageAssetService_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translationd.LanguageAssetService", 0);
  v1 = (void *)queue__queue_0;
  queue__queue_0 = (uint64_t)v0;

}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2;
  block[3] = &unk_251A11DC8;
  v12 = v6;
  v8 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "languageIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v10, "assetForIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17), (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    objc_msgSend(v10, "markReadyForFilter:", 16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __58___LTDLanguageAssetService__selectedAssetsWithCompletion___block_invoke(uint64_t a1)
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
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_selectedIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
        objc_msgSend(v2, "assetForIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "progress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setGreaterThanOrEqualToOfflineState:", 1);

        objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v2, "markReadyForFilter:", 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[6], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2;
  v10[3] = &unk_251A11E18;
  v11 = v6;
  v14 = a1[5];
  v12 = a1[4];
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  unint64_t v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v53 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "_ltLocaleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "assetForIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "ltIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v14);
    }
    v38 = v10;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = *(id *)(a1 + 48);
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v49 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "assetType");
          v26 = v25 > 7 || ((1 << v25) & 0xC4) == 0;
          if (!v26 && (objc_msgSend(v24, "isInstalled") & 1) == 0)
          {
            objc_msgSend(v24, "localeIdentifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v45;
              do
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v45 != v30)
                    objc_enumerationMutation(v27);
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k));
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
              }
              while (v29);
            }

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v21);
    }

    objc_msgSend(v11, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v41;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * m), "progress");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setGreaterThanOrEqualToOfflineState:", 2);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      }
      while (v34);
    }
    objc_msgSend(v38, "markReadyForFilter:", 64);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __55___LTDLanguageAssetService__supportedLocalesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a2);
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_cold_1();
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequiredAssets:", v5);
    objc_msgSend(*(id *)(a1 + 56), "_purgeUnusedAssetsWithCompletion:", 0);
    v9 = MEMORY[0x24BDAC760];
    v10 = *(_QWORD *)(a1 + 64);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_17;
    v13[3] = &unk_251A11EA8;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_21;
    v11[3] = &unk_251A112E0;
    v12 = *(id *)(a1 + 40);
    +[_LTDAssetService downloadAssets:options:progress:completion:](_LTDAssetService, "downloadAssets:options:progress:completion:", v5, v10, v13, v11);

  }
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "applyProgressUpdateForAsset:") & 1) == 0)
    +[_LTDAssetService purgeAsset:completion:](_LTDAssetService, "purgeAsset:completion:", v5, &__block_literal_global_19);
  if (*(_QWORD *)(a1 + 40))
  {
    +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetsFilteredUsing:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  v6 = _LTOSLogAssets();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(v7, v4);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(v7, v4);
  }

}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_21_cold_1();
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "installationStatus", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2_cold_1();
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v10 = 0;
  +[_LTDConfigurationService configurationForType:error:](_LTDConfigurationService, "configurationForType:error:", 0, &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DisableSyncInstalledLocalesOnLaunch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DisableSyncInstalledLocalesOnLaunch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke_2;
    v9[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
    v9[4] = v8;
    objc_msgSend(v8, "assetsWithOptions:completion:", 32, v9);
  }

}

void __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setAssets:options:progress:completion:", v3, 8, 0, 0);

}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_cold_1();
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
  else
  {
    v17 = a1;
    +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v9, "applyProgressUpdateForAsset:", v15) & 1) == 0)
            +[_LTDAssetService purgeAsset:completion:](_LTDAssetService, "purgeAsset:completion:", v15, &__block_literal_global_29);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = *(_QWORD *)(v17 + 32);
    if (v16)
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);

  }
}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  v6 = _LTOSLogAssets();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(v7, v4);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(v7, v4);
  }

}

uint64_t __43___LTDLanguageAssetService_selectedLocales__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDBCEA0], "lt_localeWithLTIdentifier:", a2);
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[16];

  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isReadyForAllFilters") & 1) == 0 && (_block_invoke_preheating & 1) == 0)
  {
    _block_invoke_preheating = 1;
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Preheat language cache starting", buf, 2u);
    }
    v4 = dispatch_group_create();
    v5 = objc_msgSend(v2, "isReadyForFilter:", 16);
    v6 = MEMORY[0x24BDAC760];
    if ((v5 & 1) == 0)
    {
      dispatch_group_enter(v4);
      v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Preheat language cache for available state", buf, 2u);
      }
      v8 = *(void **)(a1 + 32);
      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_32;
      v25[3] = &unk_251A11F80;
      v26 = v4;
      objc_msgSend(v8, "assetsWithOptions:completion:", 16, v25);

    }
    if ((objc_msgSend(v2, "isReadyForFilter:", 32) & 1) == 0)
    {
      v9 = _LTOSLogAssets();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Preheat language cache for selected state", buf, 2u);
      }
      dispatch_group_enter(v4);
      v10 = *(void **)(a1 + 32);
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_33;
      v23[3] = &unk_251A11F80;
      v24 = v4;
      objc_msgSend(v10, "assetsWithOptions:completion:", 32, v23);

    }
    if ((objc_msgSend(v2, "isReadyForFilter:", 64) & 1) == 0)
    {
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Preheat language cache for installed state", buf, 2u);
      }
      dispatch_group_enter(v4);
      v12 = *(void **)(a1 + 32);
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_34;
      v21[3] = &unk_251A11F80;
      v22 = v4;
      objc_msgSend(v12, "assetsWithOptions:completion:", 64, v21);

    }
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_35;
    v17[3] = &unk_251A11FA8;
    v14 = v2;
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v15;
    v20 = v16;
    dispatch_group_notify(v4, v13, v17);

  }
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Language cache ready for available state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Language cache is ready for selected state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Language cache is ready for installed state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Preheat language cache completed", v4, 2u);
  }
  _block_invoke_preheating = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "isReadyForAllFilters");
  if ((result & 1) == 0 && !*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 48), "_preheatMissingCacheStatesAfter:", 10);
  return result;
}

void __104___LTDLanguageAssetService_startLanguageStatusSession_observationType_progress_observations_completion___block_invoke(uint64_t a1)
{
  _LTDLanguageAssetCacheObserver *v2;
  id v3;

  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[_LTDLanguageAssetCacheObserver initWithID:type:progress:observations:completion:]([_LTDLanguageAssetCacheObserver alloc], "initWithID:type:progress:observations:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "addObserver:", v2);
  objc_msgSend(*(id *)(a1 + 64), "_preheatMissingCacheStatesAfter:", 0);

}

void __56___LTDLanguageAssetService_cancelLanguageStatusSession___block_invoke(uint64_t a1)
{
  id v2;

  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserverForID:", *(_QWORD *)(a1 + 32));

}

uint64_t __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltLocaleIdentifier");
}

id __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E0]), "initWithLocale:state:", v3, *(_QWORD *)(a1 + 40));
  else
    v6 = 0;

  return v6;
}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Language asset service available assets read error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Language asset service installed assets read error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Language asset service dependency resolution failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, v5, "Purged unused asset %{public}@ completed", v6);

  OUTLINED_FUNCTION_9();
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_0(&dword_2491B9000, v5, v6, "Purge of unused asset %{public}@ failed %@, expected if multiple downloads are in progress", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_3();
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Language asset service install request completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Language asset service install received a language manager error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read installed assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
