@implementation LTOfflineAssetManager

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_cold_1();
  }
  else
  {
    if ((objc_msgSend(v5, "isInstalled") & 1) == 0 && (objc_msgSend(v5, "isDownloading") & 1) == 0)
    {
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Refreshing config asset", buf, 2u);
      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3;
      v14[3] = &unk_251A11878;
      v16 = *(id *)(a1 + 40);
      v15 = v5;
      +[_LTDAssetService downloadAsset:options:progress:completion:](_LTDAssetService, "downloadAsset:options:progress:completion:", v15, 2, 0, v14);

      v9 = v16;
      goto LABEL_13;
    }
    if (+[_LTDAssetService needsCatalogRefresh](_LTDAssetService, "needsCatalogRefresh"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5;
      v12[3] = &unk_251A112E0;
      v8 = *(void **)(a1 + 32);
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v8, "updateAllAssets:", v12);
      v9 = v13;
LABEL_13:

      goto LABEL_14;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = _LTOSLogAssets();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEFAULT, "Finished refreshing config asset", v7, 2u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, objc_msgSend(*(id *)(a1 + 32), "isInstalled"));

}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = _LTOSLogAssets();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Finished updating all assets", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[5];
  id v5;

  if (_block_invoke_performingRefresh == 1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    _block_invoke_performingRefresh = 1;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_2;
    v4[3] = &unk_251A11828;
    v3 = *(id *)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    +[_LTDAssetService refreshCatalogIfNeededWithCompletion:](_LTDAssetService, "refreshCatalogIfNeededWithCompletion:", v4);

  }
}

void __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_3;
    v8[3] = &unk_251A12A70;
    v6 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_refreshAllAssets:", v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    _block_invoke_performingRefresh = 0;
  }

}

uint64_t __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  _block_invoke_performingRefresh = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v11 = 0;
  objc_msgSend(v3, "_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:", a2, v2, v4, v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16_cold_1();
  }
  objc_msgSend(v6, "availabilityInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __49___LTOfflineAssetManager_deleteAsset_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Asset purge finished", v7, 2u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);

}

uint64_t __48___LTOfflineAssetManager_offlineLanguageStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryLanguagePairStatusWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __50___LTOfflineAssetManager__removeOldAssetDirectory__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  __int128 v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  id v17;
  char v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((_removeOldAssetDirectory_removed & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LTDAssetService assetDirectoryURL](_LTDAssetService, "assetDirectoryURL");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[_LTDConfigurationService assetConfigurationWithError:](_LTDConfigurationService, "assetConfigurationWithError:", &v19);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v19;
    if (v3)
    {
      v4 = v3;
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[_LTOfflineAssetManager removeObsoleteAssets].cold.1();
    }
    else
    {
      objc_msgSend(v2, "assetDirectoryNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v6, "count") < 2 || objc_msgSend(v6, "count") == 1)
      {
        v4 = 0;
      }
      else
      {
        v8 = 0;
        v9 = 0;
        *(_QWORD *)&v7 = 138412290;
        v16 = v7;
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v9, v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "URLByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          objc_msgSend(v11, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v0, "fileExistsAtPath:isDirectory:", v12, &v18);

          if (v13 && v18)
          {
            objc_msgSend(v11, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v8;
            objc_msgSend(v0, "removeItemAtPath:error:", v14, &v17);
            v4 = v17;

            if (v4)
            {
              v15 = _LTOSLogAssets();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v16;
                v21 = v4;
                _os_log_error_impl(&dword_2491B9000, v15, OS_LOG_TYPE_ERROR, "Failed to remove old asset directory %@", buf, 0xCu);
              }
            }
          }
          else
          {
            v4 = v8;
          }

          ++v9;
          v8 = v4;
        }
        while (v9 < objc_msgSend(v6, "count") - 1);
      }
      _removeOldAssetDirectory_removed = 1;

    }
  }
}

uint64_t __77___LTOfflineAssetManager_purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = _queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3;
  v6[3] = &unk_251A12770;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t result;

  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_cold_1();
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *v2);
  return result;
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = _queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_29;
  block[3] = &unk_251A12B70;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_29(uint64_t a1)
{
  NSObject *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_29_cold_1();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];

  v2 = a1 + 40;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = _LTOSLogAssets();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_30_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEFAULT, "All assets purged successfully", v7, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40));
  return result;
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_cold_1();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_31;
    v7[3] = &unk_251A11290;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "deleteAsset:completion:", v5, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_31_cold_1();
  }

}

