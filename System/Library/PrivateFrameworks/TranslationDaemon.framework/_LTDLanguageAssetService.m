@implementation _LTDLanguageAssetService

+ (unint64_t)_languageAssetFilterFromOptions:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((a3 & 0x40) != 0)
  {
    if ((a3 & 0x30) != 0)
    {
      v4 = _LTOSLogAssets();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[_LTDLanguageAssetService _languageAssetFilterFromOptions:].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    return 64;
  }
  else if ((a3 & 0x20) != 0)
  {
    if ((a3 & 0x10) != 0)
    {
      v12 = _LTOSLogAssets();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[_LTDLanguageAssetService _languageAssetFilterFromOptions:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 32;
  }
  else
  {
    return 16;
  }
}

+ (id)_languageAssetFilterDescription:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR(".available");
  if (a3 == 32)
    v3 = CFSTR(".selected");
  if (a3 == 64)
    return CFSTR(".installed");
  else
    return (id)v3;
}

+ (void)assetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = objc_msgSend(a1, "_languageAssetFilterFromOptions:", a3);
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[_LTDLanguageAssetService assetsWithOptions:completion:].cold.2(v8, a1, v7);
  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetsFilteredUsing:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      +[_LTDLanguageAssetService assetsWithOptions:completion:].cold.1(v11);
      if (!v6)
        goto LABEL_12;
      goto LABEL_6;
    }
    if (v6)
LABEL_6:
      v6[2](v6, v10, 0);
  }
  else if (v7 == 32)
  {
    objc_msgSend(a1, "_selectedAssetsWithCompletion:", v6);
  }
  else if (v7 == 64)
  {
    objc_msgSend(a1, "_installedAssetsWithCompletion:", v6);
  }
  else
  {
    objc_msgSend(a1, "_availableAssetsWithCompletion:", v6);
  }
LABEL_12:

}

+ (id)queue
{
  if (queue_onceToken_0 != -1)
    dispatch_once(&queue_onceToken_0, &__block_literal_global_9);
  return (id)queue__queue_0;
}

+ (void)_availableAssetsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke;
  v6[3] = &unk_251A11DF0;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  +[_LTDConfigurationService offlineConfigurationWithCompletion:](_LTDConfigurationService, "offlineConfigurationWithCompletion:", v6);

}

+ (void)_selectedAssetsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___LTDLanguageAssetService__selectedAssetsWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (void)_installedAssetsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "selectedLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke;
  v8[3] = &unk_251A11E40;
  v10 = v4;
  v11 = a1;
  v9 = v5;
  v6 = v5;
  v7 = v4;
  +[_LTDAssetService assetsForLocales:includeTTS:completion:](_LTDAssetService, "assetsForLocales:includeTTS:completion:", v6, 0, v8);

}

+ (id)_supportedLocalesWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*a3)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_LTDLanguageAssetService _supportedLocalesWithError:].cold.1((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "languageIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_ltCompactMap:", &__block_literal_global_14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)_complementaryLocaleIfMissingForAssets:(id)a3 preferredComplements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") == 1
    && (objc_msgSend(a1, "selectedLocales"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        !v9))
  {
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    objc_msgSend(a1, "_supportedLocalesWithError:", &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (v15)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[_LTDLanguageAssetService _complementaryLocaleIfMissingForAssets:preferredComplements:].cold.1();
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v7, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        _LTPreferencesAdditionalLikelyPreferredLocales(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v18, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }

      }
      objc_msgSend(v17, "_ltLocaleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v13, "_ltLocaleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v19);

        if (v21)
          v22 = 0;
        else
          v22 = v17;
        v10 = v22;
      }
      else
      {
        v23 = _LTOSLogAssets();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v7;
          _os_log_impl(&dword_2491B9000, v23, OS_LOG_TYPE_INFO, "Failed to locate a supported complement for %{public}@", buf, 0xCu);
        }
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)setAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  unint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _LTOSLogAssets();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v10;
    _os_log_impl(&dword_2491B9000, v13, OS_LOG_TYPE_INFO, "Language asset service received install request: %{public}@", buf, 0xCu);
  }
  v40 = a1;
  objc_msgSend(a1, "_complementaryLocaleIfMissingForAssets:preferredComplements:", v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v10, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ltIdentifier");
      v18 = a4;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_ltLocaleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v19;
      v54 = 2114;
      v55 = v20;
      _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_DEFAULT, "Request only downloads %{public}@, downloading complement %{public}@ to ensure a bi-directional pair", buf, 0x16u);

      a4 = v18;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E0]), "initWithLocale:state:", v14, 1);
    objc_msgSend(v10, "arrayByAddingObject:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v22;
  }
  v23 = v10;
  v24 = v23;
  v39 = a4;
  if ((a4 & 8) == 0)
  {
    v37 = v12;
    v38 = v11;
    objc_msgSend(v40, "_selectedAssets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v27 = v23;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v48 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v32, "progress");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "offlineState");

          if (v34)
            objc_msgSend(v26, "addObject:", v32);
          else
            objc_msgSend(v26, "removeObject:", v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v29);
    }

    objc_msgSend(v26, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v37;
    v11 = v38;
  }
  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "preheatWithLanguages:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "markReadyForFilter:", 32);
  if (objc_msgSend(v36, "count"))
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke;
    v41[3] = &unk_251A11ED0;
    v43 = v12;
    v42 = v35;
    v45 = v40;
    v46 = v39;
    v44 = v11;
    +[_LTDAssetService assetsForLocales:includeTTS:completion:](_LTDAssetService, "assetsForLocales:includeTTS:completion:", v36, 1, v41);

  }
  else
  {
    objc_msgSend(v35, "setRequiredAssets:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v40, "_purgeUnusedAssetsWithCompletion:", 0);
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

+ (void)setInstalledLocales:(id)a3 useCellular:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _BOOL4 v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v23 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "_ltLocaleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetForIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "progress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setGreaterThanOrEqualToOfflineState:", 1);

        objc_msgSend(v12, "addObject:", v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v26 = v10;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke;
  v27[3] = &unk_251A11EF8;
  v28 = v9;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2;
  v25[3] = &unk_251A112E0;
  v21 = v10;
  v22 = v9;
  objc_msgSend(a1, "setAssets:options:progress:completion:", v12, v23 | 0xALL, v27, v25);

}

+ (BOOL)onDeviceModeSupported
{
  return 1;
}

+ (void)syncInstalledLocales
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  if (objc_msgSend(a1, "onDeviceModeSupported"))
  {
    v3 = dispatch_time(0, 5000000000);
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_after(v3, v4, block);

  }
}

+ (void)_purgeUnusedAssetsWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke;
  v5[3] = &unk_251A115E8;
  v6 = v3;
  v4 = v3;
  +[_LTDAssetService installedAssetsWithCompletion:](_LTDAssetService, "installedAssetsWithCompletion:", v5);

}

