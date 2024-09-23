@implementation LTDAssetService

void __25___LTDAssetService_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translationd.AssetService", 0);
  v1 = (void *)queue__queue;
  queue__queue = (uint64_t)v0;

}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
LABEL_9:
    objc_msgSend(a1[6], "_assetsSortedByVersion:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[5] + 2))();

    goto LABEL_10;
  }
  if (objc_msgSend(v6, "code") != 14
    || (objc_msgSend(v7, "domain"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("LTTranslationDaemonErrorDomain")),
        v8,
        !v9))
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_cold_1();
    (*((void (**)(void))a1[5] + 2))();
    goto LABEL_9;
  }
  if (objc_msgSend(a1[6], "_isObsoleteCatalogType:", a1[4]))
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(a1[6], "_forceOneTimeCatalogRefresh");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_2;
    v15[3] = &unk_251A11610;
    v12 = a1[6];
    v13 = a1[5];
    v14 = a1[6];
    v17 = v13;
    v18 = v14;
    v16 = a1[4];
    objc_msgSend(v12, "refreshCatalogIfNeededWithCompletion:", v15);

  }
LABEL_10:

}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if ((a2 & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_3;
    v9[3] = &unk_251A115E8;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "queryAssetType:filter:completion:", v6, 1, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 15, CFSTR("Failed to refresh catalog"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(*(id *)(a1 + 80), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2;
  block[3] = &unk_251A116B0;
  v12 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  v18 = a2;
  v19 = v5;
  v20 = v6;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 72);
  v13 = v9;
  v17 = v10;
  v14 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LTOSLogAssets();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 80) + 1;
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(v2, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v26 = v4;
    v27 = 2048;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Enqueue download %zd of %zd: %{public}@", buf, 0x20u);

  }
  v10 = *(void **)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 56);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_20;
  v16[3] = &unk_251A11688;
  v12 = *(_QWORD *)(a1 + 80);
  v23 = v10;
  v24 = v12;
  v17 = *(id *)(a1 + 32);
  v18 = v2;
  v21 = *(_QWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 72);
  v19 = v13;
  v22 = v14;
  v20 = *(id *)(a1 + 48);
  v15 = v2;
  objc_msgSend(v10, "downloadAsset:options:progress:completion:", v15, v9, v11, v16);

}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 80), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2_21;
  v9[3] = &unk_251A11660;
  v17 = *(_QWORD *)(a1 + 88);
  v10 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v12 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  v13 = v6;
  v16 = v7;
  v14 = *(id *)(a1 + 56);
  v8 = v3;
  dispatch_async(v4, v9);

}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void (**v13)(void);
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 88) + 1;
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = objc_msgSend(v4, "count");
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = v3;
    v16 = 2048;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Complete download %zd of %zd: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCancelled");

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (!v10)
      v10 = *(void **)(v11 + 40);
    objc_storeStrong((id *)(v11 + 40), v10);
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isTTSModel") & 1) == 0)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v12 < objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v13[2]();

  }
}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_24(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void (**v4)(void);

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v3 < objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v4[2]();

      }
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 48));
  }
}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_2_25(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void (**v29)(id, _QWORD);
  _QWORD *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v29 = a2;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = (void *)a1[7];
  +[_LTDLanguageAssetService selectedLocales](_LTDLanguageAssetService, "selectedLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pairNamesForLocales:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v34;
    v10 = 0x24BDF6000uLL;
    v30 = a1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(v10 + 1040), "pairWithIdentifiers:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "isPassthrough") & 1) == 0)
        {
          v14 = (void *)a1[7];
          v15 = a1[4];
          objc_msgSend(v13, "sourceLocale");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v16;
          objc_msgSend(v13, "targetLocale");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = v17;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
          v18 = v7;
          v19 = v9;
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          objc_msgSend(v14, "filterAssets:forLocales:error:", v15, v21, &v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v32;

          v24 = v20;
          v9 = v19;
          v7 = v18;

          a1 = v30;
          v25 = v22;
          if (v23)
          {
            v26 = _LTOSLogAssets();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v23;
              _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Failed to obtain language specific list of assets, falling back to creating symlinks with all installed assets: %@", buf, 0xCu);
            }
            v25 = (void *)v30[4];
          }
          v8 = v24 | +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](_LTSpeechTranslationAssetInfo, "_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:", v13, v25, *((unsigned __int8 *)v30 + 64));

          v10 = 0x24BDF6000;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  v27 = _LTOSLogAssets();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v27, OS_LOG_TYPE_DEFAULT, "Asset download and symlink creation completed", buf, 2u);
  }
  v28 = a1[5];
  if (v28)
    (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  if (v29)
    v29[2](v29, v8 & 1);

}

