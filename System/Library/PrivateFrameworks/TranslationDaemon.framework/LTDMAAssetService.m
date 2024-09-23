@implementation LTDMAAssetService

void __28___LTDMAAssetService__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translationd.MAAssetService", 0);
  v1 = (void *)_queue__queue_0;
  _queue__queue_0 = (uint64_t)v0;

}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "returnTypes:", objc_msgSend(*(id *)(a1 + 48), "_returnTypeForFilter:", *(_QWORD *)(a1 + 56)));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_2;
  v6[3] = &unk_251A122D8;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = (id)v5;
  v8 = v5;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v4, "queryMetaData:", v6);

}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 48), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_3;
  block[3] = &unk_251A122B0;
  v10 = a2;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v9 = v6;
  v8 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

}

void __55___LTDMAAssetService_queryAssetType_filter_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _LTDMAAssetModel *v10;
  _LTDAssetModel *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 48), "_errorFromQueryResult:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = -[_LTDMAAssetModel initWithMAAsset:]([_LTDMAAssetModel alloc], "initWithMAAsset:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          v11 = -[_LTDAssetModel initWithProvider:]([_LTDAssetModel alloc], "initWithProvider:", v10);
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = 0;
  }

}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v1 = (void *)MEMORY[0x24BE66B90];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_2;
  v6[3] = &unk_251A12328;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v1, "startCatalogDownload:options:then:", v2, v3, v6);

}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 40), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3;
  block[3] = &unk_251A11970;
  v9 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v5 = (id)v6;
  v8 = v6;
  dispatch_async(v4, block);

}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  uint64_t v23;
  uint8_t v24[16];

  objc_msgSend(*(id *)(a1 + 40), "_errorFromDownloadResult:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LTOSLogAssets();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_3((uint64_t)v2, v4);
    if (objc_msgSend(v2, "code") == 22)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
      if (_LTIsInternalInstall())
      {
        v13 = _LTOSLogAssets();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
    {
      v22 = *(void (**)(void))(v21 + 16);
LABEL_16:
      v22();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Asset catalog finished downloading", v24, 2u);
    }
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
    {
      v22 = *(void (**)(void))(v23 + 16);
      goto LABEL_16;
    }
  }

}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(a1[7], "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2;
  block[3] = &unk_251A12378;
  v9 = v3;
  v10 = a1[4];
  v12 = a1[6];
  v5 = a1[5];
  v6 = a1[7];
  v11 = v5;
  v13 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isStalled"))
  {
    v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(void **)(a1 + 40);
      v20 = 138543362;
      v21 = v3;
      _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "MobileAsset downloading asset stalled: %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    v4 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "updateTotalUnitCount:completedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalExpected"), objc_msgSend(*(id *)(a1 + 32), "totalWritten"));

    if (v6)
    {
      v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_cold_1(a1 + 40, v7, v8, v9, v10, v11, v12, v13);
      v14 = *(_QWORD *)(a1 + 56);
      if (v14)
      {
        (*(void (**)(uint64_t, id))(v14 + 16))(v14, *v4);
        objc_msgSend(*v4, "progress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isCancelled");

        if (v16)
        {
          v17 = _LTOSLogAssets();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = *v4;
            v20 = 138543362;
            v21 = v18;
            _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_INFO, "Cancelling download for %{public}@", (uint8_t *)&v20, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 48), "maAsset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "cancelDownloadSync");

          objc_msgSend(*(id *)(a1 + 64), "purgeAsset:completion:", *(_QWORD *)(a1 + 40), 0);
        }
      }
    }
  }
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_214(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "maAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_215;
  v4[3] = &unk_251A123F0;
  v8 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "startDownload:then:", v3, v4);

}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_215(id *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(a1[7], "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3;
  block[3] = &unk_251A123C8;
  v9 = a1[7];
  v10 = a2;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  dispatch_async(v4, block);

}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  _QWORD *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 56), "_errorFromDownloadResult:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_2(a1);
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
LABEL_15:
      v6();
    }
  }
  else
  {
    v7 = (_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFinished");

    if ((v9 & 1) == 0)
    {
      v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_1(a1 + 32, v10, v11, v12, v13, v14, v15, v16);
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOfflineState:", 2);

      v18 = *(_QWORD *)(a1 + 48);
      if (v18)
        (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, *v7);
    }
    v19 = _LTOSLogAssets();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *v7;
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "MobileAsset completed downloading asset %{public}@", (uint8_t *)&v22, 0xCu);
    }
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
    {
      v6 = *(void (**)(void))(v21 + 16);
      goto LABEL_15;
    }
  }

}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  +[_LTDMAAssetModel modelFromAsset:](_LTDMAAssetModel, "modelFromAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke_2;
  v4[3] = &unk_251A12440;
  v7 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "purge:", v4);

}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_2(id *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(a1[6], "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3;
  block[3] = &unk_251A11750;
  v8 = a2;
  v6 = a1[4];
  v7 = a1[5];
  dispatch_async(v4, block);

}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 3 || v2 == 0)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "MobileAsset finished purging asset %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOfflineState:", 0);

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed asset purge: %zd"), v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 20, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3_cold_1(a1);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v9);

  }
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Internal installs must be on the internal network to access staging assets", a5, a6, a7, a8, 0);
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Asset catalog endpoint is not reachable from the current network", a5, a6, a7, a8, 0);
}

void __61___LTDMAAssetService_downloadCatalogForAssetType_completion___block_invoke_3_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Error when downloading asset catalog: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "MobileAsset download asset progressed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "MobileAsset forcing progress update for asset %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __64___LTDMAAssetService_downloadAsset_options_progress_completion___block_invoke_3_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "MobileAsset failed to download asset %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

void __44___LTDMAAssetService_purgeAsset_completion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "MobileAsset failed to purge asset %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

@end