+ (void)setSelectedLocales:(id)a3
{
  _LTPreferencesSetInstalledLocales(a3);
}

+ (NSArray)selectedLocales
{
  void *v2;
  void *v3;

  _LTPreferencesInstalledLocales();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ltCompactMap:", &__block_literal_global_30_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (NSSet)_selectedIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _LTPreferencesInstalledLocales();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lt_localeIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

+ (id)_selectedAssets
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

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_selectedIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2;
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
        objc_msgSend(v4, "assetForIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

+ (void)_preheatMissingCacheStatesAfter:(int64_t)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = dispatch_time(0, 1000000000 * a3);
  objc_msgSend(a1, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a1;
  v7[5] = a3;
  dispatch_after(v5, v6, v7);

}

+ (void)startLanguageStatusSession:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5 observations:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = _LTOSLogAssets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    objc_msgSend(v12, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v17;
    _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Start language status session %{public}@", buf, 0xCu);

  }
  objc_msgSend(a1, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __104___LTDLanguageAssetService_startLanguageStatusSession_observationType_progress_observations_completion___block_invoke;
  v22[3] = &unk_251A11FF0;
  v28 = a5;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = a4;
  v27 = a1;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_async(v18, v22);

}

+ (void)cancelLanguageStatusSession:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Cancel language status session %{public}@", buf, 0xCu);

  }
  objc_msgSend(a1, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___LTDLanguageAssetService_cancelLanguageStatusSession___block_invoke;
  block[3] = &unk_251A11A70;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, block);

}

+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v10 = 0;
  objc_msgSend(a1, "_languageModelsForLocales:initialState:error:", a3, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_LTDLanguageAssetService addLanguages:useCellular:].cold.1();
  }
  else
  {
    if (v4)
      v9 = 3;
    else
      v9 = 2;
    objc_msgSend(a1, "setAssets:options:progress:completion:", v6, v9, 0, 0);
  }

}

+ (void)removeLanguages:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "_languageModelsForLocales:initialState:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_LTDLanguageAssetService removeLanguages:].cold.1();
  }
  else
  {
    objc_msgSend(a1, "setAssets:options:progress:completion:", v4, 2, 0, 0);
  }

}

+ (id)_languageModelsForLocales:(id)a3 initialState:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  int64_t v26;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(a1, "_supportedLocalesWithError:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (*a5)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v9, "_ltCompactMap:", &__block_literal_global_40);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke_2;
      v24 = &unk_251A12058;
      v14 = v13;
      v25 = v14;
      v26 = a4;
      objc_msgSend(v8, "_ltCompactMap:", &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count", v21, v22, v23, v24))
      {
        v11 = (void *)objc_msgSend(v15, "copy");
      }
      else
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v8, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lt_unsupportedLanguageError:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_retainAutorelease(v18);
        *a5 = v19;

        v11 = 0;
      }

    }
  }
  else if (*a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "lt_unsupportedLanguageError:", 0);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)_languageAssetFilterFromOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Asset options contains multiple filter options including selected, will only use selected", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

+ (void)_languageAssetFilterFromOptions:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Asset options contains multiple filter options including installed, will only use installed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

+ (void)assetsWithOptions:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Language asset service using cached asset list", v1, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)assetsWithOptions:(uint64_t)a3 completion:.cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v5 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "_languageAssetFilterDescription:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v5, v7, "Language asset service received state request with filter %{public}@", v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)_supportedLocalesWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to read offline configuration for supported locales %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_complementaryLocaleIfMissingForAssets:preferredComplements:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read supported locales for system locale complement %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)addLanguages:useCellular:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Add languages failure %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)removeLanguages:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Remove languages failure %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