void __63___LTDAssetService_downloadAssets_options_progress_completion___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_DEFAULT, "Download of %zd assets complete, running symlink creation", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 48), "cleanupScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  v7 = _LTOSLogAssets();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = (uint64_t)v5;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Deferring symlink creation to cleanupScheduler: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(v5, "scheduleAssetCleanupWork:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Don't have a cleanupScheduler, directly doing work to create symlinks", (uint8_t *)&v9, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __44___LTDAssetService_bootstrapWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    +[_LTDLanguageAssetService syncInstalledLocales](_LTDLanguageAssetService, "syncInstalledLocales");
    v5 = 0;
    if ((_DWORD)a2)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "removeObsoleteAssets");

      v5 = 0;
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    v5 = v8;
  }

}

void __37___LTDAssetService_assetDirectoryURL__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_libraryDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Translation"));
  v2 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v7);
  v4 = v7;

  if (v4)
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37___LTDAssetService_assetDirectoryURL__block_invoke_cold_1();
  }
  v6 = (void *)assetDirectoryURL__assetDirectoryURL;
  assetDirectoryURL__assetDirectoryURL = v2;

}

void __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;

  v5 = a3;
  if (v5)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "setNeedsCatalogRefresh:", 1);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "configAssetWithCompletion:", &__block_literal_global_46);
    objc_msgSend(*(id *)(a1 + 40), "_refreshHotfixWithCompletion:", 0);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }

}

void __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke_cold_1();
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);

}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  if (v5)
  {
    v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_2();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __46___LTDAssetService_configAssetWithCompletion___block_invoke_51;
      v11[3] = &unk_251A11828;
      v8 = *(void **)(a1 + 40);
      v13 = *(id *)(a1 + 32);
      v12 = v7;
      objc_msgSend(v8, "_installConfigAsset:completion:", v12, v11);

      v9 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 7, CFSTR("No config asset in result from async catalog request"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_51_cold_1();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

void __51___LTDAssetService__installConfigAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = _LTOSLogAssets();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_51_cold_1();
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_10:
      v7();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v5;
      v12 = 134217984;
      v13 = objc_msgSend(v8, "assetVersion");
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_DEFAULT, "Finished downloading config asset version %zd", (uint8_t *)&v12, 0xCu);

    }
    +[_LTDConfigurationService flushCache](_LTDConfigurationService, "flushCache");
    +[_LTDLanguageAssetCache shared](_LTDLanguageAssetCache, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v7 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }

}

void __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50___LTDAssetService_installedAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50___LTDAssetService_installedAssetsWithCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __48___LTDAssetService_filterConfigAssetFromAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isConfig");
}

void __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "_ttsAssetsForLocales:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    +[_LTDAssetService filterConfigAssetFromAssets:](_LTDAssetService, "filterConfigAssetFromAssets:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke_73;
      v15[3] = &unk_251A118E0;
      v10 = *(void **)(a1 + 48);
      v11 = *(id *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v18 = v11;
      v19 = v12;
      v16 = v5;
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v10, "_installConfigAsset:completion:", v9, v15);

      v13 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 7, CFSTR("No config asset found while resolving assets for locales"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = _LTOSLogAssets();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke_73(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v6 = (void *)a1[7];
    v7 = a1[4];
    v8 = a1[5];
    v10 = 0;
    objc_msgSend(v6, "filterAssets:forLocales:error:", v7, v8, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Asset async query failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __37___LTDAssetService_assetDirectoryURL__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create asset directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Asset catalog updated failure %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Hotfix asset refresh failure %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Config asset not found: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Asset catalog read failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_51_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error downloading config asset: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error querying catalog assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __50___LTDAssetService_installedAssetsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Error querying installed assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