uint64_t __42___LTOfflineAssetManager_updateAllAssets___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  id obj;
  void *v45;
  void *v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  _QWORD v52[4];
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  uint8_t buf[16];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "----------------------------- Determine pairs to update ------------------------------------ ", buf, 2u);
  }
  v67 = 0;
  +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v67);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v67;
  if (v4)
  {
    v5 = v4;
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_LTOfflineAssetManager updateAllAssets:].cold.1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(v3, "languagePairs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "debugDumpAssets:", *(_QWORD *)(a1 + 40));
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v13 = v10;
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x24BDF6410], "pairWithIdentifiers:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1 + 40);
          v15 = *(_QWORD *)(a1 + 48);
          v17 = *(void **)(a1 + 32);
          v62 = v10;
          objc_msgSend(v17, "_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:", v14, v15, v16, v3, &v62);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v62;

          objc_msgSend(v18, "availabilityInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v14);
          if (objc_msgSend(v19, "needsUpdate"))
            objc_msgSend(v45, "addObject:", v14);
          if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v14)
            && objc_msgSend(v19, "pairState") != 2)
          {
            objc_msgSend(v45, "addObject:", v14);
            objc_msgSend(v42, "addObject:", v18);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v20 = _LTOSLogAssets();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v20, OS_LOG_TYPE_INFO, "----------------------------- Assets to download ------------------------------------ ", buf, 2u);
    }
    v40 = v10;
    v41 = v3;
    v21 = dispatch_group_create();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v22 = *(id *)(a1 + 48);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v59 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          if ((objc_msgSend(v27, "isConfig", v40, v41) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "_updateAsset:catalogAssets:downloadGroup:completion:", v27, *(_QWORD *)(a1 + 40), v21, &__block_literal_global_33_0);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v24);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v28 = v42;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          dispatch_group_enter(v21);
          v34 = _queue;
          v52[0] = MEMORY[0x24BDAC760];
          v52[1] = 3221225472;
          v52[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_34;
          v52[3] = &unk_251A11290;
          v53 = v21;
          objc_msgSend(v33, "downloadAssetsUserInitiated:queue:completion:", 0, v34, v52);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      }
      while (v30);
    }
    v35 = v28;

    v36 = _queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_35;
    block[3] = &unk_251A12C50;
    v48 = v45;
    v49 = v46;
    v43 = *(_OWORD *)(a1 + 64);
    v50 = *(_QWORD *)(a1 + 32);
    v37 = (id)v43;
    v51 = v43;
    v38 = v46;
    v39 = v45;
    dispatch_group_notify(v21, v36, block);

    v5 = v40;
    v3 = v41;
  }

}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_34_cold_1();
  }

}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_35(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Config asset updated", v6, 2u);
    }
    v4 = *(id *)(a1 + 40);

    v2 = v4;
  }
  objc_msgSend(*(id *)(a1 + 48), "updateSpeechTranslationAssetSymLinks:", v2);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sourceLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  +[_LTDAssetService matchingASRAssetForLocale:error:](_LTDAssetService, "matchingASRAssetForLocale:error:", v2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v4)
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  if (objc_msgSend(v3, "isInstalled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Starting download for passthrough asset with attributes: %{public}@", buf, 0xCu);
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_37;
    v7[3] = &unk_251A12748;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    +[_LTDAssetService downloadAsset:options:progress:completion:](_LTDAssetService, "downloadAsset:options:progress:completion:", v3, 2, 0, v7);

  }
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_37_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2;
  v5[3] = &unk_251A12CC8;
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v7 = v2;
  v5[4] = v3;
  v6 = v4;
  v8 = *(_BYTE *)(a1 + 56);
  +[_LTDAssetService configAssetWithCompletion:](_LTDAssetService, "configAssetWithCompletion:", v5);

}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5 && (objc_msgSend(v5, "isInstalled") & 1) != 0)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v26 = 0;
      objc_msgSend(v10, "_speechTranslationAssetInfoForLocalePair:error:", v11, &v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v26;
      if (!v7)
      {
        v13 = *(unsigned __int8 *)(a1 + 56);
        v14 = _queue;
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_46;
        v24[3] = &unk_251A12748;
        v24[4] = *(_QWORD *)(a1 + 32);
        v25 = *(id *)(a1 + 48);
        objc_msgSend(v12, "downloadAssetsUserInitiated:queue:completion:", v13, v14, v24);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDF6530];
      v27[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONFIGURATION_ASSET_MISSING_ERROR_DESCRIPTION"), &stru_251A15610, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v27[1] = *MEMORY[0x24BDD0FD8];
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONFIGURATION_ASSET_MISSING_ERROR_DESCRIPTION_REASON"), &stru_251A15610, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 5, v21);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1();
    }
    v23 = *(_QWORD *)(a1 + 48);
    if (v23)
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v7);
    goto LABEL_14;
  }
  v7 = v6;
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1();
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
LABEL_15:

}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "assetIdentifierReferenceCountDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Reference counts after download %@", (uint8_t *)&v8, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error reading config asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error refreshing config asset %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failure updating all assets %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error creating speechTranslationAssetInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to delete hotfix file when trying to purge all assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to delete hotfix when purging assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "At least one asset failed to purge: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error downloading asset update %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error deleting asset during asset update %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error downloading assets during update: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to find matching ASR asset for download of pair %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_37_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Failed to download asset for ASR-only download of pair %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error downloading offline assets %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
